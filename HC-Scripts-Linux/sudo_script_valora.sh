#!/bin/bash

# ---------- CSV sanitation helpers ----------
clean_output() {
  echo "$1" | tr '\n' ' ' | tr ',' ' ' | sed 's/[[:space:]]\+/ /g'
}

write_col() {
  local val="$1"
  local file="$2"
  printf "%s\n" "$(clean_output "$val")" >> "$file"
}
# ---------- end helpers ----------

# rm -rf placeholder removed


########################Information########################

#Author / Developer : manne.vishnu.vardhan.rao@kyndryl.com

#Date Created : 25-April-2026

########################End########################

########################Developed########################

#OS : SUDO

########################End########################

rm -rf c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 `hostname`.csv package output timeout shadow inactive maxage uid emptylist shadowed chrony systemaccounts disabledaccounts active audit_file

clear

########################Customer########################

#Please enter the customer name
CustomerName="Valora Schweiz AG"

#Please enter the customer inventory id
CustomerInventoryID="BAM5860076"

#Please enter the policy name & policy version
PolicyNameVersion="CSD v10.0"

#Please enter the technical specification name & technical specification version
TechnicalSpecificationNameVersion="SUDO CIS v10.0.0"

########################End########################

########################Customization########################

#Please enter the customization date
CustomizationDate="25-Apr-2026"

#Please enter the email id
EmailId="Manne.vishnu.vardhan.rao@kyndryl.com"

########################End########################

customer=$CustomerName

custinvid=$CustomerInventoryID

policy=$PolicyNameVersion

doc=$TechnicalSpecificationNameVersion

server=`hostname`

ip=$(hostname -I | awk '{print $1}')

os=`hostnamectl | grep -i "operating system" | cut -d ":" -f 2 | xargs` #This command to be used when OS is Ubuntu and can be used for CentOS OS

#os=`cat /etc/redhat-release | xargs` #This command to be used when OS is Red Hat Enterprise Linux and can be used for CentOS OS
severity="Critical"

scandate=`date`

write_col "Customer Name" c1
write_col "Customer Inventory ID" c2
write_col "Security Policy" c3
write_col "Technical Specification" c4
write_col "Server Name" c5
write_col "Server IP" c6
write_col "Operating System" c7
write_col "Section ID" c8
write_col "Section Heading" c9
write_col "System Value Parameter" c10
write_col "Description" c11
write_col "Agreed Value" c12
write_col "Current Value" c13
write_col "Output Result" c14
write_col "Severity" c15
write_col "Scandate" c16

# ZY.1.2.1 Ensure sudo logging configuration is properly set

check_logfile=$(cvtsudoers -f json /etc/sudoers 2>/dev/null | jq -c '.. | objects | with_entries(select(.key | contains("logfile"))) | select(. != {})')

sudo_logging=$(sudo -V 2>/dev/null | grep -E -- '--with-logging')

if [[ "$check_logfile" == *'"logfile":false'* ]]; then

    if [[ "$sudo_logging" == *"--with-logging=both"* || "$sudo_logging" == *"--with-logging=syslog"* || -z "$sudo_logging" ]]; then
        result="OK"
        msg="!logfile used and sudo logging configured correctly ($sudo_logging)"
    else
        result="KO"
        msg="!logfile used but sudo logging not configured properly ($sudo_logging)"
    fi

elif [[ "$check_logfile" == *'"logfile":'* ]]; then

    result="OK"
    msg="Sudo logging configured to file ($check_logfile)"

else

    if [[ "$sudo_logging" == *"--with-logging=both"* || "$sudo_logging" == *"--with-logging=syslog"* || -z "$sudo_logging" ]]; then
        result="OK"
        msg="No explicit logfile setting, default syslog logging assumed ($sudo_logging)"
    else
        result="KO"
        msg="Logging configuration not compliant ($sudo_logging)"
    fi

fi


write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "ZY.1.2.1" c8
write_col "Privilege Escalation" c9
write_col "Sudo Logging, must not be disabled." c10
write_col "Sudo must log via syslog or both when !logfile is used" c11
write_col "If  "!logfile" are used in the Sudo configuration files then the Sudo configuration file must contain a syslog statement or the  Sudo binary must be compiled with one of the options below: --with-logging=both --with-logging=syslog or the parameter should be absent (the default is --with-logging=syslog)" c12
write_col "$msg Output : logfile_check=$check_logfile sudo_logging=$sudo_logging" c13
write_col "$result" c14
write_col "$severity" c15
write_col "$scandate" c16

