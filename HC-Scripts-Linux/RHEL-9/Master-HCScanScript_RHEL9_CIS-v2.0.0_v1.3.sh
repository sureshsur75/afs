#!/bin/bash 
#########################################################################################################
# Author   : Sailen Roy
# Version  : 1.1.0
# Email    : sailen.roy@kyndryl.com
# Reviewed by: Ashutosh Mishra
# Modified by: #
# Platform : RHEL-9.x
# Script   : Shell script
# Title    : Security Health Check Scan Script for Redhat Linux-9.x - CIS Benchmark_v2.0.0
#DISCLAIMER AND AUTHORSHIP NOTICE - This CIS Benchmark SHC Scan Script is based on the original TechSpec-based scripting framework initially developed by Ashutosh Mishra , Devendra P & Ravindra Kumar V #
#########################################################################################################

# Check if accountName is passed as an argument and assign it to accountName variable
accountName="$1"
accountBAMID="$2"

#########################################################################################################
# Parameters to be verified
#########################################################################################################
# Define the output file
touch /tmp/output_file.txt
output_file="/tmp/output_file.txt"
 
# Redirect all output/errors to the output file
exec >"$output_file" 2>&1

########################Initial Setup/Configure Filesystem Partitions ####################################

#1.1.1.1
#Ensure cramfs kernel module is not available (Automated)
#!/usr/bin/env bash
{
 l_output="" l_output2="" l_output3="" l_dl="" # Unset output variables
 l_mname="cramfs" # set module name
 l_mtype="fs" # set module type
 l_searchloc="/lib/modprobe.d/*.conf /usr/local/lib/modprobe.d/*.conf /run/modprobe.d/*.conf /etc/modprobe.d/*.conf"
 l_mpath="/lib/modules/**/kernel/$l_mtype"
 l_mpname="$(tr '-' '_' <<< "$l_mname")"
 l_mndir="$(tr '-' '/' <<< "$l_mname")"

 module_loadable_chk()
 {
 # Check if the module is currently loadable
 l_loadable="$(modprobe -n -v "$l_mname")"
 [ "$(wc -l <<< "$l_loadable")" -gt "1" ] && l_loadable="$(grep -P -- "(^\h*install|\b$l_mname)\b" <<< "$l_loadable")"
 if grep -Pq -- '^\h*install \/bin\/(true|false)' <<< "$l_loadable"; then
 l_output="$l_output\n - module: \"$l_mname\" is not loadable: \"$l_loadable\""
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is loadable: \"$l_loadable\""
 fi
 }
 module_loaded_chk()
 {
 # Check if the module is currently loaded
 if ! lsmod | grep "$l_mname" > /dev/null 2>&1; then
 l_output="$l_output\n - module: \"$l_mname\" is not loaded"
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is loaded"
 fi
 }
 module_deny_chk()
 {
 # Check if the module is deny listed
 l_dl="y"
 if modprobe --showconfig | grep -Pq -- '^\h*blacklist\h+'"$l_mpname"'\b'; then
 l_output="$l_output\n - module: \"$l_mname\" is deny listed in: \"$(grep -Pls -- "^\h*blacklist\h+$l_mname\b" $l_searchloc)\""
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is not deny listed"
 fi
 }
 # Check if the module exists on the system
 for l_mdir in $l_mpath; do
 if [ -d "$l_mdir/$l_mndir" ] && [ -n "$(ls -A $l_mdir/$l_mndir)" ]; then
 l_output3="$l_output3\n - \"$l_mdir\""
 [ "$l_dl" != "y" ] && module_deny_chk
 if [ "$l_mdir" = "/lib/modules/$(uname -r)/kernel/$l_mtype" ]; then
 module_loadable_chk
 module_loaded_chk
 fi
 else
 l_output="$l_output\n - module: \"$l_mname\" doesn't exist in \"$l_mdir\""
 fi
 done
 # Report results. If no failures output in l_output2, we pass
 [ -n "$l_output3" ] && echo -e "\n\n -- INFO --\n - module: \"$l_mname\" exists in:$l_output3" > /dev/null
 if [ -z "$l_output2" ]; then
 echo "Initial Setup / Configure Filesystem Kernel Modules" >> p1
 echo "Ensure cramfs kernel module is not available" >> p2
 echo "Mounting of cramfs filesystems is disabled" >> p3
 echo "1.1.1.1" >> p12
 echo "Yes" >> p4
 else
 echo "Initial Setup / Configure Filesystem Kernel Modules" >> p1
 echo "Ensure cramfs kernel module is not available" >> p2
 echo "Mounting of cramfs filesystems is not disabled" >> p3
 echo "1.1.1.1" >> p12
 echo "No" >> p4
 fi
}

#########################################################################################################

# 1.1.1.2
# Ensure freevxfs kernel module is not available (Automated)
#!/usr/bin/env bash
{
 l_output="" l_output2="" l_output3="" l_dl="" # Unset output variables
 l_mname="freevxfs" # set module name
 l_mtype="fs" # set module type
 l_searchloc="/lib/modprobe.d/*.conf /usr/local/lib/modprobe.d/*.conf /run/modprobe.d/*.conf /etc/modprobe.d/*.conf"
 l_mpath="/lib/modules/**/kernel/$l_mtype"
 l_mpname="$(tr '-' '_' <<< "$l_mname")"
 l_mndir="$(tr '-' '/' <<< "$l_mname")"

 module_loadable_chk()
 {
 # Check if the module is currently loadable
 l_loadable="$(modprobe -n -v "$l_mname")"
 [ "$(wc -l <<< "$l_loadable")" -gt "1" ] && l_loadable="$(grep -P -- "(^\h*install|\b$l_mname)\b" <<< "$l_loadable")"
 if grep -Pq -- '^\h*install \/bin\/(true|false)' <<< "$l_loadable"; then
 l_output="$l_output\n - module: \"$l_mname\" is not loadable: \"$l_loadable\""
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is loadable: \"$l_loadable\""
 fi
 }

 module_loaded_chk()
 {
 # Check if the module is currently loaded
 if ! lsmod | grep "$l_mname" > /dev/null 2>&1; then
 l_output="$l_output\n - module: \"$l_mname\" is not loaded"
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is loaded"
 fi
 }

 module_deny_chk()
 {
 # Check if the module is deny listed
 l_dl="y"
 if modprobe --showconfig | grep -Pq -- '^\h*blacklist\h+'"$l_mpname"'\b'; then
 l_output="$l_output\n - module: \"$l_mname\" is deny listed in: \"$(grep -Pls -- "^\h*blacklist\h+$l_mname\b" $l_searchloc)\""
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is not deny listed"
 fi
 }

 # Check if the module exists on the system
 for l_mdir in $l_mpath; do
 if [ -d "$l_mdir/$l_mndir" ] && [ -n "$(ls -A $l_mdir/$l_mndir)" ]; then
 l_output3="$l_output3\n - \"$l_mdir\""
 [ "$l_dl" != "y" ] && module_deny_chk
 if [ "$l_mdir" = "/lib/modules/$(uname -r)/kernel/$l_mtype" ]; then
 module_loadable_chk
 module_loaded_chk
 fi
 else
 l_output="$l_output\n - module: \"$l_mname\" doesn't exist in \"$l_mdir\""
 fi
 done
 # Report results. If no failures output in l_output2, we pass
 [ -n "$l_output3" ] && echo -e "\n\n -- INFO --\n - module: \"$l_mname\" exists in:$l_output3" > /dev/null
 if [ -z "$l_output2" ]; then
 echo "Initial Setup / Configure Filesystem Kernel Modules" >> p1
 echo "Ensure freevxfs kernel module is not available" >> p2
 echo "freevxfs kernel module is not available" >> p3
 echo "Yes" >> p4
 echo "1.1.1.2" >> p12
 else
 echo "Initial Setup / Configure Filesystem Kernel Modules" >> p1
 echo "Ensure freevxfs kernel module is not available" >> p2
 echo "freevxfs kernel module is available" >> p3
 echo "No" >> p4
 echo "1.1.1.2" >> p12
 fi
}

#########################################################################################################

# 1.1.1.3
# Ensure hfs kernel module is not available (Automated)
#!/usr/bin/env bash
{
 l_output="" l_output2="" l_output3="" l_dl="" # Unset output variables
 l_mname="hfs" # set module name
 l_mtype="fs" # set module type
 l_searchloc="/lib/modprobe.d/*.conf /usr/local/lib/modprobe.d/*.conf /run/modprobe.d/*.conf /etc/modprobe.d/*.conf"
 l_mpath="/lib/modules/**/kernel/$l_mtype"
 l_mpname="$(tr '-' '_' <<< "$l_mname")"
 l_mndir="$(tr '-' '/' <<< "$l_mname")"

 module_loadable_chk()
 {
 # Check if the module is currently loadable
 l_loadable="$(modprobe -n -v "$l_mname")"
 [ "$(wc -l <<< "$l_loadable")" -gt "1" ] && l_loadable="$(grep -P -- "(^\h*install|\b$l_mname)\b" <<< "$l_loadable")"
 if grep -Pq -- '^\h*install \/bin\/(true|false)' <<< "$l_loadable"; then
 l_output="$l_output\n - module: \"$l_mname\" is not loadable: \"$l_loadable\""
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is loadable: \"$l_loadable\""
 fi
 }
 module_loaded_chk()
 {
 # Check if the module is currently loaded
 if ! lsmod | grep "$l_mname" > /dev/null 2>&1; then
 l_output="$l_output\n - module: \"$l_mname\" is not loaded"
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is loaded"
 fi
 }
 module_deny_chk()
 {
 # Check if the module is deny listed
 l_dl="y"
 if modprobe --showconfig | grep -Pq -- '^\h*blacklist\h+'"$l_mpname"'\b'; then
 l_output="$l_output\n - module: \"$l_mname\" is deny listed in: \"$(grep -Pls -- "^\h*blacklist\h+$l_mname\b" $l_searchloc)\""
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is not deny listed"
 fi
 }
 # Check if the module exists on the system
 for l_mdir in $l_mpath; do
 if [ -d "$l_mdir/$l_mndir" ] && [ -n "$(ls -A $l_mdir/$l_mndir)" ]; then
 l_output3="$l_output3\n - \"$l_mdir\""
 [ "$l_dl" != "y" ] && module_deny_chk
 if [ "$l_mdir" = "/lib/modules/$(uname -r)/kernel/$l_mtype" ]; then
 module_loadable_chk
 module_loaded_chk
 fi
 else
 l_output="$l_output\n - module: \"$l_mname\" doesn't exist in \"$l_mdir\""
 fi
 done
 # Report results. If no failures output in l_output2, we pass
 [ -n "$l_output3" ] && echo -e "\n\n -- INFO --\n - module: \"$l_mname\" exists in:$l_output3" > /dev/null
 if [ -z "$l_output2" ]; then
 echo -e "\n- Audit Result:\n ** PASS **\n$l_output\n" > /dev/null
        echo "Initial Setup / Configure Filesystem Kernel Modules" >> p1
        echo "Ensure hfs kernel module is not available" >> p2
        echo "hfs kernel module is not available" >> p3
        echo "Yes" >> p4
        echo "1.1.1.3" >> p12
 else
 echo -e "\n- Audit Result:\n ** FAIL **\n - Reason(s) for audit failure:\n$l_output2\n" > /dev/null
        echo "Initial Setup / Configure Filesystem Kernel Modules" >> p1
        echo "Ensure hfs kernel module is not available" >> p2
        echo "hfs kernel module is available" >> p3
        echo "No" >> p4
        echo "1.1.1.3" >> p12
 [ -n "$l_output" ] && echo -e "\n- Correctly set:\n$l_output\n" > /dev/null
 fi
}

#########################################################################################################

# 1.1.1.4
# Ensure hfsplus kernel module is not available (Automated)
#!/usr/bin/env bash
{
 l_output="" l_output2="" l_output3="" l_dl="" # Unset output variables
 l_mname="hfsplus" # set module name
 l_mtype="fs" # set module type
 l_searchloc="/lib/modprobe.d/*.conf /usr/local/lib/modprobe.d/*.conf /run/modprobe.d/*.conf /etc/modprobe.d/*.conf"
 l_mpath="/lib/modules/**/kernel/$l_mtype"
 l_mpname="$(tr '-' '_' <<< "$l_mname")"
 l_mndir="$(tr '-' '/' <<< "$l_mname")"

 module_loadable_chk()
 {
 # Check if the module is currently loadable
 l_loadable="$(modprobe -n -v "$l_mname")"
 [ "$(wc -l <<< "$l_loadable")" -gt "1" ] && l_loadable="$(grep -P -- "(^\h*install|\b$l_mname)\b" <<< "$l_loadable")"
 if grep -Pq -- '^\h*install \/bin\/(true|false)' <<< "$l_loadable"; then
 l_output="$l_output\n - module: \"$l_mname\" is not loadable: \"$l_loadable\""
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is loadable: \"$l_loadable\""
 fi
 }
 module_loaded_chk()
 {
 # Check if the module is currently loaded
 if ! lsmod | grep "$l_mname" > /dev/null 2>&1; then
 l_output="$l_output\n - module: \"$l_mname\" is not loaded"
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is loaded"
 fi
 }
 module_deny_chk()
 {
 # Check if the module is deny listed
 l_dl="y"
 if modprobe --showconfig | grep -Pq -- '^\h*blacklist\h+'"$l_mpname"'\b'; then
 l_output="$l_output\n - module: \"$l_mname\" is deny listed in: \"$(grep -Pls -- "^\h*blacklist\h+$l_mname\b" $l_searchloc)\""
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is not deny listed"
 fi
 }
 # Check if the module exists on the system
 for l_mdir in $l_mpath; do
 if [ -d "$l_mdir/$l_mndir" ] && [ -n "$(ls -A $l_mdir/$l_mndir)" ]; then
 l_output3="$l_output3\n - \"$l_mdir\""
 [ "$l_dl" != "y" ] && module_deny_chk
 if [ "$l_mdir" = "/lib/modules/$(uname -r)/kernel/$l_mtype" ]; then
 module_loadable_chk
 module_loaded_chk
 fi
 else
 l_output="$l_output\n - module: \"$l_mname\" doesn't exist in \"$l_mdir\""
 fi
 done
 # Report results. If no failures output in l_output2, we pass
 [ -n "$l_output3" ] && echo -e "\n\n -- INFO --\n - module: \"$l_mname\" exists in:$l_output3" > /dev/null
 if [ -z "$l_output2" ]; then
 echo -e "\n- Audit Result:\n ** PASS **\n$l_output\n" > /dev/null
        echo "Initial Setup / Configure Filesystem Kernel Modules" >> p1
        echo "Ensure hfsplus kernel module is not available" >> p2
        echo "hfsplus kernel module is not available" >> p3
        echo "Yes" >> p4
        echo "1.1.1.4" >> p12
 else
 echo -e "\n- Audit Result:\n ** FAIL **\n - Reason(s) for audit failure:\n$l_output2\n" > /dev/null
        echo "Initial Setup / Configure Filesystem Kernel Modules" >> p1
        echo "Ensure hfsplus kernel module is not available" >> p2
        echo "hfsplus kernel module is available" >> p3
        echo "No" >> p4
        echo "1.1.1.4" >> p12
 [ -n "$l_output" ] && echo -e "\n- Correctly set:\n$l_output\n" > /dev/null
 fi
}

#########################################################################################################

# 1.1.1.5
# Ensure jffs2 kernel module is not available (Automated)
#!/usr/bin/env bash
{
 l_output="" l_output2="" l_output3="" l_dl="" # Unset output variables
 l_mname="jffs2" # set module name
 l_mtype="fs" # set module type
 l_searchloc="/lib/modprobe.d/*.conf /usr/local/lib/modprobe.d/*.conf /run/modprobe.d/*.conf /etc/modprobe.d/*.conf"
 l_mpath="/lib/modules/**/kernel/$l_mtype"
 l_mpname="$(tr '-' '_' <<< "$l_mname")"
 l_mndir="$(tr '-' '/' <<< "$l_mname")"

 module_loadable_chk()
 {
 # Check if the module is currently loadable
 l_loadable="$(modprobe -n -v "$l_mname")"
 [ "$(wc -l <<< "$l_loadable")" -gt "1" ] && l_loadable="$(grep -P -- "(^\h*install|\b$l_mname)\b" <<< "$l_loadable")"
 if grep -Pq -- '^\h*install \/bin\/(true|false)' <<< "$l_loadable"; then
 l_output="$l_output\n - module: \"$l_mname\" is not loadable: \"$l_loadable\""
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is loadable: \"$l_loadable\""
 fi
 }
 module_loaded_chk()
 {
 # Check if the module is currently loaded
 if ! lsmod | grep "$l_mname" > /dev/null 2>&1; then
 l_output="$l_output\n - module: \"$l_mname\" is not loaded"
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is loaded"
 fi
 }
 module_deny_chk()
 {
 # Check if the module is deny listed
 l_dl="y"
 if modprobe --showconfig | grep -Pq -- '^\h*blacklist\h+'"$l_mpname"'\b'; then
 l_output="$l_output\n - module: \"$l_mname\" is deny listed in: \"$(grep -Pls -- "^\h*blacklist\h+$l_mname\b" $l_searchloc)\""
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is not deny listed"
 fi
 }
 # Check if the module exists on the system
 for l_mdir in $l_mpath; do
 if [ -d "$l_mdir/$l_mndir" ] && [ -n "$(ls -A $l_mdir/$l_mndir)" ]; then
 l_output3="$l_output3\n - \"$l_mdir\""
 [ "$l_dl" != "y" ] && module_deny_chk
 if [ "$l_mdir" = "/lib/modules/$(uname -r)/kernel/$l_mtype" ]; then
 module_loadable_chk
 module_loaded_chk
 fi
 else
 l_output="$l_output\n - module: \"$l_mname\" doesn't exist in \"$l_mdir\""
 fi
 done
 # Report results. If no failures output in l_output2, we pass
 [ -n "$l_output3" ] && echo -e "\n\n -- INFO --\n - module: \"$l_mname\" exists in:$l_output3" > /dev/null
 if [ -z "$l_output2" ]; then
 echo -e "\n- Audit Result:\n ** PASS **\n$l_output\n" > /dev/null
        echo "Initial Setup / Configure Filesystem Kernel Modules" >> p1
        echo "Ensure jffs2 kernel module is not available" >> p2
        echo "jffs2 kernel module is not available" >> p3
        echo "Yes" >> p4
        echo "1.1.1.5" >> p12
 else
 echo -e "\n- Audit Result:\n ** FAIL **\n - Reason(s) for audit failure:\n$l_output2\n" > /dev/null
        echo "Initial Setup / Configure Filesystem Kernel Modules" >> p1
        echo "Ensure jffs2 kernel module is not available" >> p2
        echo "jffs2 kernel module is available" >> p3
        echo "No" >> p4
        echo "1.1.1.5" >> p12
 [ -n "$l_output" ] && echo -e "\n- Correctly set:\n$l_output\n" > /dev/null
 fi
}

#########################################################################################################

# 1.1.1.8
# Ensure usb-storage kernel module is not available (Automated)
#!/usr/bin/env bash
{
 l_output="" l_output2="" l_output3="" l_dl="" # Unset output variables
 l_mname="usb-storage" # set module name
 l_mtype="drivers" # set module type
 l_searchloc="/lib/modprobe.d/*.conf /usr/local/lib/modprobe.d/*.conf /run/modprobe.d/*.conf /etc/modprobe.d/*.conf"
 l_mpath="/lib/modules/**/kernel/$l_mtype"
 l_mpname="$(tr '-' '_' <<< "$l_mname")"
 l_mndir="$(tr '-' '/' <<< "$l_mname")"

 module_loadable_chk()
 {
 # Check if the module is currently loadable
 l_loadable="$(modprobe -n -v "$l_mname")"
 [ "$(wc -l <<< "$l_loadable")" -gt "1" ] && l_loadable="$(grep -P -- "(^\h*install|\b$l_mname)\b" <<< "$l_loadable")"
 if grep -Pq -- '^\h*install \/bin\/(true|false)' <<< "$l_loadable"; then
 l_output="$l_output\n - module: \"$l_mname\" is not loadable: \"$l_loadable\""
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is loadable: \"$l_loadable\""
 fi
 }
 module_loaded_chk()
 {
 # Check if the module is currently loaded
 if ! lsmod | grep "$l_mname" > /dev/null 2>&1; then
 l_output="$l_output\n - module: \"$l_mname\" is not loaded"
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is loaded"
 fi
 }
 module_deny_chk()
 {
 # Check if the module is deny listed
 l_dl="y"
 if modprobe --showconfig | grep -Pq -- '^\h*blacklist\h+'"$l_mpname"'\b'; then
 l_output="$l_output\n - module: \"$l_mname\" is deny listed in: \"$(grep -Pls -- "^\h*blacklist\h+$l_mname\b" $l_searchloc)\""
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is not deny listed"
 fi
 }
 # Check if the module exists on the system
 for l_mdir in $l_mpath; do
 if [ -d "$l_mdir/$l_mndir" ] && [ -n "$(ls -A $l_mdir/$l_mndir)" ]; then
 l_output3="$l_output3\n - \"$l_mdir\""
 [ "$l_dl" != "y" ] && module_deny_chk
 if [ "$l_mdir" = "/lib/modules/$(uname -r)/kernel/$l_mtype" ]; then
 module_loadable_chk
 module_loaded_chk
 fi
 else
 l_output="$l_output\n - module: \"$l_mname\" doesn't exist in \"$l_mdir\""
 fi
 done
 # Report results. If no failures output in l_output2, we pass
 [ -n "$l_output3" ] && echo -e "\n\n -- INFO --\n - module: \"$l_mname\" exists in:$l_output3" > /dev/null
 if [ -z "$l_output2" ]; then
 echo -e "\n- Audit Result:\n ** PASS **\n$l_output\n" > /dev/null
        echo "Initial Setup / Configure Filesystem Kernel Modules" >> p1
        echo "Ensure usb-storage kernel module is not available" >> p2
        echo "usb-storage kernel module is not available" >> p3
    	echo "Yes" >> p4
        echo "1.1.1.8" >> p12
 else
 echo -e "\n- Audit Result:\n ** FAIL **\n - Reason(s) for audit failure:\n$l_output2\n" > /dev/null
        echo "Initial Setup / Configure Filesystem Kernel Modules" >> p1
        echo "Ensure usb-storage kernel module is not available" >> p2
        echo "usb-storage kernel module is available" >> p3
    	echo "No" >> p4
        echo "1.1.1.8" >> p12
 [ -n "$l_output" ] && echo -e "\n- Correctly set:\n$l_output\n" > /dev/null
 fi
}

###########################Initial Setup / Configure Filesystem Partitions #########################

#1.1.2.1.1
#Ensure /tmp is a separate partition (Automated)

if findmnt --kernel /tmp > /dev/null 2>&1; then
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
	echo "Ensure /tmp is a separate partition" >> p2
	echo "/tmp is a separate partition" >> p3
	echo "Yes" >> p4
	echo "1.1.2.1.1" >> p12
	# Check if systemd will mount /tmp at boot time
	mount_status=$(systemctl is-enabled tmp.mount 2>&1)
	if [[ "$mount_status" == "static" || "$mount_status" == "generated" ]]; then
		echo "Initial Setup / Configure Filesystem Partitions" >> p1
		echo "Ensure /tmp is a separate partition" >> p2
		echo "Systemd will mount /tmp at boot time(status: $mount_status) " >> p3
		echo "Yes" >> p4
		echo "1.1.2.1.1" >> p12
	else
		echo "Initial Setup / Configure Filesystem Partitions" >> p1
		echo "Ensure /tmp is a separate partition" >> p2
		echo "Systemd will not mount /tmp at boot time(status: $mount_status)" >> p3
		echo "No" >> p4
		echo "1.1.2.1.1" >> p12
	fi
else
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
	echo "Ensure /tmp is a separate partition" >> p2
	echo "/tmp is not a separate partition" >> p3
	echo "No" >> p4
	echo "1.1.2.1.1" >> p12
fi

########################################################################################################

# 1.1.2.1.2
# Ensure nodev option set on /tmp partition (Automated)
pt1="/tmp"
if mountpoint -q "$pt1"; then
    # Get the mount options for the partition
    mount_options1=$(findmnt -kn -o OPTIONS "$pt1")
    # Check if 'nodev' option is set
    if echo "$mount_options1" | grep -q "nodev"; then
        echo "Initial Setup / Configure Filesystem Partitions" >> p1
        echo "Ensure nodev option set on /tmp partition" >> p2
        echo "nodev option is set for $pt1" >> p3
        echo "Yes" >> p4
        echo "1.1.2.1.2" >> p12
    else
        echo "Initial Setup / Configure Filesystem Partitions" >> p1
        echo "Ensure nodev option set on /tmp partition" >> p2
        echo "nodev option is not set for $pt1" >> p3
        echo "No" >> p4
        echo "1.1.2.1.2" >> p12
    fi
else
    echo "Initial Setup / Configure Filesystem Partitions" >> p1
    echo "Ensure nodev option set on /tmp partition" >> p2
    echo "$pt1 is not a separate partition" >> p3
    echo "No" >> p4
    echo "1.1.2.1.2" >> p12
fi

#########################################################################################################

# 1.1.2.1.3
# Ensure nosuid option set on /tmp partition (Automated)
pt3="/tmp"
if mountpoint -q "$pt3"; then
    mount_options3=$(findmnt -kn -o OPTIONS "$pt3")
    if echo "$mount_options3" | grep -q "nosuid"; then
        echo "Initial Setup / Configure Filesystem Partitions" >> p1
        echo "Ensure nosuid option set on /tmp partition" >> p2
        echo "nosuid option is set for $pt3" >> p3
        echo "Yes" >> p4
        echo "1.1.2.1.3" >> p12
    else
        echo "Initial Setup / Configure Filesystem Partitions" >> p1
        echo "Ensure nosuid option set on /tmp partition" >> p2
        echo "nosuid option is not set for $pt3" >> p3
        echo "No" >> p4
        echo "1.1.2.1.3" >> p12
    fi
else
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
   	echo "Ensure nosuid option set on /tmp partition" >> p2
    	echo "$pt3 is not a separate partition" >> p3
    	echo "No" >> p4
    	echo "1.1.2.1.3" >> p12
    fi

#########################################################################################################

# 1.1.2.1.4
# Ensure noexec option set on /tmp partition (Automated)
pt4="/tmp"
if mountpoint -q "$pt4"; then
    mount_options2=$(findmnt -kn -o OPTIONS "$pt4")
    if echo "$mount_options2" | grep -q "noexec"; then
        echo "Initial Setup / Configure Filesystem Partitions" >> p1
        echo "Ensure noexec option set on /tmp partition" >> p2
        echo "noexec option is set for $pt4" >> p3
        echo "Yes" >> p4
        echo "1.1.2.1.4" >> p12
    else
        echo "Initial Setup / Configure Filesystem Partitions" >> p1
        echo "Ensure noexec option set on /tmp partition" >> p2
        echo "noexec option is not set for $pt4" >> p3
        echo "No" >> p4
        echo "1.1.2.1.4" >> p12
    fi
else
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
    	echo "Ensure noexec option set on /tmp partition" >> p2
    	echo "$pt4 is not a separate partition" >> p3
    	echo "No" >> p4
        echo "1.1.2.1.4" >> p12
    fi

########################################################################################################

# 1.1.2.2.1
# Ensure /dev/shm is a separate partition

echo "Initial Setup / Configure Filesystem Partitions" >>p1
echo "Ensure /dev/shm is a separate partition" >>p2

if findmnt -kn /dev/shm >/dev/null 2>&1; then
    echo "/dev/shm is a separate partition" >>p3
    echo "Yes" >>p4
else
    echo "/dev/shm is NOT a separate partition" >>p3
    echo "No" >>p4
fi

echo "1.1.2.2.1" >>p12

########################################################################################################

# 1.1.2.2.2
# Ensure nodev option set on /dev/shm partition

echo "Initial Setup / Configure Filesystem Partitions" >>p1
echo "Ensure nodev option set on /dev/shm partition" >>p2

mnt_opts=$(findmnt -kn -o OPTIONS /dev/shm 2>/dev/null)

if [ -z "$mnt_opts" ]; then
    echo "/dev/shm is not mounted; cannot check nodev" >>p3
    echo "No" >>p4
else
    if echo "$mnt_opts" | grep -q "nodev"; then
        echo "nodev option is set for /dev/shm" >>p3
        echo "Yes" >>p4
    else
        echo "nodev option is NOT set for /dev/shm" >>p3
        echo "No" >>p4
    fi
fi

echo "1.1.2.2.2" >>p12

########################################################################################################

# 1.1.2.2.3
# Ensure nosuid option set on /dev/shm partition

echo "Initial Setup / Configure Filesystem Partitions" >>p1
echo "Ensure nosuid option set on /dev/shm partition" >>p2

mnt_opts=$(findmnt -kn -o OPTIONS /dev/shm 2>/dev/null)

if [ -z "$mnt_opts" ]; then
    echo "/dev/shm is not mounted; cannot check nosuid" >>p3
    echo "No" >>p4
else
    if echo "$mnt_opts" | grep -q "nosuid"; then
        echo "nosuid option is set for /dev/shm" >>p3
        echo "Yes" >>p4
    else
        echo "nosuid option is NOT set for /dev/shm" >>p3
        echo "No" >>p4
    fi
fi

echo "1.1.2.2.3" >>p12

#########################################################################################################

# 1.1.2.2.4
# Ensure noexec option set on /dev/shm partition

echo "Initial Setup / Configure Filesystem Partitions" >>p1
echo "Ensure noexec option set on /dev/shm partition" >>p2

mnt_opts=$(findmnt -kn -o OPTIONS /dev/shm 2>/dev/null)

if [ -z "$mnt_opts" ]; then
    echo "/dev/shm is not mounted; cannot check noexec" >>p3
    echo "No" >>p4
else
    if echo "$mnt_opts" | grep -q "noexec"; then
        echo "noexec option is set for /dev/shm" >>p3
        echo "Yes" >>p4
    else
        echo "noexec option is NOT set for /dev/shm" >>p3
        echo "No" >>p4
    fi
fi

echo "1.1.2.2.4" >>p12

#########################################################################################################

# 1.1.2.3.2
# Ensure nodev option set on /home partition (Automated)
pt20="/home"
if mountpoint -q "$pt20"; then
    mount_options20=$(findmnt -kn -o OPTIONS "$pt20")
    if echo "$mount_options20" | grep -q "nodev"; then
        echo "Initial Setup / Configure Filesystem Partitions" >> p1
        echo "Ensure nodev option set on /home partition" >> p2
        echo "nodev option is set for $pt20" >> p3
        echo "Yes" >> p4
        echo "1.1.2.3.2" >> p12
    else
        echo "Initial Setup / Configure Filesystem Partitions" >> p1
        echo "Ensure nodev option set on /home partition" >> p2
        echo "nodev option is not set for $pt20" >> p3
        echo "No" >> p4
        echo "1.1.2.3.2" >> p12
    fi
else
        echo "Initial Setup / Configure Filesystem Partitions" >> p1
        echo "Ensure nodev option set on /home partition" >> p2
        echo "$pt20 is not a separate partition" >> p3
        echo "No" >> p4
        echo "1.1.2.3.2" >> p12
fi

########################################################################################################

# 1.1.2.3.3
# Ensure nosuid option set on /home partition (Automated)
pt21="/home"
if mountpoint -q "$pt21"; then
    mount_options21=$(findmnt -kn -o OPTIONS "$pt21")
    if echo "$mount_options21" | grep -q "nosuid"; then
        echo "Initial Setup / Configure Filesystem Partitions" >> p1
        echo "Ensure nosuid option set on /home partition" >> p2
        echo "nosuid option is set for $pt21" >> p3
        echo "Yes" >> p4
        echo "1.1.2.3.3" >> p12
    else
        echo "Initial Setup / Configure Filesystem Partitions" >> p1
        echo "Ensure nosuid option set on /home partition" >> p2
        echo "nosuid option is not set for $pt21" >> p3
        echo "No" >> p4
        echo "1.1.2.3.3" >> p12
    fi
else
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
    	echo "Ensure nosuid option set on /home partition" >> p2
    	echo "$pt21 is not a separate partition" >> p3
    	echo "No" >> p4
    	echo "1.1.2.3.3" >> p12
    fi

#########################################################################################################

# 1.1.2.4.2
# Ensure nodev option set on /var partition (Automated)
pt42="/var"
if mountpoint -q "$pt42"; then
    mount_options5=$(findmnt -kn -o OPTIONS "$pt42")
    if echo "$mount_options5" | grep -q "nodev"; then
        echo "Initial Setup / Configure Filesystem Partitions" >> p1
        echo "Ensure nodev option set on /var partition" >> p2
        echo "nodev option is set for $pt42" >> p3
        echo "Yes" >> p4
        echo "1.1.2.4.2" >> p12
    else
        echo "Initial Setup / Configure Filesystem Partitions" >> p1
        echo "Ensure nodev option set on /var partition" >> p2
        echo "nodev option is not set for $pt42" >> p3
        echo "No" >> p4
        echo "1.1.2.4.2" >> p12
    fi
else
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
    	echo "Ensure nodev option set on /var partition" >> p2
    	echo "$pt42 is not a separate partition" >> p3
    	echo "No" >> p4
    	echo "1.1.2.4.2" >> p12
    fi

########################################################################################################

#1.1.2.4.3
#Ensure nosuid option set on /var partition
pt43="/var"
if mountpoint -q "$pt43"; then
    mount_options6=$(findmnt -kn -o OPTIONS "$pt43")
    if echo "$mount_options6" | grep -q "nosuid"; then
        echo "Initial Setup / Configure Filesystem Partitions" >> p1
        echo "Ensure nosuid option set on /var partition" >> p2
        echo "nosuid option is set for $pt43" >> p3
        echo "Yes" >> p4
        echo "1.1.2.4.3" >> p12
    else
        echo "Initial Setup / Configure Filesystem Partitions" >> p1
        echo "Ensure nosuid option set on /var partition" >> p2
        echo "nosuid option is not set for $pt43" >> p3
        echo "No" >> p4
    
        echo "1.1.2.4.3" >> p12
    fi
else
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
    	echo "Ensure nosuid option set on /var partition" >> p2
    	echo "$pt43 is not a separate partition" >> p3
    	echo "No" >> p4
    	echo "1.1.2.4.3" >> p12
    fi
    
########################################################################################################

# 1.1.2.5.2
# Ensure nodev option set on /var/tmp partition (Automated)
pt52="/var/tmp"
if mountpoint -q "$pt52"; then
    mount_options10=$(findmnt -kn -o OPTIONS "$pt52")
    if echo "$mount_options10" | grep -q "nodev"; then
        echo "Initial Setup / Configure Filesystem Partitions" >> p1
        echo "Ensure nodev option set on /var/tmp partition" >> p2
        echo "nodev option is set for $pt52" >> p3
        echo "Yes" >> p4
        echo "1.1.2.5.2" >> p12
    else
        echo "Initial Setup / Configure Filesystem Partitions" >> p1
        echo "Ensure nodev option set on /var/tmp partition" >> p2
        echo "nodev option is not set for $pt52" >> p3
        echo "No" >> p4
        echo "1.1.2.5.2" >> p12
    fi
else
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
    	echo "Ensure nodev option set on /var/tmp partition" >> p2
    	echo "$pt52 is not a separate partition" >> p3
    	echo "No" >> p4
    	echo "1.1.2.5.2" >> p12
    fi

#########################################################################################################

# 1.1.2.5.3
# Ensure nosuid option set on /var/tmp partition (Automated)
pt53="/var/tmp"
if mountpoint -q "$pt53"; then
    mount_options9=$(findmnt -kn -o OPTIONS "$pt53")
    if echo "$mount_options9" | grep -q "nosuid"; then
        echo "Initial Setup / Configure Filesystem Partitions" >> p1
        echo "Ensure nosuid option set on /var/tmp partition" >> p2
        echo "nosuid option is set for $pt53" >> p3
        echo "Yes" >> p4
        echo "1.1.2.5.3" >> p12
    else
        echo "Initial Setup / Configure Filesystem Partitions" >> p1
        echo "Ensure nosuid option set on /var/tmp partition" >> p2
        echo "nosuid option is not set for $pt53" >> p3
        echo "No" >> p4
        echo "1.1.2.5.3" >> p12
    fi
else
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
    	echo "Ensure nosuid option set on /var/tmp partition" >> p2
    	echo "$pt53 is not a separate partition" >> p3
    	echo "No" >> p4
    	echo "1.1.2.5.3" >> p12
   fi

#########################################################################################################

# 1.1.2.5.4
# Ensure noexec option set on /var/tmp partition (Automated)
pt54="/var/tmp"
if mountpoint -q "$pt54"; then
    mount_options8=$(findmnt -kn -o OPTIONS "$pt54")
    if echo "$mount_options8" | grep -q "noexec"; then
        echo "Initial Setup / Configure Filesystem Partitions" >> p1
        echo "Ensure noexec option set on /var/tmp partition" >> p2
        echo "noexec option is set for $pt54" >> p3
        echo "Yes" >> p4
        echo "1.1.2.5.4" >> p12
    else
        echo "Initial Setup / Configure Filesystem Partitions" >> p1
        echo "Ensure noexec option set on /var/tmp partition" >> p2
        echo "noexec option is not set for $pt54" >> p3
        echo "No" >> p4
        echo "1.1.2.5.4" >> p12
    fi
else
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
    	echo "Ensure noexec option set on /var/tmp partition" >> p2
    	echo "$pt54 is not a separate partition" >> p3
    	echo "No" >> p4
    	echo "1.1.2.5.4" >> p12
    fi

########################################################################################################

# 1.1.2.6.2
# Ensure nodev option set on /var/log partition (Automated)

echo "Initial Setup / Configure Filesystem Partitions" >>p1
echo "Ensure nodev option set on /var/log partition" >>p2

mnt_line=$(findmnt -kn /var/log 2>/dev/null)
mnt_opts=$(findmnt -kn -o OPTIONS /var/log 2>/dev/null)

if [ -z "$mnt_line" ]; then
  echo "/var/log is not a separate mount; cannot validate nodev on /var/log" >>p3
  echo "No" >>p4
else
  if echo "$mnt_opts" | grep -Ek '(^|,)nodev(,|$)'; then
    echo "/var/log mount options OK (nodev present)" >>p3
    echo "Yes" >>p4
  else
    echo "/var/log mount options missing nodev" >>p3
    echo "No" >>p4
  fi
fi

echo "1.1.2.6.2" >>p12

#########################################################################################################

# 1.1.2.6.3
# Ensure nosuid option set on /var/log partition (Automated)

echo "Initial Setup / Configure Filesystem Partitions" >>p1
echo "Ensure nosuid option set on /var/log partition" >>p2

mnt_line=$(findmnt -kn /var/log 2>/dev/null)
mnt_opts=$(findmnt -kn -o OPTIONS /var/log 2>/dev/null)

if [ -z "$mnt_line" ]; then
  echo "/var/log is not a separate mount; cannot validate nosuid on /var/log" >>p3
  echo "No" >>p4
else
  if echo "$mnt_opts" | grep -Eq '(^|,)nosuid(,|$)'; then
    echo "/var/log mount options OK (nosuid present)" >>p3
    echo "Yes" >>p4
  else
    echo "/var/log mount options missing nosuid" >>p3
    echo "No" >>p4
  fi
fi

echo "1.1.2.6.3" >>p12

########################################################################################################

# 1.1.2.6.4
# Ensure noexec option set on /var/log partition (Automated)

echo "Initial Setup / Configure Filesystem Partitions" >>p1
echo "Ensure noexec option set on /var/log partition" >>p2

mnt_line=$(findmnt -kn /var/log 2>/dev/null)
mnt_opts=$(findmnt -kn -o OPTIONS /var/log 2>/dev/null)

if [ -z "$mnt_line" ]; then
  echo "/var/log is not a separate mount; cannot validate noexec on /var/log" >>p3
  echo "No" >>p4
else
  if echo "$mnt_opts" | grep -Eq '(^|,)noexec(,|$)'; then
    echo "/var/log mount options OK (noexec present)" >>p3
    echo "Yes" >>p4
  else
    echo "/var/log mount options missing noexec" >>p3
    echo "No" >>p4
  fi
fi

echo "1.1.2.6.4" >>p12

#########################################################################################################

# 1.1.2.7.2
# Ensure nodev option set on /var/log/audit partition (Automated)

echo "Initial Setup / Configure Filesystem Partitions" >>p1
echo "Ensure nodev option set on /var/log/audit partition" >>p2

mnt_line=$(findmnt -kn /var/log/audit 2>/dev/null)
mnt_opts=$(findmnt -kn -o OPTIONS /var/log/audit 2>/dev/null)

if [ -z "$mnt_line" ]; then
  echo "/var/log/audit is not a separate mount; cannot validate nodev on /var/log/audit" >>p3
  echo "No" >>p4
else
  if echo "$mnt_opts" | grep -Eq '(^|,)nodev(,|$)'; then
    echo "/var/log/audit mount options OK (nodev present)" >>p3
    echo "Yes" >>p4
  else
    echo "/var/log/audit mount options missing nodev" >>p3
    echo "No" >>p4
  fi
fi

echo "1.1.2.7.2" >>p12

#########################################################################################################

# 1.1.2.7.3
# Ensure nosuid option set on /var/log/audit partition (Automated)

echo "Initial Setup / Configure Filesystem Partitions" >>p1
echo "Ensure nosuid option set on /var/log/audit partition" >>p2

mnt_line=$(findmnt -kn /var/log/audit 2>/dev/null)
mnt_opts=$(findmnt -kn -o OPTIONS /var/log/audit 2>/dev/null)

if [ -z "$mnt_line" ]; then
  echo "/var/log/audit is not a separate mount; cannot validate nosuid on /var/log/audit" >>p3
  echo "No" >>p4
else
  if echo "$mnt_opts" | grep -Eq '(^|,)nosuid(,|$)'; then
    echo "/var/log/audit mount options OK (nosuid present)" >>p3
    echo "Yes" >>p4
  else
    echo "/var/log/audit mount options missing nosuid " >>p3
    echo "No" >>p4
  fi
fi

echo "1.1.2.7.3" >>p12

########################################################################################################

# 1.1.2.7.4
# Ensure noexec option set on /var/log/audit partition (Automated)

echo "Initial Setup / Configure Filesystem Partitions" >>p1
echo "Ensure noexec option set on /var/log/audit partition" >>p2

mnt_line=$(findmnt -kn /var/log/audit 2>/dev/null)
mnt_opts=$(findmnt -kn -o OPTIONS /var/log/audit 2>/dev/null)

if [ -z "$mnt_line" ]; then
  echo "/var/log/audit is not a separate mount; cannot validate noexec on /var/log/audit" >>p3
  echo "No" >>p4
else
  if echo "$mnt_opts" | grep -Eq '(^|,)noexec(,|$)'; then
    echo "/var/log/audit mount options OK (noexec present)" >>p3
    echo "Yes" >>p4
  else
    echo "/var/log/audit mount options missing noexec " >>p3
    echo "No" >>p4
  fi
fi

echo "1.1.2.7.4" >>p12

#########################################################################################################

# 1.2.1.2
# Ensure gpgcheck is globally activated (Automated)

echo "Initial Setup / Package Management" >>p1
echo "Ensure gpgcheck is globally activated" >>p2

# Global check in /etc/dnf/dnf.conf (accept 1|true|yes, case-insensitive)
global_ok=$(grep -Pi '^\s*gpgcheck\s*=\s*(1|true|yes)\b' /etc/dnf/dnf.conf 2>/dev/null || true)

# Any repo overrides that disable gpgcheck (0, false, no, or invalid non-boolean values)?
bad_overrides=$(grep -Pris --include='*.repo' -E '^\s*gpgcheck\s*=\s*(0|[2-9]|[1-9][0-9]+|false|no)\b' /etc/yum.repos.d 2>/dev/null \
  | sed -E 's/[[:space:]]+/ /g' \
  | paste -sd ',' -)

if [ -z "$global_ok" ]; then
  # Global not enabled
  if [ -n "$bad_overrides" ]; then
    echo "Global gpgcheck is NOT enabled in /etc/dnf/dnf.conf; repo overrides disabling it: $bad_overrides" >>p3
  else
    echo "Global gpgcheck is NOT enabled in /etc/dnf/dnf.conf; no disabling overrides found" >>p3
  fi
  echo "No" >>p4
else
  # Global enabled; ensure no repo disables it
  if [ -n "$bad_overrides" ]; then
    echo "Global gpgcheck enabled; BUT repo overrides disable/invalid: $bad_overrides" >>p3
    echo "No" >>p4
  else
    echo "Global gpgcheck enabled; no repo overrides disabling it" >>p3
    echo "Yes" >>p4
  fi
fi

echo "1.2.1.2" >>p12

########################################################################################################

#1.3.1.1
#Ensure SELinux is installed (Automated)
rpm -q libselinux >/dev/null 2>&1
if [ $? -eq 0 ]
	then
		echo "Initial Setup / Mandatory Access Control" >> p1
		echo "Ensure SELinux is installed" >> p2
		echo "SELinux is installed " >> p3
		echo "Yes" >> p4
		echo "1.3.1.1" >> p12
	else
		echo "Initial Setup / Mandatory Access Control" >> p1
		echo "Ensure SELinux is installed" >> p2
		echo "SELinux is not installed" >> p3
		echo "No" >> p4
		echo "1.3.1.1" >> p12
fi

########################################################################################################

#1.3.1.2
#Ensure SELinux is not disabled in bootloader configuration (Automated)
otpt2=$(grubby --info=ALL | grep -Po '(selinux|enforcing)=0\b')

if [[ -z "$otpt2" ]]; then
    echo "Initial Setup / Mandatory Access Control" >> p1
    echo "Ensure SELinux is not disabled in bootloader configuration" >> p2
    echo "SELinux is not disabled in bootloader configuration" >> p3
    echo "Yes" >> p4
    echo "1.3.1.2" >> p12
else
    echo "Initial Setup / Mandatory Access Control" >> p1
    echo "Ensure SELinux is not disabled in bootloader configuration" >> p2
    echo "SELinux is disabled in bootloader configuration" >> p3
    echo "No" >> p4
    echo "1.3.1.2" >> p12
fi

#########################################################################################################

# 1.3.1.3
# Ensure SELinux policy is configured (Automated)

echo "Initial Setup / Mandatory Access Control" >>p1
echo "Ensure SELinux policy is configured (targeted or mls)" >>p2

# Audit exactly as specified:
# 1) grep SELINUXTYPE in /etc/selinux/config -> targeted|mls
cfg=$(grep -E '^[[:space:]]*SELINUXTYPE=(targeted|mls)\b' /etc/selinux/config 2>/dev/null | awk -F= '{print tolower($2)}' | head -n1)
# 2) sestatus | grep Loaded -> policy name targeted|mls
loaded=$(sestatus 2>/dev/null | grep -i '^Loaded policy name:' | awk -F: '{gsub(/^[[:space:]]+/,"",$2); print tolower($2)}' | head -n1)

# Decide result
if [ -n "$cfg" ] && { [ "$cfg" = "targeted" ] || [ "$cfg" = "mls" ]; } \
   && [ -n "$loaded" ] && { [ "$loaded" = "targeted" ] || [ "$loaded" = "mls" ]; }; then
    echo "SELinux configured policy: ${cfg:-unset}; loaded policy: ${loaded:-unset}" >>p3
    echo "Yes" >>p4
else
    echo "SELinux configured policy: ${cfg:-unset}; loaded policy: ${loaded:-unset} (expected targeted or mls)" >>p3
    echo "No" >>p4
fi

echo "1.3.1.3" >>p12

#########################################################################################################

# 1.3.1.4
# Ensure the SELinux mode is not disabled (Automated)

echo "Initial Setup / Mandatory Access Control" >>p1
echo "Ensure SELinux mode is not disabled" >>p2

# Audit exactly as specified:
# 1) Runtime mode: getenforce -> Enforcing|Permissive|Disabled
runtime_mode=$(getenforce 2>/dev/null | awk '{print tolower($0)}')

# 2) Configured mode in /etc/selinux/config -> enforcing|permissive (NOT disabled)
cfg_mode=$(grep -Ei '^[[:space:]]*SELINUX=(enforcing|permissive)' /etc/selinux/config 2>/dev/null \
           | awk -F= '{print tolower($2)}' | head -n1)

# Build current value
msg="SELinux runtime mode: ${runtime_mode:-unset}; configured mode: ${cfg_mode:-unset}"

# Pass if runtime is not 'disabled' AND configured is enforcing|permissive
if [ -n "$runtime_mode" ] && [ "$runtime_mode" != "disabled" ] \
   && [ -n "$cfg_mode" ] && { [ "$cfg_mode" = "enforcing" ] || [ "$cfg_mode" = "permissive" ]; }; then
    echo "$msg" >>p3
    echo "Yes" >>p4
else
    echo "$msg (expected runtime!=disabled and config=enforcing|permissive)" >>p3
    echo "No" >>p4
fi

echo "1.3.1.4" >>p12

########################################################################################################

#1.3.1.7
#Ensure the MCS Translation Service (mcstrans) is not installed (Automated)
rpm -q mcstrans >/dev/null 2>&1
if [ $? -eq 0 ]
	then
		echo "Initial Setup / Mandatory Access Control" >> p1
		echo "Ensure the MCS Translation Service (mcstrans) is not installed" >> p2
		echo "MCS Translation Service is installed" >> p3
		echo "No" >> p4
		echo "1.3.1.7" >> p12
	else
		echo "Initial Setup / Mandatory Access Control" >> p1
		echo "Ensure the MCS Translation Service (mcstrans) is not installed" >> p2
		echo "MCS Translation Service is not installed" >> p3
		echo "Yes" >> p4
		echo "1.3.1.7" >> p12
fi

#########################################################################################################

#1.3.1.8
#Ensure SETroubleshoot is not installed (Automated)

rpm -q setroubleshoot >/dev/null 2>&1
if [ $? -eq 0 ]
	then
		echo "Initial Setup / Mandatory Access Control" >> p1
		echo "Ensure SETroubleshoot is not installed" >> p2
		echo "SETroubleshoot is installed" >> p3
		echo "No" >> p4
		echo "1.3.1.8" >> p12
	else
		echo "Initial Setup / Mandatory Access Control" >> p1
		echo "Ensure SETroubleshoot is not installed" >> p2
		echo "SETroubleshoot is not installed" >> p3
		echo "Yes" >> p4
		echo "1.3.1.8" >> p12
fi

#########################################################################################################

#1.4.1
#Ensure bootloader password is set (Automated)
l_grub_password_file="$(find /boot -type f -name 'user.cfg' ! -empty)"
 if [ -f "$l_grub_password_file" ]; then
 awk -F. '/^\s*GRUB2_PASSWORD=\S+/ {print $1"."$2"."$3}' "$l_grub_password_file"
	echo "Initial Setup / Configure Bootloader" >> p1
	echo "Ensure bootloader password is set" >> p2
	echo "Bootloader password is set" >> p3
	echo "Yes" >> p4
	echo "1.4.1" >> p12
else
	echo "Initial Setup / Configure Bootloader" >> p1
	echo "Ensure bootloader password is set" >> p2
	echo "Bootloader password is not set" >> p3
	echo "No" >> p4
	echo "1.4.1" >> p12
 fi
########################################################################################################

#1.4.2
#Ensure access to bootloader config is configured (Automated)

issues=""

while IFS= read -r -d '' f; do
    read -r mode user group < <(stat -Lc '%a %U %G' "$f" 2>/dev/null)

    if [[ "$f" == /boot/efi/EFI/* ]]; then
        max_mode=700
    else
        max_mode=600
    fi

    if [ "$user" != "root" ]; then
        issues="$issues $f owner_not_root;"
    fi

    if [ "$group" != "root" ]; then
        issues="$issues $f group_not_root;"
    fi

    if [ "$mode" -gt "$max_mode" ]; then
        issues="$issues $f permission_too_open;"
    fi

done < <(find /boot -type f \( -name 'grub*' -o -name 'user.cfg' \) -print0 2>/dev/null)

if [ -z "$issues" ]; then
        echo "Initial Setup / Configure Bootloader" >> p1
        echo "Ensure access to bootloader config is configured" >> p2
        echo "Bootloader config permissions are correctly set" >> p3
        echo "Yes" >> p4
        echo "1.4.2" >> p12
else
        echo "Initial Setup / Configure Bootloader" >> p1
        echo "Ensure access to bootloader config is configured" >> p2
        echo "Bootloader config permission issues found" >> p3
        echo "No" >> p4
        echo "1.4.2" >> p12
fi


#########################################################################################################

# 1.5.1
# Ensure address space layout randomization is enabled (Automated)

echo "Initial Setup / Configure Additional Process Hardening" >>p1
echo "Ensure address space layout randomization is enabled" >>p2

# Runtime value (current kernel setting)
runtime_val=$(sysctl -n kernel.randomize_va_space 2>/dev/null | tr -d '[:space:]')

# Effective (durable) setting from merged sysctl config (respects precedence)
# Reads all sysctl.d files and /etc/sysctl.conf via systemd, keeps the LAST assignment.
eff_val=$(/usr/lib/systemd/systemd-sysctl --cat-config 2>/dev/null \
  | awk 'BEGIN{IGNORECASE=1}
         /^[[:space:]]*#/ {next}
         /^[[:space:]]*kernel\.randomize_va_space[[:space:]]*=/ {
           val=$0; sub(/^[^=]*=/,"",val); gsub(/[[:space:]]/,"",val)
         }
         END{if (val!="") print val}')

# Build CURRENT-VALUE message (single line, no tabs)
if [ "$runtime_val" = "2" ] && [ "$eff_val" = "2" ]; then
  echo "Address space layout randomization (ASLR) is enabled. (Runtime: ${runtime_val:-unset}; Effective: ${eff_val:-unset})" >>p3
  echo "Yes" >>p4
else
  rv=${runtime_val:-unset}
  ev=${eff_val:-unset}
  echo "Address space layout randomization (ASLR) is NOT enabled. (Runtime: $rv; Effective: $ev; expected 2)" >>p3
  echo "No" >>p4
fi

echo "1.5.1" >>p12

#########################################################################################################

# 1.5.2
# Ensure ptrace_scope is restricted (Automated)

echo "Initial Setup / Configure Additional Process Hardening" >>p1
echo "Ensure ptrace_scope is restricted" >>p2

# Runtime value (what the kernel is using now)
runtime_val=$(sysctl -n kernel.yama.ptrace_scope 2>/dev/null | tr -d '[:space:]')

# Effective (durable) setting from merged sysctl config (respects precedence)
# Reads all sysctl.d files and /etc/sysctl.conf via systemd, keeps the LAST assignment.
eff_val=$(/usr/lib/systemd/systemd-sysctl --cat-config 2>/dev/null \
  | awk 'BEGIN{IGNORECASE=1}
         /^[[:space:]]*#/ {next}
         /^[[:space:]]*kernel\.yama\.ptrace_scope[[:space:]]*=/ {
           val=$0; sub(/^[^=]*=/,"",val); gsub(/[[:space:]]/,"",val)
         }
         END{if (val!="") print val}')

# Build CURRENT-VALUE message (single line, no tabs)
if [ "$runtime_val" = "1" ] && [ "$eff_val" = "1" ]; then
  echo "ptrace_scope is restricted. (Runtime: ${runtime_val:-unset}; Effective: ${eff_val:-unset})" >>p3
  echo "Yes" >>p4
else
  # Clarify expectations on failure
  rv=${runtime_val:-unset}
  ev=${eff_val:-unset}
  echo "ptrace_scope is NOT restricted. (Runtime: $rv; Effective: $ev; expected 1)" >>p3
  echo "No" >>p4
fi

echo "1.5.2" >>p12

########################################################################################################

# 1.5.3
# Ensure core dump backtraces are disabled (Automated)

echo "Initial Setup / Configure Additional Process Hardening" >>p1
echo "Ensure core dump backtraces are disabled" >>p2

# Effective setting from merged systemd config (coredump.conf + *.conf.d)
# Capture the first effective ProcessSizeMax=value line if present.
eff_line=$(systemd-analyze cat-config /etc/systemd/coredump.conf 2>/dev/null \
           | awk -F= 'BEGIN{IGNORECASE=1}
                      $1 ~ /^[[:space:]]*ProcessSizeMax[[:space:]]*$/ {
                        gsub(/[[:space:]]*/,"",$2);
                        print "ProcessSizeMax=" $2;
                        exit
                      }')

# Decide and output a clean, single-line CURRENT-VALUE (no tabs)
if printf "%s" "$eff_line" | grep -Piq '^ProcessSizeMax=0$'; then
  echo "Core dump backtraces are disabled. (Effective setting: ${eff_line})" >>p3
  echo "Yes" >>p4
else
  val=$(printf "%s" "$eff_line" | awk -F= '{print $2}')
  if [ -n "$val" ]; then
    echo "Core dump backtraces are NOT disabled. (Effective setting: ProcessSizeMax=${val}; expected 0)" >>p3
  else
    echo "Core dump backtraces are NOT disabled. (Effective setting: ProcessSizeMax is unset; expected 0)" >>p3
  fi
  echo "No" >>p4
fi

echo "1.5.3" >>p12

#########################################################################################################

# 1.5.4
# Ensure core dump storage is disabled (Automated)

echo "Initial Setup / Configure Additional Process Hardening" >>p1
echo "Ensure core dump storage is disabled" >>p2

# Effective setting from merged systemd config (coredump.conf + *.conf.d)
# Capture the first effective Storage=value line if present.
eff_line=$(systemd-analyze cat-config /etc/systemd/coredump.conf 2>/dev/null \
           | awk -F= 'BEGIN{IGNORECASE=1}
                      $1 ~ /^[[:space:]]*Storage[[:space:]]*$/ {
                        gsub(/[[:space:]]*/,"",$2);
                        print "Storage=" $2;
                        exit
                      }')

# Decide and output a clean, single-line CURRENT-VALUE (no tabs)
if printf "%s" "$eff_line" | grep -Piq '^Storage=none$'; then
  echo "Core dump storage is disabled. (Effective setting: ${eff_line})" >>p3
  echo "Yes" >>p4
else
  val=$(printf "%s" "$eff_line" | awk -F= '{print $2}')
  if [ -n "$val" ]; then
    echo "Core dump storage is NOT disabled. (Effective setting: Storage=${val}; expected none)" >>p3
  else
    echo "Core dump storage is NOT disabled. (Effective setting: Storage is unset; expected none)" >>p3
  fi
  echo "No" >>p4
fi

echo "1.5.4" >>p12

#########################################################################################################

# 1.6.1
# Ensure system wide crypto policy is not set to legacy (Automated)

echo "Initial Setup / Configure system wide crypto policy" >>p1
echo "Ensure system wide crypto policy is not set to LEGACY" >>p2

# Audit exactly as required: no 'LEGACY' line should be present in /etc/crypto-policies/config
legacy_line=$(grep -Pi '^\s*LEGACY\b' /etc/crypto-policies/config 2>/dev/null | head -n1)

if [ -z "$legacy_line" ]; then
  echo "Crypto policy is not set to LEGACY in /etc/crypto-policies/config" >>p3
  echo "Yes" >>p4
else
  echo "Crypto policy is set to LEGACY in /etc/crypto-policies/config (line: ${legacy_line})" >>p3
  echo "No" >>p4
fi

echo "1.6.1" >>p12

########################################################################################################

#1.6.2
#Ensure system wide crypto policy is not set in sshd configuration (Automated)
otpt34=$(grep -i '^\s*CRYPTO_POLICY=' /etc/sysconfig/sshd)

# Check if the output is empty
if [[ -z $otpt34 ]]; then
      echo "Initial Setup / Configure system wide crypto policy" >>p1
	  echo "Ensure system wide crypto policy is not set in sshd configuration" >>p2
	  echo "CRYPTO_POLICY is not set in /etc/sysconfig/sshd" >>p3
	  echo "Yes" >>p4
	  echo "1.6.2" >>p12
else
      echo "Initial Setup / Configure system wide crypto policy" >>p1
	  echo "Ensure system wide crypto policy is not set in sshd configuration" >>p2
	  echo "CRYPTO_POLICY is set in /etc/sysconfig/sshd" >>p3
	  echo "No" >>p4
	  echo "1.6.2" >>p12
fi

#########################################################################################################

#1.6.3
#Ensure system wide crypto policy disables sha1 hash and signature support (Automated)

# Check 1: hash/sign must NOT include enabled SHA1
otpt35=$(awk -F= '($1~/(hash|sign)/ && $2~/SHA1/ && $2!~/^[[:space:]]*-[[:space:]]*SHA1/){print}' /etc/crypto-policies/state/CURRENT.pol)

# Check 2: sha1_in_certs must be = 0
otpt36=$(grep -Psi -- '^\h*sha1_in_certs\h*=\h*' /etc/crypto-policies/state/CURRENT.pol)

if [[ -z $otpt35 ]] && [[ "$otpt36" =~ "= 0" ]]; then
      echo "Initial Setup / Configure system wide crypto policy" >>p1
      echo "Ensure system wide crypto policy disables sha1 hash and signature support" >>p2
      echo "SHA1 is disabled (hash/sign clean and sha1_in_certs=0)" >>p3
      echo "Yes" >>p4
      echo "1.6.3" >>p12
else
      echo "Initial Setup / Configure system wide crypto policy" >>p1
      echo "Ensure system wide crypto policy disables sha1 hash and signature support" >>p2

      if [[ -n $otpt35 ]]; then
           echo "Enabled SHA1 found in hash/sign lines" >>p3
      elif [[ ! "$otpt36" =~ "= 0" ]]; then
           echo "sha1_in_certs is not set to 0" >>p3
      else
           echo "SHA1 configuration does not meet CIS requirements" >>p3
      fi

      echo "No" >>p4
      echo "1.6.3" >>p12
fi


#########################################################################################################

#1.6.4
#Ensure system wide crypto policy disables macs less than 128 bits (Automated)

# Audit: Nothing should be returned
otpt37=$(grep -Pi -- '^\h*mac\h*=\h*([^#\n\r]+)?-64\b' /etc/crypto-policies/state/CURRENT.pol)

if [[ -z $otpt37 ]]; then
      echo "Initial Setup / Configure system wide crypto policy" >>p1
      echo "Ensure system wide crypto policy disables macs less than 128 bits" >>p2
      echo "No weak (<128-bit) MACs detected (audit returned nothing)" >>p3
      echo "Yes" >>p4
      echo "1.6.4" >>p12
else
      echo "Initial Setup / Configure system wide crypto policy" >>p1
      echo "Ensure system wide crypto policy disables macs less than 128 bits" >>p2
      echo "Weak MACs pattern detected in mac= line" >>p3
      echo "No" >>p4
      echo "1.6.4" >>p12
fi

########################################################################################################

#1.6.5
#Ensure system wide crypto policy disables cbc for ssh (Automated)
f=/etc/crypto-policies/state/CURRENT.pol
if grep -Piq '^\h*cipher\h*=\h*([^#\n\r]+)?-CBC\b' "$f"; then
  if grep -Piq '^\h*cipher@(lib|open)ssh(-server|-client)?\h*=' "$f"; then
    if grep -Piq '^\h*cipher@(lib|open)ssh(-server|-client)?\h*=\h*([^#\n\r]+)?-CBC\b' "$f"; then
      res=Yes; msg="CBC disabled for SSH (-CBC on cipher@ssh lines)"
    else
      res=No; msg="CBC enabled for SSH (cipher@ssh missing -CBC)"
    fi
  else
    res=Yes; msg="CBC disabled globally (-CBC on cipher=; no cipher@ssh overrides)"
  fi
else
  res=No; msg="CBC not disabled on global cipher="
fi

echo "Initial Setup / Configure system wide crypto policy" >>p1
echo "Ensure system wide crypto policy disables cbc for ssh" >>p2
echo "$msg" >>p3
echo "$res" >>p4
echo "1.6.5" >>p12

#########################################################################################################

# 1.7.1
# Ensure message of the day is configured properly (Automated)

echo "Initial Setup / Configure Command Line Warning Banners" >> p1
echo "Ensure message of the day is configured properly" >> p2

# Build the token pattern per CIS audit: literal \v \r \m \s and distro ID
distro_id=$(awk -F= '/^ID=/{gsub(/"/,"",$2); print tolower($2)}' /etc/os-release 2>/dev/null)
pattern='(\\v|\\r|\\m|\\s'
[ -n "$distro_id" ] && pattern="$pattern|\\b${distro_id}\\b"
pattern="$pattern)"

# Step 1: /etc/motd must exist
if [ ! -f /etc/motd ]; then
  echo "/etc/motd file does not exist" >> p3
  echo "No" >> p4
  echo "1.7.1" >> p12
  # done
else
  # Step 2: /etc/motd must be non-empty
  if [ ! -s /etc/motd ]; then
    echo "/etc/motd is empty; banner not configured" >> p3
    echo "No" >> p4
    echo "1.7.1" >> p12
  else
    # Step 3: /etc/motd must NOT include system information tokens
    if grep -Psqi -- "$pattern" /etc/motd; then
      echo "/etc/motd contains system information tokens; remove \\v/\\r/\\m/\\s or OS name" >> p3
      echo "No" >> p4
      echo "1.7.1" >> p12
    else
      # Step 4: Align with CIS audit—ensure no /etc/motd.d/* file includes tokens
      offenders=""
      for f in /etc/motd.d/*; do
        [ -f "$f" ] || continue
        if grep -Psqi -- "$pattern" "$f"; then
          if [ -z "$offenders" ]; then offenders="$f"; else offenders="$offenders, $f"; fi
        fi
      done

      if [ -n "$offenders" ]; then
        echo "MOTD includes system information tokens in: $offenders" >> p3
        echo "No" >> p4
        echo "1.7.1" >> p12
      else
        echo "The message is configured correctly in /etc/motd and contains no system information tokens" >> p3
        echo "Yes" >> p4
        echo "1.7.1" >> p12
      fi
    fi
  fi
fi
#########################################################################################################

# 1.7.2
# Ensure local login warning banner is configured properly (Automated)

# Logic (as requested):
#   1) /etc/issue must exist
#   2) /etc/issue must be non-empty
#   3) /etc/issue must NOT contain system-info tokens per CIS audit:
#        \v (OS version), \r (OS release), \m (machine arch), \s (OS name),
#        or the distro ID from /etc/os-release (e.g., rhel, rocky, centos)
#   PASS => all three true; otherwise FAIL

echo "Initial Setup / Configure Command Line Warning Banners" >> p1
echo "Ensure local login warning banner is configured properly" >> p2

# Build the token pattern per CIS audit
distro_id=$(awk -F= '/^ID=/{gsub(/"/,"",$2); print tolower($2)}' /etc/os-release 2>/dev/null)
pattern='(\\v|\\r|\\m|\\s'
[ -n "$distro_id" ] && pattern="$pattern|\\b${distro_id}\\b"
pattern="$pattern)"

if [ ! -f /etc/issue ]; then
  echo "/etc/issue file does not exist" >> p3
  echo "No" >> p4
  echo "1.7.2" >> p12
elif [ ! -s /etc/issue ]; then
  echo "/etc/issue is empty; banner not configured" >> p3
  echo "No" >> p4
  echo "1.7.2" >> p12
else
  # Non-empty: check that it does NOT include system info tokens
  if grep -Psqi -- "$pattern" /etc/issue; then
    echo "/etc/issue contains system information tokens; remove \\v/\\r/\\m/\\s or OS name" >> p3
    echo "No" >> p4
    echo "1.7.2" >> p12
  else
    echo "The message is configured correctly in /etc/issue and contains no system information tokens" >> p3
    echo "Yes" >> p4
    echo "1.7.2" >> p12
  fi
fi


########################################################################################################

# 1.7.3
# Ensure remote login warning banner is configured properly (Automated)

# Logic:
#   1) /etc/issue.net must exist
#   2) /etc/issue.net must be non-empty
#   3) /etc/issue.net must NOT contain system-info tokens per CIS audit:
#        \v (OS version), \r (OS release), \m (machine arch), \s (OS name),
#        or the distro ID from /etc/os-release (e.g., rhel, rocky, centos)
#   PASS => all three true; otherwise FAIL

echo "Initial Setup / Configure Command Line Warning Banners" >> p1
echo "Ensure remote login warning banner is configured properly" >> p2

# Build the token pattern per CIS audit
distro_id=$(awk -F= '/^ID=/{gsub(/"/,"",$2); print tolower($2)}' /etc/os-release 2>/dev/null)
pattern='(\\v|\\r|\\m|\\s'
[ -n "$distro_id" ] && pattern="$pattern|\\b${distro_id}\\b"
pattern="$pattern)"

if [ ! -f /etc/issue.net ]; then
  echo "/etc/issue.net file does not exist" >> p3
  echo "No" >> p4
  echo "1.7.3" >> p12
elif [ ! -s /etc/issue.net ]; then
  echo "/etc/issue.net is empty; banner not configured" >> p3
  echo "No" >> p4
  echo "1.7.3" >> p12
else
  # Non-empty: check that it does NOT include system info tokens
  if grep -Psqi -- "$pattern" /etc/issue.net; then
    echo "/etc/issue.net contains system information tokens; remove \\v/\\r/\\m/\\s or OS name" >> p3
    echo "No" >> p4
    echo "1.7.3" >> p12
  else
    echo "The message is configured correctly in /etc/issue.net and contains no system information tokens" >> p3
    echo "Yes" >> p4
    echo "1.7.3" >> p12
  fi
fi

#########################################################################################################

#1.7.4
#Ensure access to /etc/motd is configured (Automated)
if [ -f /etc/motd ]
then
	# Get the permissions, user and group of /etc/motd
	perms1=$(stat -c '%a' /etc/motd)
	user1=$(stat -c '%U' /etc/motd)
	group1=$(stat -c '%G' /etc/motd)

	# Check if the permissions, user and group are as expected
		if [[ "$perms1" == "644" && "$user1" == "root" && "$group1" == "root" ]]; then
			echo "Initial Setup / Configure Command Line Warning Banners" >> p1
			echo "Ensure access to /etc/motd is configured" >> p2
			echo "Permissions on /etc/motd are configured correctly" >> p3
			echo "Yes" >> p4
			echo "1.7.4" >> p12
		else
			echo "Initial Setup / Configure Command Line Warning Banners" >> p1
			echo "Ensure access to /etc/motd is configured" >> p2
			echo "Permissions on /etc/motd are NOT configured correctly." >> p3
			echo "No" >> p4
			echo "1.7.4" >> p12
		fi
else
		echo "Initial Setup / Configure Command Line Warning Banners" >> p1
		echo "Ensure access to /etc/motd is configured" >> p2
		echo "/etc/motd file does not exist" >> p3
		echo "No" >> p4
		echo "1.7.4" >> p12
fi

#########################################################################################################

#1.7.5
#Ensure access to /etc/issue is configured (Automated)
if [ -f /etc/issue ]
then
	# Get the permissions, user and group of /etc/issue
	perms2=$(stat -c '%a' /etc/issue)
	user2=$(stat -c '%U' /etc/issue)
	group2=$(stat -c '%G' /etc/issue)

	# Check if the permissions, user and group are as expected
		if [[ "$perms2" == "644" && "$user2" == "root" && "$group2" == "root" ]]; then
			echo "Initial Setup / Configure Command Line Warning Banners" >> p1
			echo "Ensure access to /etc/issue is configured" >> p2
			echo "Permissions on /etc/issue are configured correctly" >> p3
			echo "Yes" >> p4
			echo "1.7.5" >> p12
		else
			echo "Initial Setup / Configure Command Line Warning Banners" >> p1
			echo "Ensure access to /etc/issue is configured" >> p2
			echo "Permissions on /etc/issue are NOT configured correctly" >> p3
			echo "No" >> p4
			echo "1.7.5" >> p12
		fi
else
		echo "Initial Setup / Configure Command Line Warning Banners" >> p1
		echo "Ensure access to /etc/issue is configured" >> p2
		echo "/etc/issue file does not exist" >> p3
		echo "No" >> p4
		echo "1.7.5" >> p12
fi

########################################################################################################

#1.7.6
#Ensure access to /etc/issue.net is configured (Automated)
if [ -f /etc/issue.net ]
then
	# Get the permissions, user and group of /etc/issue.net
	perms3=$(stat -c '%a' /etc/issue.net)
	user3=$(stat -c '%U' /etc/issue.net)
	group3=$(stat -c '%G' /etc/issue.net)

	# Check if the permissions, user and group are as expected
		if [[ "$perms3" == "644" && "$user3" == "root" && "$group3" == "root" ]]; then
			echo "Initial Setup / Configure Command Line Warning Banners" >> p1
			echo "Ensure access to /etc/issue.net is configured" >> p2
			echo "Permissions on /etc/issue.net are configured correctly" >> p3
			echo "Yes" >> p4
			echo "1.7.6" >> p12
		else
			echo "Initial Setup / Configure Command Line Warning Banners" >> p1
			echo "Ensure access to /etc/issue.net is configured" >> p2
			echo "Permissions on /etc/issue.net are NOT configured correctly" >> p3
			echo "No" >> p4
			echo "1.7.6" >> p12
		fi
else
		echo "Initial Setup / Configure Command Line Warning Banners" >> p1
		echo "Ensure access to /etc/issue.net is configured" >> p2
		echo "/etc/issue.net file does not exist" >> p3
		echo "No" >> p4
		echo "1.7.6" >> p12
fi

#########################################################################################################

#1.8.2
#Ensure GDM login banner is configured (Automated)
#!/usr/bin/env bash

{
 l_pkgoutput=""
 if command -v dpkg-query > /dev/null 2>&1; then
 l_pq="dpkg-query -W"
 elif command -v rpm > /dev/null 2>&1; then
 l_pq="rpm -q"
 fi
 l_pcl="gdm gdm3" # Space separated list of packages to check
 for l_pn in $l_pcl; do
 $l_pq "$l_pn" > /dev/null 2>&1 && l_pkgoutput="$l_pkgoutput\n - Package: \"$l_pn\" exists on the system\n - checking configuration"
 done
 if [ -n "$l_pkgoutput" ]; then
 l_output="" l_output2=""
 echo -e "$l_pkgoutput"
 # Look for existing settings and set variables if they exist
 l_gdmfile="$(grep -Prils '^\h*banner-message-enable\b' /etc/dconf/db/*.d)"
 if [ -n "$l_gdmfile" ]; then
 # Set profile name based on dconf db directory ({PROFILE_NAME}.d)
 l_gdmprofile="$(awk -F\/ '{split($(NF-1),a,""."");print a[1]}' <<< "$l_gdmfile")"
 # Check if banner message is enabled
 if grep -Pisq '^\h*banner-message-enable=true\b' "$l_gdmfile"; then
 l_output="$l_output\n - The \"banner-message-enable\" option is enabled in \"$l_gdmfile\""
 else
 l_output2="$l_output2\n - The \"banner-message-enable\" option is not enabled"
 fi
 l_lsbt="$(grep -Pios '^\h*banner-message-text=.*$' "$l_gdmfile")"
 if [ -n "$l_lsbt" ]; then
 l_output="$l_output\n - The \"banner-message-text\" option is set in \"$l_gdmfile\"\n - banner-message-text is set to:\n - \"$l_lsbt\""
 else
 l_output2="$l_output2\n - The \"banner-message-text\" option is not set"
 fi
 if grep -Pq "^\h*system-db:$l_gdmprofile" /etc/dconf/profile/"$l_gdmprofile"; then
 l_output="$l_output\n - The \"$l_gdmprofile\" profile exists"
 else
 l_output2="$l_output2\n - The \"$l_gdmprofile\" profile doesn't exist"
 fi
 if [ -f "/etc/dconf/db/$l_gdmprofile" ]; then
 l_output="$l_output\n - The \"$l_gdmprofile\" profile exists in the dconf database"
 else
 l_output2="$l_output2\n - The \"$l_gdmprofile\" profile doesn't exist in the dconf database"
 fi
 else
 l_output2="$l_output2\n - The \"banner-message-enable\" option isn't configured"
 fi
 else
 echo -e "\n\n - GNOME Desktop Manager isn't installed\n - Recommendation is Not Applicable\n- Audit result:\n *** PASS ***\n" > /dev/null
 fi
 # Report results. If no failures output in l_output2, we pass
 if [ -z "$l_output2" ]; then
            echo "Initial Setup / Configure GNOME Display Manager" >>p1
		    echo "Ensure GDM login banner is configured" >>p2
		    echo "GDM login banner is configured" >>p3
		    echo "Yes" >>p4
		    echo "1.8.2" >>p12
 else
            echo "Initial Setup / Configure GNOME Display Manager" >>p1
		    echo "Ensure GDM login banner is configured" >>p2
		    echo "GDM login banner is not configured" >>p3
		    echo "No" >>p4
		    echo "1.8.2" >>p12
 fi
}

#########################################################################################################

#1.8.3
#Ensure GDM disable-user-list option is enabled (Automated)
#!/usr/bin/env bash

{
 l_pkgoutput=""
 if command -v dpkg-query > /dev/null 2>&1; then
 l_pq="dpkg-query -W"
 elif command -v rpm > /dev/null 2>&1; then
 l_pq="rpm -q"
 fi
 l_pcl="gdm gdm3" # Space separated list of packages to check
 for l_pn in $l_pcl; do
 $l_pq "$l_pn" > /dev/null 2>&1 && l_pkgoutput="$l_pkgoutput\n - Package: \"$l_pn\" exists on the system\n - checking configuration"
 done
 if [ -n "$l_pkgoutput" ]; then
 output="" output2=""
 l_gdmfile="$(grep -Pril '^\h*disable-user-list\h*=\h*true\b' /etc/dconf/db)"
 if [ -n "$l_gdmfile" ]; then
 output="$output\n - The \"disable-user-list\" option is enabled in \"$l_gdmfile\""
 l_gdmprofile="$(awk -F\/ '{split($(NF-1),a,".");print a[1]}' <<< "$l_gdmfile")"
 if grep -Pq "^\h*system-db:$l_gdmprofile" /etc/dconf/profile/"$l_gdmprofile"; then
 output="$output\n - The \"$l_gdmprofile\" exists"
 else
 output2="$output2\n - The \"$l_gdmprofile\" doesn't exist"
 fi
 if [ -f "/etc/dconf/db/$l_gdmprofile" ]; then
 output="$output\n - The \"$l_gdmprofile\" profile exists in the dconf database"
 else
 output2="$output2\n - The \"$l_gdmprofile\" profile doesn't exist in the dconf database"
 fi
 else
 output2="$output2\n - The \"disable-user-list\" option is not enabled"
 fi
 if [ -z "$output2" ]; then
 echo -e "$l_pkgoutput\n- Audit result:\n *** PASS: ***\n$output\n" > /dev/null
 else
 echo -e "$l_pkgoutput\n- Audit Result:\n *** FAIL: ***\n$output2\n" > /dev/null
 [ -n "$output" ] && echo -e "$output\n" > /dev/null
 fi
	echo "Initial Setup / Configure GNOME Display Manager" >> p1
	echo "Ensure GDM disable-user-list option is enabled" >> p2
	echo "GDM disable-user-list option is not enabled" >> p3
	echo "No" >> p4
	echo "1.8.3" >> p12
 else
 echo -e "\n\n - GNOME Desktop Manager isn't installed\n - Recommendation is Not Applicable\n- Audit result:\n *** PASS ***\n" > /dev/null
	echo "Initial Setup / Configure GNOME Display Manager" >> p1
	echo "Ensure GDM disable-user-list option is enabled" >> p2
	echo "GDM disable-user-list option is enabled" >> p3
	echo "Yes" >> p4
	echo "1.8.3" >> p12
 fi
}

#########################################################################################################

#1.8.4
#Ensure GDM screen locks when the user is idle (Automated)
#!/usr/bin/env bash

{
 # Check if GNMOE Desktop Manager is installed. If package isn't installed, recommendation is Not Applicable\n
 # determine system's package manager
 l_pkgoutput=""
 if command -v dpkg-query > /dev/null 2>&1; then
 l_pq="dpkg-query -W"
 elif command -v rpm > /dev/null 2>&1; then
 l_pq="rpm -q"
 fi
 # Check if GDM is installed
 l_pcl="gdm gdm3" # Space separated list of packages to check
 for l_pn in $l_pcl; do
 $l_pq "$l_pn" > /dev/null 2>&1 && l_pkgoutput="$l_pkgoutput\n - Package: \"$l_pn\" exists on the system\n - checking configuration"
 done
 # Check configuration (If applicable)
 if [ -n "$l_pkgoutput" ]; then
 l_output="" l_output2=""
 l_idmv="900" # Set for max value for idle-delay in seconds
 l_ldmv="5" # Set for max value for lock-delay in seconds
 # Look for idle-delay to determine profile in use, needed for remaining tests
 l_kfile="$(grep -Psril '^\h*idle-delay\h*=\h*uint32\h+\d+\b' /etc/dconf/db/*)" # Determine file containing idle-delay key
 if [ -n "$l_kfile" ]; then
 # set profile name (This is the name of a dconf database)
 l_profile="$(awk -F'/' '{split($(NF-1),a,""."");print a[1]}' <<< "$l_kfile")" #Set the key profile name
 l_pdbdir="/etc/dconf/db/$l_profile.d" # Set the key file dconf db directory
 # Confirm that idle-delay exists, includes unit32, and value is between 1 and max value for idle-delay
 l_idv="$(awk -F 'uint32' '/idle-delay/{print $2}' "$l_kfile" | xargs)"
 if [ -n "$l_idv" ]; then
 [ "$l_idv" -gt "0" -a "$l_idv" -le "$l_idmv" ] && l_output="$l_output\n - The \"idle-delay\" option is set to \"$l_idv\" seconds in \"$l_kfile\""
 [ "$l_idv" = "0" ] && l_output2="$l_output2\n - The \"idle-delay\" option is set to \"$l_idv\" (disabled) in \"$l_kfile\""
 [ "$l_idv" -gt "$l_idmv" ] && l_output2="$l_output2\n - The \"idle-delay\" option is set to \"$l_idv\" seconds (greater than $l_idmv) in \"$l_kfile\""
 else
 l_output2="$l_output2\n - The \"idle-delay\" option is not set in \"$l_kfile\""
 fi
 # Confirm that lock-delay exists, includes unit32, and value is between 0 and max value for lock-delay
 l_ldv="$(awk -F 'uint32' '/lock-delay/{print $2}' "$l_kfile" | xargs)"
 if [ -n "$l_ldv" ]; then
 [ "$l_ldv" -ge "0" -a "$l_ldv" -le "$l_ldmv" ] && l_output="$l_output\n - The \"lock-delay\" option is set to \"$l_ldv\" seconds in \"$l_kfile\""
 [ "$l_ldv" -gt "$l_ldmv" ] && l_output2="$l_output2\n - The \"lock-delay\" option is set to \"$l_ldv\" seconds (greater than $l_ldmv) in \"$l_kfile\""
 else
 l_output2="$l_output2\n - The \"lock-delay\" option is not set in \"$l_kfile\""
 fi
 # Confirm that dconf profile exists
 if grep -Psq "^\h*system-db:$l_profile" /etc/dconf/profile/*; then
 l_output="$l_output\n - The \"$l_profile\" profile exists"
 else
 l_output2="$l_output2\n - The \"$l_profile\" doesn't exist"
 fi
 # Confirm that dconf profile database file exists
 if [ -f "/etc/dconf/db/$l_profile" ]; then
 l_output="$l_output\n - The \"$l_profile\" profile exists in the dconf database"
 else
 l_output2="$l_output2\n - The \"$l_profile\" profile doesn't exist in the dconf database"
 fi
 else
 l_output2="$l_output2\n - The \"idle-delay\" option doesn't exist, remaining tests skipped"
 fi
 else
 l_output="$l_output\n - GNOME Desktop Manager package is not installed on the system\n - Recommendation is not applicable"
 fi
 # Report results. If no failures output in l_output2, we pass
 [ -n "$l_pkgoutput" ] && echo -e "\n$l_pkgoutput" > /dev/null
 if [ -z "$l_output2" ]; then
            echo "Initial Setup / Configure GNOME Display Manager" >>p1
		    echo "Ensure GDM screen locks when the user is idle" >>p2
		    echo "GDM screen locks when the user is idle" >>p3
		    echo "Yes" >>p4
		    echo "1.8.4" >>p12
 else
            echo "Initial Setup / Configure GNOME Display Manager" >>p1
		    echo "Ensure GDM screen locks when the user is idle" >>p2
		    echo "GDM screen not locks when the user is idle" >>p3
		    echo "No" >>p4
		    echo "1.8.4" >>p12
 fi
}

#########################################################################################################

#1.8.5
#Ensure GDM screen locks cannot be overridden (Automated)

#!/usr/bin/env bash

{
 # Check if GNOME Desktop Manager is installed. If package isn't installed, recommendation is Not Applicable\n
 # determine system's package manager
 l_pkgoutput=""
 if command -v dpkg-query > /dev/null 2>&1; then
 l_pq="dpkg-query -W"
 elif command -v rpm > /dev/null 2>&1; then
 l_pq="rpm -q"
 fi
 # Check if GDM is installed
 l_pcl="gdm gdm3" # Space separated list of packages to check
 for l_pn in $l_pcl; do
 $l_pq "$l_pn" > /dev/null 2>&1 && l_pkgoutput="$l_pkgoutput\n - Package: \"$l_pn\" exists on the system\n - checking configuration"
 done
 # Check configuration (If applicable)
 if [ -n "$l_pkgoutput" ]; then
 l_output="" l_output2=""
 # Look for idle-delay to determine profile in use, needed for remaining tests
 l_kfd="/etc/dconf/db/$(grep -Psril '^\h*idle-delay\h*=\h*uint32\h+\d+\b' /etc/dconf/db/*/ | awk -F'/' '{split($(NF-1),a,""."");print a[1]}').d" #set directory of key file to be locked
 l_kfd2="/etc/dconf/db/$(grep -Psril '^\h*lock-delay\h*=\h*uint32\h+\d+\b' /etc/dconf/db/*/ | awk -F'/' '{split($(NF-1),a,""."");print a[1]}').d" #set directory of key file to be locked
 if [ -d "$l_kfd" ]; then # If key file directory doesn't exist, options can't be locked
 if grep -Prilq '/org/gnome/desktop/session/idle-delay\b' "$l_kfd"; then
 l_output="$l_output\n - \"idle-delay\" is locked in \"$(grep -Pril '/org/gnome/desktop/session/idle-delay\b' "$l_kfd")\""
 else
 l_output2="$l_output2\n - \"idle-delay\" is not locked"
 fi
 else
 l_output2="$l_output2\n - \"idle-delay\" is not set so it can not be locked"
 fi
 if [ -d "$l_kfd2" ]; then # If key file directory doesn't exist, options can't be locked
 if grep -Prilq '/org/gnome/desktop/screensaver/lock-delay\b' "$l_kfd2"; then
 l_output="$l_output\n - \"lock-delay\" is locked in \"$(grep -Pril '/org/gnome/desktop/screensaver/lock-delay\b' "$l_kfd2")\""
 else
 l_output2="$l_output2\n - \"lock-delay\" is not locked"
 fi
 else
 l_output2="$l_output2\n - \"lock-delay\" is not set so it can not be locked"
 fi
 else
 l_output="$l_output\n - GNOME Desktop Manager package is not installed on the system\n - Recommendation is not applicable"
 fi
 # Report results. If no failures output in l_output2, we pass
 [ -n "$l_pkgoutput" ] && echo -e "\n$l_pkgoutput" > /dev/null
 if [ -z "$l_output2" ]; then
            echo "Initial Setup / Configure GNOME Display Manager" >>p1
		    echo "Ensure GDM screen locks cannot be overridden" >>p2
		    echo "GDM screen locks cannot be overridden" >>p3
		    echo "Yes" >>p4
		    echo "1.8.5" >>p12
 else
            echo "Initial Setup / Configure GNOME Display Manager" >>p1
		    echo "Ensure GDM screen locks cannot be overridden" >>p2
		    echo "GDM screen locks can be overridden" >>p3
		    echo "No" >>p4
		    echo "1.8.5" >>p12
 fi
}

########################################################################################################

#1.8.6
#Ensure GDM automatic mounting of removable media is disabled (Automated)
#!/usr/bin/env bash

{
 l_pkgoutput="" l_output="" l_output2=""
 # Check if GNOME Desktop Manager is installed. If package isn't installed, recommendation is Not Applicable\n
 # determine system's package manager
 if command -v dpkg-query > /dev/null 2>&1; then
 l_pq="dpkg-query -W"
 elif command -v rpm > /dev/null 2>&1; then
 l_pq="rpm -q"
 fi
 # Check if GDM is installed
 l_pcl="gdm gdm3" # Space separated list of packages to check
 for l_pn in $l_pcl; do
 $l_pq "$l_pn" > /dev/null 2>&1 && l_pkgoutput="$l_pkgoutput\n - Package: \"$l_pn\" exists on the system\n - checking configuration"
 done
 # Check configuration (If applicable)
 if [ -n "$l_pkgoutput" ]; then
 echo -e "$l_pkgoutput"
 # Look for existing settings and set variables if they exist
 l_kfile="$(grep -Prils -- '^\h*automount\b' /etc/dconf/db/*.d)"
 l_kfile2="$(grep -Prils -- '^\h*automount-open\b' /etc/dconf/db/*.d)"
 # Set profile name based on dconf db directory ({PROFILE_NAME}.d)
 if [ -f "$l_kfile" ]; then
 l_gpname="$(awk -F\/ '{split($(NF-1),a,""."");print a[1]}' <<< "$l_kfile")"
 elif [ -f "$l_kfile2" ]; then
 l_gpname="$(awk -F\/ '{split($(NF-1),a,""."");print a[1]}' <<< "$l_kfile2")"
 fi
 # If the profile name exist, continue checks
 if [ -n "$l_gpname" ]; then
 l_gpdir="/etc/dconf/db/$l_gpname.d"
 # Check if profile file exists
 if grep -Pq -- "^\h*system-db:$l_gpname\b" /etc/dconf/profile/*; then
 l_output="$l_output\n - dconf database profile file \""$(grep -Pl -- "^\h*system-db:$l_gpname\b" /etc/dconf/profile/*)"\" exists"
 else
 l_output2="$l_output2\n - dconf database profile isn't set"
 fi
 # Check if the dconf database file exists
 if [ -f "/etc/dconf/db/$l_gpname" ]; then
 l_output="$l_output\n - The dconf database \"$l_gpname\" exists"
 else
 l_output2="$l_output2\n - The dconf database \"$l_gpname\" doesn't exist"
 fi
 # check if the dconf database directory exists
 if [ -d "$l_gpdir" ]; then
 l_output="$l_output\n - The dconf directory \"$l_gpdir\" exists"
 else
 l_output2="$l_output2\n - The dconf directory \"$l_gpdir\" doesn't exist"
 fi
 # check automount setting
 if grep -Pqrs -- '^\h*automount\h*=\h*false\b' "$l_kfile"; then
 l_output="$l_output\n - \"automount\" is set to false in: \"$l_kfile\""
 else
 l_output2="$l_output2\n - \"automount\" is not set correctly"
 fi
 # check automount-open setting
 if grep -Pqs -- '^\h*automount-open\h*=\h*false\b' "$l_kfile2"; then
 l_output="$l_output\n - \"automount-open\" is set to false in: \"$l_kfile2\""
 else
 l_output2="$l_output2\n - \"automount-open\" is not set correctly"
 fi
 else
 # Settings don't exist. Nothing further to check
 l_output2="$l_output2\n - neither \"automount\" or \"automount-open\" is set"
 fi
 else
 l_output="$l_output\n - GNOME Desktop Manager package is not installed on the system\n - Recommendation is not applicable"
 fi
 # Report results. If no failures output in l_output2, we pass
 if [ -z "$l_output2" ]; then
            echo "Initial Setup / Configure GNOME Display Manager" >>p1
		    echo "Ensure GDM automatic mounting of removable media is disabled" >>p2
		    echo "GDM automatic mounting of removable media is disabled" >>p3
		    echo "Yes" >>p4
		    echo "1.8.6" >>p12
 else
            echo "Initial Setup / Configure GNOME Display Manager" >>p1
		    echo "Ensure GDM automatic mounting of removable media is disabled" >>p2
		    echo "GDM automatic mounting of removable media is not disabled" >>p3
		    echo "No" >>p4
		    echo "1.8.6" >>p12
 fi
}

#########################################################################################################

#1.8.7
#Ensure GDM disabling automatic mounting of removable media is not overridden (Automated)
#!/usr/bin/env bash

{
 # Check if GNOME Desktop Manager is installed. If package isn't installed, recommendation is Not Applicable\n
 # determine system's package manager
 l_pkgoutput=""
 if command -v dpkg-query > /dev/null 2>/dev/null; then
 l_pq="dpkg-query -W"
 elif command -v rpm > /dev/null 2>/dev/null; then
 l_pq="rpm -q"
 fi
 # Check if GDM is installed
 l_pcl="gdm gdm3" # Space separated list of packages to check
 for l_pn in $l_pcl; do
 $l_pq "$l_pn" > /dev/null 2>&1 && l_pkgoutput="$l_pkgoutput\n - Package: \"$l_pn\" exists on the system\n - checking configuration"
 done
 # Check configuration (If applicable)
 if [ -n "$l_pkgoutput" ]; then
 l_output="" l_output2=""
 # Look for idle-delay to determine profile in use, needed for remaining tests
 l_kfd="/etc/dconf/db/$(grep -Psril '^\h*automount\b' /etc/dconf/db/*/ | awk -F'/' '{split($(NF-1),a,".");print a[1]}').d" #set directory of key file to be locked
 l_kfd2="/etc/dconf/db/$(grep -Psril '^\h*automount-open\b' /etc/dconf/db/*/ | awk -F'/' '{split($(NF-1),a,".");print a[1]}').d" #set directory of key file to be locked
 if [ -d "$l_kfd" ]; then # If key file directory doesn't exist, options can't be locked
 if grep -Piq '^\h*\/org/gnome\/desktop\/media-handling\/automount\b' "$l_kfd"; then
 l_output="$l_output\n - \"automount\" is locked in \"$(grep -Pil '^\h*\/org/gnome\/desktop\/media-handling\/automount\b' "$l_kfd")\""
 else
 l_output2="$l_output2\n - \"automount\" is not locked"
 fi
 else
 l_output2="$l_output2\n - \"automount\" is not set so it can not be locked"
 fi
 if [ -d "$l_kfd2" ]; then # If key file directory doesn't exist, options can't be locked
 if grep -Piq '^\h*\/org/gnome\/desktop\/media-handling\/automount-open\b' "$l_kfd2"; then
 l_output="$l_output\n - \"automount-open\" is locked in \"$(grep -Pril '^\h*\/org/gnome\/desktop\/media-handling\/automount-open\b' "$l_kfd2")\""
 else
 l_output2="$l_output2\n - \"automount-open\" is not locked"
 fi
 else
 l_output2="$l_output2\n - \"automount-open\" is not set so it can not be locked"
 fi
 else
 l_output="$l_output\n - GNOME Desktop Manager package is not installed on the system\n - Recommendation is not applicable"
 fi
 # Report results. If no failures output in l_output2, we pass
 [ -n "$l_pkgoutput" ] && echo -e "\n$l_pkgoutput" > /dev/null
 if [ -z "$l_output2" ]; then
            echo "Initial Setup / Configure GNOME Display Manager" >>p1
		    echo "Ensure GDM disabling automatic mounting of removable media is not overridden" >>p2
		    echo "GDM disabling automatic mounting of removable media is not overridden" >>p3
		    echo "Yes" >>p4
		    echo "1.8.7" >>p12
 else
            echo "Initial Setup / Configure GNOME Display Manager" >>p1
		    echo "Ensure GDM disabling automatic mounting of removable media is not overridden" >>p2
		    echo "GDM disabling automatic mounting of removable media is  overridden" >>p3
		    echo "No" >>p4
		    echo "1.8.7" >>p12
 fi
}

#########################################################################################################

#1.8.8
#Ensure GDM autorun-never is enabled (Automated)
#!/usr/bin/env bash

{
 l_pkgoutput="" l_output="" l_output2=""
 # Check if GNOME Desktop Manager is installed. If package isn't installed, recommendation is Not Applicable\n
 # determine system's package manager
 if command -v dpkg-query > /dev/null 2>&1; then
 l_pq="dpkg-query -W"
 elif command -v rpm > /dev/null 2>&1; then
 l_pq="rpm -q"
 fi
 # Check if GDM is installed
 l_pcl="gdm gdm3" # Space separated list of packages to check
 for l_pn in $l_pcl; do
 $l_pq "$l_pn" > /dev/null 2>&1 && l_pkgoutput="$l_pkgoutput\n - Package: \"$l_pn\" exists on the system\n - checking configuration"
 echo -e "$l_pkgoutput"
 done
 # Check configuration (If applicable)
 if [ -n "$l_pkgoutput" ]; then
 echo -e "$l_pkgoutput"
 # Look for existing settings and set variables if they exist
 l_kfile="$(grep -Prils -- '^\h*autorun-never\b' /etc/dconf/db/*.d)"
 # Set profile name based on dconf db directory ({PROFILE_NAME}.d)
 if [ -f "$l_kfile" ]; then
 l_gpname="$(awk -F\/ '{split($(NF-1),a,""."");print a[1]}' <<< "$l_kfile")"
 fi
 # If the profile name exist, continue checks
 if [ -n "$l_gpname" ]; then
 l_gpdir="/etc/dconf/db/$l_gpname.d"
 # Check if profile file exists
 if grep -Pq -- "^\h*system-db:$l_gpname\b" /etc/dconf/profile/*; then
 l_output="$l_output\n - dconf database profile file \"$(grep -Pl -- "^\h*system-db:$l_gpname\b" /etc/dconf/profile/*)\" exists"
 else
 l_output2="$l_output2\n - dconf database profile isn't set"
 fi
 # Check if the dconf database file exists
 if [ -f "/etc/dconf/db/$l_gpname" ]; then
 l_output="$l_output\n - The dconf database \"$l_gpname\" exists"
 else
 l_output2="$l_output2\n - The dconf database \"$l_gpname\" doesn't exist"
 fi
 # check if the dconf database directory exists
 if [ -d "$l_gpdir" ]; then
 l_output="$l_output\n - The dconf directory \"$l_gpdir\" exists"
 else
 l_output2="$l_output2\n - The dconf directory \"$l_gpdir\" doesn't exist"
 fi
 # check autorun-never setting
 if grep -Pqrs -- '^\h*autorun-never\h*=\h*true\b' "$l_kfile"; then
 l_output="$l_output\n - \"autorun-never\" is set to true in: \"$l_kfile\""
 else
 l_output2="$l_output2\n - \"autorun-never\" is not set correctly"
 fi
 else
 # Settings don't exist. Nothing further to check
 l_output2="$l_output2\n - \"autorun-never\" is not set"
 fi
 else
 l_output="$l_output\n - GNOME Desktop Manager package is not installed on the system\n - Recommendation is not applicable"
 fi
 # Report results. If no failures output in l_output2, we pass
 if [ -z "$l_output2" ]; then
            echo "Initial Setup / Configure GNOME Display Manager" >>p1
		    echo "Ensure GDM autorun-never is enabled" >>p2
		    echo "GDM autorun-never is enabled" >>p3
		    echo "Yes" >>p4
		    echo "1.8.8" >>p12
 else
            echo "Initial Setup / Configure GNOME Display Manager" >>p1
		    echo "Ensure GDM autorun-never is enabled" >>p2
		    echo "GDM autorun-never is enabled" >>p3
		    echo "Yes" >>p4
		    echo "1.8.8" >>p12
 fi
}

#########################################################################################################

#1.8.9
#Ensure GDM autorun-never is not overridden (Automated)
#!/usr/bin/env bash

{
 # Check if GNOME Desktop Manager is installed. If package isn't installed, recommendation is Not Applicable\n
 # determine system's package manager
 l_pkgoutput=""
 if command -v dpkg-query > /dev/null 2>&1; then
 l_pq="dpkg-query -W"
 elif command -v rpm > /dev/null 2>&1; then
 l_pq="rpm -q"
 fi
 # Check if GDM is installed
 l_pcl="gdm gdm3" # Space separated list of packages to check
 for l_pn in $l_pcl; do
 $l_pq "$l_pn" > /dev/null 2>&1 && l_pkgoutput="$l_pkgoutput\n - Package: \"$l_pn\" exists on the system\n - checking configuration"
 done
 # Check configuration (If applicable)
 if [ -n "$l_pkgoutput" ]; then
 l_output="" l_output2=""
 # Look for idle-delay to determine profile in use, needed for remaining tests
 l_kfd="/etc/dconf/db/$(grep -Psril '^\h*autorun-never\b' /etc/dconf/db/*/ | awk -F'/' '{split($(NF-1),a,""."");print a[1]}').d" #set directory of key file to be locked
 if [ -d "$l_kfd" ]; then # If key file directory doesn't exist, options can't be locked
 if grep -Piq '^\h*\/org/gnome\/desktop\/media-handling\/autorun-never\b' "$l_kfd"; then
 l_output="$l_output\n - \"autorun-never\" is locked in \"$(grep -Pil '^\h*\/org/gnome\/desktop\/media-handling\/autorun-never\b' "$l_kfd")\""
 else
 l_output2="$l_output2\n - \"autorun-never\" is not locked"
 fi
 else
 l_output2="$l_output2\n - \"autorun-never\" is not set so it can not be locked"
 fi
 else
 l_output="$l_output\n - GNOME Desktop Manager package is not installed on the system\n - Recommendation is not applicable"
 fi
 # Report results. If no failures output in l_output2, we pass
 [ -n "$l_pkgoutput" ] && echo -e "\n$l_pkgoutput" > /dev/null
 if [ -z "$l_output2" ]; then
            echo "Initial Setup / Configure GNOME Display Manager" >>p1
		    echo "Ensure GDM autorun-never is not overridden" >>p2
		    echo "GDM autorun-never is not overridden" >>p3
		    echo "Yes" >>p4
		    echo "1.8.9" >>p12
 else
            echo "Initial Setup / Configure GNOME Display Manager" >>p1
		    echo "Ensure GDM autorun-never is not overridden" >>p2
		    echo "GDM autorun-never is  overridden" >>p3
		    echo "No" >>p4
		    echo "1.8.9" >>p12
 fi
}

#########################################################################################################

#1.8.10
#Ensure XDMCP is not enabled (Automated)
otpt9=$(grep -Eis '^\s*Enable\s*=\s*true' /etc/gdm/custom.conf)
if [[ -z "$otpt9" ]]; then
    echo "Initial Setup / Configure GNOME Display Manager" >>p1
	echo "Ensure XDCMP is not enabled" >>p2
	echo "XDCMP is not enabled" >>p3
	echo "Yes" >>p4
	echo "1.8.10" >>p12
else
    echo "Initial Setup / Configure GNOME Display Manager" >>p1
	echo "Ensure XDCMP is not enabled" >>p2
	echo "XDCMP is  enabled" >>p3
	echo "No" >>p4
	echo "1.8.10" >>p12
fi


#########################################################################################################

#2.1.1
#Ensure autofs services are not in use

if ! rpm -q autofs >/dev/null 2>&1; then
    echo "Services / Configure Server Services" >>p1
    echo "Ensure autofs services are not in use" >>p2
    echo "package autofs is not installed" >>p3
    echo "Yes" >>p4
    echo "2.1.1" >>p12
else
    en=$(systemctl is-enabled autofs.service 2>/dev/null || true)
    ac=$(systemctl is-active  autofs.service 2>/dev/null || true)

    if [ "$en" != "enabled" ] && [ "$ac" != "active" ]; then
        echo "Services / Configure Server Services" >>p1
        echo "Ensure autofs services are not in use" >>p2
        echo "autofs installed but service is disabled and inactive" >>p3
        echo "Yes" >>p4
        echo "2.1.1" >>p12
    else
        echo "Services / Configure Server Services" >>p1
        echo "Ensure autofs services are not in use" >>p2
        echo "autofs installed; status: enabled=$en, active=$ac" >>p3
        echo "No" >>p4
        echo "2.1.1" >>p12
    fi
fi

#########################################################################################################

#2.1.2
#Ensure avahi daemon services are not in use (Automated)

rpm -q avahi &>/dev/null
if [ $? -eq 0 ]; then
    # Avahi package is installed
    if systemctl is-enabled avahi-daemon.socket avahi-daemon.service 2>/dev/null | grep -q 'enabled' && \
       systemctl is-active  avahi-daemon.socket avahi-daemon.service 2>/dev/null | grep -q '^active'; then
        echo "Services / Configure Server Services" >> p1
        echo "Ensure avahi daemon services are not in use" >> p2
        echo "avahi daemon services are in use (package is installed)" >> p3
        echo "No" >> p4
        echo "2.1.2" >> p12
    else
        echo "Services / Configure Server Services" >> p1
        echo "Ensure avahi daemon services are not in use" >> p2
        echo "avahi daemon services are installed but not enabled or active" >> p3
        echo "No" >> p4
        echo "2.1.2" >> p12
    fi
else
    # Avahi package is not installed (compliant)
    echo "Services / Configure Server Services" >> p1
    echo "Ensure avahi daemon services are not in use" >> p2
    echo "avahi daemon services are not in use (package not installed)" >> p3
    echo "Yes" >> p4
    echo "2.1.2" >> p12
fi

#########################################################################################################

# 2.1.3
# Ensure dhcp server services are not in use

if ! rpm -q dhcp-server >/dev/null 2>&1; then
    echo "Services / Configure Server Services" >>p1
    echo "Ensure dhcp server services are not in use" >>p2
    echo "package dhcp-server is not installed" >>p3
    echo "Yes" >>p4
    echo "2.1.3" >>p12
else
    en4=$(systemctl is-enabled dhcpd.service  2>/dev/null || true)
    en6=$(systemctl is-enabled dhcpd6.service 2>/dev/null || true)
    ac4=$(systemctl is-active  dhcpd.service  2>/dev/null || true)
    ac6=$(systemctl is-active  dhcpd6.service 2>/dev/null || true)

    if [ "$en4" != "enabled" ] && [ "$en6" != "enabled" ] && \
       [ "$ac4" != "active" ]  && [ "$ac6" != "active" ]; then
        echo "Services / Configure Server Services" >>p1
        echo "Ensure dhcp server services are not in use" >>p2
        echo "dhcp-server installed but services are disabled and inactive" >>p3
        echo "Yes" >>p4
        echo "2.1.3" >>p12
    else
        echo "Services / Configure Server Services" >>p1
        echo "Ensure dhcp server services are not in use" >>p2
        echo "dhcp-server installed; status: dhcpd(en=$en4, ac=$ac4), dhcpd6(en=$en6, ac=$ac6)" >>p3
        echo "No" >>p4
        echo "2.1.3" >>p12
    fi
fi

#########################################################################################################

# 2.1.4
# Ensure dns server services are not in use

if ! rpm -q bind >/dev/null 2>&1; then
    echo "Services / Configure Server Services" >>p1
    echo "Ensure dns server services are not in use" >>p2
    echo "package bind is not installed" >>p3
    echo "Yes" >>p4
    echo "2.1.4" >>p12
else
    en=$(systemctl is-enabled named.service 2>/dev/null || true)
    ac=$(systemctl is-active  named.service 2>/dev/null || true)

    if [ "$en" != "enabled" ] && [ "$ac" != "active" ]; then
        echo "Services / Configure Server Services" >>p1
        echo "Ensure dns server services are not in use" >>p2
        echo "package bind is installed but named.service is disabled and inactive" >>p3
        echo "Yes" >>p4
        echo "2.1.4" >>p12
    else
        echo "Services / Configure Server Services" >>p1
        echo "Ensure dns server services are not in use" >>p2
        echo "package bind is installed; status: named(en=$en, ac=$ac)" >>p3
        echo "No" >>p4
        echo "2.1.4" >>p12
    fi
fi

#########################################################################################################

# 2.1.5
# Ensure dnsmasq services are not in use

if ! rpm -q dnsmasq >/dev/null 2>&1; then
    echo "Services / Configure Server Services" >>p1
    echo "Ensure dnsmasq services are not in use" >>p2
    echo "package dnsmasq is not installed" >>p3
    echo "Yes" >>p4
    echo "2.1.5" >>p12  
else
    en=$(systemctl is-enabled dnsmasq.service 2>/dev/null || true)
    ac=$(systemctl is-active  dnsmasq.service 2>/dev/null || true)

    if [ "$en" != "enabled" ] && [ "$ac" != "active" ]; then
        echo "Services / Configure Server Services" >>p1
        echo "Ensure dnsmasq services are not in use" >>p2
        echo "dnsmasq installed but service is disabled and inactive" >>p3
        echo "Yes" >>p4
        echo "2.1.5" >>p12
    else
        echo "Services / Configure Server Services" >>p1
        echo "Ensure dnsmasq services are not in use" >>p2
        echo "dnsmasq installed; status: dnsmasq(en=$en, ac=$ac)" >>p3
        echo "No" >>p4
        echo "2.1.5" >>p12
    fi
fi

#########################################################################################################

# 2.1.6
# Ensure samba file server services are not in use

if ! rpm -q samba >/dev/null 2>&1; then
    echo "Services / Configure Server Services" >>p1
    echo "Ensure samba file server services are not in use" >>p2
    echo "package samba is not installed" >>p3
    echo "Yes" >>p4
    echo "2.1.6" >>p12
else
    en=$(systemctl is-enabled smb.service 2>/dev/null || true)
    ac=$(systemctl is-active  smb.service 2>/dev/null || true)

    if [ "$en" != "enabled" ] && [ "$ac" != "active" ]; then
        echo "Services / Configure Server Services" >>p1
        echo "Ensure samba file server services are not in use" >>p2
        echo "samba installed but smb.service is disabled and inactive" >>p3
        echo "Yes" >>p4
        echo "2.1.6" >>p12
    else
        echo "Services / Configure Server Services" >>p1
        echo "Ensure samba file server services are not in use" >>p2
        echo "samba installed; status: smb(en=$en, ac=$ac)" >>p3
        echo "No" >>p4
        echo "2.1.6" >>p12
    fi
fi

#########################################################################################################

# 2.1.7
# Ensure ftp server services are not in use (Automated)

rpm -q vsftpd &> /dev/null
if [ $? -eq 0 ]; then
    if systemctl is-enabled vsftpd.service 2>/dev/null | grep 'enabled' && systemctl is-active vsftpd.service 2>/dev/null | grep '^active'; then
        echo "Services / Configure Server Services" >> p1
        echo "Ensure ftp server services are not in use" >> p2
        echo "ftp server services are in use" >> p3
        echo "No" >> p4
        echo "2.1.7" >> p12
    else
        echo "Services / Configure Server Services" >> p1
        echo "Ensure ftp server services are not in use" >> p2
        echo "ftp server services are installed but not enabled or active" >> p3
        echo "No" >> p4
        echo "2.1.7" >> p12
    fi
else
    echo "Services / Configure Server Services" >> p1
    echo "Ensure ftp server services are not in use" >> p2
    echo "ftp server services are not installed" >> p3
    echo "Yes" >> p4
    echo "2.1.7" >> p12
fi

#########################################################################################################

# 2.1.8
# Ensure message access server services are not in use

if ! rpm -q dovecot >/dev/null 2>&1 && ! rpm -q cyrus-imapd >/dev/null 2>&1; then
    echo "Services / Configure Server Services" >>p1
    echo "Ensure message access server services are not in use" >>p2
    echo "package dovecot is not installed; package cyrus-imapd is not installed" >>p3
    echo "Yes" >>p4
    echo "2.1.8" >>p12
else
    # Capture enable/active states (handle missing units safely)
    en_dsock=$(systemctl is-enabled dovecot.socket  2>/dev/null || true)
    en_dsvc=$(systemctl is-enabled dovecot.service  2>/dev/null || true)
    en_csvc=$(systemctl is-enabled cyrus-imapd.service 2>/dev/null || true)

    ac_dsock=$(systemctl is-active  dovecot.socket  2>/dev/null || true)
    ac_dsvc=$(systemctl is-active   dovecot.service  2>/dev/null || true)
    ac_csvc=$(systemctl is-active   cyrus-imapd.service 2>/dev/null || true)

    if [ "$en_dsock" != "enabled" ] && [ "$en_dsvc" != "enabled" ] && [ "$en_csvc" != "enabled" ] && \
       [ "$ac_dsock" != "active" ]  && [ "$ac_dsvc" != "active" ]  && [ "$ac_csvc" != "active" ]; then
        echo "Services / Configure Server Services" >>p1
        echo "Ensure message access server services are not in use" >>p2
        echo "package(s) installed but dovecot.socket, dovecot.service, and cyrus-imapd.service are disabled and inactive" >>p3
        echo "Yes" >>p4
        echo "2.1.8" >>p12
    else
        echo "Services / Configure Server Services" >>p1
        echo "Ensure message access server services are not in use" >>p2
        echo "Installed; status: dovecot.socket(en=$en_dsock, ac=$ac_dsock), dovecot.service(en=$en_dsvc, ac=$ac_dsvc), cyrus-imapd.service(en=$en_csvc, ac=$ac_csvc)" >>p3
        echo "No" >>p4
        echo "2.1.8" >>p12
    fi
fi

#########################################################################################################

# 2.1.9
# Ensure network file system services are not in use
rpm -q nfs-utils &> /dev/null
if [ $? -eq 0 ]; then
    if systemctl is-enabled nfs-server.service 2>/dev/null | grep 'enabled' && systemctl is-active nfs-server.service 2>/dev/null | grep '^active'; then
        echo "Services / Configure Server Services" >> p1
        echo "Ensure network file system services are not in use" >> p2
        echo "network file system services are in use." >> p3
        echo "No" >> p4
        echo "2.1.9" >> p12
    else
        echo "Services / Configure Server Services" >> p1
        echo "Ensure network file system services are not in use" >> p2
        echo "network file system services are installed but not enabled or active" >> p3
        echo "Yes" >> p4
        echo "2.1.9" >> p12
    fi
else
    echo "Services / Configure Server Services" >> p1
    echo "Ensure network file system services are not in use" >> p2
    echo "network file system services are not in use" >> p3
    echo "Yes" >> p4
    echo "2.1.9" >> p12
fi

#########################################################################################################
# 2.1.10
# Ensure nis server services are not in use

if ! rpm -q ypserv >/dev/null 2>&1; then
    echo "Services / Configure Server Services" >>p1
    echo "Ensure nis server services are not in use" >>p2
    echo "package ypserv is not installed" >>p3
    echo "Yes" >>p4
    echo "2.1.10" >>p12
else
    en=$(systemctl is-enabled ypserv.service 2>/dev/null || true)
    ac=$(systemctl is-active  ypserv.service 2>/dev/null || true)

    if [ "$en" != "enabled" ] && [ "$ac" != "active" ]; then
        echo "Services / Configure Server Services" >>p1
        echo "Ensure nis server services are not in use" >>p2
        echo "ypserv installed but ypserv.service is disabled and inactive" >>p3
        echo "Yes" >>p4
        echo "2.1.10" >>p12
    else
        echo "Services / Configure Server Services" >>p1
        echo "Ensure nis server services are not in use" >>p2
        echo "ypserv installed; status: ypserv(en=$en, ac=$ac)" >>p3
        echo "No" >>p4
        echo "2.1.10" >>p12
    fi
fi

#########################################################################################################

#2.1.11
# Ensure print server services are not in use (Automated)

if rpm -q cups &>/dev/null; then
    # cups package is present; ensure socket/service are not enabled/active
    enabled_any=$(systemctl is-enabled cups.socket cups.service 2>/dev/null | grep -q 'enabled'; echo $?)
    active_any=$(systemctl is-active  cups.socket cups.service 2>/dev/null | grep -q '^active';  echo $?)

    if [ "$enabled_any" -eq 0 ] || [ "$active_any" -eq 0 ]; then
        # Non-compliant: either enabled or active
        echo "Services / Configure Server Services" >> p1
        echo "Ensure print server services are not in use" >> p2
        echo "CUPS is installed and cups.socket/cups.service is enabled or active" >> p3
        echo "No" >> p4
        echo "2.1.11" >> p12
    else
        # Compliant: installed but disabled and inactive (likely a dependency)
        echo "Services / Configure Server Services" >> p1
        echo "Ensure print server services are not in use" >> p2
        echo "CUPS is installed (likely a dependency) but cups.socket and cups.service are disabled and inactive" >> p3
        echo "Yes" >> p4
        echo "2.1.11" >> p12
    fi
else
    # Compliant: package not installed
    echo "Services / Configure Server Services" >> p1
    echo "Ensure print server services are not in use" >> p2
    echo "CUPS package is not installed" >> p3
    echo "Yes" >> p4
    echo "2.1.11" >> p12
fi

#########################################################################################################

# 2.1.12
# Ensure rpcbind services are not in use
rpm -q rpcbind &> /dev/null
if [ $? -eq 0 ]; then
    if systemctl is-enabled rpcbind.socket rpcbind.service 2>/dev/null | grep 'enabled' &&systemctl is-active rpcbind.socket rpcbind.service 2>/dev/null | grep '^active'; then
        echo "Services / Configure Server Services" >> p1
        echo "Ensure rpcbind services are not in use" >> p2
        echo "rpcbind services are in use." >> p3
        echo "No" >> p4
        echo "2.1.12" >> p12
    else
        echo "Services / Configure Server Services" >> p1
        echo "Ensure rpcbind services are not in use" >> p2
        echo "rpcbind services are installed but not enabled or active" >> p3
        echo "No" >> p4
        echo "2.1.12" >> p12
    fi
else
    echo "Services / Configure Server Services" >> p1
    echo "Ensure rpcbind services are not in use" >> p2
    echo "rpcbind services are not in use" >> p3
    echo "Yes" >> p4
    echo "2.1.12" >> p12
fi

#########################################################################################################

# 2.1.13
# Ensure rsync services are not in use

if ! rpm -q rsync-daemon >/dev/null 2>&1; then
    echo "Services / Configure Server Services" >>p1
    echo "Ensure rsync services are not in use" >>p2
    echo "package rsync-daemon is not installed" >>p3
    echo "Yes" >>p4
    echo "2.1.13" >>p12
else
    en_sock=$(systemctl is-enabled rsyncd.socket  2>/dev/null || true)
    en_srv=$(systemctl is-enabled rsyncd.service  2>/dev/null || true)
    ac_sock=$(systemctl is-active  rsyncd.socket  2>/dev/null || true)
    ac_srv=$(systemctl is-active   rsyncd.service  2>/dev/null || true)

    if [ "$en_sock" != "enabled" ] && [ "$en_srv" != "enabled" ] && \
       [ "$ac_sock" != "active" ]  && [ "$ac_srv" != "active" ]; then
        echo "Services / Configure Server Services" >>p1
        echo "Ensure rsync services are not in use" >>p2
        echo "rsync-daemon installed but rsyncd.socket and rsyncd.service are disabled and inactive" >>p3
        echo "Yes" >>p4
        echo "2.1.13" >>p12
    else
        echo "Services / Configure Server Services" >>p1
        echo "Ensure rsync services are not in use" >>p2
        echo "rsync-daemon installed; status: rsyncd.socket(en=$en_sock, ac=$ac_sock), rsyncd.service(en=$en_srv, ac=$ac_srv)" >>p3
        echo "No" >>p4
        echo "2.1.13" >>p12
    fi
fi

#########################################################################################################

# 2.1.14
# Ensure snmp services are not in use

if ! rpm -q net-snmp >/dev/null 2>&1; then
    echo "Services / Configure Server Services" >>p1
    echo "Ensure snmp services are not in use" >>p2
    echo "package net-snmp is not installed" >>p3
    echo "Yes" >>p4
    echo "2.1.14" >>p12
else
    en=$(systemctl is-enabled snmpd.service 2>/dev/null || true)
    ac=$(systemctl is-active  snmpd.service 2>/dev/null || true)

    if [ "$en" != "enabled" ] && [ "$ac" != "active" ]; then
        echo "Services / Configure Server Services" >>p1
        echo "Ensure snmp services are not in use" >>p2
        echo "net-snmp installed but snmpd.service is disabled and inactive" >>p3
        echo "Yes" >>p4
        echo "2.1.14" >>p12
    else
        echo "Services / Configure Server Services" >>p1
        echo "Ensure snmp services are not in use" >>p2
        echo "net-snmp installed; status: snmpd(en=$en, ac=$ac)" >>p3
        echo "No" >>p4
        echo "2.1.14" >>p12
    fi
fi

#########################################################################################################

# 2.1.15
# Ensure telnet server services are not in use

if ! rpm -q telnet-server >/dev/null 2>&1; then
    echo "Services / Configure Server Services" >>p1
    echo "Ensure telnet server services are not in use" >>p2
    echo "package telnet-server is not installed" >>p3
    echo "Yes" >>p4
    echo "2.1.15" >>p12
else
    en=$(systemctl is-enabled telnet.socket 2>/dev/null || true)
    ac=$(systemctl is-active  telnet.socket 2>/dev/null || true)

    if [ "$en" != "enabled" ] && [ "$ac" != "active" ]; then
        echo "Services / Configure Server Services" >>p1
        echo "Ensure telnet server services are not in use" >>p2
        echo "telnet-server installed but telnet.socket is disabled and inactive" >>p3
        echo "Yes" >>p4
        echo "2.1.15" >>p12
    else
        echo "Services / Configure Server Services" >>p1
        echo "Ensure telnet server services are not in use" >>p2
        echo "telnet-server installed; status: telnet.socket(en=$en, ac=$ac)" >>p3
        echo "No" >>p4
        echo "2.1.15" >>p12
    fi
fi

#########################################################################################################

# 2.1.16
# Ensure tftp server services are not in use

if ! rpm -q tftp-server >/dev/null 2>&1; then
    echo "Services / Configure Server Services" >>p1
    echo "Ensure tftp server services are not in use" >>p2
    echo "package tftp-server is not installed" >>p3
    echo "Yes" >>p4
    echo "2.1.16" >>p12
else
    en_sock=$(systemctl is-enabled tftp.socket  2>/dev/null || true)
    en_srv=$(systemctl is-enabled tftp.service  2>/dev/null || true)
    ac_sock=$(systemctl is-active  tftp.socket  2>/dev/null || true)
    ac_srv=$(systemctl is-active   tftp.service  2>/dev/null || true)

    if [ "$en_sock" != "enabled" ] && [ "$en_srv" != "enabled" ] && \
       [ "$ac_sock" != "active" ]  && [ "$ac_srv" != "active" ]; then
        echo "Services / Configure Server Services" >>p1
        echo "Ensure tftp server services are not in use" >>p2
        echo "tftp-server installed but tftp.socket and tftp.service are disabled and inactive" >>p3
        echo "Yes" >>p4
        echo "2.1.16" >>p12
    else
        echo "Services / Configure Server Services" >>p1
        echo "Ensure tftp server services are not in use" >>p2
        echo "tftp-server installed; status: tftp.socket(en=$en_sock, ac=$ac_sock), tftp.service(en=$en_srv, ac=$ac_srv)" >>p3
        echo "No" >>p4
        echo "2.1.16" >>p12
    fi
fi

#########################################################################################################

# 2.1.17
# Ensure web proxy server services are not in use

if ! rpm -q squid >/dev/null 2>&1; then
    echo "Services / Configure Server Services" >>p1
    echo "Ensure web proxy server services are not in use" >>p2
    echo "package squid is not installed" >>p3
    echo "Yes" >>p4
    echo "2.1.17" >>p12
else
    en=$(systemctl is-enabled squid.service 2>/dev/null || true)
    ac=$(systemctl is-active  squid.service 2>/dev/null || true)

    if [ "$en" != "enabled" ] && [ "$ac" != "active" ]; then
        echo "Services / Configure Server Services" >>p1
        echo "Ensure web proxy server services are not in use" >>p2
        echo "squid installed but squid.service is disabled and inactive" >>p3
        echo "Yes" >>p4
        echo "2.1.17" >>p12
    else
        echo "Services / Configure Server Services" >>p1
        echo "Ensure web proxy server services are not in use" >>p2
        echo "squid installed; status: squid(en=$en, ac=$ac)" >>p3
        echo "No" >>p4
        echo "2.1.17" >>p12
    fi
fi
#########################################################################################################

# 2.1.18
# Ensure web server services are not in use

httpd_installed=false
nginx_installed=false

rpm -q httpd >/dev/null 2>&1 && httpd_installed=true
rpm -q nginx >/dev/null 2>&1 && nginx_installed=true

# Neither package installed
if ! $httpd_installed && ! $nginx_installed; then
    echo "Services / Configure Server Services" >> p1
    echo "Ensure web server services are not in use" >> p2
    echo "httpd and nginx packages are not installed" >> p3
    echo "Yes" >> p4
    echo "2.2.18" >> p12

else

    enabled=0
    active=0
    msg=""

    # Check httpd
    if $httpd_installed; then
        systemctl is-enabled httpd.socket httpd.service 2>/dev/null | grep -q enabled && enabled=1
        systemctl is-active httpd.socket httpd.service 2>/dev/null | grep -q '^active' && active=1

        if [ $enabled -eq 1 ] || [ $active -eq 1 ]; then
            msg="httpd package is installed and httpd service is enabled or active"
        else
            msg="httpd package is installed but httpd service is not enabled and not active"
        fi
    fi

    # Check nginx
    if $nginx_installed; then

        ng_enabled=0
        ng_active=0

        systemctl is-enabled nginx.service 2>/dev/null | grep -q enabled && ng_enabled=1
        systemctl is-active nginx.service 2>/dev/null | grep -q '^active' && ng_active=1

        if [ -n "$msg" ]; then
            msg="$msg; "
        fi

        if [ $ng_enabled -eq 1 ] || [ $ng_active -eq 1 ]; then
            msg="${msg}nginx package is installed and nginx service is enabled or active"
        else
            msg="${msg}nginx package is installed but nginx service is not enabled and not active"
        fi

        [ $ng_enabled -eq 1 ] && enabled=1
        [ $ng_active -eq 1 ] && active=1
    fi

    echo "Services / Configure Server Services" >> p1
    echo "Ensure web server services are not in use" >> p2
    echo "$msg" >> p3

    if [ $enabled -eq 1 ] || [ $active -eq 1 ]; then
        echo "No" >> p4
    else
        echo "Yes" >> p4
    fi

    echo "2.1.18" >> p12
fi

#########################################################################################################

# 2.1.19
# Ensure xinetd services are not in use

if ! rpm -q xinetd >/dev/null 2>&1; then
    echo "Services / Configure Server Services" >>p1
    echo "Ensure xinetd services are not in use" >>p2
    echo "package xinetd is not installed" >>p3
    echo "Yes" >>p4
    echo "2.1.19" >>p12
else
    en=$(systemctl is-enabled xinetd.service 2>/dev/null || true)
    ac=$(systemctl is-active  xinetd.service 2>/dev/null || true)

    if [ "$en" != "enabled" ] && [ "$ac" != "active" ]; then
        echo "Services / Configure Server Services" >>p1
        echo "Ensure xinetd services are not in use" >>p2
        echo "xinetd installed but xinetd.service is disabled and inactive" >>p3
        echo "Yes" >>p4
        echo "2.1.19" >>p12
    else
        echo "Services / Configure Server Services" >>p1
        echo "Ensure xinetd services are not in use" >>p2
        echo "xinetd installed; status: xinetd(en=$en, ac=$ac)" >>p3
        echo "No" >>p4
        echo "2.1.19" >>p12
    fi
fi

#########################################################################################################

# 2.1.21
# Ensure mail transfer agents are configured for local-only mode

issues=""
oks=""

# If postconf exists and shows inet_interfaces = all, that's a fail per audit text
if [ "$(postconf -n inet_interfaces 2>/dev/null)" = "inet_interfaces = all" ]; then
    issues="${issues}Postfix is bound to all interfaces; "
else
    # Check standard MTA ports for any non-loopback listeners
    for port in 25 465 587; do
        if ss -plntu 2>/dev/null | grep -P -- ':'"$port"'\b' | grep -Pvq -- '\h+(127\.0\.0\.1|\[?::1\]?):'"$port"'\b'; then
            issues="${issues}Port \"$port\" is listening on a non-loopback network interface; "
        else
            oks="${oks}Port \"$port\" is not listening on a non-loopback network interface; "
        fi
    done
fi

echo "Services / Configure Server Services" >>p1
echo "Ensure mail transfer agents are configured for local-only mode" >>p2

if [ -z "$issues" ]; then
    # PASS
    # Trim trailing semicolon+space from oks
    oks="${oks% ; }"
    [ -z "$oks" ] && oks="No MTA is listening on non-loopback ports (25, 465, 587)"
    echo "$oks" >>p3
    echo "Yes" >>p4
else
    # FAIL
    issues="${issues% ; }"
    if [ -n "$oks" ]; then
        oks="${oks% ; }"
        echo "Audit failure: $issues | Correctly set: $oks" >>p3
    else
        echo "Audit failure: $issues" >>p3
    fi
    echo "No" >>p4
fi

echo "2.1.21" >>p12

#########################################################################################################

#2.2.1
#Ensure ftp client is not installed (Automated)

if rpm -q ftp >/dev/null 2>&1; then
    echo "Services / Configure Client Services" >>p1
    echo "Ensure ftp client is not installed" >>p2
    echo "ftp package is installed" >>p3
    echo "No" >>p4
    echo "2.2.1" >>p12
else
    echo "Services / Configure Client Services" >>p1
    echo "Ensure ftp client is not installed" >>p2
    echo "ftp package is not installed" >>p3
    echo "Yes" >>p4
    echo "2.2.1" >>p12
fi

#########################################################################################################

#2.2.3
#Ensure nis client is not installed (Automated)

if rpm -q ypbind >/dev/null 2>&1; then
    echo "Services / Configure Client Services" >>p1
    echo "Ensure nis client is not installed" >>p2
    echo "ypbind package is installed" >>p3
    echo "No" >>p4
    echo "2.2.3" >>p12
else
    echo "Services / Configure Client Services" >>p1
    echo "Ensure nis client is not installed" >>p2
    echo "ypbind package is not installed" >>p3
    echo "Yes" >>p4
    echo "2.2.3" >>p12
fi

#########################################################################################################

#2.2.4
#Ensure telnet client is not installed (Automated)

if rpm -q telnet >/dev/null 2>&1; then
    echo "Services / Configure Client Services" >>p1
    echo "Ensure telnet client is not installed" >>p2
    echo "telnet package is installed" >>p3
    echo "No" >>p4
    echo "2.2.4" >>p12
else
    echo "Services / Configure Client Services" >>p1
    echo "Ensure telnet client is not installed" >>p2
    echo "package telnet is not installed" >>p3
    echo "Yes" >>p4
    echo "2.2.4" >>p12
fi

#########################################################################################################

#2.2.5
#Ensure tftp client is not installed (Automated)

if rpm -q tftp >/dev/null 2>&1; then
    echo "Services / Configure Client Services" >>p1
    echo "Ensure tftp client is not installed" >>p2
    echo "tftp package is installed" >>p3
    echo "No" >>p4
    echo "2.2.5" >>p12
else
    echo "Services / Configure Client Services" >>p1
    echo "Ensure tftp client is not installed" >>p2
    echo "package tftp is not installed" >>p3
    echo "Yes" >>p4
    echo "2.2.5" >>p12
fi

#########################################################################################################

#2.3.1
#Ensure time synchronization is in use (Automated)
otpt12=$(rpm -q chrony)
if [[ $otpt12 == chrony-* ]]; then
    echo "Services / Configure Time Synchronization" >>p1
	echo "Ensure time synchronization is in use" >>p2
	echo "Chronyd must be running" >>p3
	echo "Yes" >>p4
	echo "2.3.1" >>p12
else
    echo "Services / Configure Time Synchronization" >>p1
	echo "Ensure time synchronization is in use" >>p2
	echo "Chronyd not running" >>p3
	echo "No" >>p4
	echo "2.3.1" >>p12
fi

#########################################################################################################

#2.3.2
#Ensure chrony is configured (Automated)
otpt16=$(grep -E "^(server|pool)" /etc/chrony.conf)
otpt17=$(grep ^OPTIONS /etc/sysconfig/chronyd)

# Check if the output contains "server" or "pool" and "OPTIONS=-u chrony"
if [[ $otpt16 == server* || $otpt16 == pool* ]] && [[ $otpt17 == *"-u chrony"* ]]; then
    echo "Services / Configure Time Synchronization" >>p1
	echo "Ensure chrony is configured" >>p2
	echo "At least one pool or server is specified" >>p3
	echo "Yes" >>p4
	echo "2.3.2" >>p12
else
    echo "Services / Configure Time Synchronization" >>p1
	echo "Ensure chrony is configured" >>p2
	echo "At least one pool or server is not specified" >>p3
	echo "No" >>p4
	echo "2.3.2" >>p12
fi

#########################################################################################################

# 2.3.3
# Ensure chrony is not run as the root user (Automated)

echo "Services / Configure Time Synchronization" >>p1
echo "Ensure chrony is not run as the root user" >>p2

if ! rpm -q chrony >/dev/null 2>&1; then
    # If chrony is not installed, it's inherently not running as root
    echo "chrony package is not installed" >>p3
    echo "Yes" >>p4
    echo "2.3.3" >>p12
else
    # CIS audit: Nothing should be returned if not configured with -u root
    match=$(grep -Psi -- '^[[:space:]]*OPTIONS="?[:space:]*([^#\n\r]+[[:space:]]+)?-u[[:space:]]+root\b' /etc/sysconfig/chronyd 2>/dev/null || true)

    if [ -z "$match" ]; then
        echo "No evidence of 'OPTIONS=... -u root' in /etc/sysconfig/chronyd" >>p3
        echo "Yes" >>p4
        echo "2.3.3" >>p12
    else
        compact=$(echo "$match" | tr '\n' ';' | sed 's/;*$//')
        echo "Found configuration running chronyd as root: $compact" >>p3
        echo "No" >>p4
        echo "2.3.3" >>p12
    fi
fi

#########################################################################################################

# 2.4.1.1
# Ensure cron daemon is enabled and active (Automated)

echo "Services / Job Schedulers" >> p1
echo "Ensure cron daemon is enabled and active" >> p2

# Detect unit name (crond.service on RHEL; cron.service on Debian/Ubuntu)
unit=""
if systemctl list-unit-files 2>/dev/null | awk '$1=="crond.service"{f=1} END{exit !f}'; then
  unit="crond.service"
elif systemctl list-unit-files 2>/dev/null | awk '$1=="cron.service"{f=1} END{exit !f}'; then
  unit="cron.service"
fi

if [ -z "$unit" ]; then
  echo "cron service unit not found (neither crond.service nor cron.service present)" >> p3
  echo "No" >> p4
  echo "2.4.1.1" >> p12
else
  enabled_state=$(systemctl is-enabled "$unit" 2>/dev/null)
  active_state=$(systemctl is-active "$unit" 2>/dev/null)

  # PASS only if enabled_state=='enabled' and active_state=='active'
  if [ "$enabled_state" = "enabled" ] && [ "$active_state" = "active" ]; then
    echo "cron daemon ($unit) enabled: $enabled_state; active: $active_state" >> p3
    echo "Yes" >> p4
  else
    echo "cron daemon ($unit) enabled: ${enabled_state:-unknown}; active: ${active_state:-unknown} (expected enabled & active)" >> p3
    echo "No" >> p4
  fi

  echo "2.4.1.1" >> p12
fi


#########################################################################################################

#2.4.1.2
#Ensure permissions on /etc/crontab are configured (Automated)
file3="/etc/crontab"
if [ -f "$file3" ]; then
	otpt10=$(stat -c "%A %u %g" /etc/crontab)
	# Split the output into an array
	read -ra arr <<< "$otpt10"
	# Extract the permissions, UID, and GID
	permissions3=${arr[0]}
	uid3=${arr[1]}
	gid3=${arr[2]}
	permissions_numeric3=$(stat -c "%a" /etc/crontab)
	if [[ $permissions_numeric3 == "600" && $uid3 -eq 0 && $gid3 -eq 0 ]]; then
		echo "Services / Job Schedulers" >> p1
		echo "Ensure permissions on /etc/crontab are configured" >> p2
		echo "Permissions on /etc/crontab are configured" >> p3
		echo "Yes" >> p4
		echo "2.4.1.2" >> p12
	else
		echo "Services / Job Schedulers" >> p1
		echo "Ensure permissions on /etc/crontab are configured" >> p2
		echo "Permissions on /etc/crontab are NOT configured correctly" >> p3
		echo "No" >> p4
		echo "2.4.1.2" >> p12
	fi
else
	echo "Services / Job Schedulers" >> p1
	echo "Ensure permissions on /etc/crontab are configured" >> p2
	echo "File $file3 does not exist" >> p3
	echo "No" >> p4
	echo "2.4.1.2" >> p12
fi

#########################################################################################################

#2.4.1.3
#Ensure permissions on /etc/cron.hourly are configured (Automated)
file4="/etc/cron.hourly"
if [ -d "$file4" ]; then
	otpt11=$(stat -c "%A %u %g" /etc/cron.hourly)
	# Split the output into an array
	read -ra arr <<< "$otpt11"
	# Extract the permissions, UID, and GID
	permissions4=${arr[0]}
	uid4=${arr[1]}
	gid4=${arr[2]}
	# Convert the permissions to the numeric format
	permissions_numeric4=$(stat -c "%a" /etc/cron.hourly)
	# Check the conditions
	if [[ $permissions_numeric4 == "700" && $uid4 -eq 0 && $gid4 -eq 0 ]]; then
		echo "Services / Job Schedulers" >> p1
		echo "Ensure permissions on /etc/cron.hourly are configured" >> p2
		echo "Permissions on /etc/cron.hourly are configured" >> p3
		echo "Yes" >> p4
		echo "2.4.1.3" >> p12
	else
		echo "Services / Job Schedulers" >> p1
		echo "Ensure permissions on /etc/cron.hourly are configured" >> p2
		echo "Permissions on /etc/cron.hourly are NOT configured correctly" >> p3
		echo "No" >> p4
		echo "2.4.1.3" >> p12
	fi
else
	echo "Services / Job Schedulers" >> p1
	echo "Ensure permissions on /etc/cron.hourly are configured" >> p2
	echo "File $file4 does not exist" >> p3
	echo "No" >> p4
	echo "2.4.1.3" >> p12
fi

#########################################################################################################

#2.4.1.4
#Ensure permissions on /etc/cron.daily are configured (Automated)
file5="/etc/cron.daily"

if [ -d "$file5" ]; then
	# Get the permissions using the stat command
	otpt8=$(stat -c "%A %u %g" /etc/cron.daily)
	# Split the output into an array
	read -ra arr <<< "$otpt8"
	# Extract the permissions, UID, and GID
	permissions5=${arr[0]}
	uid5=${arr[1]}
	gid5=${arr[2]}
	# Convert the permissions to the numeric format
	permissions_numeric5=$(stat -c "%a" /etc/cron.daily)
	if [[ $permissions_numeric5 == "700" && $uid5 -eq 0 && $gid5 -eq 0 ]]; then
		echo "Services / Job Schedulers" >> p1
		echo "Ensure permissions on /etc/cron.daily are configured" >> p2
		echo "Permissions on /etc/cron.daily are configured" >> p3
		echo "Yes" >> p4
		echo "2.4.1.4" >> p12
	else
		echo "Services / Job Schedulers" >> p1
		echo "Ensure permissions on /etc/cron.daily are configured" >> p2
		echo "Permissions on /etc/cron.daily are NOT configured correctly" >> p3
		echo "No" >> p4
		echo "2.4.1.4" >> p12
	fi
else
	echo "Services / Job Schedulers" >> p1
	echo "Ensure permissions on /etc/cron.daily are configured" >> p2
	echo "Directory $file5 does not exist" >> p3
	echo "No" >> p4
	echo "2.4.1.4" >> p12
fi

#########################################################################################################

#2.4.1.5
#Ensure permissions on /etc/cron.weekly are configured (Automated)
file8="/etc/cron.weekly"
if [ -d "$file8" ]; then
	otpt15=$(stat -c "%A %u %g" /etc/cron.weekly)
	read -ra arr <<< "$otpt15"
	permissions8=${arr[0]}
	uid8=${arr[1]}
	gid8=${arr[2]}
	permissions_numeric8=$(stat -c "%a" /etc/cron.weekly)
	if [[ $permissions_numeric8 == "700" && $uid8 -eq 0 && $gid8 -eq 0 ]]; then
		echo "Services / Job Schedulers" >> p1
		echo "Ensure permissions on /etc/cron.weekly are configured" >> p2
		echo "Permissions on /etc/cron.weekly are configured" >> p3
		echo "Yes" >> p4
		echo "2.4.1.5" >> p12
	else
		echo "Services / Job Schedulers" >> p1
		echo "Ensure permissions on /etc/cron.weekly are configured" >> p2
		echo "Permissions on /etc/cron.weekly are NOT configured correctly" >> p3
		echo "No" >> p4
		echo "2.4.1.5" >> p12
	fi
else
	echo "Services / Job Schedulers" >> p1
	echo "Ensure permissions on /etc/cron.weekly are configured" >> p2
	echo "Direcory $file8 does not exist" >> p3
	echo "No" >> p4
	echo "2.4.1.5" >> p12
fi

#########################################################################################################

#2.4.1.6
#Ensure permissions on /etc/cron.monthly are configured (Automated)
file6="/etc/cron.monthly"
if [ -d "$file6" ]; then
	otpt13=$(stat -c "%A %u %g" /etc/cron.monthly)

	# Split the output into an array
	read -ra arr <<< "$otpt13"

	# Extract the permissions, UID, and GID
	permissions6=${arr[0]}
	uid6=${arr[1]}
	gid6=${arr[2]}

	# Convert the permissions to the numeric format
	permissions_numeric6=$(stat -c "%a" /etc/cron.monthly)

	# Check the conditions
	if [[ $permissions_numeric6 == "700" && $uid6 -eq 0 && $gid6 -eq 0 ]]; then
		echo "Services / Job Schedulers" >> p1
		echo "Ensure permissions on /etc/cron.monthly are configured" >> p2
		echo "Permissions on /etc/cron.monthly are configured" >> p3
		echo "Yes" >> p4
		echo "2.4.1.6" >> p12
	else
		echo "Services / Job Schedulers" >> p1
		echo "Ensure permissions on /etc/cron.monthly are configured" >> p2
		echo "Permissions on /etc/cron.monthly are NOT configured correctly" >> p3
		echo "No" >> p4
		echo "2.4.1.6" >> p12
	fi
else
	echo "Services / Job Schedulers" >> p1
	echo "Ensure permissions on /etc/cron.monthly are configured" >> p2
	echo "Direcory $file6 does not exist" >> p3
	echo "No" >> p4
	echo "2.4.1.6" >> p12
fi

#########################################################################################################

#2.4.1.7
#Ensure permissions on /etc/cron.d are configured (Automated)
file7="/etc/cron.d"
if [ -d "$file7" ]; then
	otpt14=$(stat -c "%A %u %g" /etc/cron.d)

	# Split the output into an array
	read -ra arr <<< "$otpt14"

	# Extract the permissions, UID, and GID
	permissions7=${arr[0]}
	uid7=${arr[1]}
	gid7=${arr[2]}

	# Convert the permissions to the numeric format
	permissions_numeric7=$(stat -c "%a" /etc/cron.d)

	# Check the conditions
	if [[ $permissions_numeric7 == "700" && $uid7 -eq 0 && $gid7 -eq 0 ]]; then
		echo "Services / Job Schedulers" >> p1
		echo "Ensure permissions on /etc/cron.d are configured" >> p2
		echo "Permissions on /etc/cron.d are configured" >> p3
		echo "Yes" >> p4
		echo "2.4.1.7" >> p12
	else
		echo "Services / Job Schedulers" >> p1
		echo "Ensure permissions on /etc/cron.d are configured" >> p2
		echo "Permissions on /etc/cron.d are NOT configured correctly" >> p3
		echo "No" >> p4
		echo "2.4.1.7" >> p12
	fi
else
	echo "Services / Job Schedulers" >> p1
	echo "Ensure permissions on /etc/cron.d are configured" >> p2
	echo "Direcory $file7 does not exist" >> p3
	echo "No" >> p4
	echo "2.4.1.7" >> p12
fi

#########################################################################################################

# 2.4.1.8
# Ensure crontab is restricted to authorized users (Automated)
allow_status=""
deny_status=""
result="Yes"
msg=""
# Check /etc/cron.allow
if [ ! -e /etc/cron.allow ]; then
    allow_status="missing"
else
    allow_perm=$(stat -Lc "%a" /etc/cron.allow)
    allow_owner=$(stat -Lc "%U" /etc/cron.allow)
    allow_group=$(stat -Lc "%G" /etc/cron.allow)

    if [ "$allow_perm" -gt 640 ] || \
       [ "$allow_owner" != "root" ] || \
       [ "$allow_group" != "root" ]; then
        allow_status="incorrect"
    else
        allow_status="correct"
    fi
fi

# Check /etc/cron.deny
if [ ! -e /etc/cron.deny ]; then
    deny_status="missing"
else
    deny_perm=$(stat -Lc "%a" /etc/cron.deny)
    deny_owner=$(stat -Lc "%U" /etc/cron.deny)
    deny_group=$(stat -Lc "%G" /etc/cron.deny)

    if [ "$deny_perm" -gt 640 ] || \
       [ "$deny_owner" != "root" ] || \
       [ "$deny_group" != "root" ]; then
        deny_status="incorrect"
    else
        deny_status="correct"
    fi
fi

# Evaluate CIS requirement
if [ "$allow_status" = "missing" ] && [ "$deny_status" = "missing" ]; then
    result="No"
    msg="/etc/cron.allow and /etc/cron.deny files are missing"
elif [ "$allow_status" = "missing" ]; then
    result="No"
    msg="/etc/cron.allow file is missing"
elif [ "$allow_status" = "incorrect" ] && [ "$deny_status" = "incorrect" ]; then
    result="No"
    msg="/etc/cron.allow and /etc/cron.deny permissions or ownership are incorrect"
elif [ "$allow_status" = "incorrect" ]; then
    result="No"
    msg="/etc/cron.allow permissions or ownership are incorrect"
elif [ "$deny_status" = "incorrect" ]; then
    result="No"
    msg="/etc/cron.deny permissions or ownership are incorrect"
else
    result="Yes"
    msg="/etc/cron.allow is correctly configured and /etc/cron.deny is correctly configured or not present"
fi

echo "Scheduled Jobs" >> p1
echo "Ensure crontab is restricted to authorized users" >> p2
echo "$msg" >> p3
echo "$result" >> p4
echo "2.4.1.8" >> p12

#########################################################################################################

# 2.4.2.1
# Ensure at is restricted to authorized users (Automated)

echo "Services / Job Schedulers" >> p1
echo "Ensure at is restricted to authorized users" >> p2

# Check if 'at' is installed
if ! command -v at >/dev/null 2>&1 && ! systemctl list-unit-files 2>/dev/null | grep -q '^atd\.service'; then
  echo "at is not installed on the system" >> p3
  echo "No" >> p4
  echo "2.4.2.1" >> p12
else
  # Check /etc/at.allow
  if [ -f /etc/at.allow ]; then
    # get: mode owner group
    read -r mode owner group < <(stat -Lc '%a %U %G' /etc/at.allow 2>/dev/null)
    m=$((10#${mode: -3}))  # normalize
    if [ "$m" -le 640 ] && [ "$owner" = "root" ] && { [ "$group" = "root" ] || [ "$group" = "daemon" ]; }; then
      allow_ok="yes"
    else
      allow_ok="no"
    fi
  else
    allow_ok="no"
  fi

  # Check /etc/at.deny (optional)
  if [ ! -f /etc/at.deny ]; then
    deny_ok="yes"
  else
    read -r mode owner group < <(stat -Lc '%a %U %G' /etc/at.deny 2>/dev/null)
    m=$((10#${mode: -3}))
    if [ "$m" -le 640 ] && [ "$owner" = "root" ] && { [ "$group" = "root" ] || [ "$group" = "daemon" ]; }; then
      deny_ok="yes"
    else
      deny_ok="no"
    fi
  fi

  # Final result:
  if [ "$allow_ok" = "yes" ] && [ "$deny_ok" = "yes" ]; then
    echo "at.allow and at.deny permissions/ownership compliant" >> p3
    echo "Yes" >> p4
  else
    echo "at.allow/at.deny permissions or ownership NOT compliant" >> p3
    echo "No" >> p4
  fi

  echo "2.4.2.1" >> p12
fi

######################################Network / Configure ##################################################


#########################################################################################################

#########################################################################################################

#3.1.2
#Ensure wireless interfaces are disabled.
#!/usr/bin/env bash

{
 l_output="" l_output2=""
 module_chk()
 {
 # Check how module will be loaded
 l_loadable="$(modprobe -n -v "$l_mname")"
 if grep -Pq -- '^\h*install \/bin\/(true|false)' <<< "$l_loadable"; then
 l_output="$l_output\n - module: \"$l_mname\" is not loadable: \"$l_loadable\""
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is loadable: \"$l_loadable\""
 fi
 # Check is the module currently loaded
 if ! lsmod | grep "$l_mname" > /dev/null 2>&1; then
 l_output="$l_output\n - module: \"$l_mname\" is not loaded"
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is loaded"
 fi
 # Check if the module is deny listed
 if modprobe --showconfig | grep -Pq -- "^\h*blacklist\h+$l_mname\b"; then
 l_output="$l_output\n - module: \"$l_mname\" is deny listed in: \"$(grep -Pl -- "^\h*blacklist\h+$l_mname\b" /etc/modprobe.d/*)\""
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is not deny listed"
 fi
 }
 if [ -n "$(find /sys/class/net/*/ -type d -name wireless)" ]; then
 l_dname=$(for driverdir in $(find /sys/class/net/*/ -type d -name wireless | xargs -0 dirname); do basename "$(readlink -f "$driverdir"/device/driver/module)";done | sort -u)
 for l_mname in $l_dname; do
 module_chk
 done
 fi
 # Report results. If no failures output in l_output2, we pass
 if [ -z "$l_output2" ]; then
    echo "Network / Configure Network Devices" >>p1
        echo "Ensure wireless interfaces are disabled" >>p2
        echo "Wireless interfaces are disabled" >>p3
        echo "Yes" >>p4
        echo "3.1.2" >>p12
 if [ -z "$l_output" ]; then
 echo -e "\n - System has no wireless NICs installed" > /dev/null
 else
 echo -e "\n$l_output\n"
 fi
 else
    echo "Network / Configure Network Devices" >>p1
        echo "Ensure wireless interfaces are disabled" >>p2
        echo "Wireless interfaces are not disabled" >>p3
        echo "No" >>p4
        echo "3.1.2" >>p12
 fi
}

###########################################################################################################################

#3.1.3
#Ensure bluetooth services are not in use (Automated)

pkg=$(rpm -q bluez 2>/dev/null)

if [ -z "$pkg" ]; then
        echo "Network / Configure Network Devices" >> p1
        echo "Ensure bluetooth services are not in use" >> p2
        echo "Bluez package not installed" >> p3
        echo "Yes" >> p4
        echo "3.1.3" >> p12
else
        en=$(systemctl is-enabled bluetooth.service 2>/dev/null)
        ac=$(systemctl is-active bluetooth.service 2>/dev/null)

        current="Bluetooth service $en $ac"

        if [ "$en" = "disabled" ] && [ "$ac" = "inactive" ]; then
                result="Yes"
        else
                result="No"
        fi

        echo "Network / Configure Network Devices" >> p1
        echo "Ensure bluetooth services are not in use" >> p2
        echo "Bluez installed $current" >> p3
        echo "$result" >> p4
        echo "3.1.3" >> p12
fi

###########################################################################################################################

#3.3.1
#Ensure ip forwarding is disabled (Automated)
{
 l_output=(); l_output2=(); l_ipv6_disabled=""
 a_parlist=("net.ipv4.ip_forward=0" "net.ipv6.conf.all.forwarding=0")
 l_ufwscf="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"

 f_ipv6_chk()
 {
  l_ipv6_disabled="no"
  ! grep -Pqs -- '^\h*0\b' /sys/module/ipv6/parameters/disable && l_ipv6_disabled="yes"
  if sysctl net.ipv6.conf.all.disable_ipv6 | grep -Pqs -- "\h*net\.ipv6\.conf\.all\.disable_ipv6\h*=\h*1\b" && \
     sysctl net.ipv6.conf.default.disable_ipv6 | grep -Pqs -- "\h*net\.ipv6\.conf\.default\.disable_ipv6\h*=\h*1\b"; then
   l_ipv6_disabled="yes"
  fi
 }

 f_kernel_parameter_chk()
 {
  l_running_parameter_value="$(sysctl "$l_parameter_name" | awk -F= '{print $2}' | xargs)"
  if grep -Pq -- "\b$l_parameter_value\b" <<< "$l_running_parameter_value"; then
   l_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_running_parameter_value\" in the running configuration")
  else
   l_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_running_parameter_value\" in the running configuration and should have a value of: \"$l_value_out\"")
  fi
  unset A_out; declare -A A_out
  while read -r l_out; do
   if [ -n "$l_out" ]; then
    if [[ $l_out =~ ^\s*# ]]; then
     l_file="${l_out//# /}"
    else
     l_kpar="$(awk -F= '{print $1}' <<< "$l_out" | xargs)"
     [ "$l_kpar" = "$l_parameter_name" ] && A_out+=(["$l_kpar"]="$l_file")
    fi
   fi
  done < <("$l_systemdsysctl" --cat-config | grep -Po '^\h*([^#\n\r]+|#\h*\/[^#\n\r]+\.conf\b)')
  if [ -n "$l_ufwscf" ]; then
   l_kpar="$(grep -Po "\h*$l_parameter_name\b" "$l_ufwscf" | xargs)"
   l_kpar="${l_kpar/\/\///.}"
   [ "$l_kpar" = "$l_parameter_name" ] && A_out+=(["$l_kpar"]="$l_ufwscf")
  fi
  if (( ${#A_out[@]} > 0 )); then
   while IFS="=" read -r l_fkpname l_file_parameter_value; do
    l_fkpname="${l_fkpname// /}"
    l_file_parameter_value="${l_file_parameter_value// /}"
    if grep -Pq -- "\b$l_parameter_value\b" <<< "$l_file_parameter_value"; then
     l_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\"")
    else
     l_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\" and should have a value of: \"$l_value_out\"")
    fi
   done < <(grep -Po -- "\h*$l_parameter_name\h*=\h*\H+" "${A_out[$l_fkpname]}")
  else
   l_output2+=(" - \"$l_parameter_name\" is not set in an included file ** Note: \"$l_parameter_name\" May be set in a file that's ignored by load procedure **")
  fi
 }

 l_systemdsysctl="$(readlink -f /lib/systemd/systemd-sysctl)"
 while IFS="=" read -r l_parameter_name l_parameter_value; do
  l_parameter_name="${l_parameter_name// /}"
  l_parameter_value="${l_parameter_value// /}"
  l_value_out="${l_parameter_value//-/ through }"
  l_value_out="${l_value_out//|/ or }"
  if grep -q '^net\.ipv6\.' <<< "$l_parameter_name"; then
   [ -z "$l_ipv6_disabled" ] && f_ipv6_chk
   if [ "$l_ipv6_disabled" = "yes" ]; then
    l_output+=(" - IPv6 is disabled on the system, \"$l_parameter_name\" is not applicable")
   else
    f_kernel_parameter_chk
   fi
  else
   f_kernel_parameter_chk
  fi
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ "${#l_output2[@]}" -le 0 ]; then
  echo "Network / Configure Network Kernel Parameters" >> p1
  echo "Ensure IP forwarding is disabled" >> p2
  echo "IP forwarding is disabled" >> p3
  echo "Yes" >> p4
  echo "3.3.1" >> p12
 else
  echo "Network / Configure Network Kernel Parameters" >> p1
  echo "Ensure IP forwarding is disabled" >> p2
  echo "${l_output2[*]}" >> p3
  echo "No" >> p4
  echo "3.3.1" >> p12
 fi
}


###########################################################################################################################

#3.3.2
#Ensure packet redirect sending is disabled (Automated)
{
 l_output=(); l_output2=(); l_ipv6_disabled=""
 a_parlist=("net.ipv4.conf.all.send_redirects=0" "net.ipv4.conf.default.send_redirects=0")
 l_ufwscf="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"

 f_ipv6_chk()
 {
  l_ipv6_disabled="no"
  ! grep -Pqs -- '^\h*0\b' /sys/module/ipv6/parameters/disable && l_ipv6_disabled="yes"
  if sysctl net.ipv6.conf.all.disable_ipv6 | grep -Pqs -- "\h*net\.ipv6\.conf\.all\.disable_ipv6\h*=\h*1\b" && \
     sysctl net.ipv6.conf.default.disable_ipv6 | grep -Pqs -- "\h*net\.ipv6\.conf\.default\.disable_ipv6\h*=\h*1\b"; then
   l_ipv6_disabled="yes"
  fi
 }

 f_kernel_parameter_chk()
 {
  l_running_parameter_value="$(sysctl "$l_parameter_name" | awk -F= '{print $2}' | xargs)"
  if grep -Pq -- "\b$l_parameter_value\b" <<< "$l_running_parameter_value"; then
   l_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_running_parameter_value\" in the running configuration")
  else
   l_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_running_parameter_value\" in the running configuration and should have a value of: \"$l_value_out\"")
  fi
  unset A_out; declare -A A_out
  while read -r l_out; do
   if [ -n "$l_out" ]; then
    if [[ $l_out =~ ^\s*# ]]; then
     l_file="${l_out//# /}"
    else
     l_kpar="$(awk -F= '{print $1}' <<< "$l_out" | xargs)"
     [ "$l_kpar" = "$l_parameter_name" ] && A_out+=(["$l_kpar"]="$l_file")
    fi
   fi
  done < <("$l_systemdsysctl" --cat-config | grep -Po '^\h*([^#\n\r]+|#\h*\/[^#\n\r]+\.conf\b)')
  if [ -n "$l_ufwscf" ]; then
   l_kpar="$(grep -Po "\h*$l_parameter_name\b" "$l_ufwscf" | xargs)"
   l_kpar="${l_kpar/\/\///.}"
   [ "$l_kpar" = "$l_parameter_name" ] && A_out+=(["$l_kpar"]="$l_ufwscf")
  fi
  if (( ${#A_out[@]} > 0 )); then
   while IFS="=" read -r l_fkpname l_file_parameter_value; do
    l_fkpname="${l_fkpname// /}"
    l_file_parameter_value="${l_file_parameter_value// /}"
    if grep -Pq -- "\b$l_parameter_value\b" <<< "$l_file_parameter_value"; then
     l_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\"")
    else
     l_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\" and should have a value of: \"$l_value_out\"")
    fi
   done < <(grep -Po -- "\h*$l_parameter_name\h*=\h*\H+" "${A_out[$l_fkpname]}")
  else
   l_output2+=(" - \"$l_parameter_name\" is not set in an included file ** Note: \"$l_parameter_name\" May be set in a file that's ignored by load procedure **")
  fi
 }

 l_systemdsysctl="$(readlink -f /lib/systemd/systemd-sysctl)"
 while IFS="=" read -r l_parameter_name l_parameter_value; do
  l_parameter_name="${l_parameter_name// /}"
  l_parameter_value="${l_parameter_value// /}"
  l_value_out="${l_parameter_value//-/ through }"
  l_value_out="${l_value_out//|/ or }"
  if grep -q '^net\.ipv6\.' <<< "$l_parameter_name"; then
   [ -z "$l_ipv6_disabled" ] && f_ipv6_chk
   if [ "$l_ipv6_disabled" = "yes" ]; then
    l_output+=(" - IPv6 is disabled on the system, \"$l_parameter_name\" is not applicable")
   else
    f_kernel_parameter_chk
   fi
  else
   f_kernel_parameter_chk
  fi
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ "${#l_output2[@]}" -le 0 ]; then
  echo "Network / Configure Network Kernel Parameters" >> p1
  echo "Ensure packet redirect sending is disabled" >> p2
  echo "Packet redirect sending is disabled" >> p3
  echo "Yes" >> p4
  echo "3.3.2" >> p12
 else
  echo "Network / Configure Network Kernel Parameters" >> p1
  echo "Ensure packet redirect sending is disabled" >> p2
  echo "${l_output2[*]}" >> p3
  echo "No" >> p4
  echo "3.3.2" >> p12
 fi
}

###########################################################################################################################

#3.3.3
#Ensure bogus icmp responses are ignored (Automated)
{
 l_output=(); l_output2=(); l_ipv6_disabled=""
 a_parlist=("net.ipv4.icmp_ignore_bogus_error_responses=1")
 l_ufwscf="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"

 f_ipv6_chk()
 {
  l_ipv6_disabled="no"
  ! grep -Pqs -- '^\h*0\b' /sys/module/ipv6/parameters/disable && l_ipv6_disabled="yes"
  if sysctl net.ipv6.conf.all.disable_ipv6 | grep -Pqs -- "\h*net\.ipv6\.conf\.all\.disable_ipv6\h*=\h*1\b" && \
     sysctl net.ipv6.conf.default.disable_ipv6 | grep -Pqs -- "\h*net\.ipv6\.conf\.default\.disable_ipv6\h*=\h*1\b"; then
   l_ipv6_disabled="yes"
  fi
 }

 f_kernel_parameter_chk()
 {
  l_running_parameter_value="$(sysctl "$l_parameter_name" | awk -F= '{print $2}' | xargs)"
  if grep -Pq -- "\b$l_parameter_value\b" <<< "$l_running_parameter_value"; then
   l_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_running_parameter_value\" in the running configuration")
  else
   l_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_running_parameter_value\" in the running configuration and should have a value of: \"$l_value_out\"")
  fi
  unset A_out; declare -A A_out
  while read -r l_out; do
   if [ -n "$l_out" ]; then
    if [[ $l_out =~ ^\s*# ]]; then
     l_file="${l_out//# /}"
    else
     l_kpar="$(awk -F= '{print $1}' <<< "$l_out" | xargs)"
     [ "$l_kpar" = "$l_parameter_name" ] && A_out+=(["$l_kpar"]="$l_file")
    fi
   fi
  done < <("$l_systemdsysctl" --cat-config | grep -Po '^\h*([^#\n\r]+|#\h*\/[^#\n\r]+\.conf\b)')
  if [ -n "$l_ufwscf" ]; then
   l_kpar="$(grep -Po "\h*$l_parameter_name\b" "$l_ufwscf" | xargs)"
   l_kpar="${l_kpar/\/\///.}"
   [ "$l_kpar" = "$l_parameter_name" ] && A_out+=(["$l_kpar"]="$l_ufwscf")
  fi
  if (( ${#A_out[@]} > 0 )); then
   while IFS="=" read -r l_fkpname l_file_parameter_value; do
    l_fkpname="${l_fkpname// /}"
    l_file_parameter_value="${l_file_parameter_value// /}"
    if grep -Pq -- "\b$l_parameter_value\b" <<< "$l_file_parameter_value"; then
     l_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\"")
    else
     l_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\" and should have a value of: \"$l_value_out\"")
    fi
   done < <(grep -Po -- "\h*$l_parameter_name\h*=\h*\H+" "${A_out[$l_fkpname]}")
  else
   l_output2+=(" - \"$l_parameter_name\" is not set in an included file ** Note: \"$l_parameter_name\" May be set in a file that's ignored by load procedure **")
  fi
 }

 l_systemdsysctl="$(readlink -f /lib/systemd/systemd-sysctl)"
 while IFS="=" read -r l_parameter_name l_parameter_value; do
  l_parameter_name="${l_parameter_name// /}"
  l_parameter_value="${l_parameter_value// /}"
  l_value_out="${l_parameter_value//-/ through }"
  l_value_out="${l_value_out//|/ or }"
  if grep -q '^net\.ipv6\.' <<< "$l_parameter_name"; then
   [ -z "$l_ipv6_disabled" ] && f_ipv6_chk
   if [ "$l_ipv6_disabled" = "yes" ]; then
    l_output+=(" - IPv6 is disabled on the system, \"$l_parameter_name\" is not applicable")
   else
    f_kernel_parameter_chk
   fi
  else
   f_kernel_parameter_chk
  fi
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ "${#l_output2[@]}" -le 0 ]; then
  echo "Network / Configure Network Kernel Parameters" >> p1
  echo "Ensure bogus ICMP responses are ignored" >> p2
  echo "Bogus ICMP responses are ignored" >> p3
  echo "Yes" >> p4
  echo "3.3.3" >> p12
 else
  echo "Network / Configure Network Kernel Parameters" >> p1
  echo "Ensure bogus ICMP responses are ignored" >> p2
  echo "${l_output2[*]}" >> p3
  echo "No" >> p4
  echo "3.3.3" >> p12
 fi
}

###########################################################################################################################

#3.3.4
#Ensure broadcast icmp requests are ignored (Automated)
{
 l_output=(); l_output2=(); l_ipv6_disabled=""
 a_parlist=("net.ipv4.icmp_echo_ignore_broadcasts=1")
 l_ufwscf="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"

 f_ipv6_chk()
 {
  l_ipv6_disabled="no"
  ! grep -Pqs -- '^\h*0\b' /sys/module/ipv6/parameters/disable && l_ipv6_disabled="yes"
  if sysctl net.ipv6.conf.all.disable_ipv6 | grep -Pqs -- "\h*net\.ipv6\.conf\.all\.disable_ipv6\h*=\h*1\b" && \
     sysctl net.ipv6.conf.default.disable_ipv6 | grep -Pqs -- "\h*net\.ipv6\.conf\.default\.disable_ipv6\h*=\h*1\b"; then
   l_ipv6_disabled="yes"
  fi
 }

 f_kernel_parameter_chk()
 {
  l_running_parameter_value="$(sysctl "$l_parameter_name" | awk -F= '{print $2}' | xargs)"
  if grep -Pq -- "\b$l_parameter_value\b" <<< "$l_running_parameter_value"; then
   l_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_running_parameter_value\" in the running configuration")
  else
   l_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_running_parameter_value\" in the running configuration and should have a value of: \"$l_value_out\"")
  fi
  unset A_out; declare -A A_out
  while read -r l_out; do
   if [ -n "$l_out" ]; then
    if [[ $l_out =~ ^\s*# ]]; then
     l_file="${l_out//# /}"
    else
     l_kpar="$(awk -F= '{print $1}' <<< "$l_out" | xargs)"
     [ "$l_kpar" = "$l_parameter_name" ] && A_out+=(["$l_kpar"]="$l_file")
    fi
   fi
  done < <("$l_systemdsysctl" --cat-config | grep -Po '^\h*([^#\n\r]+|#\h*\/[^#\n\r]+\.conf\b)')
  if [ -n "$l_ufwscf" ]; then
   l_kpar="$(grep -Po "\h*$l_parameter_name\b" "$l_ufwscf" | xargs)"
   l_kpar="${l_kpar/\/\///.}"
   [ "$l_kpar" = "$l_parameter_name" ] && A_out+=(["$l_kpar"]="$l_ufwscf")
  fi
  if (( ${#A_out[@]} > 0 )); then
   while IFS="=" read -r l_fkpname l_file_parameter_value; do
    l_fkpname="${l_fkpname// /}"
    l_file_parameter_value="${l_file_parameter_value// /}"
    if grep -Pq -- "\b$l_parameter_value\b" <<< "$l_file_parameter_value"; then
     l_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\"")
    else
     l_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\" and should have a value of: \"$l_value_out\"")
    fi
   done < <(grep -Po -- "\h*$l_parameter_name\h*=\h*\H+" "${A_out[$l_fkpname]}")
  else
   l_output2+=(" - \"$l_parameter_name\" is not set in an included file ** Note: \"$l_parameter_name\" May be set in a file that's ignored by load procedure **")
  fi
 }

 l_systemdsysctl="$(readlink -f /lib/systemd/systemd-sysctl)"
 while IFS="=" read -r l_parameter_name l_parameter_value; do
  l_parameter_name="${l_parameter_name// /}"
  l_parameter_value="${l_parameter_value// /}"
  l_value_out="${l_parameter_value//-/ through }"
  l_value_out="${l_value_out//|/ or }"
  if grep -q '^net\.ipv6\.' <<< "$l_parameter_name"; then
   [ -z "$l_ipv6_disabled" ] && f_ipv6_chk
   if [ "$l_ipv6_disabled" = "yes" ]; then
    l_output+=(" - IPv6 is disabled on the system, \"$l_parameter_name\" is not applicable")
   else
    f_kernel_parameter_chk
   fi
  else
   f_kernel_parameter_chk
  fi
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ "${#l_output2[@]}" -le 0 ]; then
  echo "Network / Configure Network Kernel Parameters" >> p1
  echo "Ensure broadcast ICMP requests are ignored" >> p2
  echo "Broadcast ICMP requests are ignored" >> p3
  echo "Yes" >> p4
  echo "3.3.4" >> p12
 else
  echo "Network / Configure Network Kernel Parameters" >> p1
  echo "Ensure broadcast ICMP requests are ignored" >> p2
  echo "${l_output2[*]}" >> p3
  echo "No" >> p4
  echo "3.3.4" >> p12
 fi
}

###########################################################################################################################

#3.3.5
#Ensure icmp redirects are not accepted (Automated)
{
 l_output=(); l_output2=(); l_ipv6_disabled=""
 a_parlist=("net.ipv4.conf.all.accept_redirects=0"
            "net.ipv4.conf.default.accept_redirects=0"
            "net.ipv6.conf.all.accept_redirects=0"
            "net.ipv6.conf.default.accept_redirects=0")
 l_ufwscf="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"

 f_ipv6_chk()
 {
  l_ipv6_disabled="no"
  ! grep -Pqs -- '^\h*0\b' /sys/module/ipv6/parameters/disable && l_ipv6_disabled="yes"
  if sysctl net.ipv6.conf.all.disable_ipv6 | grep -Pqs -- "\h*net\.ipv6\.conf\.all\.disable_ipv6\h*=\h*1\b" && \
     sysctl net.ipv6.conf.default.disable_ipv6 | grep -Pqs -- "\h*net\.ipv6\.conf\.default\.disable_ipv6\h*=\h*1\b"; then
   l_ipv6_disabled="yes"
  fi
 }

 f_kernel_parameter_chk()
 {
  l_running_parameter_value="$(sysctl "$l_parameter_name" | awk -F= '{print $2}' | xargs)"
  if grep -Pq -- "\b$l_parameter_value\b" <<< "$l_running_parameter_value"; then
   l_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_running_parameter_value\" in the running configuration")
  else
   l_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_running_parameter_value\" in the running configuration and should have a value of: \"$l_value_out\"")
  fi
  unset A_out; declare -A A_out
  while read -r l_out; do
   if [ -n "$l_out" ]; then
    if [[ $l_out =~ ^\s*# ]]; then
     l_file="${l_out//# /}"
    else
     l_kpar="$(awk -F= '{print $1}' <<< "$l_out" | xargs)"
     [ "$l_kpar" = "$l_parameter_name" ] && A_out+=(["$l_kpar"]="$l_file")
    fi
   fi
  done < <("$l_systemdsysctl" --cat-config | grep -Po '^\h*([^#\n\r]+|#\h*\/[^#\n\r]+\.conf\b)')
  if [ -n "$l_ufwscf" ]; then
   l_kpar="$(grep -Po "\h*$l_parameter_name\b" "$l_ufwscf" | xargs)"
   l_kpar="${l_kpar/\/\///.}"
   [ "$l_kpar" = "$l_parameter_name" ] && A_out+=(["$l_kpar"]="$l_ufwscf")
  fi
  if (( ${#A_out[@]} > 0 )); then
   while IFS="=" read -r l_fkpname l_file_parameter_value; do
    l_fkpname="${l_fkpname// /}"
    l_file_parameter_value="${l_file_parameter_value// /}"
    if grep -Pq -- "\b$l_parameter_value\b" <<< "$l_file_parameter_value"; then
     l_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\"")
    else
     l_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\" and should have a value of: \"$l_value_out\"")
    fi
   done < <(grep -Po -- "\h*$l_parameter_name\h*=\h*\H+" "${A_out[$l_fkpname]}")
  else
   l_output2+=(" - \"$l_parameter_name\" is not set in an included file ** Note: \"$l_parameter_name\" May be set in a file that's ignored by load procedure **")
  fi
 }

 l_systemdsysctl="$(readlink -f /lib/systemd/systemd-sysctl)"
 while IFS="=" read -r l_parameter_name l_parameter_value; do
  l_parameter_name="${l_parameter_name// /}"
  l_parameter_value="${l_parameter_value// /}"
  l_value_out="${l_parameter_value//-/ through }"
  l_value_out="${l_value_out//|/ or }"
  if grep -q '^net\.ipv6\.' <<< "$l_parameter_name"; then
   [ -z "$l_ipv6_disabled" ] && f_ipv6_chk
   if [ "$l_ipv6_disabled" = "yes" ]; then
    l_output+=(" - IPv6 is disabled on the system, \"$l_parameter_name\" is not applicable")
   else
    f_kernel_parameter_chk
   fi
  else
   f_kernel_parameter_chk
  fi
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ "${#l_output2[@]}" -le 0 ]; then
  echo "Network / Configure Network Kernel Parameters" >> p1
  echo "Ensure ICMP redirects are not accepted" >> p2
  echo "ICMP redirects are not accepted correctly" >> p3
  echo "Yes" >> p4
  echo "3.3.5" >> p12
 else
  echo "Network / Configure Network Kernel Parameters" >> p1
  echo "Ensure ICMP redirects are not accepted" >> p2
  echo "${l_output2[*]}" >> p3
  echo "No" >> p4
  echo "3.3.5" >> p12
 fi
}

###########################################################################################################################

#3.3.6
#Ensure secure icmp redirects are not accepted (Automated)
{
 l_output=(); l_output2=(); l_ipv6_disabled=""
 a_parlist=("net.ipv4.conf.all.secure_redirects=0"
            "net.ipv4.conf.default.secure_redirects=0")
 l_ufwscf="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"

 f_ipv6_chk()
 {
  l_ipv6_disabled="no"
  ! grep -Pqs -- '^\h*0\b' /sys/module/ipv6/parameters/disable && l_ipv6_disabled="yes"
  if sysctl net.ipv6.conf.all.disable_ipv6 | grep -Pqs -- "\h*net\.ipv6\.conf\.all\.disable_ipv6\h*=\h*1\b" && \
     sysctl net.ipv6.conf.default.disable_ipv6 | grep -Pqs -- "\h*net\.ipv6\.conf\.default\.disable_ipv6\h*=\h*1\b"; then
   l_ipv6_disabled="yes"
  fi
 }

 f_kernel_parameter_chk()
 {
  l_running_parameter_value="$(sysctl "$l_parameter_name" | awk -F= '{print $2}' | xargs)"
  if grep -Pq -- "\b$l_parameter_value\b" <<< "$l_running_parameter_value"; then
   l_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_running_parameter_value\" in the running configuration")
  else
   l_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_running_parameter_value\" in the running configuration and should have a value of: \"$l_value_out\"")
  fi
  unset A_out; declare -A A_out
  while read -r l_out; do
   if [ -n "$l_out" ]; then
    if [[ $l_out =~ ^\s*# ]]; then
     l_file="${l_out//# /}"
    else
     l_kpar="$(awk -F= '{print $1}' <<< "$l_out" | xargs)"
     [ "$l_kpar" = "$l_parameter_name" ] && A_out+=(["$l_kpar"]="$l_file")
    fi
   fi
  done < <("$l_systemdsysctl" --cat-config | grep -Po '^\h*([^#\n\r]+|#\h*\/[^#\n\r]+\.conf\b)')
  if [ -n "$l_ufwscf" ]; then
   l_kpar="$(grep -Po "\h*$l_parameter_name\b" "$l_ufwscf" | xargs)"
   l_kpar="${l_kpar/\/\///.}"
   [ "$l_kpar" = "$l_parameter_name" ] && A_out+=(["$l_kpar"]="$l_ufwscf")
  fi
  if (( ${#A_out[@]} > 0 )); then
   while IFS="=" read -r l_fkpname l_file_parameter_value; do
    l_fkpname="${l_fkpname// /}"
    l_file_parameter_value="${l_file_parameter_value// /}"
    if grep -Pq -- "\b$l_parameter_value\b" <<< "$l_file_parameter_value"; then
     l_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\"")
    else
     l_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\" and should have a value of: \"$l_value_out\"")
    fi
   done < <(grep -Po -- "\h*$l_parameter_name\h*=\h*\H+" "${A_out[$l_fkpname]}")
  else
   l_output2+=(" - \"$l_parameter_name\" is not set in an included file ** Note: \"$l_parameter_name\" May be set in a file that's ignored by load procedure **")
  fi
 }

 l_systemdsysctl="$(readlink -f /lib/systemd/systemd-sysctl)"
 while IFS="=" read -r l_parameter_name l_parameter_value; do
  l_parameter_name="${l_parameter_name// /}"
  l_parameter_value="${l_parameter_value// /}"
  l_value_out="${l_parameter_value//-/ through }"
  l_value_out="${l_value_out//|/ or }"
  if grep -q '^net\.ipv6\.' <<< "$l_parameter_name"; then
   [ -z "$l_ipv6_disabled" ] && f_ipv6_chk
   if [ "$l_ipv6_disabled" = "yes" ]; then
    l_output+=(" - IPv6 is disabled on the system, \"$l_parameter_name\" is not applicable")
   else
    f_kernel_parameter_chk
   fi
  else
   f_kernel_parameter_chk
  fi
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ "${#l_output2[@]}" -le 0 ]; then
  echo "Network / Configure Network Kernel Parameters" >> p1
  echo "Ensure secure ICMP redirects are not accepted" >> p2
  echo "Secure ICMP redirects are not accepted correctly" >> p3
  echo "Yes" >> p4
  echo "3.3.6" >> p12
 else
  echo "Network / Configure Network Kernel Parameters" >> p1
  echo "Ensure secure ICMP redirects are not accepted" >> p2
  echo "${l_output2[*]}" >> p3
  echo "No" >> p4
  echo "3.3.6" >> p12
 fi
}

###########################################################################################################################

#3.3.7
#Ensure reverse path filtering is enabled (Automated)
{
 l_output=(); l_output2=(); l_ipv6_disabled=""
 a_parlist=("net.ipv4.conf.all.rp_filter=1"
            "net.ipv4.conf.default.rp_filter=1")
 l_ufwscf="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"

 f_ipv6_chk()
 {
  l_ipv6_disabled="no"
  ! grep -Pqs -- '^\h*0\b' /sys/module/ipv6/parameters/disable && l_ipv6_disabled="yes"
  if sysctl net.ipv6.conf.all.disable_ipv6 | grep -Pqs -- "\h*net\.ipv6\.conf\.all\.disable_ipv6\h*=\h*1\b" && \
     sysctl net.ipv6.conf.default.disable_ipv6 | grep -Pqs -- "\h*net\.ipv6\.conf\.default\.disable_ipv6\h*=\h*1\b"; then
   l_ipv6_disabled="yes"
  fi
 }

 f_kernel_parameter_chk()
 {
  l_running_parameter_value="$(sysctl "$l_parameter_name" | awk -F= '{print $2}' | xargs)"
  if grep -Pq -- "\b$l_parameter_value\b" <<< "$l_running_parameter_value"; then
   l_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_running_parameter_value\" in the running configuration")
  else
   l_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_running_parameter_value\" in the running configuration and should have a value of: \"$l_value_out\"")
  fi
  unset A_out; declare -A A_out
  while read -r l_out; do
   if [ -n "$l_out" ]; then
    if [[ $l_out =~ ^\s*# ]]; then
     l_file="${l_out//# /}"
    else
     l_kpar="$(awk -F= '{print $1}' <<< "$l_out" | xargs)"
     [ "$l_kpar" = "$l_parameter_name" ] && A_out+=(["$l_kpar"]="$l_file")
    fi
   fi
  done < <("$l_systemdsysctl" --cat-config | grep -Po '^\h*([^#\n\r]+|#\h*\/[^#\n\r]+\.conf\b)')
  if [ -n "$l_ufwscf" ]; then
   l_kpar="$(grep -Po "\h*$l_parameter_name\b" "$l_ufwscf" | xargs)"
   l_kpar="${l_kpar/\/\///.}"
   [ "$l_kpar" = "$l_parameter_name" ] && A_out+=(["$l_kpar"]="$l_ufwscf")
  fi
  if (( ${#A_out[@]} > 0 )); then
   while IFS="=" read -r l_fkpname l_file_parameter_value; do
    l_fkpname="${l_fkpname// /}"
    l_file_parameter_value="${l_file_parameter_value// /}"
    if grep -Pq -- "\b$l_parameter_value\b" <<< "$l_file_parameter_value"; then
     l_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\"")
    else
     l_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\" and should have a value of: \"$l_value_out\"")
    fi
   done < <(grep -Po -- "\h*$l_parameter_name\h*=\h*\H+" "${A_out[$l_fkpname]}")
  else
   l_output2+=(" - \"$l_parameter_name\" is not set in an included file ** Note: \"$l_parameter_name\" May be set in a file that's ignored by load procedure **")
  fi
 }

 l_systemdsysctl="$(readlink -f /lib/systemd/systemd-sysctl)"
 while IFS="=" read -r l_parameter_name l_parameter_value; do
  l_parameter_name="${l_parameter_name// /}"
  l_parameter_value="${l_parameter_value// /}"
  l_value_out="${l_parameter_value//-/ through }"
  l_value_out="${l_value_out//|/ or }"
  if grep -q '^net\.ipv6\.' <<< "$l_parameter_name"; then
   [ -z "$l_ipv6_disabled" ] && f_ipv6_chk
   if [ "$l_ipv6_disabled" = "yes" ]; then
    l_output+=(" - IPv6 is disabled on the system, \"$l_parameter_name\" is not applicable")
   else
    f_kernel_parameter_chk
   fi
  else
   f_kernel_parameter_chk
  fi
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ "${#l_output2[@]}" -le 0 ]; then
  echo "Network / Configure Network Kernel Parameters" >> p1
  echo "Ensure reverse path filtering is enabled" >> p2
  echo "Reverse path filtering is enabled correctly" >> p3
  echo "Yes" >> p4
  echo "3.3.7" >> p12
 else
  echo "Network / Configure Network Kernel Parameters" >> p1
  echo "Ensure reverse path filtering is enabled" >> p2
  echo "${l_output2[*]}" >> p3
  echo "No" >> p4
  echo "3.3.7" >> p12
 fi
}

###########################################################################################################################
#3.3.8
#Ensure source routed packets are not accepted (Automated)
{
 l_output=(); l_output2=(); l_ipv6_disabled=""
 a_parlist=("net.ipv4.conf.all.accept_source_route=0"
            "net.ipv4.conf.default.accept_source_route=0"
            "net.ipv6.conf.all.accept_source_route=0"
            "net.ipv6.conf.default.accept_source_route=0")
 l_ufwscf="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"

 f_ipv6_chk()
 {
  l_ipv6_disabled="no"
  ! grep -Pqs -- '^\h*0\b' /sys/module/ipv6/parameters/disable && l_ipv6_disabled="yes"
  if sysctl net.ipv6.conf.all.disable_ipv6 | grep -Pqs -- "\h*net\.ipv6\.conf\.all\.disable_ipv6\h*=\h*1\b" && \
     sysctl net.ipv6.conf.default.disable_ipv6 | grep -Pqs -- "\h*net\.ipv6\.conf\.default\.disable_ipv6\h*=\h*1\b"; then
   l_ipv6_disabled="yes"
  fi
 }

 f_kernel_parameter_chk()
 {
  l_running_parameter_value="$(sysctl "$l_parameter_name" | awk -F= '{print $2}' | xargs)"
  if grep -Pq -- "\b$l_parameter_value\b" <<< "$l_running_parameter_value"; then
   l_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_running_parameter_value\" in the running configuration")
  else
   l_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_running_parameter_value\" in the running configuration and should have a value of: \"$l_value_out\"")
  fi
  unset A_out; declare -A A_out
  while read -r l_out; do
   if [ -n "$l_out" ]; then
    if [[ $l_out =~ ^\s*# ]]; then
     l_file="${l_out//# /}"
    else
     l_kpar="$(awk -F= '{print $1}' <<< "$l_out" | xargs)"
     [ "$l_kpar" = "$l_parameter_name" ] && A_out+=(["$l_kpar"]="$l_file")
    fi
   fi
  done < <("$l_systemdsysctl" --cat-config | grep -Po '^\h*([^#\n\r]+|#\h*\/[^#\n\r]+\.conf\b)')
  if [ -n "$l_ufwscf" ]; then
   l_kpar="$(grep -Po "\h*$l_parameter_name\b" "$l_ufwscf" | xargs)"
   l_kpar="${l_kpar/\/\///.}"
   [ "$l_kpar" = "$l_parameter_name" ] && A_out+=(["$l_kpar"]="$l_ufwscf")
  fi
  if (( ${#A_out[@]} > 0 )); then
   while IFS="=" read -r l_fkpname l_file_parameter_value; do
    l_fkpname="${l_fkpname// /}"
    l_file_parameter_value="${l_file_parameter_value// /}"
    if grep -Pq -- "\b$l_parameter_value\b" <<< "$l_file_parameter_value"; then
     l_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\"")
    else
     l_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\" and should have a value of: \"$l_value_out\"")
    fi
   done < <(grep -Po -- "\h*$l_parameter_name\h*=\h*\H+" "${A_out[$l_fkpname]}")
  else
   l_output2+=(" - \"$l_parameter_name\" is not set in an included file ** Note: \"$l_parameter_name\" May be set in a file that's ignored by load procedure **")
  fi
 }

 l_systemdsysctl="$(readlink -f /lib/systemd/systemd-sysctl)"
 while IFS="=" read -r l_parameter_name l_parameter_value; do
  l_parameter_name="${l_parameter_name// /}"
  l_parameter_value="${l_parameter_value// /}"
  l_value_out="${l_parameter_value//-/ through }"
  l_value_out="${l_value_out//|/ or }"
  if grep -q '^net\.ipv6\.' <<< "$l_parameter_name"; then
   [ -z "$l_ipv6_disabled" ] && f_ipv6_chk
   if [ "$l_ipv6_disabled" = "yes" ]; then
    l_output+=(" - IPv6 is disabled on the system, \"$l_parameter_name\" is not applicable")
   else
    f_kernel_parameter_chk
   fi
  else
   f_kernel_parameter_chk
  fi
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ "${#l_output2[@]}" -le 0 ]; then
  echo "Network / Configure Network Kernel Parameters" >> p1
  echo "Ensure source routed packets are not accepted" >> p2
  echo "Source routed packets are not accepted" >> p3
  echo "Yes" >> p4
  echo "3.3.8" >> p12
 else
  echo "Network / Configure Network Kernel Parameters" >> p1
  echo "Ensure source routed packets are not accepted" >> p2
  echo "${l_output2[*]}" >> p3
  echo "No" >> p4
  echo "3.3.8" >> p12
 fi
}

###########################################################################################################################

#3.3.9
#Ensure suspicious packets are logged.
{
 l_output=(); l_output2=(); l_ipv6_disabled=""
 a_parlist=("net.ipv4.conf.all.log_martians=1"
            "net.ipv4.conf.default.log_martians=1")
 l_ufwscf="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"

 f_ipv6_chk()
 {
  l_ipv6_disabled="no"
  ! grep -Pqs -- '^\h*0\b' /sys/module/ipv6/parameters/disable && l_ipv6_disabled="yes"
  if sysctl net.ipv6.conf.all.disable_ipv6 | grep -Pqs -- "\h*net\.ipv6\.conf\.all\.disable_ipv6\h*=\h*1\b" && \
     sysctl net.ipv6.conf.default.disable_ipv6 | grep -Pqs -- "\h*net\.ipv6\.conf\.default\.disable_ipv6\h*=\h*1\b"; then
   l_ipv6_disabled="yes"
  fi
 }

 f_kernel_parameter_chk()
 {
  l_running_parameter_value="$(sysctl "$l_parameter_name" | awk -F= '{print $2}' | xargs)"
  if grep -Pq -- "\b$l_parameter_value\b" <<< "$l_running_parameter_value"; then
   l_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_running_parameter_value\" in the running configuration")
  else
   l_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_running_parameter_value\" in the running configuration and should have a value of: \"$l_value_out\"")
  fi
  unset A_out; declare -A A_out
  while read -r l_out; do
   if [ -n "$l_out" ]; then
    if [[ $l_out =~ ^\s*# ]]; then
     l_file="${l_out//# /}"
    else
     l_kpar="$(awk -F= '{print $1}' <<< "$l_out" | xargs)"
     [ "$l_kpar" = "$l_parameter_name" ] && A_out+=(["$l_kpar"]="$l_file")
    fi
   fi
  done < <("$l_systemdsysctl" --cat-config | grep -Po '^\h*([^#\n\r]+|#\h*\/[^#\n\r]+\.conf\b)')
  if [ -n "$l_ufwscf" ]; then
   l_kpar="$(grep -Po "\h*$l_parameter_name\b" "$l_ufwscf" | xargs)"
   l_kpar="${l_kpar/\/\///.}"
   [ "$l_kpar" = "$l_parameter_name" ] && A_out+=(["$l_kpar"]="$l_ufwscf")
  fi
  if (( ${#A_out[@]} > 0 )); then
   while IFS="=" read -r l_fkpname l_file_parameter_value; do
    l_fkpname="${l_fkpname// /}"
    l_file_parameter_value="${l_file_parameter_value// /}"
    if grep -Pq -- "\b$l_parameter_value\b" <<< "$l_file_parameter_value"; then
     l_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\"")
    else
     l_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\" and should have a value of: \"$l_value_out\"")
    fi
   done < <(grep -Po -- "\h*$l_parameter_name\h*=\h*\H+" "${A_out[$l_fkpname]}")
  else
   l_output2+=(" - \"$l_parameter_name\" is not set in an included file ** Note: \"$l_parameter_name\" May be set in a file that's ignored by load procedure **")
  fi
 }

 l_systemdsysctl="$(readlink -f /lib/systemd/systemd-sysctl)"
 while IFS="=" read -r l_parameter_name l_parameter_value; do
  l_parameter_name="${l_parameter_name// /}"
  l_parameter_value="${l_parameter_value// /}"
  l_value_out="${l_parameter_value//-/ through }"
  l_value_out="${l_value_out//|/ or }"
  if grep -q '^net\.ipv6\.' <<< "$l_parameter_name"; then
   [ -z "$l_ipv6_disabled" ] && f_ipv6_chk
   if [ "$l_ipv6_disabled" = "yes" ]; then
    l_output+=(" - IPv6 is disabled on the system, \"$l_parameter_name\" is not applicable")
   else
    f_kernel_parameter_chk
   fi
  else
   f_kernel_parameter_chk
  fi
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ "${#l_output2[@]}" -le 0 ]; then
  echo "Network / Configure Network Kernel Parameters" >> p1
  echo "Ensure suspicious packets are logged" >> p2
  echo "Suspicious packets are logged" >> p3
  echo "Yes" >> p4
  echo "3.3.9" >> p12
 else
  echo "Network / Configure Network Kernel Parameters" >> p1
  echo "Ensure suspicious packets are logged" >> p2
  echo "${l_output2[*]}" >> p3
  echo "No" >> p4
  echo "3.3.9" >> p12
 fi
}

###########################################################################################################################

#3.3.10
#Ensure TCP SYN Cookies is enabled.
{
 l_output=(); l_output2=(); l_ipv6_disabled=""
 a_parlist=("net.ipv4.tcp_syncookies=1")
 l_ufwscf="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"

 f_ipv6_chk()
 {
  l_ipv6_disabled="no"
  ! grep -Pqs -- '^\h*0\b' /sys/module/ipv6/parameters/disable && l_ipv6_disabled="yes"
  if sysctl net.ipv6.conf.all.disable_ipv6 | grep -Pqs -- "\h*net\.ipv6\.conf\.all\.disable_ipv6\h*=\h*1\b" && \
     sysctl net.ipv6.conf.default.disable_ipv6 | grep -Pqs -- "\h*net\.ipv6\.conf\.default\.disable_ipv6\h*=\h*1\b"; then
   l_ipv6_disabled="yes"
  fi
 }

 f_kernel_parameter_chk()
 {
  l_running_parameter_value="$(sysctl "$l_parameter_name" | awk -F= '{print $2}' | xargs)"
  if grep -Pq -- "\b$l_parameter_value\b" <<< "$l_running_parameter_value"; then
   l_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_running_parameter_value\" in the running configuration")
  else
   l_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_running_parameter_value\" in the running configuration and should have a value of: \"$l_value_out\"")
  fi
  unset A_out; declare -A A_out
  while read -r l_out; do
   if [ -n "$l_out" ]; then
    if [[ $l_out =~ ^\s*# ]]; then
     l_file="${l_out//# /}"
    else
     l_kpar="$(awk -F= '{print $1}' <<< "$l_out" | xargs)"
     [ "$l_kpar" = "$l_parameter_name" ] && A_out+=(["$l_kpar"]="$l_file")
    fi
   fi
  done < <("$l_systemdsysctl" --cat-config | grep -Po '^\h*([^#\n\r]+|#\h*\/[^#\n\r]+\.conf\b)')
  if [ -n "$l_ufwscf" ]; then
   l_kpar="$(grep -Po "\h*$l_parameter_name\b" "$l_ufwscf" | xargs)"
   l_kpar="${l_kpar/\/\///.}"
   [ "$l_kpar" = "$l_parameter_name" ] && A_out+=(["$l_kpar"]="$l_ufwscf")
  fi
  if (( ${#A_out[@]} > 0 )); then
   while IFS="=" read -r l_fkpname l_file_parameter_value; do
    l_fkpname="${l_fkpname// /}"
    l_file_parameter_value="${l_file_parameter_value// /}"
    if grep -Pq -- "\b$l_parameter_value\b" <<< "$l_file_parameter_value"; then
     l_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\"")
    else
     l_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\" and should have a value of: \"$l_value_out\"")
    fi
   done < <(grep -Po -- "\h*$l_parameter_name\h*=\h*\H+" "${A_out[$l_fkpname]}")
  else
   l_output2+=(" - \"$l_parameter_name\" is not set in an included file ** Note: \"$l_parameter_name\" May be set in a file that's ignored by load procedure **")
  fi
 }

 l_systemdsysctl="$(readlink -f /lib/systemd/systemd-sysctl)"
 while IFS="=" read -r l_parameter_name l_parameter_value; do
  l_parameter_name="${l_parameter_name// /}"
  l_parameter_value="${l_parameter_value// /}"
  l_value_out="${l_parameter_value//-/ through }"
  l_value_out="${l_value_out//|/ or }"
  if grep -q '^net\.ipv6\.' <<< "$l_parameter_name"; then
   [ -z "$l_ipv6_disabled" ] && f_ipv6_chk
   if [ "$l_ipv6_disabled" = "yes" ]; then
    l_output+=(" - IPv6 is disabled on the system, \"$l_parameter_name\" is not applicable")
   else
    f_kernel_parameter_chk
   fi
  else
   f_kernel_parameter_chk
  fi
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ "${#l_output2[@]}" -le 0 ]; then
  echo "Network / Configure Network Kernel Parameters" >> p1
  echo "Ensure TCP SYN Cookies is enabled" >> p2
  echo "TCP SYN cookies is enabled" >> p3
  echo "Yes" >> p4
  echo "3.3.10" >> p12
 else
  echo "Network / Configure Network Kernel Parameters" >> p1
  echo "Ensure TCP SYN Cookies is enabled" >> p2
  echo "${l_output2[*]}" >> p3
  echo "No" >> p4
  echo "3.3.10" >> p12
 fi
}

###########################################################################################################################
#3.3.11
#Ensure IPv6 router advertisements are not accepted.
{
 l_output=(); l_output2=(); l_ipv6_disabled=""
 a_parlist=("net.ipv6.conf.all.accept_ra=0"
            "net.ipv6.conf.default.accept_ra=0")
 l_ufwscf="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"

 f_ipv6_chk()
 {
  l_ipv6_disabled="no"
  ! grep -Pqs -- '^\h*0\b' /sys/module/ipv6/parameters/disable && l_ipv6_disabled="yes"
  if sysctl net.ipv6.conf.all.disable_ipv6 | grep -Pqs -- "\h*net\.ipv6\.conf\.all\.disable_ipv6\h*=\h*1\b" && \
     sysctl net.ipv6.conf.default.disable_ipv6 | grep -Pqs -- "\h*net\.ipv6\.conf\.default\.disable_ipv6\h*=\h*1\b"; then
   l_ipv6_disabled="yes"
  fi
 }

 f_kernel_parameter_chk()
 {
  l_running_parameter_value="$(sysctl "$l_parameter_name" | awk -F= '{print $2}' | xargs)"
  if grep -Pq -- "\b$l_parameter_value\b" <<< "$l_running_parameter_value"; then
   l_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_running_parameter_value\" in the running configuration")
  else
   l_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_running_parameter_value\" in the running configuration and should have a value of: \"$l_value_out\"")
  fi
  unset A_out; declare -A A_out
  while read -r l_out; do
   if [ -n "$l_out" ]; then
    if [[ $l_out =~ ^\s*# ]]; then
     l_file="${l_out//# /}"
    else
     l_kpar="$(awk -F= '{print $1}' <<< "$l_out" | xargs)"
     [ "$l_kpar" = "$l_parameter_name" ] && A_out+=(["$l_kpar"]="$l_file")
    fi
   fi
  done < <("$l_systemdsysctl" --cat-config | grep -Po '^\h*([^#\n\r]+|#\h*\/[^#\n\r]+\.conf\b)')
  if [ -n "$l_ufwscf" ]; then
   l_kpar="$(grep -Po "\h*$l_parameter_name\b" "$l_ufwscf" | xargs)"
   l_kpar="${l_kpar/\/\///.}"
   [ "$l_kpar" = "$l_parameter_name" ] && A_out+=(["$l_kpar"]="$l_ufwscf")
  fi
  if (( ${#A_out[@]} > 0 )); then
   while IFS="=" read -r l_fkpname l_file_parameter_value; do
    l_fkpname="${l_fkpname// /}"
    l_file_parameter_value="${l_file_parameter_value// /}"
    if grep -Pq -- "\b$l_parameter_value\b" <<< "$l_file_parameter_value"; then
     l_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\"")
    else
     l_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\" and should have a value of: \"$l_value_out\"")
    fi
   done < <(grep -Po -- "\h*$l_parameter_name\h*=\h*\H+" "${A_out[$l_fkpname]}")
  else
   l_output2+=(" - \"$l_parameter_name\" is not set in an included file ** Note: \"$l_parameter_name\" May be set in a file that's ignored by load procedure **")
  fi
 }

 l_systemdsysctl="$(readlink -f /lib/systemd/systemd-sysctl)"
 while IFS="=" read -r l_parameter_name l_parameter_value; do
  l_parameter_name="${l_parameter_name// /}"
  l_parameter_value="${l_parameter_value// /}"
  l_value_out="${l_parameter_value//-/ through }"
  l_value_out="${l_value_out//|/ or }"
  if grep -q '^net\.ipv6\.' <<< "$l_parameter_name"; then
   [ -z "$l_ipv6_disabled" ] && f_ipv6_chk
   if [ "$l_ipv6_disabled" = "yes" ]; then
    l_output+=(" - IPv6 is disabled on the system, \"$l_parameter_name\" is not applicable")
   else
    f_kernel_parameter_chk
   fi
  else
   f_kernel_parameter_chk
  fi
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ "${#l_output2[@]}" -le 0 ]; then
  echo "Network / Configure Network Kernel Parameters" >> p1
  echo "Ensure IPv6 router advertisements are not accepted" >> p2
  echo "IPv6 router advertisements are not accepted" >> p3
  echo "Yes" >> p4
  echo "3.3.11" >> p12
 else
  echo "Network / Configure Network Kernel Parameters" >> p1
  echo "Ensure IPv6 router advertisements are not accepted" >> p2
  echo "${l_output2[*]}" >> p3
  echo "No" >> p4
  echo "3.3.11" >> p12
 fi
}

##################################Host Based Firewall####################################################

#4.1.1
#Ensure nftables is installed (Automated)
if rpm -q nftables >/dev/null 2>&1; then
    echo "Host Based Firewall / Configure a firewall utility" >>p1
	echo "Ensure nftables is installed" >>p2
	echo "Nftables is installed" >>p3
	echo "Yes" >>p4
	echo "4.1.1" >>p12
else
    echo "Host Based Firewall / Configure a firewall utility" >>p1
	echo "Ensure nftables is installed" >>p2
	echo "Nftables is not installed" >>p3
	echo "No" >>p4
	echo "4.1.1" >>p12
fi

#########################################################################################################

#4.1.2
#Ensure a single firewall configuration utility is in use (Automated)
#!/usr/bin/env bash

{
 l_output="" l_output2="" l_fwd_status="" l_nft_status="" l_fwutil_status=""
 # Determine FirewallD utility Status
 rpm -q firewalld > /dev/null 2>&1 && l_fwd_status="$(systemctl is-enabled firewalld.service):$(systemctl is-active firewalld.service)"
 # Determine NFTables utility Status
 rpm -q nftables > /dev/null 2>&1 && l_nft_status="$(systemctl is-enabled nftables.service):$(systemctl is-active nftables.service)"
 l_fwutil_status="$l_fwd_status:$l_nft_status"
 case $l_fwutil_status in
 enabled:active:masked:inactive|enabled:active:disabled:inactive) 
 l_output="\n - FirewallD utility is in use, enabled and active\n - NFTables utility is correctly disabled or masked and inactive" ;;
 masked:inactive:enabled:active|disabled:inactive:enabled:active) 
 l_output="\n - NFTables utility is in use, enabled and active\n - FirewallD utility is correctly disabled or masked and inactive" ;;
 enabled:active:enabled:active)
 l_output2="\n - Both FirewallD and NFTables utilities are enabled and active" ;;
 enabled:*:enabled:*)
 l_output2="\n - Both FirewallD and NFTables utilities are enabled" ;;
 *:active:*:active) 
 l_output2="\n - Both FirewallD and NFTables utilities are enabled" ;;
 :enabled:active) 
 l_output="\n - NFTables utility is in use, enabled, and active\n - FirewallD package is not installed" ;;
 :) 
 l_output2="\n - Neither FirewallD or NFTables is installed" ;;
 *:*:) 
 l_output2="\n - NFTables package is not installed on the system" ;;
 *) 
 l_output2="\n - Unable to determine firewall state" ;;
 esac
 if [ -z "$l_output2" ]; then
 echo -e "\n- Audit Results:\n ** Pass **\n$l_output\n"
 echo "Host Based Firewall / Configure a firewall utility" >>p1
 echo "Ensure a single firewall configuration utility is in use" >>p2
 echo "A single firewall configuration utility is in use" >>p3
 echo "Yes" >>p4
 echo "4.1.2" >>p12
 else
 echo -e "\n- Audit Results:\n ** Fail **\n$l_output2\n"
 echo "Host Based Firewall / Configure a firewall utility" >>p1
 echo "Ensure a single firewall configuration utility is in use" >>p2
 echo "A single firewall configuration utility is not in use" >>p3
 echo "No" >>p4
 echo "4.1.2" >>p12
 fi
}

#########################################################################################################

# 4.2.2
# Ensure firewalld loopback traffic is configured

# Static fields
echo "Host Based Firewall / Configure FirewallD" >> p1
echo "Ensure firewalld loopback traffic is configured" >> p2
echo "4.2.2" >> p12

# Initialize
result=""
status="No"

# Check if firewalld is enabled AND active
if systemctl is-enabled firewalld.service 2>/dev/null | grep -q '^enabled' && \
   systemctl is-active firewalld.service 2>/dev/null | grep -q '^active'; then

    # Check loopback accept
    if nft list ruleset 2>/dev/null | awk '/hook\s+input\s+/,/\}/' | grep -Pq '\blo\b.*accept'; then
        loop_accept="yes"
    else
        loop_accept="no"
    fi

    # Check IPv4 loopback drop
    if nft list ruleset 2>/dev/null | grep -Pq 'ip\s+saddr\s+127\.0\.0\.0/8.*drop'; then
        ipv4_drop="yes"
    else
        ipv4_drop="no"
    fi

    # Check IPv6 only if enabled
    if grep -q '^0$' /sys/module/ipv6/parameters/disable 2>/dev/null; then
        if nft list ruleset 2>/dev/null | grep -Pq 'ip6\s+saddr\s+::1.*drop'; then
            ipv6_drop="yes"
        else
            ipv6_drop="no"
        fi
    else
        ipv6_drop="na"
    fi

    # Evaluate result
    if [[ "$loop_accept" == "yes" && "$ipv4_drop" == "yes" && ( "$ipv6_drop" == "yes" || "$ipv6_drop" == "na" ) ]]; then
        result="Loopback interface correctly configured (accept + drop rules present)"
        status="Yes"
    else
#        result="Loopback configuration incomplete (accept=$loop_accept, ipv4_drop=$ipv4_drop, ipv6_drop=$ipv6_drop)"
        result="Loopback configuration incomplete"
        status="No"
    fi

else
    result="firewalld is not enabled and active (control applies when firewalld is in use)"
    status="No"
fi

final_result=$(echo "$result" | tr -d '\r\n\t')

echo "$final_result" >> p3
echo "$status" >> p4

#########################################################################################################

# 4.3.1
# Ensure nftables base chains exist (Automated)
#!/usr/bin/env bash
{
 l_output="" l_output2=""

 # Check base chain for INPUT
 if nft list ruleset 2>/dev/null | grep -q "hook input"; then
  l_output="$l_output Base chain for INPUT exists."
 else
  l_output2="$l_output2 Base chain for INPUT does not exist."
 fi

 # Check base chain for FORWARD
 if nft list ruleset 2>/dev/null | grep -q "hook forward"; then
  l_output="$l_output Base chain for FORWARD exists."
 else
  l_output2="$l_output2 Base chain for FORWARD does not exist."
 fi

 # Check base chain for OUTPUT
 if nft list ruleset 2>/dev/null | grep -q "hook output"; then
  l_output="$l_output Base chain for OUTPUT exists."
 else
  l_output2="$l_output2 Base chain for OUTPUT does not exist."
 fi

 if [ -z "$l_output2" ]; then
  echo "Host Based Firewall / Configure NFTables" >> p1
  echo "Ensure nftables base chains exist" >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "4.3.1" >> p12
 else
  echo "Host Based Firewall / Configure NFTables" >> p1
  echo "Ensure nftables base chains exist" >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "4.3.1" >> p12
 fi
}

#########################################################################################################

# 4.3.3
# Ensure nftables default deny firewall policy (Automated)
#!/usr/bin/env bash

{
  chains=("input" "forward")
  for chain in "${chains[@]}"; do
    if systemctl --quiet is-enabled nftables.service && nft list ruleset | grep -q "hook $chain"; then
      if nft list ruleset | grep "hook $chain" | grep -q 'policy drop'; then
        echo "Host Based Firewall / Configure NFTables" >>p1
        echo "Ensure nftables default deny firewall policy" >>p2
        echo "Base chain for $chain contains a policy of DROP" >>p3
        echo "Yes" >>p4
        echo "4.3.3" >>p12
      else
        echo "Host Based Firewall / Configure NFTables" >>p1
        echo "Ensure nftables default deny firewall policy" >>p2
        echo "Base chain for $chain does not contain a policy of DROP" >>p3
        echo "No" >>p4
        echo "4.3.3" >>p12
      fi
    else
      echo "Host Based Firewall / Configure NFTables" >>p1
      echo "Ensure nftables default deny firewall policy" >>p2
      echo "nftables service is not enabled or base chain for $chain does not exist" >>p3
      echo "No" >>p4
      echo "4.3.3" >>p12
    fi
  done
}

#########################################################################################################

# 4.3.4
# Ensure nftables loopback traffic is configured (Automated)

echo "Host Based Firewall / Configure NFTables" >> p1
echo "Ensure nftables loopback traffic is configured" >> p2

# If firewalld is active, CIS says this recommendation can be skipped
if systemctl is-active firewalld >/dev/null 2>&1; then
  echo "firewalld is active; loopback rules managed by firewalld (skipped per CIS note)" >> p3
  echo "Yes" >> p4
  echo "4.3.4" >> p12
else
  # Require nft
  if ! command -v nft >/dev/null 2>&1; then
    echo "nftables not installed: nft command not found" >> p3
    echo "No" >> p4
    echo "4.3.4" >> p12
  else
    ruleset="$(nft list ruleset 2>/dev/null)"

    # Checks per audit:
    #  - Accept loopback input:          iif lo accept
    #  - Drop IPv4 loopback off non-lo:  iif != lo ip saddr 127.0.0.0/8 drop
    #  - Drop IPv6 loopback off non-lo:  iif != lo ip6 saddr ::1/128 drop (only if IPv6 enabled)
    ok_lo_acc=$(printf "%s" "$ruleset" | grep -qiE '\biif[[:space:]]+lo\b[[:space:]]+accept\b' && echo yes || echo no)
    ok_v4_drop=$(printf "%s" "$ruleset" | grep -qiE '\biif[[:space:]]*!=?[[:space:]]*lo\b.*\bip[[:space:]]+saddr[[:space:]]+127\.0\.0\.0/8\b.*\bdrop\b' && echo yes || echo no)

    ipv6_enabled=no
    if [ -r /sys/module/ipv6/parameters/disable ] && grep -q '^[[:space:]]*0[[:space:]]*$' /sys/module/ipv6/parameters/disable; then
      ipv6_enabled=yes
    fi

    ok_v6_drop=yes
    if [ "$ipv6_enabled" = "yes" ]; then
      ok_v6_drop=$(printf "%s" "$ruleset" | grep -qiE '\biif[[:space:]]*!=?[[:space:]]*lo\b.*\bip6[[:space:]]+saddr[[:space:]]+::1/128\b.*\bdrop\b' && echo yes || echo no)
    fi

    if [ "$ok_lo_acc" = "yes" ] && [ "$ok_v4_drop" = "yes" ] && [ "$ok_v6_drop" = "yes" ]; then
      if [ "$ipv6_enabled" = "yes" ]; then
        echo "Loopback rules present: 'iif lo accept', 'iif != lo ip saddr 127.0.0.0/8 drop', 'iif != lo ip6 saddr ::1/128 drop'" >> p3
      else
        echo "Loopback rules present: 'iif lo accept', 'iif != lo ip saddr 127.0.0.0/8 drop' (IPv6 disabled)" >> p3
      fi
      echo "Yes" >> p4
    else
      miss=""
      [ "$ok_lo_acc"  != "yes" ] && miss="${miss}missing 'iif lo accept'; "
      [ "$ok_v4_drop" != "yes" ] && miss="${miss}missing 'iif != lo ip saddr 127.0.0.0/8 drop'; "
      if [ "$ipv6_enabled" = "yes" ] && [ "$ok_v6_drop" != "yes" ]; then
        miss="${miss}missing 'iif != lo ip6 saddr ::1/128 drop'; "
      fi
      echo "${miss% ; }" >> p3
      echo "No" >> p4
    fi

    echo "4.3.4" >> p12
  fi
fi
#######################################Access Control / Configure SSH Server#`############################

#5.1.1
#Ensure permissions on /etc/ssh/sshd_config are configured
otpt32=$(stat -Lc "%n %a %u/%U %g/%G" /etc/ssh/sshd_config)

# Extract the permissions, Uid, and Gid from the output
permissions11=$(echo $otpt32 | cut -d' ' -f2)
uid11=$(echo $otpt32 | cut -d' ' -f3)
gid11=$(echo $otpt32 | cut -d' ' -f4)

# Check the conditions for compliance
if [[ $permissions11 == 600 && $uid11 == "0/root" && $gid11 == "0/root" ]]; then
      echo "Access Control / Configure SSH Server" >>p1
	  echo "Ensure permissions on /etc/ssh/sshd_config are configured" >>p2
	  echo "Permissions of sshd_config 0600 and ownership of root:root" >>p3
	  echo "Yes" >>p4
	  echo "5.1.1" >>p12
else
      echo "Access Control / Configure SSH Server" >>p1
	  echo "Ensure permissions on /etc/ssh/sshd_config are configured" >>p2
	  echo "No Permissions of sshd_config 0600 and ownership of root:root" >>p3
	  echo "No" >>p4
	  echo "5.1.1" >>p12
fi

#########################################################################################################

#5.1.2
#Ensure permissions on SSH private host key files are configured.
#!/usr/bin/env bash

{
 l_output="" l_output2=""
 l_skgn="ssh_keys" # Group designated to own openSSH keys
 l_skgid="$(awk -F: '($1 == "'"$l_skgn"'"){print $3}' /etc/group)"
 [ -n "$l_skgid" ] && l_cga="$l_skgn" || l_cga="root"
 awk '{print}' <<< "$(find -L /etc/ssh -xdev -type f -exec stat -Lc "%n %#a %U %G %g" {} +)" | (while read -r l_file l_mode l_owner l_group l_gid; do
 if file "$l_file" | grep -Pq ':\h+OpenSSH\h+private\h+key\b'; then
 [ "$l_gid" = "$l_skgid" ] && l_pmask="0137" || l_pmask="0177"
 l_maxperm="$( printf '%o' $(( 0777 & ~$l_pmask )) )"
 if [ $(( $l_mode & $l_pmask )) -gt 0 ]; then
 l_output2="$l_output2\n - File: \"$l_file\" is mode \"$l_mode\" should be mode: \"$l_maxperm\" or more restrictive"
 else 
 l_output="$l_output\n - File: \"$l_file\" is mode \"$l_mode\" should be mode: \"$l_maxperm\" or more restrictive"
 fi
 if [ "$l_owner" != "root" ]; then
 l_output2="$l_output2\n - File: \"$l_file\" is owned by: \"$l_owner\" should be owned by \"root\""
 else
 l_output="$l_output\n - File: \"$l_file\" is owned by: \"$l_owner\" should be owned by \"root\""
 fi
 if [ "$l_group" != "root" ] && [ "$l_gid" != "$l_skgid" ]; then
 l_output2="$l_output2\n - File: \"$l_file\" is owned by group \"$l_group\" should belong to group \"$l_cga\""
 else
 l_output="$l_output\n - File: \"$l_file\" is owned by group \"$l_group\" should belong to group \"$l_cga\""
 fi
 fi
 done
 if [ -z "$l_output2" ]; then
 echo -e "\n- Audit Result:\n *** PASS ***\n$l_output"
 echo "Access Control / Configure SSH Server" >>p1
 echo "Ensure permissions on SSH private host key files are configured." >>p2
 echo "Permissions on SSH private host key files are configured" >>p3
 echo "Yes" >>p4
 echo "5.1.2" >>p12
 else
 echo -e "\n- Audit Result:\n *** FAIL ***\n$l_output2\n\n - Correctly set:\n$l_output"
 echo "Access Control / Configure SSH Server" >>p1
 echo "Ensure permissions on SSH private host key files are configured" >>p2
 echo "No Permissions on SSH private host key files are configured" >>p3
 echo "No" >>p4
 echo "5.1.2" >>p12
 fi
 )
}


#########################################################################################################

#5.1.3
#Ensure permissions on SSH public host key files are configured.
#!/usr/bin/env bash

{
 l_output="" l_output2=""
 l_pmask="0133" 
 awk '{print}' <<< "$(find -L /etc/ssh -xdev -type f -exec stat -Lc "%n %#a %U %G" {} +)" | (while read -r l_file l_mode l_owner l_group; do
 if file "$l_file" | grep -Pq ':\h+OpenSSH\h+(\H+\h+)?public\h+key\b'; then
 l_maxperm="$( printf '%o' $(( 0777 & ~$l_pmask )) )"
 if [ $(( $l_mode & $l_pmask )) -gt 0 ]; then
 l_output2="$l_output2\n - Public key file: \"$l_file\" is mode \"$l_mode\" should be mode: \"$l_maxperm\" or more restrictive"
 else 
 l_output="$l_output\n - Public key file: \"$l_file\" is mode \"$l_mode\" should be mode: \"$l_maxperm\" or more restrictive"
 fi
 if [ "$l_owner" != "root" ]; then
 l_output2="$l_output2\n - Public key file: \"$l_file\" is owned by: \"$l_owner\" should be owned by \"root\""
 else
 l_output="$l_output\n - Public key file: \"$l_file\" is owned by: \"$l_owner\" should be owned by \"root\""
 fi
 if [ "$l_group" != "root" ]; then
 l_output2="$l_output2\n - Public key file: \"$l_file\" is owned by group \"$l_group\" should belong to group \"root\"\n"
 else
 l_output="$l_output\n - Public key file: \"$l_file\" is owned by group \"$l_group\" should belong to group \"root\"\n"
 fi
 fi
 done
 if [ -z "$l_output2" ]; then
 echo -e "\n- Audit Result:\n *** PASS ***\n$l_output"
 echo "Access Control / Configure SSH Server" >>p1
 echo "Ensure permissions on SSH public host key files are configured" >>p2
 echo "Permissions on SSH public host key files are configured" >>p3
 echo "Yes" >>p4
 echo "5.1.3" >>p12
 else
 echo -e "\n- Audit Result:\n *** FAIL ***\n$l_output2\n\n - Correctly set:\n$l_output"
 echo "Access Control / Configure SSH Server" >>p1
 echo "Ensure permissions on SSH public host key files are configured" >>p2
 echo "No Permissions on SSH public host key files are configured" >>p3
 echo "No" >>p4
 echo "5.1.3" >>p12
 fi
 )
}

#########################################################################################################

# 5.1.4
# Ensure sshd Ciphers are configured (Automated)

echo "Access Control / Configure SSH Server" >>p1
echo "Ensure sshd Ciphers are configured" >>p2

# Run the CIS weak-cipher check
weak=$(sshd -T 2>/dev/null | grep -Pi '(^|\s)ciphers\s+\"?([^#\n\r]+,)?((3des|blowfish|cast128|aes(128|192|256)-cbc|arcfour(128|256)?|rijndael-cbc@lysator\.liu\.se|chacha20-poly1305@openssh\.com))\b' || true)

if [ -z "$weak" ]; then
    echo "No weak SSH ciphers detected" >>p3
    echo "Yes" >>p4
else
    compact=$(echo "$weak" | tr '\n' ',' | sed 's/,$//')
    echo "Weak SSH ciphers detected " >>p3
    echo "No" >>p4
fi

echo "5.1.4" >>p12


#########################################################################################################

# 5.1.5
# Ensure sshd KexAlgorithms is configured (Automated)

echo "Access Control / Configure SSH Server" >>p1
echo "Ensure sshd KexAlgorithms is configured" >>p2

# Run CIS weak KEX check
weak=$(sshd -T 2>/dev/null | \
grep -Pi 'kexalgorithms\h+([^#\n\r]+,)?(diffie-hellman-group1-sha1|diffie-hellman-group14-sha1|diffie-hellman-group-exchange-sha1)\b' \
|| true)

if [ -z "$weak" ]; then
    echo "No weak SSH KexAlgorithms detected" >>p3
    echo "Yes" >>p4
else
    compact=$(echo "$weak" | tr '\n' ',' | sed 's/,$//')
#   echo "Weak SSH KexAlgorithms detected: [$compact]" >>p3
    echo "Weak SSH KexAlgorithms detected" >>p3
    echo "No" >>p4
fi

echo "5.1.5" >>p12


#########################################################################################################

# 5.1.6
# Ensure sshd MACs are configured (Automated)

section_id="5.1.6"
section_title="Access Control / Configure SSH Server"
check_desc="Ensure sshd MACs are configured"

# List of weak MAC algorithms per CIS
weak_macs=(
    "hmac-md5"
    "hmac-md5-96"
    "hmac-sha1-96"
    "umac-64@openssh.com"
    "hmac-md5-etm@openssh.com"
    "hmac-md5-96-etm@openssh.com"
    "hmac-sha1-96-etm@openssh.com"
    "umac-64-etm@openssh.com"
    "umac-128-etm@openssh.com"
)

# Get configured MACs from sshd
mac_config=$(sshd -T 2>/dev/null | awk '/macs/ {print $2}')

# Initialize compliance flag
is_compliant=true
found_weak=""

# Check for weak MACs
for mac in "${weak_macs[@]}"; do
    if echo "$mac_config" | grep -qw "$mac"; then
        is_compliant=false
        found_weak="$found_weak$mac "
    fi
done

# Output results in p1/p2/p3/p4/p12
echo "$section_title" >>p1
echo "$check_desc" >>p2

if $is_compliant; then
    echo "No weak MAC algorithms found" >>p3
    echo "Yes" >>p4
else
    echo "Weak MAC algorithm(s) found: ${found_weak%" "}" >>p3
    echo "No" >>p4
fi

echo "$section_id" >>p12

#########################################################################################################

# 5.1.7
# Ensure sshd access is configured (Automated)

echo "Access Control / Configure SSH Server" >>p1
echo "Ensure sshd access is configured" >>p2

# Get sshd evaluated configuration (applies Match blocks only if -C is used; base check here)
conf=$(sshd -T 2>/dev/null || true)

# Extract allow/deny users/groups with non-empty values
lines=$(printf '%s\n' "$conf" | grep -Pi '^\s*(allow-deny)(users-groups)\s+\S+' || true)

if [ -n "$lines" ]; then
  compact=$(echo "$lines" | tr '\n' ';' | sed 's/;*$//')
  echo "Access controls present: [$compact]" >>p3
  echo "Yes" >>p4
else
  echo "No allow/deny users/groups configured in sshd -T output" >>p3
  echo "No" >>p4
fi

echo "5.1.7" >>p12

#########################################################################################################

# 5.1.8
# Ensure sshd Banner is configured (Automated)
HOSTNAME4=$(hostname)
IP_ADDRESS4=$(grep $HOSTNAME4 /etc/hosts | awk '{print $1}')

# Fetch the current SSH configuration based on runtime test
SSH_OUTPUT4=$(sshd -T -C user=sshuser -C host="$HOSTNAME4" -C addr="$IP_ADDRESS4" | grep banner)

# Interpret the SSHD runtime configuration status
if [[ "$SSH_OUTPUT4" == "banner /etc/issue.net" ]]; then
    echo "Access Control / Configure SSH Server" >> p1
    echo "Ensure sshd Banner is configured" >> p2
    echo "SSH warning banner is configured. Current status: $SSH_OUTPUT4" >> p3
    echo "Yes" >> p4
    echo "5.1.8" >> p12
else
    echo "Access Control / Configure SSH Server" >> p1
    echo "Ensure sshd Banner is configured" >> p2
    echo "SSH warning banner is not configured" >> p3
    echo "No" >> p4
    echo "5.1.8" >> p12
fi

# Configuration file path
CONFIG_FILE="/etc/ssh/sshd_config"
EXPECTED_BANNER="/etc/issue.net"

# Function to check compliance of Banner parameter
check_banner_compliance() {
    # Search for the Banner parameter in the sshd_config, including commented lines
    BANNER_LINE=$(grep -E "^\s*#?\s*Banner\s+" $CONFIG_FILE)

    if [ -z "$BANNER_LINE" ]; then
        # If no Banner line is present
        echo "Non-compliant: Banner parameter is missing."
                echo "Access Control / Configure SSH Server" >> p1
                echo "Ensure sshd Banner is configured" >> p2
                echo "Banner parameter is missing." >> p3
                echo "No" >> p4
                echo "5.1.8" >> p12
    else
        # Check if Banner is commented out
        if [[ "$BANNER_LINE" =~ ^\s*# ]]; then
            # If Banner line is commented out
            echo "Non-compliant: Banner parameter is commented out."
                        echo "Access Control / Configure SSH Server" >> p1
                        echo "Ensure sshd Banner is configured" >> p2
                        echo "Banner parameter is commented out in $CONFIG_FILE" >> p3
                        echo "No" >> p4
                        echo "5.1.8" >> p12
        else
            # Extract the Banner path from the line
            BANNER_VALUE=$(echo $BANNER_LINE | awk '{print $2}')
            if [ "$BANNER_VALUE" == "$EXPECTED_BANNER" ]; then
                # If Banner is set correctly
                echo "Compliant: Banner is set to $EXPECTED_BANNER."
                                echo "Access Control / Configure SSH Server" >> p1
                                echo "Ensure sshd Banner is configured" >> p2
                                echo "Banner is set to $EXPECTED_BANNER in $CONFIG_FILE" >> p3
                                echo "Yes" >> p4
                                echo "5.1.8" >> p12
            else
                # If Banner is set but not to the expected value
                echo "Non-compliant: Banner is not set to $EXPECTED_BANNER."
                                echo "Access Control / Configure SSH Server" >> p1
                                echo "Ensure sshd Banner is configured" >> p2
                                echo "Banner is not set to $EXPECTED_BANNER in $CONFIG_FILE" >> p3
                                echo "No" >> p4
                                echo "5.1.8" >> p12
            fi
        fi
    fi
}

# Run the compliance check
check_banner_compliance
#########################################################################################################

# 5.1.9
# Ensure sshd ClientAliveInterval and ClientAliveCountMax are configured (Automated)

echo "Access Control / Configure SSH Server" >>p1
echo "Ensure sshd ClientAliveInterval and ClientAliveCountMax are configured" >>p2

conf=$(sshd -T 2>/dev/null || true)
ival=$(printf '%s\n' "$conf" | awk '$1=="clientaliveinterval"{print $2}' | tail -n1)
cmax=$(printf '%s\n' "$conf" | awk '$1=="clientalivecountmax"{print $2}' | tail -n1)

# Validate presence and > 0
fail_reasons=""
[ -z "$ival" ] && fail_reasons="${fail_reasons}missing ClientAliveInterval; "
[ -z "$cmax" ] && fail_reasons="${fail_reasons}missing ClientAliveCountMax; "
if [ -n "$ival" ] && [ "$ival" -le 0 ] 2>/dev/null; then fail_reasons="${fail_reasons}ClientAliveInterval<=0; "; fi
if [ -n "$cmax" ] && [ "$cmax" -le 0 ] 2>/dev/null; then fail_reasons="${fail_reasons}ClientAliveCountMax<=0; "; fi

if [ -z "$fail_reasons" ]; then
  echo "clientaliveinterval=$ival; clientalivecountmax=$cmax" >>p3
  echo "Yes" >>p4
else
  echo "clientaliveinterval=${ival:-unset}; clientalivecountmax=${cmax:-unset}; issues=${fail_reasons% ; }" >>p3
  echo "No" >>p4
fi

echo "5.1.9" >>p12


#########################################################################################################

# 5.1.12
# Ensure sshd HostbasedAuthentication is disabled (Automated)

echo "Access Control / Configure SSH Server" >>p1
echo "Ensure sshd HostbasedAuthentication is disabled" >>p2

val=$(sshd -T 2>/dev/null | awk '$1=="hostbasedauthentication"{print $2}' | tail -n1)

if [ "$val" = "no" ]; then
    echo "hostbasedauthentication=$val" >>p3
    echo "Yes" >>p4
else
    echo "hostbasedauthentication=${val:-unset}" >>p3
    echo "No" >>p4
fi

echo "5.1.12" >>p12

#########################################################################################################

# 5.1.13
# Ensure sshd IgnoreRhosts is enabled (Automated)

echo "Access Control / Configure SSH Server" >>p1
echo "Ensure sshd IgnoreRhosts is enabled" >>p2

val=$(sshd -T 2>/dev/null | awk '$1=="ignorerhosts"{print $2}' | tail -n1)

if [ "$val" = "yes" ]; then
    echo "ignorerhosts=$val" >>p3
    echo "Yes" >>p4
else
    echo "ignorerhosts=${val:-unset}" >>p3
    echo "No" >>p4
fi

echo "5.1.13" >>p12

#########################################################################################################

# 5.1.14
# Ensure sshd LoginGraceTime is configured (Automated)

echo "Access Control / Configure SSH Server" >>p1
echo "Ensure sshd LoginGraceTime is configured" >>p2

val=$(sshd -T 2>/dev/null | awk '$1=="logingracetime"{print $2}' | tail -n1)

# Validate: must exist AND be between 1 and 60 inclusive
if [ -n "$val" ] && [ "$val" -ge 1 ] 2>/dev/null && [ "$val" -le 60 ] 2>/dev/null; then
    echo "logingracetime=$val" >>p3
    echo "Yes" >>p4
else
    echo "logingracetime=${val:-unset} (expected 1–60)" >>p3
    echo "No" >>p4
fi

echo "5.1.14" >>p12

#########################################################################################################

# 5.1.15
# Ensure sshd LogLevel is configured (Automated)

echo "Access Control / Configure SSH Server" >>p1
echo "Ensure sshd LogLevel is configured" >>p2

val=$(sshd -T 2>/dev/null | awk '$1=="loglevel"{print $2}' | tail -n1)

if [ "$val" = "INFO" ] || [ "$val" = "VERBOSE" ]; then
    echo "loglevel=$val" >>p3
    echo "Yes" >>p4
else
    echo "loglevel=${val:-unset} (expected INFO or VERBOSE)" >>p3
    echo "No" >>p4
fi

echo "5.1.15" >>p12

#########################################################################################################

# 5.1.16
# Ensure sshd MaxAuthTries is configured (Automated)

echo "Access Control / Configure SSH Server" >>p1
echo "Ensure sshd MaxAuthTries is configured" >>p2

val=$(sshd -T 2>/dev/null | awk '$1=="maxauthtries"{print $2}' | tail -n1)

if [ -n "$val" ] && [ "$val" -le 4 ] 2>/dev/null; then
    echo "maxauthtries=$val" >>p3
    echo "Yes" >>p4
else
    echo "maxauthtries=${val:-unset} (expected ≤4)" >>p3
    echo "No" >>p4
fi

echo "5.1.16" >>p12

#########################################################################################################

# 5.1.17
# Ensure sshd MaxStartups is configured (Automated)

echo "Access Control / Configure SSH Server" >>p1
echo "Ensure sshd MaxStartups is configured" >>p2

val=$(sshd -T 2>/dev/null | awk '$1=="maxstartups"{print $2}' | tail -n1)

if [ -z "$val" ]; then
    echo "maxstartups=unset (expected ≤10:30:60)" >>p3
    echo "No" >>p4
    echo "5.1.17" >>p12
fi

# Split into a:b:c
IFS=':' read -r a b c <<< "$val"

# Validate: a ≤ 10, b ≤ 30, c ≤ 60
if [ "$a" -le 10 ] 2>/dev/null && [ "$b" -le 30 ] 2>/dev/null && [ "$c" -le 60 ] 2>/dev/null; then
    echo "maxstartups=$val" >>p3
    echo "Yes" >>p4
else
    echo "maxstartups=$val (expected ≤10:30:60)" >>p3
    echo "No" >>p4
fi

echo "5.1.17" >>p12

#########################################################################################################

# 5.1.18
# Ensure sshd MaxSessions is configured (Automated)

echo "Access Control / Configure SSH Server" >>p1
echo "Ensure sshd MaxSessions is configured" >>p2

# 1) Check the evaluated sshd config
val=$(sshd -T 2>/dev/null | awk 'tolower($1)=="maxsessions"{print $2}' | tail -n1)

# 2) Check config files for any insecure MaxSessions values (>=11)
cfg_bad=$(grep -Psi -- '^\s*MaxSessions\s+"?(1[1-9]|[2-9][0-9]|[1-9][0-9][0-9]+)\b' \
/etc/ssh/sshd_config /etc/ssh/sshd_config.d/*.conf 2>/dev/null || true)

# Evaluate results
if [ -z "$val" ] || [ "$val" -gt 10 ] 2>/dev/null; then
    echo "maxsessions=${val:-unset} (expected ≤10)" >>p3
    echo "No" >>p4
elif [ -n "$cfg_bad" ]; then
    bad=$(echo "$cfg_bad" | tr '\n' ',' | sed 's/,$//')
    echo "maxsessions=$val; insecure_config=[${bad}]" >>p3
    echo "No" >>p4
else
    echo "maxsessions=$val" >>p3
    echo "Yes" >>p4
fi

echo "5.1.18" >>p12

#########################################################################################################

# 5.1.19
# Ensure sshd PermitEmptyPasswords is disabled (Automated)

echo "Access Control / Configure SSH Server" >>p1
echo "Ensure sshd PermitEmptyPasswords is disabled" >>p2

val=$(sshd -T 2>/dev/null | awk '$1=="permitemptypasswords"{print $2}' | tail -n1)

if [ "$val" = "no" ]; then
    echo "permitemptypasswords=$val" >>p3
    echo "Yes" >>p4
else
    echo "permitemptypasswords=${val:-unset} (expected no)" >>p3
    echo "No" >>p4
fi

echo "5.1.19" >>p12

#########################################################################################################

# 5.1.20
# Ensure sshd PermitRootLogin is disabled (Automated)

echo "Access Control / Configure SSH Server" >>p1
echo "Ensure sshd PermitRootLogin is disabled" >>p2

val=$(sshd -T 2>/dev/null | awk '$1=="permitrootlogin"{print $2}' | tail -n1)

if [ "$val" = "no" ]; then
    echo "permitrootlogin=$val" >>p3
    echo "Yes" >>p4
else
    echo "permitrootlogin=${val:-unset} (expected no)" >>p3
    echo "No" >>p4
fi

echo "5.1.20" >>p12

#########################################################################################################

# 5.1.21
# Ensure sshd PermitUserEnvironment is disabled (Automated)

echo "Access Control / Configure SSH Server" >>p1
echo "Ensure sshd PermitUserEnvironment is disabled" >>p2

val=$(sshd -T 2>/dev/null | awk '$1=="permituserenvironment"{print $2}' | tail -n1)

if [ "$val" = "no" ]; then
    echo "permituserenvironment=$val" >>p3
    echo "Yes" >>p4
else
    echo "permituserenvironment=${val:-unset} (expected no)" >>p3
    echo "No" >>p4
fi

echo "5.1.21" >>p12

#########################################################################################################

# 5.1.22
# Ensure sshd UsePAM is enabled (Automated)

echo "Access Control / Configure SSH Server" >>p1
echo "Ensure sshd UsePAM is enabled" >>p2

val=$(sshd -T 2>/dev/null | awk 'tolower($1)=="usepam"{print $2}' | tail -n1)

if [ "$val" = "yes" ]; then
    echo "usepam=$val" >>p3
    echo "Yes" >>p4
else
    echo "usepam=${val:-unset} (expected yes)" >>p3
    echo "No" >>p4
fi

echo "5.1.22" >>p12

#########################################################################################################

# 5.2.1
# Ensure sudo is installed

echo "Access Control / Configure privilege escalation" >>p1
echo "Ensure sudo is installed" >>p2

# CIS logic: check output of `dnf list sudo`
out=$(dnf list sudo 2>/dev/null | grep -i '^Installed Packages')

if [ -n "$out" ]; then
    version=$(dnf list sudo 2>/dev/null | awk '/sudo/ && /@/ {print $2}')
    echo "sudo installed: version=${version:-unknown}" >>p3
    echo "Yes" >>p4
else
    echo "sudo not installed" >>p3
    echo "No" >>p4
fi

echo "5.2.1" >>p12

#########################################################################################################

# 5.2.2
# Ensure sudo commands use pty

echo "Access Control / Configure privilege escalation" >>p1
echo "Ensure sudo commands use pty" >>p2

# Ensure sudo commands use pty
use_hit=$(grep -rPi -- '^\s*Defaults\s+([^#\n\r]+,\s*)?use_pty\b' /etc/sudoers* 2>/dev/null || true)
neg_hit=$(grep -rPi -- '^\s*Defaults\s+([^#\n\r]+,\s*)?!use_pty\b' /etc/sudoers* 2>/dev/null || true)

if [ -n "$use_hit" ] && [ -z "$neg_hit" ]; then
  echo "Defaults use_pty present; no '!use_pty' negation found" >>p3
  echo "Yes" >>p4
else
  uh=$(echo "$use_hit" | tr '\n' ';' | sed 's/;*$//')
  nh=$(echo "$neg_hit" | tr '\n' ';' | sed 's/;*$//')
  echo "use_pty_present=$([ -n "$use_hit" ] && echo yes || echo no); negation_present=$([ -n "$neg_hit" ] && echo yes || echo no); use_hits=[${uh}]; neg_hits=[${nh}]" >>p3
  echo "No" >>p4
fi

echo "5.2.2" >>p12

#########################################################################################################

# 5.2.3
# Ensure sudo log file exists

echo "Access Control / Configure privilege escalation" >>p1
echo "Ensure sudo log file exists" >>p2

# CIS audit: detect Defaults logfile=<path> in /etc/sudoers*
hits=$(grep -rPsi "^\s*Defaults\s+([^#]+,\s*)?logfile\s*=\s*(\"|')?\S+(\"|')?(,\s*\S+\s*)*\s*(#.*)?$" /etc/sudoers* 2>/dev/null || true)

if [ -n "$hits" ]; then
  compact=$(echo "$hits" | tr '\n' ';' | sed 's/;*$//')
  echo "logfile directive present: [$compact]" >>p3
  echo "Yes" >>p4
else
  echo "No Defaults logfile=<path> directive found in /etc/sudoers*" >>p3
  echo "No" >>p4
fi

echo "5.2.3" >>p12

#########################################################################################################

# 5.2.5
# Ensure re-authentication for privilege escalation is not disabled globally (Automated)

echo "Access Control / Configure privilege escalation" >>p1
echo "Ensure re-authentication for privilege escalation is not disabled globally" >>p2

# CIS audit: detect any uncommented '!authenticate' in sudoers files
hits=$(grep -r "^[^#].*\!authenticate" /etc/sudoers* 2>/dev/null || true)

if [ -z "$hits" ]; then
    echo "No '!authenticate' tags found (re-authentication required for sudo)" >>p3
    echo "Yes" >>p4
else
    compact=$(echo "$hits" | tr '\n' ';' | sed 's/;*$//')
    echo "Disabling tags detected: [$compact]" >>p3
    echo "No" >>p4
fi

echo "5.2.5" >>p12


#########################################################################################################

# 5.2.6
# Ensure sudo authentication timeout is configured correctly

echo "Access Control / Configure privilege escalation" >>p1
echo "Ensure sudo authentication timeout is configured correctly" >>p2

# Gather configured timestamp_timeout values from sudoers files
vals=$(grep -roP "timestamp_timeout=\K-?[0-9]*" /etc/sudoers* 2>/dev/null || true)

if [ -z "$vals" ]; then
  # Not configured → default is 5 minutes; show what sudo reports for transparency
  def=$(sudo -V 2>/dev/null | grep -F "Authentication timestamp timeout:" | awk -F: '{gsub(/^[ \t]+/,"",$2); print $2}')
  # If sudo -V unavailable, still PASS because CIS says default is 5 when unset
  echo "timestamp_timeout=default(5); reported=${def:-unavailable}" >>p3
  echo "Yes" >>p4
else
  bad=""
  good=""
  for v in $vals; do
    if [ "$v" = "-1" ] 2>/dev/null || [ "$v" -gt 15 ] 2>/dev/null; then
      bad+="$v,"
    else
      good+="$v,"
    fi
  done
  if [ -z "$bad" ]; then
    echo "timestamp_timeout_values=[${good%,}]" >>p3
    echo "Yes" >>p4
  else
    echo "invalid_timestamp_timeout=[${bad%,}]; all_found=[${good%,}${good:+,}${bad%,}]" >>p3
    echo "No" >>p4
  fi
fi

echo "5.2.6" >>p12

#########################################################################################################

#5.2.7
#Ensure access to the su command is restricted (Automated)
pattern='^\h*auth\h+(?:required|requisite)\h+pam_wheel\.so\h+(?:[^#\n\r]+\h+)?((?!\2)(use_uid\b|group=\H+\b))\h+(?:[^#\n\r]+\h+)?((?!\1)(use_uid\b|group=\H+\b))(\ h+.*)?$'

# Define the file to check
file="/etc/pam.d/su"

# Check if the /etc/pam.d/su file exists
if [[ -f $file ]]; then
    if grep -Pi "$pattern" "$file" >/dev/null 2>&1; then
        echo "Access Control / Configure privilege escalation" >> p1
   echo "Ensure access to the su command is restricted" >> p2
        echo "su command is restricted according to the configuration in $file" >> p3
        echo "Yes" >> p4
        echo "5.2.7" >> p12
    else
        echo "Access Control / Configure privilege escalation" >> p1
   echo "Ensure access to the su command is restricted" >> p2
        echo "su command is not restricted according to the configuration in $file" >> p3
        echo "No" >> p4
        echo "5.2.7" >> p12
    fi
else
    echo "Access Control / Configure privilege escalation" >> p1
    echo "Ensure access to the su command is restricted" >> p2
  echo "The /etc/pam.d/su file does not exist" >> p3
    echo "No" >> p4
    echo "5.2.7" >> p12
fi

#########################################################################################################

# 5.3.1.1
# Ensure latest version of pam is installed (Automated)

echo "Access Control / Configure PAM" >>p1
echo "Ensure latest version of pam is installed" >>p2

pkg=$(rpm -q pam 2>/dev/null)

if ! echo "$pkg" | grep -q '^pam-'; then
    echo "pam not installed" >>p3
    echo "No" >>p4
    echo "5.3.1.1" >>p12
fi

# Extract version-release number e.g., pam-1.5.1-19.el9.x86_64 → 1.5.1-19
ver=$(echo "$pkg" | sed -E 's/^pam-([0-9]+\.[0-9]+\.[0-9]+)-([0-9]+).*/\1-\2/')
base_ver=$(echo "$ver" | cut -d- -f1)
rel=$(echo "$ver" | cut -d- -f2)

# Minimum required: version 1.5.1 and release >= 19
min_base="1.5.1"
min_rel=19

if [ "$base_ver" = "$min_base" ] && [ "$rel" -ge "$min_rel" ]; then
    echo "pam version OK: $pkg" >>p3
    echo "Yes" >>p4
else
    echo "pam version too old: $pkg (expected ≥ pam-${min_base}-${min_rel})" >>p3
    echo "No" >>p4
fi

echo "5.3.1.1" >>p12

#########################################################################################################

# 5.3.1.2
# Ensure latest version of authselect is installed (Automated)

echo "Access Control / Configure PAM" >>p1
echo "Ensure latest version of authselect is installed" >>p2

pkg=$(rpm -q authselect 2>/dev/null)

if ! echo "$pkg" | grep -q '^authselect-'; then
    echo "authselect not installed" >>p3
    echo "No" >>p4
    echo "5.3.1.2" >>p12
fi

# Extract base version and numeric release from the RPM NEVR string
# Example: authselect-1.2.6-2.el9.x86_64  --> base=1.2.6  rel=2
base=$(echo "$pkg" | sed -E 's/^authselect-([0-9]+\.[0-9]+\.[0-9]+)-.*/\1/')
rel=$(echo "$pkg" | sed -E 's/^authselect-[0-9]+\.[0-9]+\.[0-9]+-([0-9]+).*/\1/')

# Minimum required
min_base="1.2.6"
min_rel=2

# Compare versions: if base > 1.2.6 → PASS; if base == 1.2.6 → rel >= 2 → PASS; else FAIL
version_cmp=$(printf '%s\n%s\n' "$min_base" "$base" | sort -V | head -n1)

if [ "$base" != "$min_base" ]; then
    if [ "$version_cmp" = "$min_base" ] && [ "$base" != "$min_base" ]; then
        # base > min_base
        echo "authselect version OK: $pkg" >>p3
        echo "Yes" >>p4
    else
        # base < min_base
        echo "authselect version too old: $pkg (expected ≥ authselect-${min_base}-${min_rel})" >>p3
        echo "No" >>p4
    fi
else
    # base == min_base → check release
    if [ "$rel" -ge "$min_rel" ] 2>/dev/null; then
        echo "authselect version OK: $pkg" >>p3
        echo "Yes" >>p4
    else
        echo "authselect release too old: $pkg (expected ≥ authselect-${min_base}-${min_rel})" >>p3
        echo "No" >>p4
    fi
fi

echo "5.3.1.2" >>p12


#########################################################################################################

# 5.3.1.3
# Ensure latest version of libpwquality is installed (Automated)

echo "Access Control / Configure PAM" >>p1
echo "Ensure latest version of libpwquality is installed" >>p2

pkg=$(rpm -q libpwquality 2>/dev/null)

# If package is not installed at all
if ! echo "$pkg" | grep -q '^libpwquality-'; then
    echo "libpwquality not installed" >>p3
    echo "No" >>p4
    echo "5.3.1.3" >>p12
fi

# Extract base version and release number
# Example: libpwquality-1.4.4-8.el9.x86_64 → base=1.4.4  rel=8
base=$(echo "$pkg" | sed -E 's/^libpwquality-([0-9]+\.[0-9]+\.[0-9]+)-.*/\1/')
rel=$(echo "$pkg" | sed -E 's/^libpwquality-[0-9]+\.[0-9]+\.[0-9]+-([0-9]+).*/\1/')

# Minimum required for compliance
min_base="1.4.4"
min_rel=8

# Compare versions
version_cmp=$(printf '%s\n%s\n' "$min_base" "$base" | sort -V | head -n1)

if [ "$base" != "$min_base" ]; then
    # base version different
    if [ "$version_cmp" = "$min_base" ] && [ "$base" != "$min_base" ]; then
        # base > min_base → PASS
        echo "libpwquality version OK: $pkg" >>p3
        echo "Yes" >>p4
    else
        # base < min_base → FAIL
        echo "libpwquality version too old: $pkg (expected ≥ libpwquality-${min_base}-${min_rel})" >>p3
        echo "No" >>p4
    fi
else
    # base version equal → check release
    if [ "$rel" -ge "$min_rel" ]; then
        echo "libpwquality version OK: $pkg" >>p3
        echo "Yes" >>p4
    else
        echo "libpwquality release too old: $pkg (expected ≥ libpwquality-${min_base}-${min_rel})" >>p3
        echo "No" >>p4
    fi
fi

echo "5.3.1.3" >>p12


#########################################################################################################

# 5.3.2.1
#Ensure active authselect profile includes PAM modules (Automated)

active_profile="$(head -1 /etc/authselect/authselect.conf 2>/dev/null)"
required_modules="$(grep -P -- '\b(pam_pwquality\.so|pam_pwhistory\.so|pam_faillock\.so|pam_unix\.so)\b' \
  /etc/authselect/"$active_profile"/{system,password}-auth 2>/dev/null)"

if [ -n "$required_modules" ]; then
        echo "Access Control / Configure PAM" >> p1
        echo "Ensure active authselect profile includes pam modules" >> p2
        echo "Active authselect profile includes pam modules" >> p3
        echo "Yes" >> p4
        echo "5.3.2.1" >> p12
else
        echo "Access Control / Configure PAM" >> p1
        echo "Ensure active authselect profile includes pam modules" >> p2
        echo "Active authselect profile not includes pam modules" >> p3
        echo "No" >> p4
        echo "5.3.2.1" >> p12
fi

#########################################################################################################

# 5.3.2.2
# Ensure pam_faillock module is enabled (Automated)

echo "Access Control / Configure PAM" >>p1
echo "Ensure pam_faillock module is enabled" >>p2

files=("/etc/pam.d/password-auth" "/etc/pam.d/system-auth")

check_file() {
  local f="$1"
  [ -f "$f" ] || { echo "file_missing"; return; }

  # auth preauth silent line present (order-agnostic for options)
  preauth=$(grep -Pi '^\s*auth\s+required\s+pam_faillock\.so\b.*\bpreauth\b.*\bsilent\b' "$f" 2>/dev/null || true)
  # auth authfail line present
  authfail=$(grep -Pi '^\s*auth\s+required\s+pam_faillock\.so\b.*\bauthfail\b' "$f" 2>/dev/null || true)
  # account line present
  account=$(grep -Pi '^\s*account\s+required\s+pam_faillock\.so\b' "$f" 2>/dev/null || true)

  if [ -n "$preauth" ] && [ -n "$authfail" ] && [ -n "$account" ]; then
    echo "ok"
  else
    # Build a compact status for missing parts
    msg="missing:"
    [ -z "$preauth" ] && msg="$msg preauth"
    [ -z "$authfail" ] && msg="$msg authfail"
    [ -z "$account" ] && msg="$msg account"
    echo "$msg"
  fi
}

status_pw=$(check_file "/etc/pam.d/password-auth")
status_sys=$(check_file "/etc/pam.d/system-auth")

if [ "$status_pw" = "ok" ] && [ "$status_sys" = "ok" ]; then
  echo "password-auth=ok; system-auth=ok" >>p3
  echo "Yes" >>p4
else
  echo "password-auth=${status_pw}; system-auth=${status_sys}" >>p3
  echo "No" >>p4
fi

echo "5.3.2.2" >>p12

#########################################################################################################

# 5.3.2.3
# Ensure pam_pwquality module is enabled (Automated)

echo "Access Control / Configure PAM" >>p1
echo "Ensure pam_pwquality module is enabled" >>p2

# Check the two files required by CIS
pwquality_pw=$(grep -Pi '\bpam_pwquality\.so\b' /etc/pam.d/password-auth 2>/dev/null || true)
pwquality_sys=$(grep -Pi '\bpam_pwquality\.so\b' /etc/pam.d/system-auth 2>/dev/null || true)

if [ -n "$pwquality_pw" ] && [ -n "$pwquality_sys" ]; then
    echo "password-auth=ok; system-auth=ok" >>p3
    echo "Yes" >>p4
else
    pa_status=$([ -n "$pwquality_pw" ] && echo ok || echo missing)
    sa_status=$([ -n "$pwquality_sys" ] && echo ok || echo missing)
    echo "password-auth=$pa_status; system-auth=$sa_status" >>p3
    echo "No" >>p4
fi

echo "5.3.2.3" >>p12

#########################################################################################################

# 5.3.2.4
# Ensure pam_pwhistory module is enabled (Automated)

echo "Access Control / Configure PAM" >>p1
echo "Ensure pam_pwhistory module is enabled" >>p2

pw_pwh=$(grep -Pi '\bpam_pwhistory\.so\b' /etc/pam.d/password-auth 2>/dev/null || true)
sys_pwh=$(grep -Pi '\bpam_pwhistory\.so\b' /etc/pam.d/system-auth 2>/dev/null || true)

if [ -n "$pw_pwh" ] && [ -n "$sys_pwh" ]; then
    echo "password-auth=ok; system-auth=ok" >>p3
    echo "Yes" >>p4
else
    pa_status=$([ -n "$pw_pwh" ] && echo ok || echo missing)
    sa_status=$([ -n "$sys_pwh" ] && echo ok || echo missing)
    echo "password-auth=$pa_status; system-auth=$sa_status" >>p3
    echo "No" >>p4
fi

echo "5.3.2.4" >>p12

#########################################################################################################

# 5.3.2.5
# Ensure pam_unix module is enabled (Automated)

echo "Access Control / Configure PAM" >>p1
echo "Ensure pam_unix module is enabled" >>p2

# Check presence of pam_unix.so in required stacks for both files
check_file() {
  local f="$1"
  [ -f "$f" ] || { echo "file_missing"; return; }
  local auth account password session
  auth=$(grep -Pi '^\s*auth\s+.*\bpam_unix\.so\b' "$f" 2>/dev/null || true)
  account=$(grep -Pi '^\s*account\s+.*\bpam_unix\.so\b' "$f" 2>/dev/null || true)
  password=$(grep -Pi '^\s*password\s+.*\bpam_unix\.so\b' "$f" 2>/dev/null || true)
  session=$(grep -Pi '^\s*session\s+.*\bpam_unix\.so\b' "$f" 2>/dev/null || true)

  if [ -n "$auth" ] && [ -n "$account" ] && [ -n "$password" ] && [ -n "$session" ]; then
    echo "ok"
  else
    msg="missing:"
    [ -z "$auth" ] && msg="$msg auth"
    [ -z "$account" ] && msg="$msg account"
    [ -z "$password" ] && msg="$msg password"
    [ -z "$session" ] && msg="$msg session"
    echo "$msg"
  fi
}

status_pw=$(check_file "/etc/pam.d/password-auth")
status_sys=$(check_file "/etc/pam.d/system-auth")

if [ "$status_pw" = "ok" ] && [ "$status_sys" = "ok" ]; then
  echo "password-auth=ok; system-auth=ok" >>p3
  echo "Yes" >>p4
else
  echo "password-auth=${status_pw}; system-auth=${status_sys}" >>p3
  echo "No" >>p4
fi

echo "5.3.2.5" >>p12

#########################################################################################################

# 5.3.3.1.1
# Ensure password failed attempts lockout is configured (Automated)

echo "Access Control / Configure PAM" >>p1
echo "Ensure password failed attempts lockout is configured" >>p2

# 1) /etc/security/faillock.conf must set deny=1..5 (inclusive)
faillock_conf_match=$(grep -Pi '^\s*deny\s*=\s*[1-5]\b' /etc/security/faillock.conf 2>/dev/null || true)

# 2) PAM stacks must NOT set deny=0 or deny>=6 on pam_faillock.so in these files
pam_files_invalid=$(grep -Pi '^\s*auth\s+(requisite|required|sufficient)\s+pam_faillock\.so\s+([^#\n\r]+\s+)?deny\s*=\s*(0|[6-9]|[1-9][0-9]+)\b' \
/etc/pam.d/system-auth /etc/pam.d/password-auth 2>/dev/null || true)

if [ -n "$faillock_conf_match" ] && [ -z "$pam_files_invalid" ]; then
  # PASS: grab configured deny value for reporting
  faillock_deny_value=$(echo "$faillock_conf_match" | head -n1 | awk -F= '{gsub(/[ \t]/,"",$2); print $2}')
  echo "faillock.conf deny=$faillock_deny_value; pam_invalid_deny=none" >>p3
  echo "Yes" >>p4
else
  # FAIL: summarize issues
  conf_status=$([ -n "$faillock_conf_match" ] && echo "ok" || echo "missing_or_out_of_range")
  pam_invalid_compact=$(echo "$pam_files_invalid" | tr '\n' ';' | sed 's/;*$//')
  echo "faillock_conf=$conf_status; pam_invalid_deny=${pam_invalid_compact:-none}" >>p3
  echo "No" >>p4
fi

echo "5.3.3.1.1" >>p12

#########################################################################################################

# 5.3.3.1.2
# Ensure password unlock time is configured (Automated)

echo "Access Control / Configure PAM" >>p1
echo "Ensure password unlock time is configured" >>p2

# Condition 1: unlock_time must be 0, 900, or >= 900 in faillock.conf
valid_unlock_conf=$(grep -Pi '^\s*unlock_time\s*=\s*(0|9[0-9][0-9]|[1-9][0-9]{3,})\b' \
/etc/security/faillock.conf 2>/dev/null || true)

# Condition 2: invalid unlock_time values (1–899) must NOT appear in PAM stacks
invalid_unlock_pam=$(grep -Pi '^\s*auth\s+(requisite|required|sufficient)\s+pam_faillock\.so\s+([^#\n\r]+\s+)?unlock_time\s*=\s*([1-9]|[1-9][0-9]|[1-8][0-9][0-9])\b' \
/etc/pam.d/system-auth /etc/pam.d/password-auth 2>/dev/null || true)

if [ -n "$valid_unlock_conf" ] && [ -z "$invalid_unlock_pam" ]; then
    conf_value=$(echo "$valid_unlock_conf" | head -n1 | awk -F= '{gsub(/[ \t]/,"",$2); print $2}')
    echo "unlock_time_valid=$conf_value; pam_invalid_unlock=none" >>p3
    echo "Yes" >>p4
else
    conf_status=$([ -n "$valid_unlock_conf" ] && echo ok || echo missing_or_out_of_range)
    pam_hits=$(echo "$invalid_unlock_pam" | tr '\n' ';' | sed 's/;*$//')
    echo "unlock_time_conf=$conf_status; pam_invalid_unlock=${pam_hits:-none}" >>p3
    echo "No" >>p4
fi

echo "5.3.3.1.2" >>p12

#########################################################################################################

# 5.3.3.2.1
# Ensure password number of changed characters is configured (Automated)

echo "Access Control / Configure PAM" >>p1
echo "Ensure password number of changed characters is configured" >>p2

# Condition 1: pwquality config must set difok >= 2
pwq_difok_valid=$(grep -Psi '^\s*difok\s*=\s*([2-9]|[1-9][0-9]+)\b' \
/etc/security/pwquality.conf /etc/security/pwquality.conf.d/*.conf 2>/dev/null || true)

# Condition 2: PAM stacks must NOT set difok=0 or difok=1
pam_difok_invalid=$(grep -Psi '^\s*password\s+(requisite|required|sufficient)\s+pam_pwquality\.so\s+([^#\n\r]+\s+)?difok\s*=\s*([0-1])\b' \
/etc/pam.d/system-auth /etc/pam.d/password-auth 2>/dev/null || true)

if [ -n "$pwq_difok_valid" ] && [ -z "$pam_difok_invalid" ]; then
  # PASS: include the first matching difok value for transparency
  difok_value=$(echo "$pwq_difok_valid" | head -n1 | awk -F= '{gsub(/[ \t]/,"",$2); print $2}')
  echo "pwquality.difok=$difok_value; pam_invalid_difok=none" >>p3
  echo "Yes" >>p4
else
  # FAIL: summarize status and any invalid hits
  conf_status=$([ -n "$pwq_difok_valid" ] && echo ok || echo missing_or_below_2)
  pam_hits=$(echo "$pam_difok_invalid" | tr '\n' ';' | sed 's/;*$//')
  echo "pwquality_conf=$conf_status; pam_invalid_difok=${pam_hits:-none}" >>p3
  echo "No" >>p4
fi

echo "5.3.3.2.1" >>p12

#########################################################################################################

# 5.3.3.2.2
# Ensure password length is configured (Automated)

echo "Access Control / Configure PAM" >>p1
echo "Ensure password length is configured" >>p2

# Condition 1: pwquality config must set minlen >= 14
pwq_minlen_valid=$(grep -Psi '^\s*minlen\s*=\s*(1[4-9]|[2-9][0-9]|[1-9][0-9]{2,})\b' \
/etc/security/pwquality.conf /etc/security/pwquality.conf.d/*.conf 2>/dev/null || true)

# Condition 2: PAM arguments must NOT set minlen ≤ 13
pam_minlen_invalid=$(grep -Psi '^\s*password\s+(requisite|required|sufficient)\s+pam_pwquality\.so\s+([^#\n\r]+\s+)?minlen\s*=\s*([0-9]|1[0-3])\b' \
/etc/pam.d/system-auth /etc/pam.d/password-auth 2>/dev/null || true)

if [ -n "$pwq_minlen_valid" ] && [ -z "$pam_minlen_invalid" ]; then
    minlen_value=$(echo "$pwq_minlen_valid" | head -n1 | awk -F= '{gsub(/[ \t]/,"",$2); print $2}')
    echo "pwquality.minlen=$minlen_value; pam_invalid_minlen=none" >>p3
    echo "Yes" >>p4
else
    conf_status=$([ -n "$pwq_minlen_valid" ] && echo ok || echo missing_or_below_14)
    pam_hits=$(echo "$pam_minlen_invalid" | tr '\n' ';' | sed 's/;*$//')
    echo "pwquality_conf=$conf_status; pam_invalid_minlen=${pam_hits:-none}" >>p3
    echo "No" >>p4
fi

echo "5.3.3.2.2" >>p12

#########################################################################################################

# 5.3.3.2.4
# Ensure password same consecutive characters is configured (Automated)

echo "Access Control / Configure PAM" >>p1
echo "Ensure password same consecutive characters is configured" >>p2

# Condition 1: pwquality config must set maxrepeat=1..3 (not 0)
pwq_maxrepeat_valid=$(grep -Psi '^\s*maxrepeat\s*=\s*[1-3]\b' \
/etc/security/pwquality.conf /etc/security/pwquality.conf.d/*.conf 2>/dev/null || true)

# Condition 2: PAM must NOT set maxrepeat=0 or >=4
pam_maxrepeat_invalid=$(grep -Psi '^\s*password\s+(requisite|required|sufficient)\s+pam_pwquality\.so\s+([^#\n\r]+\s+)?maxrepeat\s*=\s*(0|[4-9]|[1-9][0-9]+)\b' \
/etc/pam.d/system-auth /etc/pam.d/password-auth 2>/dev/null || true)

if [ -n "$pwq_maxrepeat_valid" ] && [ -z "$pam_maxrepeat_invalid" ]; then
    # Show the configured value for transparency
    maxrepeat_value=$(echo "$pwq_maxrepeat_valid" | head -n1 | awk -F= '{gsub(/[ \t]/,"",$2); print $2}')
    echo "pwquality.maxrepeat=$maxrepeat_value; pam_invalid_maxrepeat=none" >>p3
    echo "Yes" >>p4
else
    conf_status=$([ -n "$pwq_maxrepeat_valid" ] && echo ok || echo missing_or_out_of_range)
    pam_hits=$(echo "$pam_maxrepeat_invalid" | tr '\n' ';' | sed 's/;*$//')
    echo "pwquality_conf=$conf_status; pam_invalid_maxrepeat=${pam_hits:-none}" >>p3
    echo "No" >>p4
fi

echo "5.3.3.2.4" >>p12

#########################################################################################################

# 5.3.3.2.5
# Ensure password maximum sequential characters is configured (Automated)

echo "Access Control / Configure PAM" >>p1
echo "Ensure password maximum sequential characters is configured" >>p2

# Condition 1: pwquality config must set maxsequence = 1..3 (not 0)
pwq_maxsequence_valid=$(grep -Psi '^\s*maxsequence\s*=\s*[1-3]\b' \
/etc/security/pwquality.conf /etc/security/pwquality.conf.d/*.conf 2>/dev/null || true)

# Condition 2: PAM must NOT set maxsequence to 0 or >= 4
pam_maxsequence_invalid=$(grep -Psi '^\s*password\s+(requisite|required|sufficient)\s+pam_pwquality\.so\s+([^#\n\r]+\s+)?maxsequence\s*=\s*(0|[4-9]|[1-9][0-9]+)\b' \
/etc/pam.d/system-auth /etc/pam.d/password-auth 2>/dev/null || true)

if [ -n "$pwq_maxsequence_valid" ] && [ -z "$pam_maxsequence_invalid" ]; then
    # Show the configured value for transparency
    maxsequence_value=$(echo "$pwq_maxsequence_valid" | head -n1 | awk -F= '{gsub(/[ \t]/,"",$2); print $2}')
    echo "pwquality.maxsequence=$maxsequence_value; pam_invalid_maxsequence=none" >>p3
    echo "Yes" >>p4
else
    conf_status=$([ -n "$pwq_maxsequence_valid" ] && echo ok || echo missing_or_out_of_range)
    pam_hits=$(echo "$pam_maxsequence_invalid" | tr '\n' ';' | sed 's/;*$//')
    echo "pwquality_conf=$conf_status; pam_invalid_maxsequence=${pam_hits:-none}" >>p3
    echo "No" >>p4
fi

echo "5.3.3.2.5" >>p12

#########################################################################################################

# 5.3.3.2.6
# Ensure password dictionary check is enabled (Automated)

echo "Access Control / Configure PAM" >>p1
echo "Ensure password dictionary check is enabled" >>p2

# Condition 1: pwquality must NOT disable dictcheck (dictcheck=0)
pwq_dictcheck_disabled=$(grep -Psi '^\s*dictcheck\s*=\s*0\b' \
/etc/security/pwquality.conf /etc/security/pwquality.conf.d/*.conf 2>/dev/null || true)

# Condition 2: PAM must NOT disable dictcheck via module args (dictcheck=0)
pam_dictcheck_disabled=$(grep -Psi '^\s*password\s+(requisite|required|sufficient)\s+pam_pwquality\.so\s+([^#\n\r]+\s+)?dictcheck\s*=\s*0\b' \
/etc/pam.d/system-auth /etc/pam.d/password-auth 2>/dev/null || true)

if [ -z "$pwq_dictcheck_disabled" ] && [ -z "$pam_dictcheck_disabled" ]; then
  echo "pwquality=dictcheck enabled (no dictcheck=0); pam=dictcheck enabled (no dictcheck=0)" >>p3
  echo "Yes" >>p4
else
  pwq_hits=$(echo "$pwq_dictcheck_disabled" | tr '\n' ';' | sed 's/;*$//')
  pam_hits=$(echo "$pam_dictcheck_disabled" | tr '\n' ';' | sed 's/;*$//')
  echo "pwquality_disabled=[${pwq_hits:-none}]; pam_disabled=[${pam_hits:-none}]" >>p3
  echo "No" >>p4
fi

echo "5.3.3.2.6" >>p12

#########################################################################################################

# 5.3.3.2.7
# Ensure password quality is enforced for the root user (Automated)

echo "Access Control / Configure PAM" >>p1
echo "Ensure password quality is enforced for the root user" >>p2

# Check pwquality configuration for enforce_for_root
pwq_enforce_for_root=$(grep -Psi '^\s*enforce_for_root\b' \
/etc/security/pwquality.conf /etc/security/pwquality.conf.d/*.conf 2>/dev/null || true)

if [ -n "$pwq_enforce_for_root" ]; then
  compact=$(echo "$pwq_enforce_for_root" | tr '\n' ';' | sed 's/;*$//')
  echo "enforce_for_root present: [${compact}]" >>p3
  echo "Yes" >>p4
else
  echo "enforce_for_root not found in pwquality configuration" >>p3
  echo "No" >>p4
fi

echo "5.3.3.2.7" >>p12


#########################################################################################################

# 5.3.3.3.1
# Ensure password history remember is configured (Automated)

echo "Access Control / Configure PAM" >>p1
echo "Ensure password history remember is configured" >>p2

# Condition 1: pwhistory.conf must set remember >= 24
pwhistory_remember_valid=$(grep -Pi '^\s*remember\s*=\s*(2[4-9]|[3-9][0-9]|[1-9][0-9]{2,})\b' \
/etc/security/pwhistory.conf 2>/dev/null || true)

# Condition 2: PAM must NOT set remember < 24 on pam_pwhistory.so
pam_remember_invalid=$(grep -Pi '^\s*password\s+(requisite|required|sufficient)\s+pam_pwhistory\.so\s+([^#\n\r]+\s+)?remember=(2[0-3]|1[0-9]|[0-9])\b' \
/etc/pam.d/system-auth /etc/pam.d/password-auth 2>/dev/null || true)

if [ -n "$pwhistory_remember_valid" ] && [ -z "$pam_remember_invalid" ]; then
    remember_value=$(echo "$pwhistory_remember_valid" | head -n1 | awk -F= '{gsub(/[ \t]/,"",$2); print $2}')
    echo "pwhistory.remember=$remember_value; pam_invalid_remember=none" >>p3
    echo "Yes" >>p4
else
    conf_status=$([ -n "$pwhistory_remember_valid" ] && echo ok || echo missing_or_below_24)
    pam_hits=$(echo "$pam_remember_invalid" | tr '\n' ';' | sed 's/;*$//')
    echo "pwhistory_conf=$conf_status; pam_invalid_remember=${pam_hits:-none}" >>p3
    echo "No" >>p4
fi

echo "5.3.3.3.1" >>p12

#########################################################################################################

# 5.3.3.3.2
# Ensure password history is enforced for the root user (Automated)

echo "Access Control / Configure PAM" >>p1
echo "Ensure password history is enforced for the root user" >>p2

hit=$(grep -Pi '^\s*enforce_for_root\b' /etc/security/pwhistory.conf 2>/dev/null || true)

if [ -n "$hit" ]; then
  compact=$(echo "$hit" | tr '\n' ';' | sed 's/;*$//')
  echo "pwhistory.enforce_for_root present: [${compact}]" >>p3
  echo "Yes" >>p4
else
  echo "pwhistory.enforce_for_root not found in /etc/security/pwhistory.conf" >>p3
  echo "No" >>p4
fi

echo "5.3.3.3.2" >>p12

#########################################################################################################

# 5.3.3.3.3
# Ensure pam_pwhistory includes use_authtok (Automated)

echo "Access Control / Configure PAM" >>p1
echo "Ensure pam_pwhistory includes use_authtok" >>p2

pw_line=$(grep -Pi '^\s*password\s+[^#\n\r]+\s+pam_pwhistory\.so\s+([^#\n\r]+\s+)?use_authtok\b' /etc/pam.d/password-auth 2>/dev/null || true)
sys_line=$(grep -Pi '^\s*password\s+[^#\n\r]+\s+pam_pwhistory\.so\s+([^#\n\r]+\s+)?use_authtok\b' /etc/pam.d/system-auth 2>/dev/null || true)

if [ -n "$pw_line" ] && [ -n "$sys_line" ]; then
  echo "password-auth=ok; system-auth=ok" >>p3
  echo "Yes" >>p4
else
  pa_status=$([ -n "$pw_line" ] && echo ok || echo missing)
  sa_status=$([ -n "$sys_line" ] && echo ok || echo missing)
  echo "password-auth=$pa_status; system-auth=$sa_status" >>p3
  echo "No" >>p4
fi

echo "5.3.3.3.3" >>p12

#########################################################################################################

# 5.3.3.4.1
# Ensure pam_unix does not include nullok (Automated)

echo "Access Control / Configure PAM" >>p1
echo "Ensure pam_unix does not include nullok" >>p2

# Gather all pam_unix.so lines from the required stacks in the two files
pam_unix_lines=$(grep -Pi '^\s*(auth|account|password|session)\s+(requisite|required|sufficient)\s+pam_unix\.so\b.*' \
/etc/pam.d/password-auth /etc/pam.d/system-auth 2>/dev/null || true)

# From those lines, detect any that include 'nullok'
pam_unix_with_nullok=$(printf '%s\n' "$pam_unix_lines" | grep -Pi '\bnullok\b' || true)

if [ -z "$pam_unix_with_nullok" ]; then
  # PASS: either no pam_unix lines, or none include nullok
  count=$(printf '%s\n' "$pam_unix_lines" | sed '/^\s*$/d' | wc -l)
  echo "pam_unix lines checked=$count; nullok=absent" >>p3
  echo "Yes" >>p4
else
  # FAIL: at least one pam_unix line includes nullok
  bad=$(echo "$pam_unix_with_nullok" | tr '\n' ';' | sed 's/;*$//')
  echo "nullok present on pam_unix lines: [${bad}]" >>p3
  echo "No" >>p4
fi

echo "5.3.3.4.1" >>p12

#########################################################################################################

# 5.3.3.4.2
# Ensure pam_unix does not include remember (Automated)

echo "Access Control / Configure PAM" >>p1
echo "Ensure pam_unix does not include remember" >>p2

# Step 1: Collect pam_unix.so lines from password-auth and system-auth
pam_unix_password_lines=$(grep -Pi '^\s*password\s+([^#\n\r]+\s+)?pam_unix\.so\b.*' \
/etc/pam.d/password-auth /etc/pam.d/system-auth 2>/dev/null || true)

# Step 2: From those lines, detect any use of remember=<n>
pam_unix_with_remember=$(printf '%s\n' "$pam_unix_password_lines" | grep -Pi '\bremember=\d+\b' || true)

if [ -z "$pam_unix_with_remember" ]; then
  # PASS: no remember arguments found
  count=$(printf '%s\n' "$pam_unix_password_lines" | sed '/^\s*$/d' | wc -l)
  echo "pam_unix password lines checked=$count; remember=absent" >>p3
  echo "Yes" >>p4
else
  # FAIL: at least one remember=<n> detected
  bad=$(echo "$pam_unix_with_remember" | tr '\n' ';' | sed 's/;*$//')
  echo "remember present on pam_unix lines: [${bad}]" >>p3
  echo "No" >>p4
fi

echo "5.3.3.4.2" >>p12

#########################################################################################################

# 5.3.3.4.3
# Ensure pam_unix includes a strong password hashing algorithm (Automated)

echo "Access Control / Configure PAM" >>p1
echo "Ensure pam_unix includes a strong password hashing algorithm" >>p2

# Check for sha512 or yescrypt on pam_unix.so lines in the password stack
pw_line=$(grep -Pi '^\s*password\s+[^#\n\r]+\s+pam_unix\.so\s+([^#\n\r]+\s+)?(sha512|yescrypt)\b' /etc/pam.d/password-auth 2>/dev/null || true)
sys_line=$(grep -Pi '^\s*password\s+[^#\n\r]+\s+pam_unix\.so\s+([^#\n\r]+\s+)?(sha512|yescrypt)\b' /etc/pam.d/system-auth 2>/dev/null || true)

if [ -n "$pw_line" ] && [ -n "$sys_line" ]; then
  echo "password-auth=ok; system-auth=ok" >>p3
  echo "Yes" >>p4
else
  pa_status=$([ -n "$pw_line" ] && echo ok || echo missing)
  sa_status=$([ -n "$sys_line" ] && echo ok || echo missing)
  echo "password-auth=$pa_status; system-auth=$sa_status" >>p3
  echo "No" >>p4
fi

echo "5.3.3.4.3" >>p12

#########################################################################################################

# 5.3.3.4.4
# Ensure pam_unix includes use_authtok (Automated)

echo "Access Control / Configure PAM" >>p1
echo "Ensure pam_unix includes use_authtok" >>p2

pw_line=$(grep -Pi '^\s*password\s+[^#\n\r]+\s+pam_unix\.so\s+([^#\n\r]+\s+)?use_authtok\b' \
/etc/pam.d/password-auth 2>/dev/null || true)

sys_line=$(grep -Pi '^\s*password\s+[^#\n\r]+\s+pam_unix\.so\s+([^#\n\r]+\s+)?use_authtok\b' \
/etc/pam.d/system-auth 2>/dev/null || true)

if [ -n "$pw_line" ] && [ -n "$sys_line" ]; then
    echo "password-auth=ok; system-auth=ok" >>p3
    echo "Yes" >>p4
else
    pa_status=$([ -n "$pw_line" ] && echo ok || echo missing)
    sa_status=$([ -n "$sys_line" ] && echo ok || echo missing)
    echo "password-auth=$pa_status; system-auth=$sa_status" >>p3
    echo "No" >>p4
fi

echo "5.3.3.4.4" >>p12

#########################################################################################################

# 5.4.1.1
# Ensure password expiration is configured (Automated)

section="Access Control / User Accounts and Environment"
check="Ensure password expiration is configured"

passmax=$(grep -Pi '^\h*PASS_MAX_DAYS\h+\d+\b' /etc/login.defs | awk '{print $2}')

issue_count=0

# Check login.defs first
if [ -z "$passmax" ] || [ "$passmax" -gt 365 ]; then
    echo "$section" >>p1
    echo "$check" >>p2
    echo "PASS_MAX_DAYS in /etc/login.defs is $passmax and should be 365 or less" >>p3
    echo "No" >>p4
    echo "5.4.1.1" >>p12
    issue_count=$((issue_count+1))
fi

# Check each user in /etc/shadow
while IFS=: read -r user pass lastchg min max warn inactive expire flag
do
    if [[ "$pass" =~ ^\$ ]]; then
        if [ "$max" -gt 365 ] || [ "$max" -lt 1 ]; then
            echo "$section" >>p1
            echo "$check" >>p2
            echo "User $user PASS_MAX_DAYS is $max and should be between 1 and 365" >>p3
            echo "No" >>p4
            echo "5.4.1.1" >>p12
            issue_count=$((issue_count+1))
        fi
    fi
done < /etc/shadow

# PASS condition
if [ "$issue_count" -eq 0 ]; then
    echo "$section" >>p1
    echo "$check" >>p2
    echo "PASS_MAX_DAYS is $passmax and all users PASS_MAX_DAYS are within policy" >>p3
    echo "Yes" >>p4
    echo "5.4.1.1" >>p12
fi

#########################################################################################################

#5.4.1.3
#Ensure password expiration warning days is configured
# File to check
filelo="/etc/login.defs"
# Function to check PASS_WARN_AGE
check_pass_warn_age() {
    # Use grep to find the PASS_WARN_AGE line
    current_value=$(grep "^PASS_WARN_AGE" "$filelo" | awk '{print $2}')

    # If PASS_WARN_AGE is found
    if [[ -n "$current_value" ]]; then
        if [[ "$current_value" -ge 7 ]]; then
            echo "Compliant: PASS_WARN_AGE is $current_value days"
                        echo "Access Control / User Accounts and Environment" >> p1
                        echo "Ensure password expiration warning days is configured" >> p2
                        echo "PASS_WARN_AGE is $current_value days" >> p3
                        echo "5.4.1.3" >> p12
                        echo "Yes" >> p4
        elif [[ "$current_value" -eq 0 ]]; then
            echo "Non-compliant: PASS_WARN_AGE is $current_value"
                        echo "Access Control / User Accounts and Environment" >> p1
                        echo "Ensure password expiration warning days is configured" >> p2
                        echo "PASS_WARN_AGE is $current_value" >> p3
                        echo "5.4.1.3" >> p12
                        echo "No" >> p4
        elif [[ "$current_value" -lt 7 ]]; then
            echo "Non-compliant: PASS_WARN_AGE is $current_value"
                        echo "Access Control / User Accounts and Environment" >> p1
                        echo "Ensure password expiration warning days is configured" >> p2
                        echo "PASS_WARN_AGE is $current_value" >> p3
                        echo "5.4.1.3" >> p12
                        echo "No" >> p4
        elif [[ "$current_value" -eq -1 ]]; then
            echo "Non-compliant: PASS_WARN_AGE is $current_value"
                        echo "Access Control / User Accounts and Environment" >> p1
                        echo "Ensure password expiration warning days is configured" >> p2
                        echo "PASS_WARN_AGE is $current_value" >> p3
                        echo "5.4.1.3" >> p12
                        echo "No" >> p4
        fi
    else
        echo "PASS_WARN_AGE is not set in $filelo."
    fi
}

# Run the function to check PASS_WARN_AGE
check_pass_warn_age
# Function to check PASS_WARN_AGE for a user
check_user_pass_warn_age() {
    local user="$1"

    # Use chage to get the password expiration warning days for the user
    pass_warn_age=$(chage -l "$user" | grep "warning" | awk -F: '{print $2}' | xargs)

    if [[ -n "$pass_warn_age" ]]; then
        if [[ "$pass_warn_age" -ge 7 ]]; then
            echo "Compliant: $user has PASS_WARN_AGE set to $pass_warn_age days (7 or more)."
                        echo "Access Control / User Accounts and Environment" >> p1
                        echo "Ensure password expiration warning days is configured" >> p2
                        echo "$user has PASS_WARN_AGE set to $pass_warn_age days" >> p3
                        echo "Yes" >> p4
                        echo "5.4.1.3" >> p12
        else
            echo "Non-compliant: $user has PASS_WARN_AGE set to $pass_warn_age days (less than 7)."
                        echo "Access Control / User Accounts and Environment" >> p1
                        echo "Ensure password expiration warning days is configured" >> p2
                        echo "$user has PASS_WARN_AGE set to $pass_warn_age days" >> p3
                        echo "5.4.1.3" >> p12
                        echo "No" >> p4
        fi
    else
        echo "Non-compliant: $user's PASS_WARN_AGE is not set or unknown."
                echo "Access Control / User Accounts and Environment" >> p1
                echo "Ensure password expiration warning days is configured" >> p2
                echo "$user's PASS_WARN_AGE is not set or unknown" >> p3
                echo "5.4.1.3" >> p12
                echo "No" >> p4
    fi
}

# Extract users with passwords set from /etc/shadow
users=$(awk -F: '/^[^:\n\r]+:[^!\*xX\n\r]/ {print $1}' /etc/shadow)

# Loop through the users and check their password expiration warning
for user in $users; do
    # Check if the user has a password set using the passwd command
    passwd_status=$(passwd -S "$user" | awk '{print $2}')

    if [[ "$passwd_status" == "PS" ]]; then
        # If the user has a password set, check the PASS_WARN_AGE
        check_user_pass_warn_age "$user"
    else
        echo "Exempt: $user does not have a password set (status: $passwd_status)."
    fi
done

#########################################################################################################

# 5.4.1.4
# Ensure strong password hashing algorithm is configured (Automated)

echo "Access Control / User Accounts and Environment" >>p1
echo "Ensure strong password hashing algorithm is configured" >>p2

hit=$(grep -Pi '^\s*ENCRYPT_METHOD\s+(SHA512|YESCRYPT)\b' /etc/login.defs 2>/dev/null || true)

if [ -n "$hit" ]; then
  # Extract the method for display
  method=$(echo "$hit" | awk '{print $2}' | head -n1)
  echo "ENCRYPT_METHOD=${method}" >>p3
  echo "Yes" >>p4
else
  # Show current setting if present (for troubleshooting)
  current=$(grep -Pi '^\s*ENCRYPT_METHOD\s+\S+\b' /etc/login.defs 2>/dev/null | awk '{print $2}' | head -n1)
  echo "ENCRYPT_METHOD=${current:-unset_or_weak} (expected SHA512 or YESCRYPT)" >>p3
  echo "No" >>p4
fi

echo "5.4.1.4" >>p12

#########################################################################################################

#5.4.1.5
#Ensure inactive password lock is configured (Automated)
{
 l_output="" l_output2=""
 l_inactive="$(useradd -D 2>/dev/null | grep -i 'INACTIVE' | awk -F= '{print $2}')"
 if [ -z "$l_inactive" ] || [ "$l_inactive" -eq -1 ] 2>/dev/null; then
  l_output2="$l_output2 Default INACTIVE is set to ${l_inactive:--1} (disabled). Required: 1-45."
 elif [ "$l_inactive" -gt 45 ] 2>/dev/null; then
  l_output2="$l_output2 Default INACTIVE is set to $l_inactive. Required: 1-45."
 else
  l_output="Default INACTIVE is set to $l_inactive (compliant)."
 fi
 while IFS=: read -r l_user _ _ _ _ _ l_uinactive _; do
  if [ -z "$l_uinactive" ] || [ "$l_uinactive" -eq -1 ] 2>/dev/null; then
   l_output2="$l_output2 User $l_user has INACTIVE=${l_uinactive:--1} (disabled). Required: 1-45."
  elif [ "$l_uinactive" -gt 45 ] 2>/dev/null; then
   l_output2="$l_output2 User $l_user has INACTIVE=$l_uinactive (exceeds 45)."
  fi
 done < <(awk -F: '/^[^:]+:[^!*]/{print}' /etc/shadow 2>/dev/null)
 if [ -z "$l_output2" ]; then
  echo "Access Control / User Accounts and Environment" >> p1
  echo "Ensure inactive password lock is configured" >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.4.1.5" >> p12
 else
  echo "Access Control / User Accounts and Environment" >> p1
  echo "Ensure inactive password lock is configured" >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.4.1.5" >> p12
 fi
}

#########################################################################################################

# 5.4.1.6
# Ensure all users last password change date is in the past (Automated)

echo "Access Control / User Accounts and Environment" >>p1
echo "Ensure all users last password change date is in the past" >>p2

offenders=""

# Iterate local users with hashed passwords ($...$ in shadow)
while IFS=: read -r user _; do
  # Get the 'Last password change' line; skip if 'never'
  lp_line=$(chage --list "$user" 2>/dev/null | grep '^Last password change' | cut -d: -f2- | sed 's/^[ \t]*//')
  [ -z "$lp_line" ] && continue
  echo "$lp_line" | grep -qi 'never$' && continue

  # Convert to epoch; if parse fails, skip user to avoid false positives
  lp_epoch=$(date -d "$lp_line" +%s 2>/dev/null || echo "")
  [ -z "$lp_epoch" ] && continue

  now_epoch=$(date +%s)
  if [ "$lp_epoch" -gt "$now_epoch" ] 2>/dev/null; then
    offenders+="$user:$lp_line;"
  fi
done < <(awk -F: '$2~/^\$.+\$/{print $1":"$2}' /etc/shadow 2>/dev/null)

if [ -z "$offenders" ]; then
  echo "All users have last password change date in the past (no future-dated changes detected)" >>p3
  echo "Yes" >>p4
else
  echo "Users with future-dated last password change: [${offenders%;}]" >>p3
  echo "No" >>p4
fi

echo "5.4.1.6" >>p12

#########################################################################################################

# 5.4.2.1
# Ensure root is the only UID 0 account

echo "Access Control / User Accounts and Environment" >>p1
echo "Ensure root is the only UID 0 account" >>p2

uid0_users=$(awk -F: '($3 == 0) { print $1 }' /etc/passwd 2>/dev/null | xargs)

if [ "$uid0_users" = "root" ]; then
  echo "UID0 users=[root]" >>p3
  echo "Yes" >>p4
else
  echo "UID0 users=[$uid0_users] (expected only root)" >>p3
  echo "No" >>p4
fi

echo "5.4.2.1" >>p12

#########################################################################################################

# 5.4.2.2
# Ensure root is the only GID 0 account

echo "Access Control / User Accounts and Environment" >>p1
echo "Ensure root is the only GID 0 account" >>p2

# Collect all accounts (excluding sync|shutdown|halt|operator) whose primary GID is 0
gid0_list=$(awk -F: '($1 !~ /^(sync|shutdown|halt|operator)$/ && $4=="0"){print $1":"$4}' /etc/passwd 2>/dev/null | xargs)

if [ "$gid0_list" = "root:0" ]; then
  echo "GID0 accounts=[root:0]" >>p3
  echo "Yes" >>p4
else
  # If none found or more than root found, report what we saw
  echo "GID0 accounts=[$gid0_list] (expected only root:0)" >>p3
  echo "No" >>p4
fi

echo "5.4.2.2" >>p12

#########################################################################################################

# 5.4.2.3
# Ensure group root is the only GID 0 group (Automated)

echo "Access Control / User Accounts and Environment" >>p1
echo "Ensure group root is the only GID 0 group" >>p2

gid0_groups=$(awk -F: '($3=="0"){print $1":"$3}' /etc/group 2>/dev/null | xargs)

if [ "$gid0_groups" = "root:0" ]; then
    echo "GID0 groups=[root:0]" >>p3
    echo "Yes" >>p4
else
    echo "GID0 groups=[$gid0_groups] (expected only root:0)" >>p3
    echo "No" >>p4
fi

echo "5.4.2.3" >>p12

#########################################################################################################

# 5.4.2.4
# Ensure root account access is controlled (Automated)

echo "Access Control / User Accounts and Environment" >>p1
echo "Ensure root account access is controlled" >>p2

# Get the root account status from passwd -S (field 2):
# Common values:
#   P or PS ...  -> password set (hash type may be SHA512/YESCRYPT)
#   L or LK .... -> account locked
#   NP ......... -> no password (not controlled)
st=$(passwd -S root 2>/dev/null | awk '{print $2}')

if echo "$st" | grep -Eq '^(P|PS|P.*)$'; then
  echo "root account is controlled (Password is Set)" >>p3
  echo "Yes" >>p4
elif echo "$st" | grep -Eq '^(L|LK)$'; then
  echo "root account is controlled (Password is Locked)" >>p3
  echo "Yes" >>p4
else
  echo "root account is NOT controlled" >>p3
  echo "No" >>p4
fi

echo "5.4.2.4" >>p12

#########################################################################################################

# 5.4.2.5
# Ensure root path integrity (Automated)

echo "Access Control / User Accounts and Environment" >>p1
echo "Ensure root path integrity" >>p2

issues=""

# Permissions mask to enforce max 0755 on PATH dirs
perm_mask='0022'
maxperm="$(printf '%o' $(( 0777 & ~perm_mask )))"

# Fetch root's PATH (login shell env)
root_path=$(sudo -Hiu root env 2>/dev/null | awk -F= '/^PATH=/{print $2}')

# Basic PATH format checks
echo "$root_path" | grep -q "::" && issues="${issues}empty_dir_entry(::); "
echo "$root_path" | grep -Pq ":\s*$" && issues="${issues}trailing_colon(:); "
echo "$root_path" | grep -Pq '(^|:)\.(?::|$)' && issues="${issues}current_dir(.); "

# Split PATH and validate each component
IFS=':' read -r -a path_elems <<< "$root_path"
for p in "${path_elems[@]}"; do
  # Skip empty—already flagged by :: check
  [ -z "$p" ] && continue

  if [ -d "$p" ]; then
    # Check owner and mode
    read -r fmode fown <<<"$(stat -Lc '%#a %U' "$p" 2>/dev/null || echo '')"
    if [ -z "$fmode" ]; then
      issues="${issues}\"$p\":stat_failed; "
      continue
    fi
    [ "$fown" != "root" ] && issues="${issues}\"$p\":owner=$fown(expected:root); "
    # more permissive than 0755? -> any of the perm_mask bits set
    om=$(( fmode & perm_mask ))
    [ "$om" -gt 0 ] && issues="${issues}\"$p\":mode=$fmode(expected:<=$maxperm); "
  else
    issues="${issues}\"$p\":not_a_directory; "
  fi
done

if [ -z "$issues" ]; then
  echo "root PATH OK; max_mode=$maxperm; no '.'/::/trailing ':'; all dirs root-owned" >>p3
  echo "Yes" >>p4
else
  echo "root PATH issues: ${issues% }" >>p3
  echo "No" >>p4
fi

echo "5.4.2.5" >>p12

#########################################################################################################

# 5.4.2.6
# Ensure root user umask is configured (Automated)

echo "Access Control / User Accounts and Environment" >>p1
echo "Ensure root user umask is configured" >>p2

# CIS audit regex: any match indicates a non-compliant umask definition
noncompliant_hits=$(grep -Psi -- '^\s*umask\s+(([0-7][0-7][01][0-7]\b|[0-7][0-7][0-7][0-6]\b)|([0-7][01][0-7]\b|[0-7][0-7][0-6]\b)|(u=[rwx]{1,3},)?(((g=[rx]?[rx]?w[rx]?[rx]?\b)(,o=[rwx]{1,3})?)|((g=[wrx]{1,3},)?o=[wrx]{1,3}\b)))' \
/root/.bash_profile /root/.bashrc 2>/dev/null || true)

if [ -z "$noncompliant_hits" ]; then
  echo "root umask OK in /root/.bash_profile and /root/.bashrc (no non-compliant entries found)" >>p3
  echo "Yes" >>p4
else
  compact=$(echo "$noncompliant_hits" | tr '\n' ';' | sed 's/;*$//')
  echo "Non-compliant umask entries: [${compact}]" >>p3
  echo "No" >>p4
fi

echo "5.4.2.6" >>p12

#########################################################################################################

# 5.4.2.7
# Ensure system accounts do not have a valid login shell (Automated)

echo "Access Control / User Accounts and Environment" >>p1
echo "Ensure system accounts do not have a valid login shell" >>p2

# Determine UID_MIN
uid_min=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs 2>/dev/null)
[ -z "$uid_min" ] && uid_min=1000

# Build regex of valid shells (exclude nologin)
valid_shells_re="^($(awk -F/ '$NF != "nologin" {print}' /etc/shells 2>/dev/null | sed -rn '/^\//{s,/,\\\\/,g;p}' | paste -s -d '|' -))$"

# Find system accounts (UID < UID_MIN or UID == 65534) that have a valid shell, excluding listed service accounts
offenders=$(awk -v pat="$valid_shells_re" -v min="$uid_min" -F: '
  ($1!~/^(root|halt|sync|shutdown|nfsnobody)$/ && ($3 < min || $3 == 65534) && $(NF) ~ pat) {
    print $1 ":" $7
  }' /etc/passwd 2>/dev/null)

if [ -z "$offenders" ]; then
  echo "All system accounts use non-interactive shells (no valid shells found)" >>p3
  echo "Yes" >>p4
else
  compact=$(echo "$offenders" | tr '\n' ';' | sed 's/;*$//')
  echo "System accounts with valid shells: [${compact}]" >>p3
  echo "No" >>p4
fi

echo "5.4.2.7" >>p12

#########################################################################################################

# 5.4.2.8
# Ensure accounts without a valid login shell are locked (Automated)
{
 l_output="" l_output2=""
 l_valid_shells="^($(sed -rn '/^\//{s,/,\\\\/,g;p}' /etc/shells | paste -s -d'|'))$"
 while IFS= read -r l_user; do
  l_shadow_pass="$(awk -F: -v u="$l_user" '$1==u {print $2}' /etc/shadow 2>/dev/null)"
  if [[ "$l_shadow_pass" != !* ]] && [[ "$l_shadow_pass" != \** ]] && [ -n "$l_shadow_pass" ]; then
   l_output2="$l_output2 Account \"$l_user\" has no valid login shell and is not locked"
  fi
 done < <(awk -v pat="$l_valid_shells" -F: '($1 != "root" && $(NF) !~ pat) {print $1}' /etc/passwd 2>/dev/null)
 if [ -z "$l_output2" ]; then
  echo "Access Control / User Accounts and Environment" >> p1
  echo "Ensure accounts without a valid login shell are locked" >> p2
  echo "All non-root accounts without a valid login shell are locked" >> p3
  echo "Yes" >> p4
  echo "5.4.2.8" >> p12
 else
  echo "Access Control / User Accounts and Environment" >> p1
  echo "Ensure accounts without a valid login shell are locked" >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.4.2.8" >> p12
 fi
}

#########################################################################################################

#5.4.3.2
#Ensure default user shell timeout is configured (Automated)
#!/usr/bin/env bash
{
output1="" output2=""
[ -f /etc/bashrc ] && BRC="/etc/bashrc"
for f in "$BRC" /etc/profile /etc/profile.d/*.sh ; do
grep -Pq '^\s*([^#]+\s+)?TMOUT=(900|[1-8][0-9][0-9]|[1-9][0-9]|[1-9])\b' "$f" && grep -Pq '^\s*([^#]+;\s*)?export\s+TMOUT(\s+|\s*;|\s*$|=(900|[1-8][0-9][0-9]|[1-9][0-9]|[1-9]))\b' "$f" && output1="$f"
done
grep -Pq '^\s*([^#]+\s+)?TMOUT=(9[0-9][1-9]|9[1-9][0-9]|0+|[1-9]\d{3,})\b' /etc/profile /etc/profile.d/*.sh "$BRC" && output2=$(grep -Ps '^\s*([^#]+\s+)?TMOUT=(9[0-9][1-9]|9[1-9][0-9]|0+|[1-9]\d{3,})\b' /etc/profile /etc/profile.d/*.sh $BRC)
if [ -n "$output1" ] && [ -z "$output2" ]; then
echo -e "\nPASSED\n\nTMOUT is configured in: \"$output1\"\n"
        echo "Access Control / User Accounts and Environment" >> p1
        echo "Ensure default user shell timeout is configured" >> p2
        echo "Default user shell timeout is 900 seconds or less" >> p3
        echo "Yes" >> p4
        echo "5.4.3.2" >> p12
else
[ -z "$output1" ] && echo -e "\nFAILED\n\nTMOUT is not configured\n" [ -n "$output2" ] && echo -e "\nFAILED\n\nTMOUT is incorrectly configured in: \"$output2\"\n"
        echo "Access Control / User Accounts and Environment" >> p1
        echo "Ensure default user shell timeout is configured" >> p2
        echo "Default user shell timeout is not 900 seconds or less" >> p3
        echo "No" >> p4
        echo "5.4.3.2" >> p12
   fi
}

#########################################################################################################

# 5.4.3.3
# Ensure default user umask is configured (Automated)

echo "Access Control / User Accounts and Environment" >>p1
echo "Ensure default user umask is configured" >>p2

# Good (compliant) umask: 027 or more restrictive, or symbolic u=rwx,g=rx,o=
good_shell_re='^\s*umask\s+(0?[0-7][2-7]7|u(=[rwx]{0,3}),g=([rx]{0,2}),o=)(\s*#.*)?$'
# Bad (non-compliant) umask: more permissive than 027, or incorrect symbolic
bad_shell_re='^\s*umask\s+(([0-7][0-7][01][0-7]\b|[0-7][0-7][0-7][0-6]\b)|([0-7][01][0-7]\b|[0-7][0-7][0-6]\b)|(u=[rwx]{1,3},)?(((g=[rx]?[rx]?w[rx]?[rx]?\b)(,o=[rwx]{1,3})?)|((g=[wrx]{1,3},)?o=[wrx]{1,3}\b)))'

# pam_umask good/bad patterns
good_pam_re='^\s*session\s+[^#\n\r]+\s+pam_umask\.so\s+([^#\n\r]+\s+)?umask=(0?[0-7][2-7]7)\b'
bad_pam_re='^\s*session\s+[^#\n\r]+\s+pam_umask\.so\s+([^#\n\r]+\s+)?umask=(([0-7][0-7][01][0-7]\b|[0-7][0-7][0-7][0-6]\b)|([0-7][01][0-7]\b))'

first_good=""; bad_hits=""

scan_file() {
  local f="$1"
  [ -f "$f" ] || return 0
  if grep -Psiq -- "$good_shell_re" "$f" 2>/dev/null; then
    [ -z "$first_good" ] && first_good="$f:$(grep -Psi -- "$good_shell_re" "$f" | head -n1 | tr -d '\r')"
  fi
  if grep -Psiq -- "$bad_shell_re" "$f" 2>/dev/null; then
    bad_hits="${bad_hits}${f}:$(grep -Psi -- "$bad_shell_re" "$f" | head -n1 | tr -d '\r'); "
  fi
}

# 1) /etc/profile.d/*.sh
while IFS= read -r -d '' f; do scan_file "$f"; done < <(find /etc/profile.d/ -type f -name '*.sh' -print0 2>/dev/null)

# 2) /etc/profile
[ -z "$first_good" ] && scan_file /etc/profile
# 3) /etc/bashrc and /etc/bash.bashrc
[ -z "$first_good" ] && scan_file /etc/bashrc
[ -z "$first_good" ] && scan_file /etc/bash.bashrc

# 4) pam_umask in /etc/pam.d/postlogin (only if still no good)
if [ -z "$first_good" ] && [ -f /etc/pam.d/postlogin ]; then
  if grep -Psiq -- "$good_pam_re" /etc/pam.d/postlogin 2>/dev/null; then
    first_good="/etc/pam.d/postlogin:$(grep -Psi -- "$good_pam_re" /etc/pam.d/postlogin | head -n1 | tr -d '\r')"
  fi
  if grep -Psiq -- "$bad_pam_re" /etc/pam.d/postlogin 2>/dev/null; then
    bad_hits="${bad_hits}/etc/pam.d/postlogin:$(grep -Psi -- "$bad_pam_re" /etc/pam.d/postlogin | head -n1 | tr -d '\r'); "
  fi
fi

# 5) /etc/login.defs
[ -z "$first_good" ] && scan_file /etc/login.defs
# 6) /etc/default/login
[ -z "$first_good" ] && scan_file /etc/default/login

# Decide
if [ -n "$first_good" ] && [ -z "$bad_hits" ]; then
  echo "umask compliant at: ${first_good}; no invalid umask found" >>p3
  echo "Yes" >>p4
else
  echo "compliant=${first_good:-none}; invalid=${bad_hits:-none}" >>p3
  echo "No" >>p4
fi

echo "5.4.3.3" >>p12

###################################Logging and Auditing###################################################

# 6.1.1
# Ensure AIDE is installed (Automated)

echo "Logging and Auditing / Configure Integrity Checking" >>p1
echo "Ensure AIDE is installed" >>p2

if rpm -q aide >/dev/null 2>&1; then
  echo "aide is installed: $(rpm -q aide)" >>p3
  echo "Yes" >>p4
else
  echo "aide package is not installed" >>p3
  echo "No" >>p4
fi

echo "6.1.1" >>p12

#########################################################################################################

# 6.1.2
# Ensure filesystem integrity is regularly checked (Automated)

echo "Logging and Auditing / Configure Integrity Checking" >>p1
echo "Ensure filesystem integrity is regularly checked" >>p2

# 1) Check for AIDE cron jobs (suppress all errors)
cron_hits=$(grep -Ers -- \
'(^([^#]+\s+)?(/usr/s?bin/|^\s*)aide(\.wrapper)?\s+([^-#\n\r]\S*\s+)*(-{1,2}(check|update)|\$AIDEARGS)\b)' \
/etc/cron.* /etc/crontab /var/spool/cron 2>/dev/null || true)

# 2) Check systemd units (redirect BOTH stdout and stderr to /dev/null)
svc_en=$(systemctl is-enabled aidecheck.service >/dev/null 2>&1 && echo enabled || echo disabled)
tmr_en=$(systemctl is-enabled aidecheck.timer   >/dev/null 2>&1 && echo enabled || echo disabled)
tmr_ac=$(systemctl is-active  aidecheck.timer   >/dev/null 2>&1 && echo active  || echo inactive)

# --- PASS/FAIL decision logic ---
if [ -n "$cron_hits" ] || { [ "$svc_en" = "enabled" ] && [ "$tmr_en" = "enabled" ] && [ "$tmr_ac" = "active" ]; }; then
    # PASS
    echo "AIDE service is running daily to check filesystem integrity" >>p3
    echo "Yes" >>p4
else
    # FAIL — include full diagnostic text in p3
    cron_summary=$( [ -n "$cron_hits" ] && echo "cron_found" || echo "none" )
    echo "no valid AIDE schedule; cron_sample=[$cron_summary]; aidecheck.service=$svc_en; aidecheck.timer=$tmr_en/$tmr_ac" >>p3
    echo "No" >>p4
fi

echo "6.1.2" >>p12

#########################################################################################################

# 6.1.3
# Ensure cryptographic mechanisms are used to protect the integrity of audit tools (Automated)

echo "Logging and Auditing / Configure Integrity Checking" >>p1
echo "Ensure cryptographic mechanisms are used to protect the integrity of audit tools" >>p2

# Build merged AIDE configuration text
cfg=""
if command -v systemd-analyze >/dev/null 2>&1; then
  cfg="$(systemd-analyze cat-config aide.conf 2>/dev/null || true)"
fi
if [ -z "$cfg" ]; then
  [ -f /etc/aide.conf ] && cfg+="$(
    sed -n 'p' /etc/aide.conf 2>/dev/null
  )"
  if ls /etc/aide.conf.d/*.conf >/dev/null 2>&1; then
    for f in /etc/aide.conf.d/*.conf; do
      cfg+=$'\n'"$(sed -n 'p' "$f" 2>/dev/null)"
    done
  fi
fi

tools=("auditctl" "auditd" "ausearch" "aureport" "autrace" "augenrules")
reqs=("p" "i" "n" "u" "g" "s" "b" "acl" "xattrs" "sha512")

issues=""
if [ -z "$cfg" ]; then
  issues="AIDE configuration not found or unreadable; "
else
  for t in "${tools[@]}"; do
    # Find the first rule line for the tool in /sbin or /usr/sbin
    line="$(printf '%s\n' "$cfg" | grep -P '^\s*(/usr)?/sbin/'"$t"'\b.*' -m1 || true)"
    if [ -z "$line" ]; then
      issues+="missing_rule:$t; "
      continue
    fi
    # Check required attributes
    missing=""
    for r in "${reqs[@]}"; do
      printf '%s' "$line" | grep -Pq '\b'"$r"'\b' || missing+="$r,"
    done
    if [ -n "$missing" ]; then
      issues+="missing_opts:$t(${missing%,}); "
    fi
  done
fi

if [ -z "$issues" ]; then
  echo "All audit tool rules present with required options" >>p3
  echo "Yes" >>p4
else
  echo "$issues" >>p3
  echo "No" >>p4
fi

echo "6.1.3" >>p12


#########################################################################################################

# 6.2.1.1
# Ensure journald service is enabled and active (Automated)

echo "Logging and Auditing / System Logging" >>p1
echo "Ensure journald service is enabled and active" >>p2

# CIS Benchmark requirement:
# systemctl is-enabled systemd-journald.service  -> expected: static
# systemctl is-active  systemd-journald.service  -> expected: active
en=$(systemctl is-enabled systemd-journald.service 2>/dev/null || true)
ac=$(systemctl is-active  systemd-journald.service 2>/dev/null || true)

# Normalize empties to prevent blank outputs
[ -z "$en" ] && en="unknown"
[ -z "$ac" ] && ac="unknown"

if [ "$en" = "static" ] && [ "$ac" = "active" ]; then
  echo "systemd-journald.service enabled=static active=active" >>p3
  echo "Yes" >>p4
else
  echo "systemd-journald.service enabled=$en active=$ac (expected enabled=static active=active)" >>p3
  echo "No" >>p4
fi

echo "6.2.1.1" >>p12

#########################################################################################################

# 6.2.1.4
# Ensure only one logging system is in use

echo "Logging and Auditing / System Logging" >>p1
echo "Ensure only one logging system is in use" >>p2

rsyslog_active=false
journald_active=false

if systemctl is-active --quiet rsyslog; then
    rsyslog_active=true
elif systemctl is-active --quiet systemd-journald; then
    journald_active=true
fi

if $rsyslog_active; then
    echo "rsyslog is in use; follow the Configure rsyslog recommendations only" >>p3
    echo "Yes" >>p4
elif $journald_active; then
    echo "journald is in use; follow the Configure journald recommendations only" >>p3
    echo "Yes" >>p4
else
    echo "Unable to determine system logging; ensure ONLY ONE logging system is used: rsyslog OR journald" >>p3
    echo "No" >>p4
fi

echo "6.2.1.4" >>p12

#########################################################################################################

# 6.2.2.2
# Ensure journald ForwardToSyslog is disabled

echo "Logging and Auditing / System Logging" >>p1
echo "Ensure journald ForwardToSyslog is disabled" >>p2

# Read effective config (includes drop-ins)
# Capture the last occurrence of ForwardToSyslog= as the effective value
val_line=$(systemd-analyze cat-config systemd/journald.conf 2>/dev/null | grep -E '^ForwardToSyslog=' | tail -n1 || true)

if [ -z "$val_line" ]; then
  # Not explicitly set → treat as non-compliant per audit requirement
  echo "ForwardToSyslog is not explicitly set (expected: ForwardToSyslog=no)" >>p3
  echo "No" >>p4
else
  val="${val_line#ForwardToSyslog=}"
  if [ "$val" = "no" ]; then
    echo "ForwardToSyslog=$val" >>p3
    echo "Yes" >>p4
  else
    echo "ForwardToSyslog=$val (expected: no)" >>p3
    echo "No" >>p4
  fi
fi

echo "6.2.2.2" >>p12

#########################################################################################################

# 6.2.2.3
# Ensure journald Compress is configured

echo "Logging and Auditing / System Logging" >>p1
echo "Ensure journald Compress is configured" >>p2

# Get the effective Compress setting (last one wins)
val_line=$(systemd-analyze cat-config systemd/journald.conf 2>/dev/null | grep -E '^Compress=' | tail -n1 || true)

if [ -z "$val_line" ]; then
  # Not explicitly set → treat as non-compliant per audit requirement
  echo "Compress is not explicitly set (expected: Compress=yes)" >>p3
  echo "No" >>p4
else
  val="${val_line#Compress=}"
  if [ "$val" = "yes" ]; then
    echo "Compress=$val" >>p3
    echo "Yes" >>p4
  else
    echo "Compress=$val (expected: yes)" >>p3
    echo "No" >>p4
  fi
fi

echo "6.2.2.3" >>p12

#########################################################################################################

# 6.2.2.4
# Ensure journald Storage is configured

echo "Logging and Auditing / System Logging" >>p1
echo "Ensure journald Storage is configured" >>p2

# Get the effective Storage setting (last one wins)
val_line=$(systemd-analyze cat-config systemd/journald.conf 2>/dev/null | grep -E '^Storage=' | tail -n1 || true)

if [ -z "$val_line" ]; then
  # Not explicitly set → treat as non-compliant per audit requirement
  echo "Storage is not explicitly set (expected: Storage=persistent)" >>p3
  echo "No" >>p4
else
  val="${val_line#Storage=}"
  if [ "$val" = "persistent" ]; then
    echo "Storage=$val" >>p3
    echo "Yes" >>p4
  else
    echo "Storage=$val (expected: persistent)" >>p3
    echo "No" >>p4
  fi
fi

echo "6.2.2.4" >>p12

#########################################################################################################

# 6.2.2.1.1
# Ensure systemd-journal-remote is installed

echo "Logging and Auditing / System Logging" >>p1
echo "Ensure systemd-journal-remote is installed" >>p2

if rpm -q systemd-journal-remote >/dev/null 2>&1; then
    pkg=$(rpm -q systemd-journal-remote)
    echo "systemd-journal-remote is installed: $pkg" >>p3
    echo "Yes" >>p4
else
    echo "systemd-journal-remote is NOT installed" >>p3
    echo "No" >>p4
fi

echo "6.2.2.1.1" >>p12

#########################################################################################################

# 6.2.2.1.3
# Ensure systemd-journal-upload is enabled and active (Automated)

echo "Logging and Auditing / System Logging" >>p1
echo "Ensure systemd-journal-upload is enabled and active" >>p2

unit="systemd-journal-upload.service"

en=$(systemctl is-enabled "$unit" 2>/dev/null || true)
ac=$(systemctl is-active  "$unit" 2>/dev/null || true)

[ -z "$en" ] && en="not-found"
[ -z "$ac" ] && ac="inactive"

if [ "$en" = "enabled" ] && [ "$ac" = "active" ]; then
  echo "systemd-journal-upload.service enabled=$en active=$ac" >>p3
  echo "Yes" >>p4
else
  echo "systemd-journal-upload.service enabled=$en active=$ac" >>p3
  echo "No" >>p4
fi

echo "6.2.2.1.3" >>p12

#########################################################################################################

# 6.2.2.1.4
# Ensure systemd-journal-remote service is not in use (Automated)

echo "Logging and Auditing / System Logging" >>p1
echo "Ensure systemd-journal-remote service is not in use" >>p2

# Capture exact states (no grep pipelines to avoid stray output)
en_sock=$(systemctl is-enabled systemd-journal-remote.socket  2>/dev/null || true)
en_srv=$(systemctl is-enabled systemd-journal-remote.service  2>/dev/null || true)
ac_sock=$(systemctl is-active  systemd-journal-remote.socket  2>/dev/null || true)
ac_srv=$(systemctl is-active  systemd-journal-remote.service  2>/dev/null || true)

# Normalize empties
[ -z "$en_sock" ] && en_sock="unknown"
[ -z "$en_srv"  ] && en_srv="unknown"
[ -z "$ac_sock" ] && ac_sock="unknown"
[ -z "$ac_srv"  ] && ac_srv="unknown"

# PASS when both NOT enabled and NOT active
if [ "$en_sock" != "enabled" ] && [ "$en_srv" != "enabled" ] && [ "$ac_sock" != "active" ] && [ "$ac_srv" != "active" ]; then
  echo "Both systemd-journal-remote.socket and systemd-journal-remote.service are NOT enabled and NOT active" >>p3
  echo "Yes" >>p4
else
  # If not fully disabled/inactive, fail and report concise state
  echo "socket en=$en_sock ac=$ac_sock / service en=$en_srv ac=$ac_srv" >>p3
  echo "No" >>p4
fi

echo "6.2.2.1.4" >>p12

#########################################################################################################


# 6.2.3.1
# Ensure rsyslog is installed

echo "Logging and Auditing / System Logging" >>p1
echo "Ensure rsyslog is installed" >>p2

if rpm -q rsyslog >/dev/null 2>&1; then
    echo "rsyslog is installed: $(rpm -q rsyslog)" >>p3
    echo "Yes" >>p4
else
    echo "rsyslog package is not installed" >>p3
    echo "No" >>p4
fi

echo "6.2.3.1" >>p12

#########################################################################################################

# 6.2.3.2
# Ensure rsyslog service is enabled and active (Automated)

echo "Logging and Auditing / System Logging" >>p1
echo "Ensure rsyslog service is enabled and active" >>p2

unit="rsyslog.service"

en=$(systemctl is-enabled "$unit" 2>/dev/null || true)
ac=$(systemctl is-active  "$unit" 2>/dev/null || true)

[ -z "$en" ] && en="not-found"
[ -z "$ac" ] && ac="inactive"

if [ "$en" = "enabled" ] && [ "$ac" = "active" ]; then
  echo "rsyslog.service enabled=$en active=$ac" >>p3
  echo "Yes" >>p4
else
  echo "rsyslog.service enabled=$en active=$ac" >>p3
  echo "No" >>p4
fi

echo "6.2.3.2" >>p12

#########################################################################################################

# 6.2.3.3
# Ensure journald is configured to send logs to rsyslog

echo "Logging and Auditing / System Logging" >>p1
echo "Ensure journald is configured to send logs to rsyslog" >>p2

# Get the effective ForwardToSyslog setting (last one wins)
val_line=$(systemd-analyze cat-config systemd/journald.conf 2>/dev/null | grep -E '^ForwardToSyslog=' | tail -n1 || true)

if [ -z "$val_line" ]; then
  # Not explicitly set → treat as non-compliant per audit requirement
  echo "ForwardToSyslog is not explicitly set (expected: ForwardToSyslog=yes when rsyslog is preferred)" >>p3
  echo "No" >>p4
else
  val="${val_line#ForwardToSyslog=}"
  if [ "$val" = "yes" ]; then
    echo "ForwardToSyslog=$val" >>p3
    echo "Yes" >>p4
  else
    echo "ForwardToSyslog=$val (expected: yes when rsyslog is preferred)" >>p3
    echo "No" >>p4
  fi
fi

echo "6.2.3.3" >>p12

#########################################################################################################

# 6.2.3.4
# Ensure rsyslog log file creation mode is configured (Automated)

echo "Logging and Auditing / System Logging" >>p1
echo "Ensure rsyslog log file creation mode is configured" >>p2

# Compliant modes: 0640 or more restrictive (e.g., 0600, 0640, 0620, 0420, etc.)
# Regex per audit: ^\h*\$FileCreateMode\h+0[0,2,4,6][0,2,4]0\b
# Search in /etc/rsyslog.conf and /etc/rsyslog.d/*.conf
matches=$(grep -Psi '^\s*\$FileCreateMode\s+0[0,2,4,6][0,2,4]0\b' /etc/rsyslog.conf /etc/rsyslog.d/*.conf 2>/dev/null || true)

# Also detect any $FileCreateMode that is LESS restrictive than 0640 (noncompliant)
noncomp=$(grep -Psi '^\s*\$FileCreateMode\s+0([1,3,5,7][0-7][0-7]|[0,2,4,6][1,3,5,7][0-7]|[0,2,4,6][0,2,4,6][1,3,5,7])\b' /etc/rsyslog.conf /etc/rsyslog.d/*.conf 2>/dev/null || true)

if [ -n "$matches" ] && [ -z "$noncomp" ]; then
  # Compact single-line file list
  files=$(printf "%s" "$matches" | awk -F: '{print $1}' | sort -u | tr '\n' ' ' | xargs)
  echo "FileCreateMode compliant (0640 or more restrictive) in: ${files:-unknown}" >>p3
  echo "Yes" >>p4
else
  if [ -z "$matches" ]; then
    echo "FileCreateMode not found or not set to 0640 or more restrictive in rsyslog config" >>p3
  else
    badlist=$(printf "%s" "$noncomp" | awk -F: '{print $1":"$2}' | tr '\n' ';' | sed 's/;*$//')
    echo "FileCreateMode not compliant in: ${badlist:-unknown}" >>p3
  fi
  echo "No" >>p4
fi

echo "6.2.3.4" >>p12

#########################################################################################################

# 6.2.3.7
# Ensure rsyslog is not configured to receive logs from remote clients
echo "Logging and Auditing / System Logging" >>p1
echo "Ensure rsyslog is not configured to receive logs from a remote client" >>p2

# Look for inbound TCP receiving directives (advanced or legacy)
hits=$(grep -Psi -- '^\s*module\(load="?imtcp"?\)' /etc/rsyslog.conf /etc/rsyslog.d/*.conf 2>/dev/null || true)
hits2=$(grep -Psi -- '^\s*input\(type="?imtcp"?\b' /etc/rsyslog.conf /etc/rsyslog.d/*.conf 2>/dev/null || true)
hits3=$(grep -Psi -- '^\s*\$ModLoad\s+imtcp\b' /etc/rsyslog.conf /etc/rsyslog.d/*.conf 2>/dev/null || true)
hits4=$(grep -Psi -- '^\s*\$InputTCPServerRun\b' /etc/rsyslog.conf /etc/rsyslog.d/*.conf 2>/dev/null || true)

if [ -z "$hits$hits2$hits3$hits4" ]; then
    echo "No inbound rsyslog TCP receiver directives detected" >>p3
    echo "Yes" >>p4
else
    combined=$(printf "%s\n%s\n%s\n%s" "$hits" "$hits2" "$hits3" "$hits4" | tr '\n' ';' | sed 's/;*$//')
    echo "Inbound receive config found: $combined" >>p3
    echo "No" >>p4
fi

echo "6.2.3.7" >>p12

#########################################################################################################

# 6.2.4.1
# Ensure access to all logfiles has been configured

echo "Logging and Auditing / System Logging" >>p1
echo "Ensure access to all logfiles has been configured" >>p2

issues=""

# Loop over all /var/log files
while IFS= read -r f; do
    [ ! -f "$f" ] && continue

    base=$(basename "$f")
    mode=$(stat -c "%a" "$f")
    user=$(stat -c "%U" "$f")
    group=$(stat -c "%G" "$f")

    case "$base" in
        lastlog|lastlog.*|wtmp|wtmp.*|wtmp-*|btmp|btmp.*|btmp-*)
            # 0664 or stricter; owner=root; group=root/utmp
            if [ "$mode" -gt 664 ] || [ "$user" != "root" ] || [[ ! "$group" =~ ^(root|utmp)$ ]]; then
                issues+="$f;"
            fi
            ;;
        secure|auth.log|syslog|messages|*.journal|*.journal~)
            # 0640 or stricter; owner=root/syslog; group=root/adm
            if [ "$mode" -gt 640 ] || [[ ! "$user" =~ ^(root|syslog)$ ]] || [[ ! "$group" =~ ^(root|adm)$ ]]; then
                issues+="$f;"
            fi
            ;;
        gdm|gdm3|SSSD|sssd)
            # 0660 or stricter; owner=root/SSSD; group root/SSSD/gdm/gdm3
            if [ "$mode" -gt 660 ] || [[ ! "$user" =~ ^(root|SSSD)$ ]] || [[ ! "$group" =~ ^(root|SSSD|gdm|gdm3)$ ]]; then
                issues+="$f;"
            fi
            ;;
        *)
            # Default: 0640 or stricter; owner root/syslog; group root/adm
            if [ "$mode" -gt 640 ] || [[ ! "$user" =~ ^(root|syslog)$ ]] || [[ ! "$group" =~ ^(root|adm)$ ]]; then
                issues+="$f;"
            fi
            ;;
    esac
done < <(find /var/log -type f)

if [ -z "$issues" ]; then
    echo "All /var/log files have correct permissions & ownership" >>p3
    echo "Yes" >>p4
else
    echo "Files with incorrect access: ${issues}" >>p3
    echo "No" >>p4
fi

echo "6.2.4.1" >>p12


#######################################System Maintenance################################################

#7.1.1
# Ensure permissions on /etc/passwd are configured (Automated)
file1="/etc/passwd"
if [ -f "$file1" ]; then
	command_output1=$(stat -Lc "%n %a %u/%U %g/%G" /etc/passwd)
	IFS=' ' read -r -a parts <<< "$command_output1"
    if [ "${parts[0]}" = "/etc/passwd" ] && [ "${parts[1]}" = "644" ] && [ "${parts[2]}" = "0/root" ] && [ "${parts[3]}" = "0/root" ]; then
		echo "System Maintenance / System File Permissions" >> p1
		echo "Ensure permissions on /etc/passwd are configured" >> p2
		echo "Permissions on /etc/passwd are configured $command_output1" >> p3
		echo "Yes" >> p4
		echo "7.1.1" >> p12
    else
		echo "System Maintenance / System File Permissions" >> p1
		echo "Ensure permissions on /etc/passwd are configured" >> p2
		echo "Permissions on /etc/passwd are NOT configured properly $command_output1" >> p3
		echo "No" >> p4
		echo "7.1.1" >> p12
    fi
else
	echo "System Maintenance / System File Permissions" >> p1
	echo "Ensure permissions on /etc/passwd are configured" >> p2
	echo "File $file1 does not exist" >> p3
	echo "No" >> p4
	echo "7.1.1" >> p12
fi

#########################################################################################################

#7.1.2
#Ensure permissions on /etc/passwd- are configured (Automated)
file2="/etc/passwd-"
if [ -f "$file2" ]; then
	command_output2=$(stat -Lc "%n %a %u/%U %g/%G" /etc/passwd-)
	IFS=' ' read -r -a parts <<< "$command_output2"
    if [ "${parts[0]}" = "/etc/passwd-" ] && [ "${parts[1]}" = "644" ] && [ "${parts[2]}" = "0/root" ] && [ "${parts[3]}" = "0/root" ]; then
		echo "System Maintenance / System File Permissions" >> p1
		echo "Ensure permissions on /etc/passwd- are configured" >> p2
		echo "Permissions on /etc/passwd- are configured $command_output2" >> p3
		echo "Yes" >> p4
		echo "7.1.2" >> p12
    else
		echo "System Maintenance / System File Permissions" >> p1
		echo "Ensure permissions on /etc/passwd- are configured" >> p2
		echo "Permissions on /etc/passwd- are NOT configured properly $command_output2" >> p3
		echo "No" >> p4
		echo "7.1.2" >> p12
    fi
else
	echo "System Maintenance / System File Permissions" >> p1
	echo "Ensure permissions on /etc/passwd- are configured" >> p2
	echo "File $file2 does not exist" >> p3
	echo "No" >> p4
	echo "7.1.2" >> p12
fi

#########################################################################################################

#7.1.3
#Ensure permissions on /etc/group are configured (Automated)
file3="/etc/group"
if [ -f "$file3" ]; then
	command_output3=$(stat -Lc "%n %a %u/%U %g/%G" /etc/group)
	IFS=' ' read -r -a parts <<< "$command_output3"
    if [ "${parts[0]}" = "/etc/group" ] && [ "${parts[1]}" = "644" ] && [ "${parts[2]}" = "0/root" ] && [ "${parts[3]}" = "0/root" ]; then
		echo "System Maintenance / System File Permissions" >> p1
		echo "Ensure permissions on /etc/group are configured" >> p2
		echo "Permissions on /etc/group are configured $command_output3" >> p3
		echo "Yes" >> p4
		echo "7.1.3" >> p12
    else
		echo "System Maintenance / System File Permissions" >> p1
		echo "Ensure permissions on /etc/group are configured" >> p2
		echo "Permissions on /etc/group are NOT configured properly $command_output3" >> p3
		echo "No" >> p4
		echo "7.1.3" >> p12
    fi
else
	echo "System Maintenance / System File Permissions" >> p1
	echo "Ensure permissions on /etc/group are configured" >> p2
	echo "File $file3 does not exist" >> p3
	echo "No" >> p4
	echo "7.1.3" >> p12
fi

#########################################################################################################

#7.1.4
#Ensure permissions on /etc/group- are configured (Automated)
file4="/etc/group-"
if [ -f "$file4" ]; then
	command_output4=$(stat -Lc "%n %a %u/%U %g/%G" /etc/group-)
	IFS=' ' read -r -a parts <<< "$command_output4"
    if [ "${parts[0]}" = "/etc/group-" ] && [ "${parts[1]}" = "644" ] && [ "${parts[2]}" = "0/root" ] && [ "${parts[3]}" = "0/root" ]; then
		echo "System Maintenance / System File Permissions" >> p1
		echo "Ensure permissions on /etc/group- are configured" >> p2
		echo "Permissions on /etc/group- are configured $command_output4" >> p3
		echo "Yes" >> p4
		echo "7.1.4" >> p12
    else
		echo "System Maintenance / System File Permissions" >> p1
		echo "Ensure permissions on /etc/group- are configured" >> p2
		echo "Permissions on /etc/group- are NOT configured properly $command_output4" >> p3
		echo "No" >> p4
		echo "7.1.4" >> p12
    fi
else
	echo "System Maintenance / System File Permissions" >> p1
	echo "Ensure permissions on /etc/group- are configured" >> p2
	echo "File $file4 does not exist" >> p3
	echo "No" >> p4
	echo "7.1.4" >> p12
fi

#########################################################################################################

#7.1.5
#Ensure permissions on /etc/shadow are configured (Automated)
file5="/etc/shadow"
if [ -f "$file5" ]; then
	command_output5=$(stat -Lc "%n %a %u/%U %g/%G" /etc/shadow)
	IFS=' ' read -r -a parts <<< "$command_output5"
    if [ "${parts[0]}" = "/etc/shadow" ] && [ "${parts[1]}" = "0" ] && [ "${parts[2]}" = "0/root" ] && [ "${parts[3]}" = "0/root" ]; then
		echo "System Maintenance / System File Permissions" >> p1
		echo "Ensure permissions on /etc/shadow are configured" >> p2
		echo "Permissions on /etc/shadow are configured $command_output5" >> p3
		echo "Yes" >> p4
		echo "7.1.5" >> p12
    else
		echo "System Maintenance / System File Permissions" >> p1
		echo "Ensure permissions on /etc/shadow are configured" >> p2
		echo "Permissions on /etc/shadow are NOT configured properly $command_output5" >> p3
		echo "No" >> p4
		echo "7.1.5" >> p12
    fi
else
	echo "System Maintenance / System File Permissions" >> p1
	echo "Ensure permissions on /etc/shadow are configured" >> p2
	echo "File $file5 does not exist" >> p3
	echo "No" >> p4
	echo "7.1.5" >> p12
fi

#########################################################################################################

#7.1.6
#Ensure permissions on /etc/shadow- are configured (Automated)
file6="/etc/shadow-"
if [ -f "$file6" ]; then
	command_output6=$(stat -Lc "%n %a %u/%U %g/%G" /etc/shadow-)
	IFS=' ' read -r -a parts <<< "$command_output6"
    if [ "${parts[0]}" = "/etc/shadow-" ] && [ "${parts[1]}" = "0" ] && [ "${parts[2]}" = "0/root" ] && [ "${parts[3]}" = "0/root" ]; then
		echo "System Maintenance / System File Permissions" >> p1
		echo "Ensure permissions on /etc/shadow- are configured" >> p2
		echo "Permissions on /etc/shadow- are configured $command_output6" >> p3
		echo "Yes" >> p4
		echo "7.1.6" >> p12
    else
		echo "System Maintenance / System File Permissions" >> p1
		echo "Ensure permissions on /etc/shadow- are configured" >> p2
		echo "Permissions on /etc/shadow- are NOT configured properly $command_output6" >> p3
		echo "No" >> p4
		echo "7.1.6" >> p12
    fi
else
	echo "System Maintenance / System File Permissions" >> p1
	echo "Ensure permissions on /etc/shadow- are configured" >> p2
	echo "File $file6 does not exist" >> p3
	echo "No" >> p4
	echo "7.1.6" >> p12
fi

#########################################################################################################

#7.1.7
#Ensure permissions on /etc/gshadow are configured (Automated)
file7="/etc/gshadow"
if [ -f "$file7" ]; then
	command_output7=$(stat -Lc "%n %a %u/%U %g/%G" /etc/gshadow)
	IFS=' ' read -r -a parts <<< "$command_output7"
    if [ "${parts[0]}" = "/etc/gshadow" ] && [ "${parts[1]}" = "0" ] && [ "${parts[2]}" = "0/root" ] && [ "${parts[3]}" = "0/root" ]; then
		echo "System Maintenance / System File Permissions" >> p1
		echo "Ensure permissions on /etc/gshadow are configured" >> p2
		echo "Permissions on /etc/gshadow are configured $command_output7" >> p3
		echo "Yes" >> p4
		echo "7.1.7" >> p12
    else
		echo "System Maintenance / System File Permissions" >> p1
		echo "Ensure permissions on /etc/gshadow are configured" >> p2
		echo "Permissions on /etc/gshadow are NOT configured properly $command_output7" >> p3
		echo "No" >> p4
		echo "7.1.7" >> p12
    fi
else
	echo "System Maintenance / System File Permissions" >> p1
	echo "Ensure permissions on /etc/gshadow are configured" >> p2
	echo "File $file7 does not exist" >> p3
	echo "No" >> p4
	echo "7.1.7" >> p12
fi

#########################################################################################################

#7.1.8
#Ensure permissions on /etc/gshadow- are configured (Automated)
file8="/etc/gshadow-"
if [ -f "$file8" ]; then
	command_output8=$(stat -Lc "%n %a %u/%U %g/%G" /etc/gshadow-)
	IFS=' ' read -r -a parts <<< "$command_output8"
    if [ "${parts[0]}" = "/etc/gshadow-" ] && [ "${parts[1]}" = "0" ] && [ "${parts[2]}" = "0/root" ] && [ "${parts[3]}" = "0/root" ]; then
		echo "System Maintenance / System File Permissions" >> p1
		echo "Ensure permissions on /etc/gshadow- are configured" >> p2
		echo "Permissions on /etc/gshadow- are configured $command_output8" >> p3
		echo "Yes" >> p4
		echo "7.1.8" >> p12
    else
		echo "System Maintenance / System File Permissions" >> p1
		echo "Ensure permissions on /etc/gshadow- are configured" >> p2
		echo "Permissions on /etc/gshadow- are NOT configured properly $command_output8" >> p3
		echo "No" >> p4
		echo "7.1.8" >> p12
    fi
else
	echo "System Maintenance / System File Permissions" >> p1
	echo "Ensure permissions on /etc/gshadow- are configured" >> p2
	echo "File $file8 does not exist" >> p3
	echo "No" >> p4
	echo "7.1.8" >> p12
fi

#########################################################################################################

# 7.1.9
# Ensure permissions on /etc/shells are configured (Automated)
{
 l_output="" l_output2=""
 l_file="/etc/shells"
 l_mode="$(stat -Lc '%#a' $l_file 2>/dev/null)"
 l_uid="$(stat -Lc '%u' $l_file 2>/dev/null)"
 l_gid="$(stat -Lc '%g' $l_file 2>/dev/null)"
 l_owner="$(stat -Lc '%U' $l_file 2>/dev/null)"
 l_group="$(stat -Lc '%G' $l_file 2>/dev/null)"
 if [ $(( l_mode & 0133 )) -gt 0 ] 2>/dev/null; then
  l_output2="$l_output2 $l_file mode is $l_mode. Required: 0644 or more restrictive."
 else
  l_output="$l_output $l_file mode is $l_mode (compliant)."
 fi
 if [ "$l_uid" -ne 0 ] 2>/dev/null; then
  l_output2="$l_output2 $l_file owner is $l_owner. Required: root"
 else
  l_output="$l_output Owner is root (compliant)."
 fi
 if [ "$l_gid" -ne 0 ] 2>/dev/null; then
  l_output2="$l_output2 $l_file group is $l_group. Required: root"
 else
  l_output="$l_output Group is root (compliant)"
 fi
 if [ -z "$l_output2" ]; then
  echo "System Maintenance / System File Permissions" >> p1
  echo "Ensure permissions on /etc/shells are configured" >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "7.1.9" >> p12
 else
  echo "System Maintenance / System File Permissions" >> p1
  echo "Ensure permissions on /etc/shells are configured" >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "7.1.9" >> p12
 fi
}

########################################################################################################

# 7.1.10
# Ensure permissions on /etc/security/opasswd are configured

found=0

for file in /etc/security/opasswd*; do

    [ -e "$file" ] || continue
    found=1

    mode=$(stat -Lc '%a' "$file")
    uid=$(stat -Lc '%u' "$file")
    gid=$(stat -Lc '%g' "$file")

    file_info=$(stat -Lc '%n Access: (%#a/%A) Uid: (%u/%U) Gid: (%g/%G)' "$file")

    echo "System Maintenance / System File Permissions" >> p1
    echo "Ensure permissions on /etc/security/opasswd are configured" >> p2

    if [ "$mode" -le 600 ] && [ "$uid" -eq 0 ] && [ "$gid" -eq 0 ]; then
        echo "Permissions on $file are configured $file_info" >> p3
        echo "Yes" >> p4
    else
        echo "Permissions on $file are NOT configured $file_info" >> p3
        echo "No" >> p4
    fi

    echo "7.1.10" >> p12

done

# If no opasswd files exist
if [ $found -eq 0 ]; then
    echo "System Maintenance / System File Permissions" >> p1
    echo "Ensure permissions on /etc/security/opasswd are configured" >> p2
    echo "No /etc/security/opasswd* files found" >> p3
    echo "Yes" >> p4
    echo "7.1.10" >> p12
fi

#########################################################################################################

# 7.1.11
# Ensure world writable files and directories are secured
echo "System Maintenance / System File Permissions" >> p1
echo "Ensure world writable files and directories are secured" >> p2

ww_files_cnt=$(find / -xdev -type f -perm -0002 2>/dev/null | wc -l)
ww_dirs_nosticky_cnt=$(find / -xdev -type d -perm -0002 ! -perm -1000 2>/dev/null | wc -l)

if [ "$ww_files_cnt" -eq 0 ] && [ "$ww_dirs_nosticky_cnt" -eq 0 ]; then
    echo "No world-writable files or directories without sticky bit" >> p3
    echo "Yes" >> p4
else
    echo "World-writable files: $ww_files_cnt; dirs without sticky: $ww_dirs_nosticky_cnt" >> p3
    echo "No" >> p4
fi

echo "7.1.11" >> p12

#########################################################################################################

# 7.1.12
# Ensure no files or directories without an owner and a group exist

echo "System Maintenance / System File Permissions" >> p1
echo "Ensure no files or directories without an owner and a group exist" >> p2

unowned_files=$(find / -xdev \( -type f -o -type d \) -nouser 2>/dev/null)
ungrouped_files=$(find / -xdev \( -type f -o -type d \) -nogroup 2>/dev/null)

if [ -z "$unowned_files" ] && [ -z "$ungrouped_files" ]; then
    echo "All files and directories have valid owner and group" >> p3
    echo "Yes" >> p4
else
    msg=""
    [ -n "$unowned_files" ] && msg+="Unowned files/dirs found; "
    [ -n "$ungrouped_files" ] && msg+="Ungrouped files/dirs found; "

    echo "${msg% ; }" >> p3
    echo "No" >> p4
fi

echo "7.1.12" >> p12

#########################################################################################################

#7.2.1
#Ensure accounts in /etc/passwd use shadowed passwords (Automated)
PASSWD_FILE="/etc/passwd"
# Flag to track if any account has shadowed password
found_non_shadowed=false
# Read each line in the passwd file, splitting by ':'
while IFS=':' read -r username password uid gid gecos home shell; do
    if [ "$password" != "x" ]; then
        found_non_shadowed=true
		echo "System Maintenance / Local User and Group Settings" >> p1
		echo "Ensure accounts in /etc/passwd use shadowed passwords" >> p2
		echo "$username is not set to shadowed password" >> p3
		echo "No" >> p4
		echo "7.2.1" >> p12
    fi
done < "$PASSWD_FILE"

# Check if any non-shadowed password was found and print a summary
if ! $found_non_shadowed; then
	echo "System Maintenance / Local User and Group Settings" >> p1
	echo "Ensure accounts in /etc/passwd use shadowed passwords" >> p2
	echo "All accounts are set to use shadowed passwords" >> p3
	echo "Yes" >> p4
	echo "7.2.1" >> p12
fi

#########################################################################################################

# 7.2.2
# Ensure /etc/shadow password fields are not empty (Automated)

ctrl_id="7.2.2"

# List accounts with an empty password field ($2 == "")
offenders=$(awk -F: '($2 == "") {print $1}' /etc/shadow 2>/dev/null || true)

if [ -z "$offenders" ]; then
  # Compliant: no empty password fields
  echo "System Maintenance / Local User and Group Settings" >>p1
  echo "Ensure /etc/shadow password fields are not empty" >>p2
  echo "All shadow password fields are set" >>p3
  echo "Yes" >>p4
  echo "$ctrl_id" >>p12
else
  # One output row per offending user (FULL columns)
  for u in $offenders; do
    echo "System Maintenance / Local User and Group Settings" >>p1
    echo "Ensure /etc/shadow password fields are not empty" >>p2
    echo "User $u has an empty password field" >>p3
    echo "No" >>p4
    echo "$ctrl_id" >>p12
  done
fi

#########################################################################################################

#7.2.3
#Ensure all groups in /etc/passwd exist in /etc/group (Automated)
grp_found=0
# Initialize a variable to store the group IDs that are found
groups_found=""
for i in $(cut -s -d: -f4 /etc/passwd | sort -u ); do
 grep -q -P "^.*?:[^:]*:$i:" /etc/group
 if [ $? -ne 0 ]; then
   echo "Group $i is referenced by /etc/passwd but does not exist in /etc/group"
   # Set the variable to 1 if an inconsistency is found
   grp_found=1
   # Add the group ID to the groups_found variable
   groups_found+="$i "
 fi
done
if [ $grp_found -eq 0 ]; then
	echo "System Maintenance / Local User and Group Settings" >> p1
	echo "Ensure all groups in /etc/passwd exist in /etc/group" >> p2
	echo "No Group found" >> p3
	echo "Yes" >> p4
	echo "7.2.3" >> p12
 else
	echo "System Maintenance / Local User and Group Settings" >> p1
	echo "Ensure all groups in /etc/passwd exist in /etc/group" >> p2
	echo "Groups found: $groups_found" >> p3
	echo "No" >> p4
	echo "7.2.3" >> p12
fi

#########################################################################################################

#7.2.4
#Ensure no duplicate UIDs exist (Automated)
dup_uid_found=0
# Initialize a variable to store the duplicate UIDs
dup_uids=""
while read x ; do
 [ -z "$x" ] && break
 set - $x
 if [ $1 -gt 1 ]; then
   users=$(awk -F: '($3 == n) { print $1 }' n=$2 /etc/passwd | xargs)
   echo "Duplicate UID ($2): $users"
   # Set the variable to 1 if a duplicate UID is found
   dup_uid_found=1
   # Add the duplicate UID to the dup_uids variable
   dup_uids+="$2 "
 fi
done < <(cut -f3 -d":" /etc/passwd | sort -n | uniq -c)
if [ $dup_uid_found -eq 0 ]; then
	echo "System Maintenance / Local User and Group Settings" >> p1
	echo "Ensure no duplicate UIDs exist" >> p2
	echo "No duplicate UIDs found" >> p3
	echo "Yes" >> p4
	echo "7.2.4" >> p12
else
	echo "System Maintenance / Local User and Group Settings" >> p1
	echo "Ensure no duplicate UIDs exist" >> p2
	echo "Duplicate UIDs found: $dup_uids" >> p3
	echo "No" >> p4
	echo "7.2.4" >> p12
fi

#########################################################################################################

#7.2.5
#Ensure no duplicate GIDs exist (Automated)
dup_gid_found=0
# Initialize a variable to store the duplicate GIDs
dup_gids=""

while read x ; do
 [ -z "$x" ] && break
 set - $x
 if [ $1 -gt 1 ]; then
   groups=$(awk -F: '($3 == n) { print $1 }' n=$2 /etc/group | xargs)
   echo "Duplicate GID ($2): $groups"
   # Set the variable to 1 if a duplicate GID is found
   dup_gid_found=1
   # Add the duplicate GID to the dup_gids variable
   dup_gids+="$2 "
 fi
done < <(cut -f3 -d":" /etc/group | sort -n | uniq -c)

if [ $dup_gid_found -eq 0 ]; then
	echo "System Maintenance / Local User and Group Settings" >> p1
	echo "Ensure no duplicate GIDs exist" >> p2
	echo "No duplicate GIDs found" >> p3
	echo "Yes" >> p4
	echo "7.2.5" >> p12
else
	echo "System Maintenance / Local User and Group Settings" >> p1
	echo "Ensure no duplicate GIDs exist" >> p2
	echo "Duplicate GIDs found: $dup_gids" >> p3
	echo "No" >> p4
	echo "7.2.5" >> p12
fi

#########################################################################################################

#7.2.6
#Ensure no duplicate user names exist (Automated)
dup_uname_found=0
# Initialize a variable to store the duplicate user names
dup_unames=""

while read x ; do
 [ -z "$x" ] && break
 set - $x
 if [ $1 -gt 1 ]; then
   users=$(awk -F: '($1 == n) { print $1 }' n=$2 /etc/passwd | xargs)
   echo "Duplicate User Name ($2): $users"
   # Set the variable to 1 if a duplicate user name is found
   dup_uname_found=1
   # Add the duplicate user name to the dup_unames variable
   dup_unames+="$2 "
 fi
done < <(cut -f1 -d":" /etc/passwd | sort | uniq -c)

if [ $dup_uname_found -eq 0 ]; then
	echo "System Maintenance / Local User and Group Settings" >> p1
	echo "Ensure no duplicate user names exist" >> p2
	echo "No duplicate User Names found" >> p3
	echo "Yes" >> p4
	echo "7.2.6" >> p12
else
	echo "System Maintenance / Local User and Group Settings" >> p1
	echo "Ensure no duplicate User Names exist" >> p2
	echo "Duplicate User Names found: $dup_unames" >> p3
	echo "No" >> p4
	echo "7.2.6" >> p12
fi

#########################################################################################################

#7.2.7
#Ensure no duplicate group names exist (Automated)
dup_gname_found=0
# Initialize a variable to store the duplicate group names
dup_gnames=""

while read x ; do
 [ -z "$x" ] && break
 set - $x
 if [ $1 -gt 1 ]; then
   groups=$(awk -F: '($1 == n) { print $1 }' n=$2 /etc/group | xargs)
   echo "Duplicate Group Name ($2): $groups"
   # Set the variable to 1 if a duplicate group name is found
   dup_gname_found=1
   # Add the duplicate group name to the dup_gnames variable
   dup_gnames+="$2 "
 fi
done < <(cut -f1 -d":" /etc/group | sort | uniq -c)

if [ $dup_gname_found -eq 0 ]; then
	echo "System Maintenance / Local User and Group Settings" >> p1
        echo "Ensure no duplicate Group Names exist" >> p2
	echo "No duplicate Group Names found" >> p3
	echo "Yes" >> p4
	echo "7.2.7" >> p12
else
	echo "System Maintenance / Local User and Group Settings" >> p1
	echo "Ensure no duplicate Group Names exist" >> p2
	echo "Duplicate Group Names found: $dup_gnames" >> p3
	echo "No" >> p4
	echo "7.2.7" >> p12
fi

#########################################################################################################

# 7.2.8
# Ensure local interactive user home directories are configured (Automated)

{
 l_valid_shells="^($( awk -F\/ '$NF != "nologin" {print}' /etc/shells | sed -rn '/^\//{s,/,\\\\/,g;p}' | paste -s -d '|' - ))$"

 perm_mask='0027'
 maxperm="$( printf '%o' $(( 0777 & ~$perm_mask)) )"

 pass_flag="true"

 # Loop users
 while read -r l_user l_home; do

     [[ -z "$l_user" ]] && continue

     # 1. Home missing
     if [ ! -d "$l_home" ]; then
         echo "System Maintenance / Local User and Group Settings" >> p1
         echo "Ensure local interactive user home directories are configured" >> p2
         echo "Violations found for User \"$l_user\" home directory \"$l_home\" does not exist" >> p3
         echo "No" >> p4
         echo "7.2.8" >> p12
         pass_flag="false"
         continue
     fi

     # Ownership + permissions
     read -r owner mode <<< "$(stat -Lc '%U %a' "$l_home")"

     # 2. Ownership issue
     if [ "$owner" != "$l_user" ]; then
         echo "System Maintenance / Local User and Group Settings" >> p1
         echo "Ensure local interactive user home directories are configured" >> p2
         echo "Violations found for User \"$l_user\" ownership incorrect (owned by $owner)" >> p3
         echo "No" >> p4
         echo "7.2.8" >> p12
         pass_flag="false"
     fi

     # 3. Permission issue
     if [ $(( 8#$mode & $perm_mask )) -gt 0 ]; then
         echo "System Maintenance / Local User and Group Settings" >> p1
         echo "Ensure local interactive user home directories are configured" >> p2
         echo "Violations found for User \"$l_user\" permission \"$mode\" should be $maxperm or stricter" >> p3
         echo "No" >> p4
         echo "7.2.8" >> p12
         pass_flag="false"
     fi

 done < <(awk -v pat="$l_valid_shells" -F: '$(NF) ~ pat { print $1 " " $(NF-1) }' /etc/passwd)

 # PASS case
 if [ "$pass_flag" = "true" ]; then
     echo "System Maintenance / Local User and Group Settings" >> p1
     echo "Ensure local interactive user home directories are configured" >> p2
     echo "All local interactive user home directories are correctly configured" >> p3
     echo "Yes" >> p4
     echo "7.2.8" >> p12
 fi

}

#########################################################################################################

# 7.2.9
# Ensure local interactive user dot files access is configured (Automated)

uid_min=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs 2>/dev/null)
[ -z "$uid_min" ] && uid_min=1000

MAX_SHOW=${MAX_SHOW:-10}

# Collect local interactive users: UID >= UID_MIN and shell not nologin/false
mapfile -t ulist < <(awk -F: -v min="$uid_min" '($3>=min && $7!="/sbin/nologin" && $7!="/usr/sbin/nologin" && $7!="/bin/false"){print $1":"$6}' /etc/passwd)

issue_count=0

for uh in "${ulist[@]}"; do
  [[ -z "$uh" ]] && continue
  u="${uh%%:*}"; h="${uh#*:}"
  [ -z "$u" ] || [ -z "$h" ] && continue
  [ -d "$h" ] || continue

  primary_g=$(id -gn "$u" 2>/dev/null)

  # Forbidden files: .forward, .rhost, .netrc
  while IFS= read -r -d '' f; do
    fname=$(basename "$f")
    echo "System Maintenance / Local User and Group Settings" >>p1
    echo "Ensure local interactive user dot files access is configured" >>p2
    echo "User $u has forbidden dotfile $fname in $h" >>p3
    echo "No" >>p4
    echo "7.2.9" >>p12
    issue_count=$((issue_count+1))
  done < <(find "$h" -xdev -maxdepth 1 -type f \( -name '.forward' -o -name '.rhost' -o -name '.netrc' \) -print0 2>/dev/null)

  # Dotfiles checks
  while IFS= read -r -d '' f; do
    bname=$(basename "$f")
    read -r mode owner gowner <<<"$(stat -Lc '%a %U %G' "$f" 2>/dev/null)"
    mo=$((8#$mode))

    # Ownership
    if [ "$owner" != "$u" ]; then
      echo "System Maintenance / Local User and Group Settings" >>p1
      echo "Ensure local interactive user dot files access is configured" >>p2
      echo "User $u dotfile $bname owned by $owner" >>p3
      echo "No" >>p4
      echo "7.2.9" >>p12
      issue_count=$((issue_count+1))
    fi

    # Group
    if [ "$gowner" != "$primary_g" ]; then
      echo "System Maintenance / Local User and Group Settings" >>p1
      echo "Ensure local interactive user dot files access is configured" >>p2
      echo "User $u dotfile $bname group is $gowner, should be $primary_g" >>p3
      echo "No" >>p4
      echo "7.2.9" >>p12
      issue_count=$((issue_count+1))
    fi

    # Permissions
    if [ "$bname" = ".bash_history" ]; then
      (( (mo & ~0600) != 0 )) && {
        echo "System Maintenance / Local User and Group Settings" >>p1
        echo "Ensure local interactive user dot files access is configured" >>p2
        echo "User $u dotfile $bname has mode $(printf '%04o' "$mo"), should be <=0600" >>p3
        echo "No" >>p4
        echo "7.2.9" >>p12
        issue_count=$((issue_count+1))
      }
    else
      (( (mo & ~0644) != 0 )) && {
        echo "System Maintenance / Local User and Group Settings" >>p1
        echo "Ensure local interactive user dot files access is configured" >>p2
        echo "User $u dotfile $bname has mode $(printf '%04o' "$mo"), should be <=0644" >>p3
        echo "No" >>p4
        echo "7.2.9" >>p12
        issue_count=$((issue_count+1))
      }
    fi

  done < <(find "$h" -xdev -maxdepth 1 -type f -name '.*' -print0 2>/dev/null)

done

# PASS row (only if no issues were found)
if [ $issue_count -eq 0 ]; then
  echo "System Maintenance / Local User and Group Settings" >>p1
  echo "Ensure local interactive user dot files access is configured" >>p2
  echo "All local interactive users: no forbidden dotfiles; dotfiles owned by user and primary group; permissions OK" >>p3
  echo "Yes" >>p4
  echo "7.2.9" >>p12
fi

#########################################################################################################

# End of Parameters
#########################################################################################################

# Get current date, OS version, and scan version
current_date=$(date +%Y-%m-%d)
os_version=$(cat /etc/redhat-release | awk {'print $1 $2 $4 $6'})
scan_version="CIS_Benchmark_2.0.0"  # replace with command or variable that gets your scan version

# Generate filename
filename=$(hostname)_${os_version}-${scan_version}-scan_${current_date}.csv

techSpecVersion="2.0.0"
customisedDate=$(date +%Y-%m-%d)
fqdn=$(hostname --fqdn)
ipAddress=$(ip addr show eth0 | grep inet | awk '{print $2}' | head -n 1)
osName=$(cat /etc/redhat-release | awk {'print $1 $2 $4 $6'})
timestamp=$(date +%T)

# Generate report
echo -e "ACCOUNT:${accountName:-} \nACCOUNT-BAMID:$accountBAMID \nCIS_Benchmark_Version: $techSpecVersion \nCustomisation Date: $customisedDate \nScan Version: $scan_version\nFQDN:$fqdn \nIP-ADDRESS:$ipAddress \nOS_Name&Version: $osName \nScan-Date: $current_date\nTime-Stamp: $timestamp\n********************************************************" > $filename
echo -e "SECTION-ID|SECTION-HEADING|SYSTEM-VALUE/PARAMETER|CURRENT-VALUE|TEST-RESULT" >> $filename
paste -d "|" p12 p1 p2 p3 p4 >> $filename

if [ -f "$filename" ]; then
    echo "File $filename has been created."
else
    echo "File $filename was not created."
fi

# Delete variables
unset current_date os_version scan_version filename

# Cleanup
rm -rf p5 p4 p3 p2 p1 p6 p12 f1 t1 file1 e1 e2 e3 e4 e5 e6 user
