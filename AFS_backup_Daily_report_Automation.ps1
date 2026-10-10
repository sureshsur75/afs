# ============================================
# AZURE BACKUP JOB REPORT – YESTERDAY (UTC) + EMAIL
# ============================================

# -------------------------------
# CONFIGURATION
# -------------------------------
$subscriptionId = "cfbfb6d4-3c77-4e4e-a6eb-4a46176f1324"
$resourceGroup  = "afs-rg-eastus-elastic-prodrg-01"
$vaultName      = "afs-vm-backup"
$reportFolder   = "C:\Users\SureshBabu\AFS-Backup-Reports"

if (!(Test-Path $reportFolder)) {
    New-Item -ItemType Directory -Path $reportFolder | Out-Null
}

# -------------------------------
# CALCULATE YESTERDAY (UTC)
# -------------------------------
$todayUTC       = (Get-Date).ToUniversalTime().Date
$startDateUTC   = $todayUTC.AddDays(-1)
$endDateUTC     = $todayUTC
$yesterdayLabel = $startDateUTC.ToString("yyyyMMdd")
$yesterdayStr   = $startDateUTC.ToString("yyyy-MM-dd")

$reportPath = "$reportFolder\AFS_BackupReport_$yesterdayLabel.xlsx"

# -------------------------------
# AZURE LOGIN & SUBSCRIPTION
# -------------------------------
Write-Host "Please authenticate to Azure..."
az login --use-device-code
az account set --subscription $subscriptionId

# Get Subscription Name
$subscriptionInfo = az account show --output json | ConvertFrom-Json
$subscriptionName = $subscriptionInfo.name

# -------------------------------
# FETCH BACKUP JOBS
# -------------------------------
Write-Host "Fetching backup jobs..."
$jobs = az backup job list `
    --resource-group $resourceGroup `
    --vault-name $vaultName `
    --output json | ConvertFrom-Json

if (!$jobs) {
    Write-Host "No backup jobs found."
    exit
}

# -------------------------------
# FILTER FOR YESTERDAY (UTC)
# -------------------------------
$jobsFiltered = $jobs | Where-Object {
    $startTimeUTC = [datetime]$_.properties.startTime
    $startTimeUTC -ge $startDateUTC -and $startTimeUTC -lt $endDateUTC
}

if (!$jobsFiltered) {
    Write-Host "No backup jobs found for $yesterdayStr (UTC)."
    exit
}

# -------------------------------
# FORMAT DATA FOR EXCEL
# -------------------------------
$jobReport = foreach ($job in $jobsFiltered) {
    [PSCustomObject]@{
        "Vault Name"       = $vaultName
        "Resource Group"   = $resourceGroup
        "Workload Name"    = $job.properties.entityFriendlyName
        "Operation"        = $job.properties.operation
        "Status"           = $job.properties.status
        "Type"             = $job.properties.backupManagementType
        "Start Time (UTC)" = $job.properties.startTime
        "Duration"         = $job.properties.duration
        "Job ID"           = $job.name
    }
}

# -------------------------------
# EXPORT TO EXCEL
# -------------------------------
# Requires ImportExcel module
$header = @(
    [PSCustomObject]@{"A"="Subscription Name"; "B"=$subscriptionName}
    [PSCustomObject]@{"A"="Subscription ID"; "B"=$subscriptionId}
    [PSCustomObject]@{"A"="Recovery Vault"; "B"=$vaultName}
    [PSCustomObject]@{"A"="Report Date (UTC)"; "B"=$yesterdayStr}
    [PSCustomObject]@{"A"="Generated On"; "B"=(Get-Date).ToString("yyyy-MM-dd HH:mm:ss")}
)

# Export header first (overwrite if exists)
$header | Export-Excel `
    -Path $reportPath `
    -WorksheetName "Backup Jobs" `
    -AutoSize `
    -BoldTopRow

# Export job table starting at row 7
$jobReport | Export-Excel `
    -Path $reportPath `
    -WorksheetName "Backup Jobs" `
    -StartRow 7 `
    -AutoSize `
    -BoldTopRow `
    -FreezeTopRow

Write-Host "Excel report generated successfully: $reportPath"

# -------------------------------
# SEND EMAIL WITH REPORT
# -------------------------------
$subject = "[Confidential] - AFS daily backup report $yesterdayStr"

$bodyHtml = @"
<html>
<body>
<p>Hi,</p>
<p>Please find enclosed the daily backup report of the AFS account for $yesterdayStr.</p>

<p>Regards,<br>Azure Automation</p>
</body>
</html>
"@

# Create Outlook COM object
$Outlook = New-Object -ComObject Outlook.Application
$Namespace = $Outlook.GetNamespace("MAPI")

# Choose the sending account (update with your Outlook email)
$SendAccount = $Namespace.Accounts | Where-Object { $_.SmtpAddress -eq "suresh.babu1@kyndryl.com" }

$mail = $Outlook.CreateItem(0)
$mail.SendUsingAccount = $SendAccount
$mail.To = "Ashwin.Kumar.K.C@kyndryl.com"  # Replace with recipients
$mail.CC = "pcsm_ag_team@kyndryl.com; Srinivas.Rao.Mandarapu@kyndryl.com"  # Replace with CCs
$mail.Subject = $subject
$mail.HTMLBody = $bodyHtml
$mail.Attachments.Add($reportPath)  # Attach generated backup report
$mail.Send()

Write-Host "Email sent successfully for $yesterdayStr"