# ZY.1.2.2 Ensure sudo logfile exists when file/both logging is enabled

sudo_logging=$(sudo -V 2>/dev/null | grep -Ei -- '--with-logging')
logfile_path=$(sudo -V 2>/dev/null | grep -i "log file" | awk -F': ' '{print $2}')
cvtsudoers_log=$(cvtsudoers -f json /etc/sudoers 2>/dev/null | jq -c '.. | objects | with_entries(select(.key | contains("logfile"))) | select(. != {})')

if [[ "$sudo_logging" == *"--with-logging=both"* || "$sudo_logging" == *"--with-logging=file"* ]]; then

    if [[ -n "$logfile_path" && -f "$logfile_path" ]]; then
        result="OK"
        msg="Sudo logging configured with file and logfile exists ($logfile_path)"
    elif [[ "$cvtsudoers_log" == *'"logfile":'* ]]; then
        file_from_cfg=$(echo "$cvtsudoers_log" | sed -E 's/.*"logfile":"([^"]+)".*/\1/')
        
        if [[ -f "$file_from_cfg" ]]; then
            result="OK"
            msg="Logfile from sudoers exists ($file_from_cfg)"
        else
            result="KO"
            msg="Logfile configured but file does not exist ($file_from_cfg)"
        fi
    else
        result="KO"
        msg="Logging requires logfile but no valid logfile path found"
    fi

else

    result="OK"
    msg="Sudo not configured for file logging ($sudo_logging)"

fi


write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "ZY.1.2.2" c8
write_col "Privilege Escalation" c9
write_col "Sudo-specific Log File" c10
write_col "If sudo logging is set to file/both, logfile must exist" c11
write_col "If a sudo-specific log file is used, the file  /var/log/sudo.log must exist." c12
write_col "$msg Output : sudo_logging=$sudo_logging logfile_path=$logfile_path cvtsudoers=$cvtsudoers_log" c13
write_col "$result" c14
write_col "$severity" c15
write_col "$scandate" c16

# ZY.1.2.3 Ensure secondary logging is enabled when sudo allows su command

# Check if sudoers allows usage of 'su'
su_permission=$(cvtsudoers -f json /etc/sudoers 2>/dev/null | jq -c '.. | objects | select(has("command")) | select(.command | contains("su"))')

# Run SFIT script with -l option
sfit_output=$(SFIT -l 2>/dev/null)

if [[ -n "$su_permission" ]]; then

    if [[ "$sfit_output" == *"Secondary Logging: Enabled"* || "$sfit_output" == *"secondary logging enabled"* ]]; then
        result="OK"
        msg="sudo allows su command and secondary logging is enabled"
    else
        result="KO"
        msg="sudo allows su command but secondary logging is NOT enabled"
    fi

else

    result="OK"
    msg="sudo does not allow su command, secondary logging not required"

fi


write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "ZY.1.2.3" c8
write_col "Privilege Escalation" c9
write_col "secondary logging" c10
write_col "If sudo permits su command, secondary logging must be enabled" c11
write_col "Where the Sudo configuration allows users or groups to perform the su command: Enable Secondary Logging according to https://github.com/kyndryl-global-delivery/sudo-lcm-sudo-wiki/blob/master/SecondaryLogging.md Run the SFIT script with option -l to check the configuration. Backup link: https://pages.github.kyndryl.net/sudo-lcm/sudo-wiki/SecondaryLogging.html" c12
write_col "$msg Output : su_permission=$su_permission sfit_output=$sfit_output" c13
write_col "$result" c14
write_col "$severity" c15
write_col "$scandate" c16

# ZY.1.2.5 Ensure '!log_passwords' is set in sudo configuration

sudo_output=$(sudo -l 2>/dev/null)

if [[ "$sudo_output" == *"!log_passwords"* ]]; then
    result="OK"
    msg="!log_passwords is present in sudo configuration"
else
    result="KO"
    msg="!log_passwords is NOT present in sudo configuration"
fi


write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "ZY.1.2.5" c8
write_col "Privilege Escalation" c9
write_col "Secondary logging using sudo-io" c10
write_col "Sudo must not log passwords (!log_passwords must be set)" c11
write_col "Following entry is a must for /etc/sudoers while using sudo-io logging: Defaults !log_passwords" c12
write_col "$msg Output : sudo_output=$sudo_output" c13
write_col "$result" c14
write_col "$severity" c15
write_col "$scandate" c16

# ZY.1.4.2.1 Ensure noexec is configured for KYNDRYL_SHELLESCAPE_ALL or commands use NOEXEC

# Check for Defaults!KYNDRYL_SHELLESCAPE_ALL noexec
noexec_entry=$(grep -Ri "Defaults!KYNDRYL_SHELLESCAPE_ALL[[:space:]]\+noexec" /etc/sudoers /etc/sudoers.d/* 2>/dev/null)

# Fallback: check NOEXEC on commands (example placeholder as per ZY.1.4.2.2)
noexec_cmds=$(grep -Ri "NOEXEC" /etc/sudoers /etc/sudoers.d/* 2>/dev/null)

if [[ -n "$noexec_entry" ]]; then

    result="OK"
    msg="Defaults!KYNDRYL_SHELLESCAPE_ALL noexec is configured"

else

    if [[ -n "$noexec_cmds" ]]; then
        result="OK"
        msg="KYNDRYL_SHELLESCAPE_ALL not set, but NOEXEC is applied to commands"
    else
        result="KO"
        msg="Neither Defaults!KYNDRYL_SHELLESCAPE_ALL noexec nor NOEXEC on commands is configured"
    fi

fi


write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "ZY.1.4.2.1" c8
write_col "Privilege Escalation" c9
write_col "Commands which allow shell escape." c10
write_col "Defaults!KYNDRYL_SHELLESCAPE_ALL noexec or NOEXEC must be configured" c11
write_col "The "NOEXEC" keyword must be applied to prevent shell escapes when the commands listed in ZY.1.4.2.2 are authorized. This requirement applies to the main sudoers file and any additional sudoers.* files called via the include or includedir statements" c12
write_col "$msg Output : noexec_entry=$noexec_entry noexec_cmds=$noexec_cmds" c13
write_col "$result" c14
write_col "$severity" c15
write_col "$scandate" c16

# ZY.1.4.2.3 Ensure sudo environment file is configured correctly

env_file="/etc/sudo.env"

# Check if file exists
if [[ -f "$env_file" ]]; then

    smit_shell=$(grep -E "^SMIT_SHELL=n" "$env_file" 2>/dev/null)
    smit_semicolon=$(grep -E "^SMIT_SEMI_COLON=n" "$env_file" 2>/dev/null)
    smit_quote=$(grep -E "^SMIT_QUOTE=n" "$env_file" 2>/dev/null)

    if [[ -n "$smit_shell" && -n "$smit_semicolon" && -n "$smit_quote" ]]; then
        env_status="OK"
        env_msg="All required SMIT parameters are set correctly in $env_file"
    else
        env_status="KO"
        env_msg="Missing or incorrect SMIT parameters in $env_file"
    fi

else

    env_status="KO"
    env_msg="$env_file does not exist"

fi


# Check sudoers configuration for env_file
sudo_env_entry=$(grep -Ri "Defaults[[:space:]]\+env_file=/etc/sudo.env" /etc/sudoers /etc/sudoers.d/* 2>/dev/null)

if [[ -n "$sudo_env_entry" ]]; then
    sudo_status="OK"
    sudo_msg="Defaults env_file is configured"
else
    sudo_status="KO"
    sudo_msg="Defaults env_file is NOT configured"
fi


# Final result evaluation
if [[ "$env_status" == "OK" && "$sudo_status" == "OK" ]]; then
    result="OK"
    msg="$env_msg and $sudo_msg"
else
    result="KO"
    msg="$env_msg and $sudo_msg"
fi


write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "ZY.1.4.2.3" c8
write_col "Privilege Escalation" c9
write_col "Commands which allow shell escape." c10
write_col "Verify /etc/sudo.env exists and contains required SMIT parameters and is referenced in sudoers" c11
write_col "The sudo configuration file must contain the statement “Defaults env_file=/etc/sudo.env. The sudo environment control file “/etc/sudo.env”  must contain the entries: “SMIT_SHELL=n“ “SMIT_SEMI_COLON=n” “SMIT_QUOTE=n”" c12
write_col "$msg Output : env_file=$env_file smit_shell=$smit_shell smit_semicolon=$smit_semicolon smit_quote=$smit_quote sudo_entry=$sudo_env_entry" c13
write_col "$result" c14
write_col "$severity" c15
write_col "$scandate" c16

# ZY.1.4.3.3 Ensure last active sudoers line is ALL ALL=!SUDOSUDO

# Get last User_Spec entry using cvtsudoers
last_entry=$(cvtsudoers -f json /etc/sudoers 2>/dev/null | jq -c '.User_Specs | last')

# Expected pattern check
expected_pattern='"username":"ALL".*"hostname":"ALL".*"cmndalias":"SUDOSUDO".*"negated":true'

if [[ -n "$last_entry" ]]; then

    if echo "$last_entry" | grep -Eq "$expected_pattern"; then
        result="OK"
        msg="Last sudoers entry correctly set to ALL ALL=!SUDOSUDO"
    else
        result="KO"
        msg="Last sudoers entry is not compliant with ALL ALL=!SUDOSUDO"
    fi

else

    result="KO"
    msg="Unable to retrieve last sudoers entry using cvtsudoers"

fi


write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "ZY.1.4.3.3" c8
write_col "Privilege Escalation" c9
write_col "Preventing Nested Sudo invocation" c10
write_col "Last active line must be ALL ALL=!SUDOSUDO" c11
write_col "The sudo configuration file must prevent users from using sudo to invoke sudo. Cmnd_Alias SUDOSUDO = /usr/local/bin/sudo, /usr/bin/sudo, /bin/sudo Note: All valid paths to sudo executables must be added to this entry. The following line must be the last effective line in the sudo configuration file. ALL ALL=!SUDOSUDO" c12
write_col "$msg Output : last_entry=$last_entry" c13
write_col "$result" c14
write_col "$severity" c15
write_col "$scandate" c16

# ZY.1.4.4 Ensure both sudo logging and secondary logging are active

# --- ZY.1.2.1 (Logging mode validation) ---
sudo_logging=$(sudo -V 2>/dev/null | grep -Ei -- '--with-logging')

if [[ "$sudo_logging" == *"--with-logging=both"* || "$sudo_logging" == *"--with-logging=syslog"* || -z "$sudo_logging" ]]; then
    logging_mode_status="OK"
else
    logging_mode_status="KO"
fi

# --- ZY.1.2.2 (Log file validation if file/both logging used) ---
logfile_path=$(sudo -V 2>/dev/null | grep -i "log file" | awk -F': ' '{print $2}')

if [[ "$sudo_logging" == *"--with-logging=both"* || "$sudo_logging" == *"--with-logging=file"* ]]; then
    if [[ -n "$logfile_path" && -f "$logfile_path" ]]; then
        logfile_status="OK"
    else
        logfile_status="KO"
    fi
else
    logfile_status="OK"
fi

# --- ZY.1.2.3 (Secondary logging via SFIT) ---
sfit_output=$(SFIT -l 2>/dev/null)

if [[ "$sfit_output" == *"Secondary Logging: Enabled"* || "$sfit_output" == *"secondary logging enabled"* ]]; then
    secondary_logging_status="OK"
else
    secondary_logging_status="KO"
fi


# --- Final Evaluation ---
if [[ "$logging_mode_status" == "OK" && "$logfile_status" == "OK" && "$secondary_logging_status" == "OK" ]]; then
    result="OK"
    msg="Sudo logging and secondary logging are properly configured"
else
    result="KO"
    msg="Logging issues detected (mode=$logging_mode_status logfile=$logfile_status secondary=$secondary_logging_status)"
fi


write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "ZY.1.4.4" c8
write_col "Privilege Escalation" c9
write_col "Logging of commands issued by individuals via sudo." c10
write_col "Both sudo logging and secondary logging must be enabled" c11
write_col "Sudo entries authorizing commands with shell escapes or entries that end in '=ALL'  are prohibited unless log records are generated documenting the command and the individual using elevated privileges gained through sudo. The default entry of root ALL = ALL ALL  also with NOPASSWD is permittedprovided appropriate logging of the commands issued from the root login shell is in place." c12
write_col "$msg Output : sudo_logging=$sudo_logging logfile=$logfile_path sfit_output=$sfit_output" c13
write_col "$result" c14
write_col "$severity" c15
write_col "$scandate" c16

# ZY.1.4.5 Ensure restricted editors are not authorized in sudo configuration

# List of restricted editors
restricted_editors="/bin/vi|/bin/tvi|/bin/vim|/bin/rvim|/bin/gvim|/bin/evim|/bin/emacs|/bin/ed|/usr/bin/vi|/usr/bin/tvi|/usr/bin/nano|/usr/bin/vim|/usr/bin/rvim|/usr/bin/gvim|/usr/bin/evim|/usr/bin/emacs|/usr/bin/ed|/bin/view|/usr/bin/view|/bin/rvi|/usr/bin/rvi"

# Search in sudoers and included files
editor_hits=$(grep -RE "$restricted_editors" /etc/sudoers /etc/sudoers.d/* 2>/dev/null)

if [[ -z "$editor_hits" ]]; then
    result="OK"
    msg="No restricted editors are authorized in sudo configuration"
else
    result="KO"
    msg="Restricted editors found in sudo configuration"
fi


write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "ZY.1.4.5" c8
write_col "Privilege Escalation" c9
write_col "Editors used with sudo privileges." c10
write_col "Editors like vi, vim, nano, emacs must not be allowed via sudo" c11
write_col "Sudoedit must be used to edit any files other than the sudo configuration file(s), which may be edited using visudo. Exceptions for instances where sudo access to edit files does not use "visudo" or "sudoedit" must include approved justification for the affected user(s) having read and write access to OSR's and customer data. This requirement applies to  the main sudoers file and any additional sudoers.* files called via the include or includedir  statements." c12
write_col "$msg Output : editor_hits=$editor_hits" c13
write_col "$result" c14
write_col "$severity" c15
write_col "$scandate" c16

# ZY.1.4.7 Ensure SFIT extended mode execution and output validation

sfit_dir="/var/log/sfitout"

# Run SFIT in extended mode
sfit_run=$(SFIT -e 2>/dev/null)

# Check directory existence
if [[ -d "$sfit_dir" ]]; then
    dir_status="OK"
else
    dir_status="KO"
fi

# Get latest CSV file
latest_file=$(ls -t $sfit_dir/*.csv 2>/dev/null | head -1)

if [[ -n "$latest_file" ]]; then
    file_status="OK"
else
    file_status="KO"
fi

# Check for ERROR/WARNING in latest file
if [[ -n "$latest_file" ]]; then
    issues=$(grep -Ei "ERROR|WARNING" "$latest_file" 2>/dev/null)
    
    if [[ -z "$issues" ]]; then
        content_status="OK"
    else
        content_status="KO"
    fi
else
    content_status="KO"
fi


# Final evaluation
if [[ "$dir_status" == "OK" && "$file_status" == "OK" && "$content_status" == "OK" ]]; then
    result="OK"
    msg="SFIT extended mode executed successfully and output is clean"
else
    result="KO"
    msg="SFIT validation failed (dir=$dir_status file=$file_status content=$content_status)"
fi


write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "ZY.1.4.7" c8
write_col "Privilege Escalation" c9
write_col "SFIT clean output" c10
write_col "SFIT -e must run, output directory must exist, and no ERROR/WARNING in latest CSV" c11
write_col "No WARNING or ERROR lines must be present in CSV OUTPUT FILE FILTERED output files are in /var/log/sfitout" c12
write_col "$msg Output : sfit_run=$sfit_run dir=$sfit_dir latest_file=$latest_file issues=$issues" c13
write_col "$result" c14
write_col "$severity" c15
write_col "$scandate" c16

# ZY.1.8.1.2 Ensure #includedir uses full path in sudoers

# Check includedir entries in sudoers and included files
includedir_entries=$(grep -R "^[[:space:]]*#includedir" /etc/sudoers /etc/sudoers.d/* 2>/dev/null)

# Check for valid full path (starts with /)
invalid_entries=$(echo "$includedir_entries" | awk '{print $2}' | grep -v "^/")

if [[ -n "$includedir_entries" ]]; then

    if [[ -z "$invalid_entries" ]]; then
        result="OK"
        msg="#includedir entries use full path"
    else
        result="KO"
        msg="Found #includedir entries without full path"
    fi

else

    result="OK"
    msg="No #includedir directive found (not applicable)"

fi


write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "ZY.1.8.1.2" c8
write_col "Privilege Escalation" c9
write_col "Any directory referenced by a #includedir directive in /etc/sudoers" c10
write_col "#includedir directive must contain absolute path" c11
write_col "Each directory named must specify the full path of the included directory." c12
write_col "$msg Output : includedir_entries=$includedir_entries invalid_entries=$invalid_entries" c13
write_col "$result" c14
write_col "$severity" c15
write_col "$scandate" c16

# ZY.1.8.1.4 Ensure #include uses full path in sudoers

# Fetch all #include directives (ignore commented variations with extra #)
include_entries=$(grep -R "^[[:space:]]*#include[[:space:]]" /etc/sudoers /etc/sudoers.d/* 2>/dev/null)

# Extract path and check if NOT starting with /
invalid_entries=$(echo "$include_entries" | awk '{print $2}' | grep -v "^/")

if [[ -n "$include_entries" ]]; then

    if [[ -z "$invalid_entries" ]]; then
        result="OK"
        msg="#include directives use full absolute paths"
    else
        result="KO"
        msg="Found #include directives without full path"
    fi

else

    result="OK"
    msg="No #include directive found (not applicable)"

fi


write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "ZY.1.8.1.4" c8
write_col "Privilege Escalation" c9
write_col "Any file referenced by a #include directive in the /etc/sudoers" c10
write_col "#include directive must contain absolute path to included file" c11
write_col "Each file named must specify the full path of the included file." c12
write_col "$msg Output : include_entries=$include_entries invalid_entries=$invalid_entries" c13
write_col "$result" c14
write_col "$severity" c15
write_col "$scandate" c16

# ZY.1.8.1.6 Ensure env_file ownership, group and permissions are correct

# Get env_file entries from sudoers
env_files=$(grep -Ri "Defaults[[:space:]]\+env_file=" /etc/sudoers /etc/sudoers.d/* 2>/dev/null | awk -F'=' '{print $2}')

# Define allowed OSR groups (update as per your environment if needed)
allowed_groups="root|sys|wheel"

result="OK"
msg=""

if [[ -n "$env_files" ]]; then

    for file in $env_files; do

        if [[ -f "$file" ]]; then

            owner=$(stat -c "%U" "$file")
            group=$(stat -c "%G" "$file")
            perms=$(stat -c "%a" "$file")

            # Check world-writable (others write bit)
            other_write=$(echo "$perms" | awk '{print substr($1,length($1),1)}')

            if [[ "$owner" != "root" ]]; then
                result="KO"
                msg="$msg File $file not owned by root;"
            fi

            if ! echo "$group" | grep -Eq "$allowed_groups"; then
                result="KO"
                msg="$msg File $file group $group not in allowed OSR groups;"
            fi

            if [[ "$other_write" -ge 2 ]]; then
                result="KO"
                msg="$msg File $file is world-writable;"
            fi

        else
            result="KO"
            msg="$msg File $file does not exist;"
        fi

    done

    if [[ "$result" == "OK" ]]; then
        msg="All env_file entries have correct ownership, group, and permissions"
    fi

else

    result="OK"
    msg="No Defaults env_file directive found (not applicable)"

fi


write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "ZY.1.8.1.6" c8
write_col "Privilege Escalation" c9
write_col "Any file referenced by a  “env_file” directive in the /etc/sudoers" c10
write_col "env_file must be owned by root, group must be OSR-approved, and not world-writable" c11
write_col "Each file named must be owned by root, have 'group' which is one of the OS accepted OSR groups,  and  must not be world writable." c12
write_col "$msg Output : env_files=$env_files" c13
write_col "$result" c14
write_col "$severity" c15
write_col "$scandate" c16

# ZY.1.8.2.2 Ensure sudo commands and their directories are not world-writable

# Extract commands from sudoers (basic extraction)
commands=$(grep -RhvE '^\s*#|^\s*$' /etc/sudoers /etc/sudoers.d/* 2>/dev/null \
          | awk -F'[:=]' '{for(i=1;i<=NF;i++) if($i ~ /^\//) print $i}' \
          | awk '{print $1}' | sort -u)

result="OK"
msg=""

for cmd in $commands; do

    if [[ -x "$cmd" ]]; then

        # Check command file permissions
        cmd_perm=$(stat -c "%a" "$cmd")
        other_write=$(echo "$cmd_perm" | awk '{print substr($1,length($1),1)}')

        if [[ "$other_write" -ge 2 ]]; then
            result="KO"
            msg="$msg Command $cmd is world-writable;"
        fi

        # Check all parent directories
        dir=$(dirname "$cmd")
        while [[ "$dir" != "/" ]]; do
            dir_perm=$(stat -c "%a" "$dir")
            dir_other_write=$(echo "$dir_perm" | awk '{print substr($1,length($1),1)}')

            if [[ "$dir_other_write" -ge 2 ]]; then
                result="KO"
                msg="$msg Directory $dir for command $cmd is world-writable;"
            fi

            dir=$(dirname "$dir")
        done

    fi

done

if [[ "$result" == "OK" ]]; then
    msg="All sudo commands and their directories are secure (not world-writable)"
fi


write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "ZY.1.8.2.2" c8
write_col "Privilege Escalation" c9
write_col "Sudoers config file" c10
write_col "Commands and their directory paths must not have world-writable permissions" c11
write_col "Each active entry's file/command/script executed, and all directories in its path, must have settings for "other" of r-x or more stringent. This requirement applies to  the main sudoers file and any additional sudoers.* files called via the include or includedir statements." c12
write_col "$msg Output : commands=$commands" c13
write_col "$result" c14
write_col "$severity" c15
write_col "$scandate" c16

# ZY.1.8.2.3 Ensure sudo commands and their directories are not group-writable

# Extract commands from sudoers (basic extraction)
commands=$(grep -RhvE '^\s*#|^\s*$' /etc/sudoers /etc/sudoers.d/* 2>/dev/null \
          | awk -F'[:=]' '{for(i=1;i<=NF;i++) if($i ~ /^\//) print $i}' \
          | awk '{print $1}' | sort -u)

result="OK"
msg=""

for cmd in $commands; do

    if [[ -x "$cmd" ]]; then

        # Check command file permissions
        cmd_perm=$(stat -c "%a" "$cmd")
        group_write=$(echo "$cmd_perm" | awk '{print substr($1,length($1)-1,1)}')

        if [[ "$group_write" -ge 2 ]]; then
            result="KO"
            msg="$msg Command $cmd is group-writable;"
        fi

        # Check all parent directories
        dir=$(dirname "$cmd")
        while [[ "$dir" != "/" ]]; do
            dir_perm=$(stat -c "%a" "$dir")
            dir_group_write=$(echo "$dir_perm" | awk '{print substr($1,length($1)-1,1)}')

            if [[ "$dir_group_write" -ge 2 ]]; then
                result="KO"
                msg="$msg Directory $dir for command $cmd is group-writable;"
            fi

            dir=$(dirname "$dir")
        done

    fi

done

if [[ "$result" == "OK" ]]; then
    msg="All sudo commands and their directories are secure (not group-writable)"
fi


write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "ZY.1.8.2.3" c8
write_col "Privilege Escalation" c9
write_col "Sudoers config file" c10
write_col "Commands and their directory paths must not have group-writable permissions" c11
write_col "Each active entry's file/command/script executed, and all existing directories in its path, must have settings for "group" of r-x or more stringent, if owned by groups considered to be default groups for general users. This requirement applies to  the main sudoers file and any additional sudoers.* files called via the include or includedir statements." c12
write_col "$msg Output : commands=$commands" c13
write_col "$result" c14
write_col "$severity" c15
write_col "$scandate" c16

########################End########################

#######################################end#########################################################

paste -d "|" c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 >>`hostname`.csv

rm -rf c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16
