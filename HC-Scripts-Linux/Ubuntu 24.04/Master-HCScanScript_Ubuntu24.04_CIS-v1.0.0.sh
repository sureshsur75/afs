#!/bin/bash

# Re-exec with bash if run under sh/dash
if [ -z "$BASH_VERSION" ]; then
    exec bash "$0" "$@"
fi
#########################################################################################################
# Author   :   # Sailen Roy & Ayushman Arora
# Email    :   # Sailen.Roy@kyndryl.com & Ayushman.Arora@kyndryl.com
# Modified by: #
# Reviewed by: #
# Platform :   # Ubuntu 24.04 
# Script   :   # Shell script 
# Title    :   # Security Health Check Scan Script for Ubuntu Linux-24.04 - CIS Benchmark_v1.0.0
# The script was developed for the Americas Incubation Pod public cloud accounts under the leadership of Jalendra Ramakrishnegowda.     
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
rm -f p1 p2 p3 p4 p12

##########################################################################################################
#1.1.1.1
#Ensure cramfs kernel module is not available.
#!/usr/bin/env bash

{
 l_output="" l_output2=""
 l_mname="cramfs"
 l_loadable="$(modprobe -n -v "$l_mname")"
 if grep -Pq -- '^\h*install \/bin\/(true|false)' <<< "$l_loadable"; then
 l_output="$l_output\n - module: \"$l_mname\" is not loadable: \"$l_loadable\""
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is loadable: \"$l_loadable\""
 fi
 if ! lsmod | grep "$l_mname" > /dev/null 2>&1; then
 l_output="$l_output\n - module: \"$l_mname\" is not loaded"
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is loaded"
 fi
 if grep -Pq -- "^\h*blacklist\h+$l_mname\b" /etc/modprobe.d/*; then
 l_output="$l_output\n - module: \"$l_mname\" is deny listed"
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is not deny listed"
 fi
 if [ -z "$l_output2" ]; then
  echo "Initial Setup / Configure Filesystem Kernel Modules" >> p1
  echo "Ensure cramfs kernel module is not available." >> p2
  echo "cramfs kernel module is not available." >> p3
  echo "Yes" >> p4
  echo "1.1.1.1" >> p12
 else
  echo "Initial Setup / Configure Filesystem Kernel Modules" >> p1
  echo "Ensure cramfs kernel module is not available." >> p2
  echo "cramfs kernel module is available or loadable." >> p3
  echo "No" >> p4
  echo "1.1.1.1" >> p12
 fi
}

#1.1.1.2
#Ensure freevxfs kernel module is not available.
#!/usr/bin/env bash

{
 l_output="" l_output2=""
 l_mname="freevxfs"
 l_loadable="$(modprobe -n -v "$l_mname")"
 if grep -Pq -- '^\h*install \/bin\/(true|false)' <<< "$l_loadable"; then
 l_output="$l_output\n - module: \"$l_mname\" is not loadable: \"$l_loadable\""
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is loadable: \"$l_loadable\""
 fi
 if ! lsmod | grep "$l_mname" > /dev/null 2>&1; then
 l_output="$l_output\n - module: \"$l_mname\" is not loaded"
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is loaded"
 fi
 if grep -Pq -- "^\h*blacklist\h+$l_mname\b" /etc/modprobe.d/*; then
 l_output="$l_output\n - module: \"$l_mname\" is deny listed"
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is not deny listed"
 fi
 if [ -z "$l_output2" ]; then
  echo "Initial Setup / Configure Filesystem Kernel Modules" >> p1
  echo "Ensure freevxfs kernel module is not available." >> p2
  echo "freevxfs kernel module is not available." >> p3
  echo "Yes" >> p4
  echo "1.1.1.2" >> p12
 else
  echo "Initial Setup / Configure Filesystem Kernel Modules" >> p1
  echo "Ensure freevxfs kernel module is not available." >> p2
  echo "freevxfs kernel module is available or loadable." >> p3
  echo "No" >> p4
  echo "1.1.1.2" >> p12
 fi
}

#1.1.1.3
#Ensure hfs kernel module is not available.
#!/usr/bin/env bash

{
 l_output="" l_output2=""
 l_mname="hfs"
 l_loadable="$(modprobe -n -v "$l_mname")"
 if grep -Pq -- '^\h*install \/bin\/(true|false)' <<< "$l_loadable"; then
 l_output="$l_output\n - module: \"$l_mname\" is not loadable: \"$l_loadable\""
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is loadable: \"$l_loadable\""
 fi
 if ! lsmod | grep "$l_mname" > /dev/null 2>&1; then
 l_output="$l_output\n - module: \"$l_mname\" is not loaded"
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is loaded"
 fi
 if grep -Pq -- "^\h*blacklist\h+$l_mname\b" /etc/modprobe.d/*; then
 l_output="$l_output\n - module: \"$l_mname\" is deny listed"
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is not deny listed"
 fi
 if [ -z "$l_output2" ]; then
  echo "Initial Setup / Configure Filesystem Kernel Modules" >> p1
  echo "Ensure hfs kernel module is not available." >> p2
  echo "hfs kernel module is not available." >> p3
  echo "Yes" >> p4
  echo "1.1.1.3" >> p12
 else
  echo "Initial Setup / Configure Filesystem Kernel Modules" >> p1
  echo "Ensure hfs kernel module is not available." >> p2
  echo "hfs kernel module is available or loadable." >> p3
  echo "No" >> p4
  echo "1.1.1.3" >> p12
 fi
}

#1.1.1.4
#Ensure hfsplus kernel module is not available.
#!/usr/bin/env bash

{
 l_output="" l_output2=""
 l_mname="hfsplus"
 l_loadable="$(modprobe -n -v "$l_mname")"
 if grep -Pq -- '^\h*install \/bin\/(true|false)' <<< "$l_loadable"; then
 l_output="$l_output\n - module: \"$l_mname\" is not loadable: \"$l_loadable\""
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is loadable: \"$l_loadable\""
 fi
 if ! lsmod | grep "$l_mname" > /dev/null 2>&1; then
 l_output="$l_output\n - module: \"$l_mname\" is not loaded"
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is loaded"
 fi
 if grep -Pq -- "^\h*blacklist\h+$l_mname\b" /etc/modprobe.d/*; then
 l_output="$l_output\n - module: \"$l_mname\" is deny listed"
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is not deny listed"
 fi
 if [ -z "$l_output2" ]; then
  echo "Initial Setup / Configure Filesystem Kernel Modules" >> p1
  echo "Ensure hfsplus kernel module is not available." >> p2
  echo "hfsplus kernel module is not available." >> p3
  echo "Yes" >> p4
  echo "1.1.1.4" >> p12
 else
  echo "Initial Setup / Configure Filesystem Kernel Modules" >> p1
  echo "Ensure hfsplus kernel module is not available." >> p2
  echo "hfsplus kernel module is available or loadable." >> p3
  echo "No" >> p4
  echo "1.1.1.4" >> p12
 fi
}

#1.1.1.5
#Ensure jffs2 kernel module is not available.
#!/usr/bin/env bash

{
 l_output="" l_output2=""
 l_mname="jffs2"
 l_loadable="$(modprobe -n -v "$l_mname")"
 if grep -Pq -- '^\h*install \/bin\/(true|false)' <<< "$l_loadable"; then
 l_output="$l_output\n - module: \"$l_mname\" is not loadable: \"$l_loadable\""
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is loadable: \"$l_loadable\""
 fi
 if ! lsmod | grep "$l_mname" > /dev/null 2>&1; then
 l_output="$l_output\n - module: \"$l_mname\" is not loaded"
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is loaded"
 fi
 if grep -Pq -- "^\h*blacklist\h+$l_mname\b" /etc/modprobe.d/*; then
 l_output="$l_output\n - module: \"$l_mname\" is deny listed"
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is not deny listed"
 fi
 if [ -z "$l_output2" ]; then
  echo "Initial Setup / Configure Filesystem Kernel Modules" >> p1
  echo "Ensure jffs2 kernel module is not available." >> p2
  echo "jffs2 kernel module is not available." >> p3
  echo "Yes" >> p4
  echo "1.1.1.5" >> p12
 else
  echo "Initial Setup / Configure Filesystem Kernel Modules" >> p1
  echo "Ensure jffs2 kernel module is not available." >> p2
  echo "jffs2 kernel module is available or loadable." >> p3
  echo "No" >> p4
  echo "1.1.1.5" >> p12
 fi
}

#1.1.1.9
#Ensure usb-storage kernel module is not available.
#!/usr/bin/env bash

{
 l_output="" l_output2=""
 l_mname="usb-storage"
 l_loadable="$(modprobe -n -v "$l_mname")"
 if grep -Pq -- '^\h*install \/bin\/(true|false)' <<< "$l_loadable"; then
 l_output="$l_output\n - module: \"$l_mname\" is not loadable: \"$l_loadable\""
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is loadable: \"$l_loadable\""
 fi
 if ! lsmod | grep "$l_mname" > /dev/null 2>&1; then
 l_output="$l_output\n - module: \"$l_mname\" is not loaded"
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is loaded"
 fi
 if grep -Pq -- "^\h*blacklist\h+$l_mname\b" /etc/modprobe.d/*; then
 l_output="$l_output\n - module: \"$l_mname\" is deny listed"
 else
 l_output2="$l_output2\n - module: \"$l_mname\" is not deny listed"
 fi
 if [ -z "$l_output2" ]; then
  echo "Initial Setup / Configure Filesystem Kernel Modules" >> p1
  echo "Ensure usb-storage kernel module is not available." >> p2
  echo "usb-storage kernel module is not available." >> p3
  echo "Yes" >> p4
  echo "1.1.1.9" >> p12
 else
  echo "Initial Setup / Configure Filesystem Kernel Modules" >> p1
  echo "Ensure usb-storage kernel module is not available." >> p2
  echo "usb-storage kernel module is available or loadable." >> p3
  echo "No" >> p4
  echo "1.1.1.9" >> p12
 fi
}
####################################################################################################
#1.1.2.1.1
#Ensure /tmp is tmpfs or a separate partition.
{
 l_output="" l_output2=""
 # Check 1: /tmp is mounted
 if findmnt -kn /tmp | grep -q '/tmp'; then
  l_output="$l_output /tmp is mounted."
 else
  l_output2="$l_output2 /tmp is not mounted."
 fi
 # Check 2: tmp.mount is enabled and not masked/disabled
 l_status="$(systemctl is-enabled tmp.mount 2>/dev/null)"
 if [ "$l_status" = "masked" ] || [ "$l_status" = "disabled" ]; then
  l_output2="$l_output2 tmp.mount is $l_status."
 else
  l_output="$l_output tmp.mount status: $l_status."
 fi
 if [ -z "$l_output2" ]; then
  echo "Initial Setup / Configure Filesystem Partitions" >> p1
  echo "Ensure /tmp is tmpfs or a separate partition." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "1.1.2.1.1" >> p12
 else
  echo "Initial Setup / Configure Filesystem Partitions" >> p1
  echo "Ensure /tmp is tmpfs or a separate partition." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "1.1.2.1.1" >> p12
 fi
}

#1.1.2.1.2
#Ensure nodev option set on /tmp partition.
tmp_nodev=$(findmnt --kernel /tmp | grep nodev)
if [[ -z "$tmp_nodev" ]]; then
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure nodev option set on /tmp partition." >> p2
  	echo "nodev option is not set for /tmp mount." >> p3
  	echo "No" >> p4
	echo "1.1.2.1.2" >> p12
else
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure nodev option set on /tmp partition." >> p2
  	echo "nodev option is set for /tmp mount." >> p3
  	echo "Yes" >> p4
  	echo "1.1.2.1.2" >> p12
fi

#1.1.2.1.3
#Ensure nosuid option set on /tmp partition.
tmp_nosuid=$(findmnt --kernel /tmp | grep nosuid)
if [[ -z "$tmp_nosuid" ]]; then
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure nosuid option set on /tmp partition." >> p2
  	echo "nosuid option is not set for /tmp mount." >> p3
  	echo "No" >> p4
	echo "1.1.2.1.3" >> p12
else
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure nosuid option set on /tmp partition." >> p2
  	echo "nosuid option is set for /tmp mount." >> p3
  	echo "Yes" >> p4
  	echo "1.1.2.1.3" >> p12
fi


#1.1.2.1.4
#Ensure noexec option set on /tmp partition.
tmp_noexec=$(findmnt --kernel /tmp | grep noexec)
if [[ -z "$tmp_noexec" ]]; then
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure noexec option set on /tmp partition." >> p2
  	echo "noexec option is not set for /tmp mount." >> p3
  	echo "No" >> p4
	echo "1.1.2.1.4" >> p12
else
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure noexec option set on /tmp partition." >> p2
  	echo "noexec option is set for /tmp mount." >> p3
  	echo "Yes" >> p4
  	echo "1.1.2.1.4" >> p12
fi
#################################################################################################
#1.1.2.2.1
#Ensure /dev/shm is tmpfs or a separate partition.
#!/usr/bin/env bash

{
 l_output="" l_output2=""

 # Check: /dev/shm is mounted as tmpfs
 if findmnt -kn /dev/shm | grep -q '/dev/shm'; then
  l_mount="$(findmnt -kn /dev/shm)"
  l_output="$l_output\n - /dev/shm is mounted: $l_mount"
 else
  l_output2="$l_output2\n - /dev/shm is not mounted"
 fi

 if [ -z "$l_output2" ]; then
  echo "Initial Setup / Configure Filesystem Partitions" >> p1
  echo "Ensure /dev/shm is tmpfs or a separate partition." >> p2
  echo "/dev/shm is mounted as tmpfs." >> p3
  echo "Yes" >> p4
  echo "1.1.2.2.1" >> p12
 else
  echo "Initial Setup / Configure Filesystem Partitions" >> p1
  echo "Ensure /dev/shm is tmpfs or a separate partition." >> p2
  echo "/dev/shm is not mounted as tmpfs or separate partition." >> p3
  echo "No" >> p4
  echo "1.1.2.2.1" >> p12
 fi
}

#1.1.2.2.2
#Ensure nodev option set on /dev/shm partition.
devshm_nodev=$(findmnt --kernel /dev/shm| grep nodev)
if [[ -z "$devshm_nodev" ]]; then
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure nodev option set on /dev/shm partition." >> p2
  	echo "nodev option is not set for /dev/shm mount." >> p3
  	echo "No" >> p4
	echo "1.1.2.2.2" >> p12
else
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure nodev option set on /dev/shm partition." >> p2
  	echo "nodev option is set for /dev/shm mount." >> p3
  	echo "Yes" >> p4
  	echo "1.1.2.2.2" >> p12
fi

#1.1.2.2.3
#Ensure nosuid option set on /dev/shm partition.
devshm_nosuid=$(findmnt --kernel /dev/shm| grep nosuid)
if [[ -z "$devshm_nosuid" ]]; then
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure nosuid option set on /dev/shm partition." >> p2
  	echo "nosuid option is not set for /dev/shm mount." >> p3
  	echo "No" >> p4
	echo "1.1.2.2.3" >> p12
else
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure nosuid option set on /dev/shm partition." >> p2
  	echo "nosuid option is set for /dev/shm mount." >> p3
  	echo "Yes" >> p4
  	echo "1.1.2.2.3" >> p12
fi

#1.1.2.2.4
#Ensure noexec option set on /dev/shm partition.
devshm_noexec=$(findmnt --kernel /dev/shm| grep noexec)
if [[ -z "$devshm_noexec" ]]; then
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure noexec option set on /dev/shm partition." >> p2
  	echo "noexec option is not set for /dev/shm mount." >> p3
  	echo "No" >> p4
	echo "1.1.2.2.4" >> p12
else
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure noexec option set on /dev/shm partition." >> p2
  	echo "noexec option is set for /dev/shm mount." >> p3
  	echo "Yes" >> p4
  	echo "1.1.2.2.4" >> p12
fi

##############################################################################################

#1.1.2.3.2
#Ensure nodev option set on /home partition.
home_nodev=$(findmnt --kernel /home | grep nodev)
if [[ -z "$home_nodev" ]]; then
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure nodev option set on /home partition." >> p2
  	echo "nodev option is not set for /home mount." >> p3
  	echo "No" >> p4
	echo "1.1.2.3.2" >> p12
else
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure nodev option set on /home partition." >> p2
  	echo "nodev option is set for /home mount." >> p3
  	echo "Yes" >> p4
  	echo "1.1.2.3.2" >> p12
fi

#1.1.2.3.3
#Ensure nosuid option set on /home partition.
home_nosuid=$(findmnt --kernel /home | grep nosuid)
if [[ -z "$home_nosuid" ]]; then
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure nosuid option set on /home partition." >> p2
  	echo "nosuid option is not set for /home mount." >> p3
  	echo "No" >> p4
	echo "1.1.2.3.3" >> p12
else
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure nosuid option set on /home partition." >> p2
  	echo "nosuid option is set for /home mount." >> p3
  	echo "Yes" >> p4
  	echo "1.1.2.3.3" >> p12
fi

#################################################################################################

#1.1.2.4.2
#Ensure nodev option set on /var partition.
var_nodev=$(findmnt --kernel /var | grep nodev)
if [[ -z "$var_nodev" ]]; then
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure nodev option set on /var partition." >> p2
  	echo "nodev option is not set for /var mount." >> p3
  	echo "No" >> p4
	echo "1.1.2.4.2" >> p12
else
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure nodev option set on /var partition." >> p2
  	echo "nodev option is set for /var mount." >> p3
  	echo "Yes" >> p4
  	echo "1.1.2.4.2" >> p12
fi

#1.1.2.4.3
#Ensure nosuid option set on /var partition.
var_nosuid=$(findmnt --kernel /var | grep nosuid)
if [[ -z "$var_nosuid" ]]; then
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure nosuid option set on /var partition." >> p2
  	echo "nosuid option is not set for /var mount." >> p3
  	echo "No" >> p4
	echo "1.1.2.4.3" >> p12
else
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure nosuid option set on /var partition." >> p2
  	echo "nosuid option is set for /var mount." >> p3
  	echo "Yes" >> p4
  	echo "1.1.2.4.3" >> p12
fi
###############################################################################################

#1.1.2.5.2
#Ensure nodev option set on /var/tmp partition.
vartmp_nodev=$(findmnt --kernel /var/tmp | grep nodev)
if [[ -z "$vartmp_nodev" ]]; then
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure nodev option set on /var/tmp partition." >> p2
  	echo "nodev option is not set for /var/tmp mount." >> p3
  	echo "No" >> p4
	echo "1.1.2.5.2" >> p12
else
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure nodev option set on /var/tmp partition." >> p2
  	echo "nodev option is set for /var/tmp mount." >> p3
  	echo "Yes" >> p4
  	echo "1.1.2.5.2" >> p12
fi


#1.1.2.5.3
#Ensure nosuid option set on /var/tmp partition.
vartmp_nosuid=$(findmnt --kernel /var/tmp | grep nosuid)
if [[ -z "$vartmp_nosuid" ]]; then
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure nosuid option set on /var/tmp partition." >> p2
  	echo "nosuid option is not set for /var/tmp mount." >> p3
  	echo "No" >> p4
	echo "1.1.2.5.3" >> p12
else
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure nosuid option set on /var/tmp partition." >> p2
  	echo "nosuid option is set for /var/tmp mount." >> p3
  	echo "Yes" >> p4
  	echo "1.1.2.5.3" >> p12
fi

#1.1.2.5.4
#Ensure noexec option set on /var/tmp partition.
vartmp_noexec=$(findmnt --kernel /var/tmp | grep noexec)
if [[ -z "$vartmp_noexec" ]]; then
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure noexec option set on /var/tmp partition." >> p2
  	echo "noexec option is not set for /var/tmp mount." >> p3
  	echo "No" >> p4
	echo "1.1.2.5.4" >> p12
else
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure noexec option set on /var/tmp partition." >> p2
  	echo "noexec option is set for /var/tmp mount." >> p3
  	echo "Yes" >> p4
  	echo "1.1.2.5.4" >> p12
fi

###############################################################################################

#1.1.2.6.2
#Ensure nodev option set on /var/log partition.
varlog_nodev=$(findmnt --kernel /var/log | grep nodev)
if [[ -z "$varlog_nodev" ]]; then
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure nodev option set on /var/log partition." >> p2
  	echo "nodev option is not set for /var/log mount." >> p3
  	echo "No" >> p4
	echo "1.1.2.6.2" >> p12
else
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure nodev option set on /var/log partition." >> p2
  	echo "nodev option is set for /var/log mount." >> p3
  	echo "Yes" >> p4
  	echo "1.1.2.6.2" >> p12
fi

#1.1.2.6.3
#Ensure nosuid option set on /var/log partition.
varlog_nosuid=$(findmnt --kernel /var/log | grep nosuid)
if [[ -z "$varlog_nosuid" ]]; then
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure nosuid option set on /var/log partition." >> p2
  	echo "nosuid option is not set for /var/log mount." >> p3
  	echo "No" >> p4
	echo "1.1.2.6.3" >> p12
else
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure nosuid option set on /var/log partition." >> p2
  	echo "nosuid option is set for /var/log mount." >> p3
  	echo "Yes" >> p4
  	echo "1.1.2.6.3" >> p12
fi


#1.1.2.6.4
#Ensure noexec option set on /var/log partition.
varlog_noexec=$(findmnt --kernel /var/log | grep noexec)
if [[ -z "$varlog_noexec" ]]; then
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure noexec option set on /var/log partition." >> p2
  	echo "noexec option is not set for /var/log mount." >> p3
  	echo "No" >> p4
	echo "1.1.2.6.4" >> p12
else
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure noexec option set on /var/log partition." >> p2
  	echo "noexec option is set for /var/log mount." >> p3
  	echo "Yes" >> p4
  	echo "1.1.2.6.4" >> p12
fi

###############################################################################################

#1.1.2.7.2
#Ensure nodev option set on /var/log/audit partition.
varlogaudir_nodev=$(findmnt --kernel /var/log/audit| grep nodev)
if [[ -z "$varlogaudir_nodev" ]]; then
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure nodev option set on /var/log/audit partition." >> p2
  	echo "nodev option is not set on /var/log/audit." >> p3
  	echo "No" >> p4
	echo "1.1.2.7.2" >> p12
else
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure nodev option set on /var/log/audit partition." >> p2
  	echo "nodev option is set on /var/log/audit." >> p3
  	echo "Yes" >> p4
  	echo "1.1.2.7.2" >> p12
fi

#1.1.2.7.3
#Ensure nosuid option set on /var/log/audit partition.
varlogaudir_nosuid=$(findmnt --kernel /var/log/audit| grep nosuid)
if [[ -z "$varlogaudir_nosuid" ]]; then
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure nosuid option set on /var/log/audit partition." >> p2
  	echo "nosuid option is not set on /var/log/audit." >> p3
  	echo "No" >> p4
	echo "1.1.2.7.3" >> p12
else
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure nosuid option set on /var/log/audit partition." >> p2
  	echo "nosuid option is set on /var/log/audit." >> p3
  	echo "Yes" >> p4
  	echo "1.1.2.7.3" >> p12
fi

#1.1.2.7.4
#Ensure noexec option set on /var/log/audit partition.
varlogaudir_noexec=$(findmnt --kernel /var/log/audit| grep noexec)
if [[ -z "$varlogaudir_noexec" ]]; then
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure noexec option set on /var/log/audit partition." >> p2
  	echo "noexec option is not set on /var/log/audit." >> p3
  	echo "No" >> p4
	echo "1.1.2.7.4" >> p12
else
	echo "Initial Setup / Configure Filesystem Partitions" >> p1
  	echo "Ensure noexec option set on /var/log/audit partition." >> p2
  	echo "noexec option is set on /var/log/audit." >> p3
  	echo "Yes" >> p4
  	echo "1.1.2.7.4" >> p12
fi

###############################################################################################

#1.3.1.1
#Ensure the apparmor packages are installed.
#!/usr/bin/env bash

{
 l_output="" l_output2=""

 if dpkg-query -s apparmor &>/dev/null; then
  l_output="$l_output apparmor is installed."
 else
  l_output2="$l_output2 apparmor is NOT installed."
 fi

 if dpkg-query -s apparmor-utils &>/dev/null; then
  l_output="$l_output apparmor-utils is installed."
 else
  l_output2="$l_output2 apparmor-utils is NOT installed."
 fi

 if [ -z "$l_output2" ]; then
  echo "Initial Setup / Mandatory Access Control" >> p1
  echo "Ensure the apparmor packages are installed." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "1.3.1.1" >> p12
 else
  echo "Initial Setup / Mandatory Access Control" >> p1
  echo "Ensure the apparmor packages are installed." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "1.3.1.1" >> p12
 fi
}

#1.3.1.2
#Ensure AppArmor is enabled in the bootloader configuration.
#!/usr/bin/env bash

{
 l_output="" l_output2=""

 # Check apparmor=0 is NOT in grub config (would disable AppArmor)
 if grep -q "apparmor=0" /boot/grub/grub.cfg 2>/dev/null; then
  l_output2="apparmor=0 found in /boot/grub/grub.cfg - AppArmor is disabled."
 else
  l_output="apparmor=0 not found in grub config - AppArmor is enabled."
 fi

 if [ -z "$l_output2" ]; then
  echo "Initial Setup / Mandatory Access Control" >> p1
  echo "Ensure AppArmor is enabled in the bootloader configuration." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "1.3.1.2" >> p12
 else
  echo "Initial Setup / Mandatory Access Control" >> p1
  echo "Ensure AppArmor is enabled in the bootloader configuration." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "1.3.1.2" >> p12
 fi
}


#1.3.1.3
#Ensure all AppArmor Profiles are in enforce or complain mode (Automated)
#!/usr/bin/env bash

{
    l_output=""
    l_output2=""

    aa_status="$(apparmor_status 2>/dev/null)"

    # Get counts
    unconfined_profiles=$(echo "$aa_status" | awk '/profiles are in unconfined mode/{print $1}')
    unconfined_processes=$(echo "$aa_status" | awk '/processes are unconfined but have a profile defined/{print $1}')

    # Default to 0 if the fields don't exist
    unconfined_profiles=${unconfined_profiles:-0}
    unconfined_processes=${unconfined_processes:-0}

    if [ "$unconfined_profiles" -eq 0 ] && [ "$unconfined_processes" -eq 0 ]; then
        l_output="Unconfined Profiles: $unconfined_profiles. Processes Unconfined: $unconfined_processes."

        echo "Initial Setup / Mandatory Access Control" >> p1
        echo "Ensure all AppArmor Profiles are in enforce or complain mode." >> p2
        echo "$l_output" >> p3
        echo "Yes" >> p4
        echo "1.3.1.3" >> p12
    else
        l_output2="Unconfined Profiles: $unconfined_profiles. Processes Unconfined: $unconfined_processes."

        echo "Initial Setup / Mandatory Access Control" >> p1
        echo "Ensure all AppArmor Profiles are in enforce or complain mode." >> p2
        echo "$l_output2" >> p3
        echo "No" >> p4
        echo "1.3.1.3" >> p12
    fi
}

###########################################################################################################

#1.4.1
#Ensure bootloader password is set.
{
 l_output="" l_output2=""
 fileb="/boot/grub/grub.cfg"
 if [ ! -f "$fileb" ]; then
  l_output2="File $fileb does not exist."
 elif ! grep -q "^set superusers" "$fileb"; then
  l_output2="Superuser not found in bootloader file $fileb."
 elif ! grep -q "^password" "$fileb"; then
  l_output2="Superuser found but password is not set in $fileb."
 else
  l_output="Superuser and password are configured in $fileb."
 fi
 if [ -z "$l_output2" ]; then
  echo "Initial Setup / Configure Bootloader" >> p1
  echo "Ensure bootloader password is set." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "1.4.1" >> p12
 else
  echo "Initial Setup / Configure Bootloader" >> p1
  echo "Ensure bootloader password is set." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "1.4.1" >> p12
 fi
}

#1.4.2
#Ensure access to bootloader config is configured.
#!/usr/bin/env bash

{
 l_output="" l_output2=""

 l_file="/boot/grub/grub.cfg"

 if [ -f "$l_file" ]; then
  l_perms="$(stat -c '%a' $l_file)"
  l_uid="$(stat -c '%U' $l_file)"
  l_gid="$(stat -c '%G' $l_file)"

  if [ "$l_perms" -le 600 ] 2>/dev/null; then
   l_output="$l_output Permissions on $l_file are $l_perms (0600 or more restrictive)."
  else
   l_output2="$l_output2 Permissions on $l_file are $l_perms (should be 0600 or more restrictive)."
  fi

  if [ "$l_uid" = "root" ] && [ "$l_gid" = "root" ]; then
   l_output="$l_output Owned by root:root."
  else
   l_output2="$l_output2 Ownership is $l_uid:$l_gid (should be root:root)."
  fi
 else
  l_output2="$l_file not found."
 fi

 if [ -z "$l_output2" ]; then
  echo "Initial Setup / Configure Bootloader" >> p1
  echo "Ensure access to bootloader config is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "1.4.2" >> p12
 else
  echo "Initial Setup / Configure Bootloader" >> p1
  echo "Ensure access to bootloader config is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "1.4.2" >> p12
 fi
}

###########################################################################################################
#1.5.1 
#Ensure address space layout randomization is enabled (Automated).
#!/usr/bin/env bash

{
    a_output=()
    a_output2=()
    a_parlist=("kernel.randomize_va_space=2")

    l_ufwscf="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"

    f_kernel_parameter_chk() {

        l_running_parameter_value="$(sysctl "$l_parameter_name" | awk -F= '{print $2}' | xargs)"

        # Check running configuration
        if grep -Pq -- '\b'"$l_parameter_value"'\b' <<< "$l_running_parameter_value"; then
            a_output+=("Running")
        else
            a_output2+=("\"$l_parameter_name\" is incorrectly set to \"$l_running_parameter_value\" in the running configuration")
        fi

        unset A_out
        declare -A A_out

        # Check durable setting (files)
        while read -r l_out; do
            if [ -n "$l_out" ]; then
                if [[ $l_out =~ ^\s*# ]]; then
                    l_file="${l_out//# /}"
                else
                    l_kpar="$(awk -F= '{print $1}' <<< "$l_out" | xargs)"
                    [ "$l_kpar" = "$l_parameter_name" ] && A_out+=(["$l_kpar"]="$l_file")
                fi
            fi
        done < <(
            "$l_systemdsysctl" --cat-config |
            grep -Po '^\h*([^#\n\r]+|#\h*\/[^#\n\r\h]+\.conf\b)'
        )

        # Account for systems with UFW
        if [ -n "$l_ufwscf" ]; then
            l_kpar="$(grep -Po "^\h*$l_parameter_name\b" "$l_ufwscf" | xargs)"
            l_kpar="${l_kpar//\//.}"
            [ "$l_kpar" = "$l_parameter_name" ] && A_out+=(["$l_kpar"]="$l_ufwscf")
        fi

        # Check persistent configuration
        if (( ${#A_out[@]} > 0 )); then
            l_found="false"

            while IFS="=" read -r l_fkpname l_file_parameter_value; do

                l_fkpname="${l_fkpname// /}"
                l_file_parameter_value="${l_file_parameter_value// /}"

                if [ "$l_file_parameter_value" = "$l_parameter_value" ]; then
                    l_found="true"
                    break
                fi

            done < <(
                grep -Po -- "^\h*$l_parameter_name\h*=\h*\H+" "${A_out[@]}"
            )

            if [ "$l_found" != "true" ]; then
                a_output2+=("\"$l_parameter_name\" is not set in an included file")
            fi

        else
            a_output2+=("\"$l_parameter_name\" is not set in an included file")
        fi
    }

    l_systemdsysctl="$(readlink -f /lib/systemd/systemd-sysctl)"

    while IFS="=" read -r l_parameter_name l_parameter_value; do

        l_parameter_name="${l_parameter_name// /}"
        l_parameter_value="${l_parameter_value// /}"

        l_value_out="${l_parameter_value//-/ through }"
        l_value_out="${l_value_out//|/ or }"
        l_value_out="$(tr -d '(){}' <<< "$l_value_out")"

        f_kernel_parameter_chk

    done < <(printf '%s\n' "${a_parlist[@]}")

    ##########################################################
    # Reporting
    ##########################################################
    echo "Initial Setup / Configure Additional Process Hardening" >> p1
    echo "Ensure address space layout randomization is enabled." >> p2
    if [ ${#a_output2[@]} -eq 0 ]; then
        echo "kernel.randomize_va_space is correctly set to 2" >> p3
        echo "Yes" >> p4
    else
        # Report only the first failure reason
        echo "${a_output2[0]}" >> p3
        echo "No" >> p4
    fi
    echo "1.5.1" >> p12
}

###########################################################################################################
#1.5.2
#Ensure ptrace_scope is configured.
#!/usr/bin/env bash

{
 l_output="" l_output2=""
 l_parameter_name="kernel.yama.ptrace_scope"

 # Check 1: Running configuration (acceptable values: 1, 2, or 3)
 l_running="$(sysctl $l_parameter_name 2>/dev/null | awk -F= '{print $2}' | tr -d ' ')"
 if [[ "$l_running" =~ ^[123]$ ]]; then
  l_output="$l_output $l_parameter_name is set to $l_running in running config."
 else
  l_output2="$l_output2 $l_parameter_name is set to $l_running in running config (expected 1, 2, or 3)."
 fi

 # Check 2: Persistent configuration in sysctl conf files
 l_conf_val="$(grep -rPoi "^\h*$l_parameter_name\h*=\h*[123]\b" \
  /etc/sysctl.conf /etc/sysctl.d/*.conf 2>/dev/null | tail -1)"
 if [ -n "$l_conf_val" ]; then
  l_output="$l_output $l_parameter_name found in sysctl conf: $l_conf_val"
 else
  l_output2="$l_output2 $l_parameter_name not set to 1, 2, or 3 in any sysctl conf file."
 fi

 if [ -z "$l_output2" ]; then
  echo "Initial Setup / Configure Additional Process Hardening" >> p1
  echo "Ensure ptrace_scope is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "1.5.2" >> p12
 else
  echo "Initial Setup / Configure Additional Process Hardening" >> p1
  echo "Ensure ptrace_scope is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "1.5.2" >> p12
 fi
}

#1.5.3
#Ensure core dumps are restricted (Automated)
#!/usr/bin/env bash

{
 l_output="" l_output2=""
 l_parameter_name="fs.suid_dumpable"
 l_expected="0"

 # Check 1: Running configuration
 l_running="$(sysctl $l_parameter_name 2>/dev/null | awk -F= '{print $2}' | tr -d ' ')"
 if [ "$l_running" = "$l_expected" ]; then
  l_output="$l_output $l_parameter_name is set to $l_running in running config."
 else
  l_output2="$l_output2 $l_parameter_name is set to $l_running in running config (expected $l_expected)."
 fi

 # Check 2: Persistent configuration in sysctl conf files
 l_conf_val="$(grep -rPoi "^\h*$l_parameter_name\h*=\h*$l_expected\b" \
  /etc/sysctl.conf /etc/sysctl.d/*.conf 2>/dev/null | tail -1)"
 if [ -n "$l_conf_val" ]; then
  l_output="$l_output $l_parameter_name = $l_expected found in sysctl conf."
 else
  l_output2="$l_output2 $l_parameter_name = $l_expected not found in any sysctl conf file."
 fi

 if [ -z "$l_output2" ]; then
  echo "Initial Setup / Configure Additional Process Hardening" >> p1
  echo "Ensure core dumps are restricted." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "1.5.3" >> p12
 else
  echo "Initial Setup / Configure Additional Process Hardening" >> p1
  echo "Ensure core dumps are restricted." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "1.5.3" >> p12
 fi
}

###########################################################################################################

#1.5.4
#Ensure prelink is not installed (Automated)
otp18=$(dpkg-query -W -f='${binary:Package}\t${Status}\t${db:Status-Status}\n' prelink)
if echo "$otp18" | grep -q 'installed'; then
	echo "Initial Setup / Configure Additional Process Hardening" >> p1
  	echo "Ensure prelink is not installed." >> p2
  	echo "prelink is installed." >> p3
  	echo "No" >> p4
  	echo "1.5.4" >> p12
else
	echo "Initial Setup / Configure Additional Process Hardening" >> p1
  	echo "Ensure prelink is not installed." >> p2
  	echo "prelink is not installed." >> p3
  	echo "Yes" >> p4
	echo "1.5.4" >> p12
fi


###################################################################################################
#1.5.5
#Ensure Automatic Error Reporting is not enabled (Automated).
#!/usr/bin/env bash

{
 l_output="" l_output2=""

 # Check 1: apport not installed OR enabled=0 in /etc/default/apport
 if dpkg-query -s apport &> /dev/null; then
  l_enabled="$(grep -Psi -- '^\h*enabled\h*=\h*[^0]\b' /etc/default/apport 2>/dev/null)"
  if [ -z "$l_enabled" ]; then
   l_output="$l_output apport is installed but enabled=0 in /etc/default/apport."
  else
   l_output2="$l_output2 apport is enabled in /etc/default/apport: $l_enabled"
  fi
 else
  l_output="$l_output apport package is not installed."
 fi

 # Check 2: apport.service is not active
 l_active="$(systemctl is-active apport.service 2>/dev/null | grep 'active')"
 if [ -z "$l_active" ]; then
  l_output="$l_output apport.service is not active."
 else
  l_output2="$l_output2 apport.service is active."
 fi

 if [ -z "$l_output2" ]; then
  echo "Initial Setup / Configure Additional Process Hardening" >> p1
  echo "Ensure Automatic Error Reporting is not enabled." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "1.5.5" >> p12
 else
  echo "Initial Setup / Configure Additional Process Hardening" >> p1
  echo "Ensure Automatic Error Reporting is not enabled." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "1.5.5" >> p12
 fi
}

###################################################################################################

#1.6.1
# Ensure message of the day is configured properly (Automated).

if [ -f /etc/motd ]
then
    # Check if the /etc/motd file is non-empty
    str=$(cat /etc/motd | wc -c)
    if [ "$str" -gt "0" ]
    then
        # Check if any OS information placeholders are present
        os_check=$(grep -E -i "(\\\v|\\\r|\\\m|\\\s|$(grep '^ID=' /etc/os-release | cut -d= -f2 | sed -e 's/"//g'))" /etc/motd)
        if [ -z "$os_check" ]
        then
            echo "Initial Setup / Configure Command Line Warning Banners." >> p1
            echo "Ensure message of the day is configured properly" >> p2
            echo "The message is configured correctly in /etc/motd and no OS-related placeholders were found." >> p3
            echo "Yes" >> p4
            echo "1.6.1" >> p12
        else
            echo "Initial Setup / Configure Command Line Warning Banners." >> p1
            echo "Ensure message of the day is configured properly" >> p2
            echo "The message contains OS information." >> p3
            echo "No" >> p4
            echo "1.6.1" >> p12
        fi
    else
        echo "Initial Setup / Configure Command Line Warning Banners." >> p1
        echo "Ensure message of the day is configured properly" >> p2
        echo "The message of the day file (/etc/motd) is empty." >> p3
        echo "No" >> p4
        echo "1.6.1" >> p12
    fi
else
    echo "Initial Setup / Configure Command Line Warning Banners." >> p1
    echo "Ensure message of the day is configured properly" >> p2
    echo "/etc/motd file does not exist" >> p3
    echo "No" >> p4
    echo "1.6.1" >> p12
fi

###########################################################################################################
#1.6.2
#Ensure local login warning banner is configured properly (Automated).
if [ -f /etc/issue ]
then
    # Retrieve the OS information
    OS_ID=$(grep '^ID=' /etc/os-release | cut -d= -f2 | sed -e 's/"//g')

    # Check if /etc/issue reveals any OS-related information
    GREP_RESULT=$(grep -E -i "(\\\v|\\\r|\\\m|\\\s|$OS_ID)" /etc/issue)

    # Get the content of /etc/motd to compare against /etc/issue
    MOTD_CONTENT=$(cat /etc/motd)

    # Get the content of /etc/issue
    ISSUE_CONTENT=$(cat /etc/issue)

    if [[ -z "$GREP_RESULT" ]]
    then
        if [[ -z "$ISSUE_CONTENT" ]]
        then
            # /etc/issue is empty, which is valid as per the requirement
            echo "Initial Setup / Configure Command Line Warning Banners." >> p1
            echo "Ensure local login warning banner is configured properly" >> p2
            echo "The /etc/issue file is empty." >> p3
            echo "No" >> p4
            echo "1.6.2" >> p12
        elif [[ "$ISSUE_CONTENT" == "$MOTD_CONTENT" ]]
        then
            # /etc/issue contains the same message as /etc/motd, which is not allowed
            echo "Initial Setup / Configure Command Line Warning Banners." >> p1
            echo "Ensure local login warning banner is configured properly" >> p2
            echo "/etc/issue contains the same message as /etc/motd which is not correct." >> p3
            echo "No" >> p4
            echo "1.6.2" >> p12
        else
            # /etc/issue contains a valid business notice that does not reveal OS info or duplicate /etc/motd
            echo "Initial Setup / Configure Command Line Warning Banners." >> p1
            echo "Ensure local login warning banner is configured properly" >> p2
            echo "The message is configured correctly in /etc/issue." >> p3
            echo "Yes" >> p4
            echo "1.6.2" >> p12
        fi
    else
        # /etc/issue reveals OS information, which is not allowed
        echo "Initial Setup / Configure Command Line Warning Banners." >> p1
        echo "Ensure local login warning banner is configured properly" >> p2
        echo "The message reveals OS information in /etc/issue." >> p3
        echo "No" >> p4
        echo "1.6.2" >> p12
    fi
else
    # /etc/issue file does not exist, mark as invalid
    echo "Initial Setup / Configure Command Line Warning Banners." >> p1
    echo "Ensure local login warning banner is configured properly" >> p2
    echo "/etc/issue file does not exist." >> p3
    echo "No" >> p4
    echo "1.6.2" >> p12
fi

###########################################################################################################
#1.6.3
#Ensure remote login warning banner is configured properly (Automated).
if [ -f /etc/issue.net ]
then
    # Retrieve the OS information
    OS_ID=$(grep '^ID=' /etc/os-release | cut -d= -f2 | sed -e 's/"//g')

    # Check if /etc/issue.net reveals any OS-related information
    GREP_RESULT=$(grep -E -i "(\\\v|\\\r|\\\m|\\\s|$OS_ID)" /etc/issue.net)

    # Get the content of /etc/motd to compare against /etc/issue.net
    MOTD_CONTENT=$(cat /etc/motd)

    # Get the content of /etc/issue.net
    ISSUE_CONTENT=$(cat /etc/issue.net)

    if [[ -z "$GREP_RESULT" ]]
    then
        if [[ -z "$ISSUE_CONTENT" ]]
        then
            # /etc/issue.net is empty, which is valid as per the requirement
            echo "Initial Setup / Configure Command Line Warning Banners" >> p1
            echo "Ensure remote login warning banner is configured properly." >> p2
            echo "The /etc/issue.net file is empty." >> p3
            echo "No" >> p4
            echo "1.6.3" >> p12
        elif [[ "$ISSUE_CONTENT" == "$MOTD_CONTENT" ]]
        then
            # /etc/issue.net contains the same message as /etc/motd, which is not allowed
            echo "Initial Setup / Configure Command Line Warning Banners" >> p1
            echo "Ensure remote login warning banner is configured properly." >> p2
            echo "/etc/issue.net contains the same message as /etc/motd which is not correct." >> p3
            echo "No" >> p4
            echo "1.6.3" >> p12
        else
            # /etc/issue.net contains a valid business notice that does not reveal OS info or duplicate /etc/motd
            echo "Initial Setup / Configure Command Line Warning Banners" >> p1
            echo "Ensure remote login warning banner is configured properly." >> p2
            echo "The message is configured correctly in /etc/issue.net." >> p3
            echo "Yes" >> p4
            echo "1.6.3" >> p12
        fi
    else
        # /etc/issue.net reveals OS information, which is not allowed
        echo "Initial Setup / Configure Command Line Warning Banners" >> p1
        echo "Ensure remote login warning banner is configured properly." >> p2
        echo "The message reveals OS information in /etc/issue.net." >> p3
        echo "No" >> p4
        echo "1.6.3" >> p12
    fi
else
    # /etc/issue.net file does not exist, mark as invalid
    echo "Initial Setup / Configure Command Line Warning Banners" >> p1
    echo "Ensure remote login warning banner is configured properly." >> p2
    echo "/etc/issue.net file does not exist which is required." >> p3
    echo "No" >> p4
    echo "1.6.3" >> p12
fi
###########################################################################################################

#1.6.4
#Ensure access to /etc/motd is configured.
#!/usr/bin/env bash

{
 l_output="" l_output2=""

 if [ -f /etc/motd ]; then
  l_perms="$(stat -c '%a' /etc/motd)"
  l_uid="$(stat -c '%U' /etc/motd)"
  l_gid="$(stat -c '%G' /etc/motd)"

  if [ "$l_perms" -le 644 ] 2>/dev/null; then
   l_output="$l_output Permissions on /etc/motd are $l_perms (0644 or more restrictive)."
  else
   l_output2="$l_output2 Permissions on /etc/motd are $l_perms (should be 0644 or more restrictive)."
  fi

  if [ "$l_uid" = "root" ] && [ "$l_gid" = "root" ]; then
   l_output="$l_output Owned by root:root."
  else
   l_output2="$l_output2 Ownership is $l_uid:$l_gid (should be root:root)."
  fi
 else
  l_output="/etc/motd does not exist - no access configuration required."
 fi

 if [ -z "$l_output2" ]; then
  echo "Initial Setup / Configure Command Line Warning Banners" >> p1
  echo "Ensure access to /etc/motd is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "1.6.4" >> p12
 else
  echo "Initial Setup / Configure Command Line Warning Banners" >> p1
  echo "Ensure access to /etc/motd is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "1.6.4" >> p12
 fi
}
###########################################################################################################
#1.6.5
#Ensure access to /etc/issue is configured.

{
 l_output="" l_output2=""

 if [ -f /etc/issue ]; then
  l_perms="$(stat -c '%a' /etc/issue)"
  l_uid="$(stat -c '%U' /etc/issue)"
  l_gid="$(stat -c '%G' /etc/issue)"

  if [ "$l_perms" -le 644 ] 2>/dev/null; then
   l_output="$l_output Permissions on /etc/issue are $l_perms (0644 or more restrictive)."
  else
   l_output2="$l_output2 Permissions on /etc/issue are $l_perms (should be 0644 or more restrictive)."
  fi

  if [ "$l_uid" = "root" ] && [ "$l_gid" = "root" ]; then
   l_output="$l_output Owned by root:root."
  else
   l_output2="$l_output2 Ownership is $l_uid:$l_gid (should be root:root)."
  fi
 else
  l_output2="/etc/issue does not exist."
 fi

 if [ -z "$l_output2" ]; then
  echo "Initial Setup / Configure Command Line Warning Banners" >> p1
  echo "Ensure access to /etc/issue is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "1.6.5" >> p12
 else
  echo "Initial Setup / Configure Command Line Warning Banners" >> p1
  echo "Ensure access to /etc/issue is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "1.6.5" >> p12
 fi
}
###########################################################################################################
#1.6.6
#Ensure access to /etc/issue.net is configured.

{
 l_output="" l_output2=""

 if [ -f /etc/issue.net ]; then
  l_perms="$(stat -c '%a' /etc/issue.net)"
  l_uid="$(stat -c '%U' /etc/issue.net)"
  l_gid="$(stat -c '%G' /etc/issue.net)"

  if [ "$l_perms" -le 644 ] 2>/dev/null; then
   l_output="$l_output Permissions on /etc/issue.net are $l_perms (0644 or more restrictive)."
  else
   l_output2="$l_output2 Permissions on /etc/issue.net are $l_perms (should be 0644 or more restrictive)."
  fi

  if [ "$l_uid" = "root" ] && [ "$l_gid" = "root" ]; then
   l_output="$l_output Owned by root:root."
  else
   l_output2="$l_output2 Ownership is $l_uid:$l_gid (should be root:root)."
  fi
 else
  l_output2="/etc/issue.net does not exist."
 fi

 if [ -z "$l_output2" ]; then
  echo "Initial Setup / Configure Command Line Warning Banners" >> p1
  echo "Ensure access to /etc/issue.net is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "1.6.6" >> p12
 else
  echo "Initial Setup / Configure Command Line Warning Banners" >> p1
  echo "Ensure access to /etc/issue.net is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "1.6.6" >> p12
 fi
}
###########################################################################################################

#1.7.2
#Ensure GDM login banner is configured.
#!/usr/bin/env bash
{
 l_pkgoutput=""
 if command -v dpkg-query > /dev/null 2>&1; 2>&1; then
 l_pq="dpkg-query -W"
 elif command -v rpm > /dev/null 2>&1; then
 l_pq="rpm -q"
 fi
 l_pcl="gdm gdm3" # Space seporated list of packages to check
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
 l_gdmprofile="$(awk -F\/ '{split($(NF-1),a,".");print a[1]}' <<< "$l_gdmfile")"
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
 echo -e "\n\n - GNOME Desktop Manager isn't installed\n - Recommendation is Not Applicable\n- Audit result:\n *** PASS ***\n"
 fi
 # Report results. If no failures output in l_output2, we pass
 if [ -z "$l_output2" ]; then
 echo -e "\n- Audit Result:\n ** PASS **\n$l_output\n"
	echo "Initial Setup / Configure GNOME Display Manager" >> p1
	echo "Ensure GDM login banner is configured." >> p2
	echo "GDM login banner is configured." >> p3
	echo "Yes" >> p4
	echo "1.7.2" >> p12
 else
 echo -e "\n- Audit Result:\n ** FAIL **\n - Reason(s) for audit failure:\n$l_output2\n"
	echo "Initial Setup / Configure GNOME Display Manager" >> p1
  	echo "Ensure GDM login banner is configured." >> p2
  	echo "GDM login banner is NOT configured." >> p3
  	echo "No" >> p4
  	echo "1.7.2" >> p12
 [ -n "$l_output" ] && echo -e "\n- Correctly set:\n$l_output\n"
 fi
}

#1.7.3 
#Ensure GDM disable-user-list option is enabled.
{
l_pkgoutput=""
if command -v dpkg-query > /dev/null 2>&1; then
l_pq="dpkg-query -W"
elif command -v rpm > /dev/null 2>&1; then
l_pq="rpm -q"
fi
l_pcl="gdm gdm3" # Space seporated list of packages to check
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
echo "Initial Setup / Configure GNOME Display Manager" >> p1
echo "Ensure GDM disable-user-list option is enabled." >> p2
echo "GDM disable-user-list option is enabled." >> p3
echo "Yes" >> p4
echo "1.7.3" >> p12
else
echo "Initial Setup / Configure GNOME Display Manager" >> p1
echo "Ensure GDM disable-user-list option is enabled." >> p2
echo "GDM disable-user-list option is Not enabled." >> p3
echo "No" >> p4
echo "1.7.3" >> p12
[ -n "$output" ] && echo -e "$output\n"
fi
else
echo "Initial Setup / Configure GNOME Display Manager" >> p1
echo "Ensure GDM disable-user-list option is enabled." >> p2
echo "GDM disable-user-list is not configured" >> p3
echo "Yes" >> p4
echo "1.7.3" >> p12
fi
}

#1.7.4
#Ensure GDM screen locks when the user is idle.
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
 l_kfile="$(grep -Psril '^\h*idle-delay\h*=\h*uint32\h+\d+\b' /etc/dconf/db/*/)" # Determine file containing idle-delay key
 if [ -n "$l_kfile" ]; then
 # set profile name (This is the name of a dconf database)
 l_profile="$(awk -F'/' '{split($(NF-1),a,".");print a[1]}' <<< "$l_kfile")" #Set the key profile name
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
 [ -n "$l_pkgoutput" ] && echo -e "\n$l_pkgoutput"
 if [ -z "$l_output2" ]; then
 echo -e "\n- Audit Result:\n ** PASS **\n$l_output\n"
	echo "Initial Setup / Configure GNOME Display Manager" >> p1
	echo "Ensure GDM screen locks when the user is idle." >> p2
	echo "GDM screen locks when the user is idle." >> p3
	echo "Yes" >> p4
	echo "1.7.4" >> p12
 else
 echo -e "\n- Audit Result:\n ** FAIL **\n - Reason(s) for audit failure:\n$l_output2\n"
	echo "Initial Setup / Configure GNOME Display Manager" >> p1
  	echo "Ensure GDM screen locks when the user is idle." >> p2
  	echo "No GDM screen locks when the user is idle." >> p3
  	echo "No" >> p4
  	echo "1.7.4" >> p12
 [ -n "$l_output" ] && echo -e "\n- Correctly set:\n$l_output\n"
 fi
}

#1.7.5
#Ensure GDM screen locks cannot be overridden.

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
 l_kfd="/etc/dconf/db/$(grep -Psril '^\h*idle-delay\h*=\h*uint32\h+\d+\b' /etc/dconf/db/*/ | awk -F'/' '{split($(NF-1),a,".");print a[1]}').d" #set directory of key file to be locked
 l_kfd2="/etc/dconf/db/$(grep -Psril '^\h*lock-delay\h*=\h*uint32\h+\d+\b' /etc/dconf/db/*/ | awk -F'/' '{split($(NF-1),a,".");print a[1]}').d" #set directory of key file to be locked
 if [ -d "$l_kfd" ]; then # If key file directory doesn't exist, options can't be locked
 if grep -Prilq '\/org\/gnome\/desktop\/session\/idle-delay\b' "$l_kfd"; then
 l_output="$l_output\n - \"idle-delay\" is locked in \"$(grep -Pril '\/org\/gnome\/desktop\/session\/idle-delay\b' "$l_kfd")\""
 else
 l_output2="$l_output2\n - \"idle-delay\" is not locked"
 fi
 else
 l_output2="$l_output2\n - \"idle-delay\" is not set so it can not be locked"
 fi
 if [ -d "$l_kfd2" ]; then # If key file directory doesn't exist, options can't be locked
 if grep -Prilq '\/org\/gnome\/desktop\/screensaver\/lock-delay\b' "$l_kfd2"; then
 l_output="$l_output\n - \"lock-delay\" is locked in \"$(grep -Pril '\/org\/gnome\/desktop\/screensaver\/lock-delay\b' "$l_kfd2")\""
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
 [ -n "$l_pkgoutput" ] && echo -e "\n$l_pkgoutput"
 if [ -z "$l_output2" ]; then
 echo -e "\n- Audit Result:\n ** PASS **\n$l_output\n"
 echo "Initial Setup / Configure GNOME Display Manager" >> p1
 echo "Ensure GDM screen locks cannot be overridden." >> p2
 echo "GDM screen locks cannot be overridden." >> p3
 echo "Yes" >> p4
 echo "1.7.5" >> p12
 else
 echo -e "\n- Audit Result:\n ** FAIL **\n - Reason(s) for audit failure:\n$l_output2\n"
 echo "Initial Setup / Configure GNOME Display Manager" >> p1
 echo "Ensure GDM screen locks cannot be overridden." >> p2
 echo "GDM screen locks are overridden" >> p3
 echo "No" >> p4
 echo "1.7.5" >> p12
 [ -n "$l_output" ] && echo -e "\n- Correctly set:\n$l_output\n"
 fi
}

#1.7.6
#Ensure GDM automatic mounting of removable media is disabled.
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
 l_gpname="$(awk -F\/ '{split($(NF-1),a,".");print a[1]}' <<< "$l_kfile")"
 elif [ -f "$l_kfile2" ]; then
 l_gpname="$(awk -F\/ '{split($(NF-1),a,".");print a[1]}' <<< "$l_kfile2")"
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
 l_output="$l_output\n - The dconf directory \"$l_gpdir\" exitst"
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
 echo -e "\n- Audit Result:\n ** PASS **\n$l_output\n"
	echo "Initial Setup / Configure GNOME Display Manager" >> p1
	echo "Ensure GDM automatic mounting of removable media is disabled." >> p2
	echo "GDM automatic mounting of removable media is disabled." >> p3
	echo "Yes" >> p4
	echo "1.7.6" >> p12
 else
 echo -e "\n- Audit Result:\n ** FAIL **\n - Reason(s) for audit failure:\n$l_output2\n"
	echo "Initial Setup / Configure GNOME Display Manager" >> p1
  	echo "Ensure GDM automatic mounting of removable media is disabled." >> p2
  	echo "GDM automatic mounting of removable media is Not disabled. Please check.." >> p3
  	echo "No" >> p4
  	echo "1.7.6" >> p12
 [ -n "$l_output" ] && echo -e "\n- Correctly set:\n$l_output\n"
 fi
}

#1.7.7
#Ensure GDM disabling automatic mounting of removable media is not overridden.
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
 l_output="$l_output\n - \"lautomount-open\" is locked in \"$(grep -Pril '^\h*\/org/gnome\/desktop\/media-handling\/automount-open\b' "$l_kfd2")\""
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
 [ -n "$l_pkgoutput" ] && echo -e "\n$l_pkgoutput"
 if [ -z "$l_output2" ]; then
 echo -e "\n- Audit Result:\n ** PASS **\n$l_output\n"
	echo "Initial Setup / Configure GNOME Display Manager" >> p1
	echo "Ensure GDM disabling automatic mounting of removable media is not overridden." >> p2
	echo "GDM disabling automatic mounting of removable media is not overridden." >> p3
	echo "Yes" >> p4
	echo "1.7.7" >> p12
 else
 echo -e "\n- Audit Result:\n ** FAIL **\n - Reason(s) for audit failure:\n$l_output2\n"
	echo "Initial Setup / Configure GNOME Display Manager" >> p1
  	echo "Ensure GDM disabling automatic mounting of removable media is not overridden." >> p2
  	echo "GDM disabling automatic mounting of removable media is overridden. Please check.." >> p3
  	echo "No" >> p4
  	echo "1.7.7" >> p12
 [ -n "$l_output" ] && echo -e "\n- Correctly set:\n$l_output\n"
 fi
}

#1.7.8
#Ensure GDM autorun-never is enabled.
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
 l_gpname="$(awk -F\/ '{split($(NF-1),a,".");print a[1]}' <<< "$l_kfile")"
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
 l_output="$l_output\n - The dconf directory \"$l_gpdir\" exitst"
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
 echo -e "\n- Audit Result:\n ** PASS **\n$l_output\n"
	echo "Initial Setup / Configure GNOME Display Manager" >> p1
	echo "Ensure GDM autorun-never is enabled." >> p2
	echo "GDM autorun-never is enabled." >> p3
	echo "Yes" >> p4
	echo "1.7.8" >> p12
 else
 echo -e "\n- Audit Result:\n ** FAIL **\n - Reason(s) for audit failure:\n$l_output2\n"
	echo "Initial Setup / Configure GNOME Display Manager" >> p1
  	echo "Ensure GDM autorun-never is enabled." >> p2
  	echo "GDM autorun-never is not enabled. Please check.." >> p3
  	echo "No" >> p4
  	echo "1.7.8" >> p12
 [ -n "$l_output" ] && echo -e "\n- Correctly set:\n$l_output\n"
 fi
}

#1.7.9
#Ensure GDM autorun-never is not overridden.
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
 l_kfd="/etc/dconf/db/$(grep -Psril '^\h*autorun-never\b' /etc/dconf/db/*/ | awk -F'/' '{split($(NF-1),a,".");print a[1]}').d" #set directory of key file to be locked
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
 [ -n "$l_pkgoutput" ] && echo -e "\n$l_pkgoutput"
 if [ -z "$l_output2" ]; then
 echo -e "\n- Audit Result:\n ** PASS **\n$l_output\n"
	echo "Initial Setup / Configure GNOME Display Manager" >> p1
	echo "Ensure GDM autorun-never is not overridden." >> p2
	echo "GDM autorun-never is not overridden." >> p3
	echo "Yes" >> p4
	echo "1.7.9" >> p12
 else
 echo -e "\n- Audit Result:\n ** FAIL **\n - Reason(s) for audit failure:\n$l_output2\n"
	echo "Initial Setup / Configure GNOME Display Manager" >> p1
  	echo "Ensure GDM autorun-never is not overridden." >> p2
  	echo "GDM autorun-never is overridden. Please check.." >> p3
  	echo "No" >> p4
  	echo "1.7.9" >> p12
 [ -n "$l_output" ] && echo -e "\n- Correctly set:\n$l_output\n"
 fi
}

#1.7.10
#Ensure XDMCP is not enabled.

{
l_output=""
l_output2=""

l_files=$(grep -Psi -- '^\h*Enable\s*=\s*true' /etc/gdm3/custom.conf 2>/dev/null)

if [ -z "$l_files" ]; then
 l_output="XDMCP is not enabled."
else
 l_output2="XDMCP is enabled in /etc/gdm3/custom.conf."
fi

if [ -z "$l_output2" ]; then
 echo "Initial Setup / Configure GNOME Display Manager" >> p1
 echo "Ensure XDMCP is not enabled." >> p2
 echo "$l_output" >> p3
 echo "Yes" >> p4
 echo "1.7.10" >> p12
else
 echo "Initial Setup / Configure GNOME Display Manager" >> p1
 echo "Ensure XDMCP is not enabled." >> p2
 echo "$l_output2" >> p3
 echo "No" >> p4
 echo "1.7.10" >> p12
fi
}

###############################################################################################################

#2.1.1
#Ensure autofs services are not in use.

{
l_output=""
l_output2=""

if dpkg-query -s autofs >/dev/null 2>&1; then

 if systemctl is-enabled autofs.service 2>/dev/null | grep -q enabled || \
    systemctl is-active autofs.service 2>/dev/null | grep -q active; then
  l_output2="autofs service is enabled or active."
 else
  l_output="autofs package is installed but service is not enabled or active."
 fi

else
 l_output="autofs package is not installed."
fi

if [ -z "$l_output2" ]; then
 echo "Services / Configure Server Services" >> p1
 echo "Ensure autofs services are not in use." >> p2
 echo "$l_output" >> p3
 echo "Yes" >> p4
 echo "2.1.1" >> p12
else
 echo "Services / Configure Server Services" >> p1
 echo "Ensure autofs services are not in use." >> p2
 echo "$l_output2" >> p3
 echo "No" >> p4
 echo "2.1.1" >> p12
fi
}

#2.1.2
#Ensure avahi daemon services are not in use.

{
l_output=""
l_output2=""

if dpkg-query -s avahi-daemon >/dev/null 2>&1; then

 if systemctl is-enabled avahi-daemon.service 2>/dev/null | grep -q enabled || \
    systemctl is-active avahi-daemon.service 2>/dev/null | grep -q active || \
    systemctl is-enabled avahi-daemon.socket 2>/dev/null | grep -q enabled || \
    systemctl is-active avahi-daemon.socket 2>/dev/null | grep -q active; then

  l_output2="avahi-daemon service or socket is enabled or active."

 else

  l_output="avahi-daemon package installed but service and socket are not active."

 fi

else

 l_output="avahi-daemon package is not installed."

fi

if [ -z "$l_output2" ]; then
 echo "Services / Configure Server Services" >> p1
 echo "Ensure avahi daemon services are not in use." >> p2
 echo "$l_output" >> p3
 echo "Yes" >> p4
 echo "2.1.2" >> p12
else
 echo "Services / Configure Server Services" >> p1
 echo "Ensure avahi daemon services are not in use." >> p2
 echo "$l_output2" >> p3
 echo "No" >> p4
 echo "2.1.2" >> p12
fi
}

#2.1.3
#Ensure dhcp server services are not in use.

{
l_output=""
l_output2=""

if dpkg-query -s isc-dhcp-server >/dev/null 2>&1; then

 if systemctl is-enabled isc-dhcp-server.service 2>/dev/null | grep -q enabled || \
    systemctl is-active isc-dhcp-server.service 2>/dev/null | grep -q active || \
    systemctl is-enabled isc-dhcp-server6.service 2>/dev/null | grep -q enabled || \
    systemctl is-active isc-dhcp-server6.service 2>/dev/null | grep -q active; then

  l_output2="isc-dhcp-server service is enabled or active."

 else

  l_output="isc-dhcp-server package installed but services are not active."

 fi

else

 l_output="isc-dhcp-server package is not installed."

fi

if [ -z "$l_output2" ]; then
 echo "Services / Configure Server Services" >> p1
 echo "Ensure dhcp server services are not in use." >> p2
 echo "$l_output" >> p3
 echo "Yes" >> p4
 echo "2.1.3" >> p12
else
 echo "Services / Configure Server Services" >> p1
 echo "Ensure dhcp server services are not in use." >> p2
 echo "$l_output2" >> p3
 echo "No" >> p4
 echo "2.1.3" >> p12
fi
}

#2.1.4
#Ensure dns server services are not in use.
#!/usr/bin/env bash

{
 l_output="" l_output2=""

 if ! dpkg-query -s bind9 &>/dev/null; then
  l_output="$l_output bind9 package is not installed."
 else
  l_enabled="$(systemctl is-enabled named.service 2>/dev/null | grep 'enabled')"
  l_active="$(systemctl is-active named.service 2>/dev/null | grep '^active')"

  if [ -z "$l_enabled" ]; then
   l_output="$l_output named.service is not enabled."
  else
   l_output2="$l_output2 named.service is enabled."
  fi

  if [ -z "$l_active" ]; then
   l_output="$l_output named.service is not active."
  else
   l_output2="$l_output2 named.service is active."
  fi
 fi

 if [ -z "$l_output2" ]; then
  echo "Services / Configure Server Services" >> p1
  echo "Ensure dns server services are not in use." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "2.1.4" >> p12
 else
  echo "Services / Configure Server Services" >> p1
  echo "Ensure dns server services are not in use." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "2.1.4" >> p12
 fi
}

#2.1.5
#Ensure dnsmasq services are not in use.
#!/usr/bin/env bash

{
 l_output="" l_output2=""

 if ! dpkg-query -s dnsmasq &>/dev/null; then
  l_output="$l_output dnsmasq package is not installed."
 else
  l_enabled="$(systemctl is-enabled dnsmasq.service 2>/dev/null | grep 'enabled')"
  l_active="$(systemctl is-active dnsmasq.service 2>/dev/null | grep '^active')"

  if [ -z "$l_enabled" ]; then
   l_output="$l_output dnsmasq.service is not enabled."
  else
   l_output2="$l_output2 dnsmasq.service is enabled."
  fi

  if [ -z "$l_active" ]; then
   l_output="$l_output dnsmasq.service is not active."
  else
   l_output2="$l_output2 dnsmasq.service is active."
  fi
 fi

 if [ -z "$l_output2" ]; then
  echo "Services / Configure Server Services" >> p1
  echo "Ensure dnsmasq services are not in use." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "2.1.5" >> p12
 else
  echo "Services / Configure Server Services" >> p1
  echo "Ensure dnsmasq services are not in use." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "2.1.5" >> p12
 fi
}

#2.1.6
#Ensure ftp server services are not in use.
#!/usr/bin/env bash

{
 l_output="" l_output2=""

 if ! dpkg-query -l | awk '{print $2}' | grep -E '^ftp|^tnftp' &>/dev/null; then
  l_output="$l_output No ftp server packages are installed."
 else
  l_enabled="$(systemctl is-enabled vsftpd.service 2>/dev/null | grep 'enabled')"
  l_active="$(systemctl is-active vsftpd.service 2>/dev/null | grep '^active')"

  if [ -z "$l_enabled" ]; then
   l_output="$l_output vsftpd.service is not enabled."
  else
   l_output2="$l_output2 vsftpd.service is enabled."
  fi

  if [ -z "$l_active" ]; then
   l_output="$l_output vsftpd.service is not active."
  else
   l_output2="$l_output2 vsftpd.service is active."
  fi
 fi

 if [ -z "$l_output2" ]; then
  echo "Services / Configure Server Services" >> p1
  echo "Ensure ftp server services are not in use." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "2.1.6" >> p12
 else
  echo "Services / Configure Server Services" >> p1
  echo "Ensure ftp server services are not in use." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "2.1.6" >> p12
 fi
}

#2.1.7
#Ensure ldap server services are not in use.
#!/usr/bin/env bash

{
 l_output="" l_output2=""

 if ! dpkg-query -s slapd &>/dev/null; then
  l_output="$l_output slapd package is not installed."
 else
  l_enabled="$(systemctl is-enabled slapd.service 2>/dev/null | grep 'enabled')"
  l_active="$(systemctl is-active slapd.service 2>/dev/null | grep '^active')"

  if [ -z "$l_enabled" ]; then
   l_output="$l_output slapd.service is not enabled."
  else
   l_output2="$l_output2 slapd.service is enabled."
  fi

  if [ -z "$l_active" ]; then
   l_output="$l_output slapd.service is not active."
  else
   l_output2="$l_output2 slapd.service is active."
  fi
 fi

 if [ -z "$l_output2" ]; then
  echo "Services / Configure Server Services" >> p1
  echo "Ensure ldap server services are not in use." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "2.1.7" >> p12
 else
  echo "Services / Configure Server Services" >> p1
  echo "Ensure ldap server services are not in use." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "2.1.7" >> p12
 fi
}

#2.1.8
#Ensure message access server services are not in use.
#!/usr/bin/env bash

{
 l_output="" l_output2=""

 l_pkg1_installed=false
 l_pkg2_installed=false

 dpkg-query -s dovecot-imapd &>/dev/null && l_pkg1_installed=true
 dpkg-query -s dovecot-pop3d &>/dev/null && l_pkg2_installed=true

 if [ "$l_pkg1_installed" = false ] && [ "$l_pkg2_installed" = false ]; then
  l_output="$l_output dovecot-imapd and dovecot-pop3d packages are not installed."
 else
  l_enabled="$(systemctl is-enabled dovecot.socket dovecot.service 2>/dev/null | grep 'enabled')"
  l_active="$(systemctl is-active dovecot.socket dovecot.service 2>/dev/null | grep '^active')"

  if [ -z "$l_enabled" ]; then
   l_output="$l_output dovecot.socket and dovecot.service are not enabled."
  else
   l_output2="$l_output2 dovecot.socket or dovecot.service is enabled."
  fi

  if [ -z "$l_active" ]; then
   l_output="$l_output dovecot.socket and dovecot.service are not active."
  else
   l_output2="$l_output2 dovecot.socket or dovecot.service is active."
  fi
 fi

 if [ -z "$l_output2" ]; then
  echo "Services / Configure Server Services" >> p1
  echo "Ensure message access server services are not in use." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "2.1.8" >> p12
 else
  echo "Services / Configure Server Services" >> p1
  echo "Ensure message access server services are not in use." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "2.1.8" >> p12
 fi
}

#2.1.9
#Ensure network file system services are not in use.
#!/usr/bin/env bash

{
 l_output="" l_output2=""

 if ! dpkg-query -s nfs-kernel-server &>/dev/null; then
  l_output="$l_output nfs-kernel-server package is not installed."
 else
  l_enabled="$(systemctl is-enabled nfs-server.service 2>/dev/null | grep 'enabled')"
  l_active="$(systemctl is-active nfs-server.service 2>/dev/null | grep '^active')"

  if [ -z "$l_enabled" ]; then
   l_output="$l_output nfs-server.service is not enabled."
  else
   l_output2="$l_output2 nfs-server.service is enabled."
  fi

  if [ -z "$l_active" ]; then
   l_output="$l_output nfs-server.service is not active."
  else
   l_output2="$l_output2 nfs-server.service is active."
  fi
 fi

 if [ -z "$l_output2" ]; then
  echo "Services / Configure Server Services" >> p1
  echo "Ensure network file system services are not in use." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "2.1.9" >> p12
 else
  echo "Services / Configure Server Services" >> p1
  echo "Ensure network file system services are not in use." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "2.1.9" >> p12
 fi
}

#2.1.10
#Ensure nis server services are not in use.
#!/usr/bin/env bash

{
 l_output="" l_output2=""

 if ! dpkg-query -s ypserv &>/dev/null; then
  l_output="$l_output ypserv package is not installed."
 else
  l_enabled="$(systemctl is-enabled ypserv.service 2>/dev/null | grep 'enabled')"
  l_active="$(systemctl is-active ypserv.service 2>/dev/null | grep '^active')"

  if [ -z "$l_enabled" ]; then
   l_output="$l_output ypserv.service is not enabled."
  else
   l_output2="$l_output2 ypserv.service is enabled."
  fi

  if [ -z "$l_active" ]; then
   l_output="$l_output ypserv.service is not active."
  else
   l_output2="$l_output2 ypserv.service is active."
  fi
 fi

 if [ -z "$l_output2" ]; then
  echo "Services / Configure Server Services" >> p1
  echo "Ensure nis server services are not in use." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "2.1.10" >> p12
 else
  echo "Services / Configure Server Services" >> p1
  echo "Ensure nis server services are not in use." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "2.1.10" >> p12
 fi
}

#2.1.11
#Ensure print server services are not in use.
#!/usr/bin/env bash

{
 l_output="" l_output2=""

 if ! dpkg-query -s cups &>/dev/null; then
  l_output="$l_output cups package is not installed."
 else
  l_enabled="$(systemctl is-enabled cups.socket cups.service 2>/dev/null | grep 'enabled')"
  l_active="$(systemctl is-active cups.socket cups.service 2>/dev/null | grep '^active')"

  if [ -z "$l_enabled" ]; then
   l_output="$l_output cups.socket and cups.service are not enabled."
  else
   l_output2="$l_output2 cups.socket or cups.service is enabled."
  fi

  if [ -z "$l_active" ]; then
   l_output="$l_output cups.socket and cups.service are not active."
  else
   l_output2="$l_output2 cups.socket or cups.service is active."
  fi
 fi

 if [ -z "$l_output2" ]; then
  echo "Services / Configure Server Services" >> p1
  echo "Ensure print server services are not in use." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "2.1.11" >> p12
 else
  echo "Services / Configure Server Services" >> p1
  echo "Ensure print server services are not in use." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "2.1.11" >> p12
 fi
}

#2.1.12
#Ensure rpcbind services are not in use.
#!/usr/bin/env bash

{
 l_output="" l_output2=""

 if ! dpkg-query -s rpcbind &>/dev/null; then
  l_output="$l_output rpcbind package is not installed."
 else
  l_enabled="$(systemctl is-enabled rpcbind.socket rpcbind.service 2>/dev/null | grep 'enabled')"
  l_active="$(systemctl is-active rpcbind.socket rpcbind.service 2>/dev/null | grep '^active')"

  if [ -z "$l_enabled" ]; then
   l_output="$l_output rpcbind.socket and rpcbind.service are not enabled."
  else
   l_output2="$l_output2 rpcbind.socket or rpcbind.service is enabled."
  fi

  if [ -z "$l_active" ]; then
   l_output="$l_output rpcbind.socket and rpcbind.service are not active."
  else
   l_output2="$l_output2 rpcbind.socket or rpcbind.service is active."
  fi
 fi

 if [ -z "$l_output2" ]; then
  echo "Services / Configure Server Services" >> p1
  echo "Ensure rpcbind services are not in use." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "2.1.12" >> p12
 else
  echo "Services / Configure Server Services" >> p1
  echo "Ensure rpcbind services are not in use." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "2.1.12" >> p12
 fi
}

#2.1.13
#Ensure rsync services are not in use.
#!/usr/bin/env bash

{
 l_output="" l_output2=""

 if ! dpkg-query -s rsync &>/dev/null; then
  l_output="$l_output rsync package is not installed."
 else
  l_enabled="$(systemctl is-enabled rsync.service 2>/dev/null | grep 'enabled')"
  l_active="$(systemctl is-active rsync.service 2>/dev/null | grep '^active')"

  if [ -z "$l_enabled" ]; then
   l_output="$l_output rsync.service is not enabled."
  else
   l_output2="$l_output2 rsync.service is enabled."
  fi

  if [ -z "$l_active" ]; then
   l_output="$l_output rsync.service is not active."
  else
   l_output2="$l_output2 rsync.service is active."
  fi
 fi

 if [ -z "$l_output2" ]; then
  echo "Services / Configure Server Services" >> p1
  echo "Ensure rsync services are not in use." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "2.1.13" >> p12
 else
  echo "Services / Configure Server Services" >> p1
  echo "Ensure rsync services are not in use." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "2.1.13" >> p12
 fi
}


#2.1.14
#Ensure samba file server services are not in use.
#!/usr/bin/env bash

{
 l_output="" l_output2=""

 if ! dpkg-query -s samba &>/dev/null; then
  l_output="$l_output samba package is not installed."
 else
  l_enabled="$(systemctl is-enabled smbd.service 2>/dev/null | grep 'enabled')"
  l_active="$(systemctl is-active smbd.service 2>/dev/null | grep '^active')"

  if [ -z "$l_enabled" ]; then
   l_output="$l_output smbd.service is not enabled."
  else
   l_output2="$l_output2 smbd.service is enabled."
  fi

  if [ -z "$l_active" ]; then
   l_output="$l_output smbd.service is not active."
  else
   l_output2="$l_output2 smbd.service is active."
  fi
 fi

 if [ -z "$l_output2" ]; then
  echo "Services / Configure Server Services" >> p1
  echo "Ensure samba file server services are not in use." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "2.1.14" >> p12
 else
  echo "Services / Configure Server Services" >> p1
  echo "Ensure samba file server services are not in use." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "2.1.14" >> p12
 fi
}

#2.1.15
#Ensure snmp services are not in use.
#!/usr/bin/env bash

{
 l_output="" l_output2=""

 if ! dpkg-query -s snmpd &>/dev/null; then
  l_output="$l_output snmpd package is not installed."
 else
  l_enabled="$(systemctl is-enabled snmpd.service 2>/dev/null | grep 'enabled')"
  l_active="$(systemctl is-active snmpd.service 2>/dev/null | grep '^active')"

  if [ -z "$l_enabled" ]; then
   l_output="$l_output snmpd.service is not enabled."
  else
   l_output2="$l_output2 snmpd.service is enabled."
  fi

  if [ -z "$l_active" ]; then
   l_output="$l_output snmpd.service is not active."
  else
   l_output2="$l_output2 snmpd.service is active."
  fi
 fi

 if [ -z "$l_output2" ]; then
  echo "Services / Configure Server Services" >> p1
  echo "Ensure snmp services are not in use." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "2.1.15" >> p12
 else
  echo "Services / Configure Server Services" >> p1
  echo "Ensure snmp services are not in use." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "2.1.15" >> p12
 fi
}

#2.1.16
#Ensure tftp server services are not in use.
#!/usr/bin/env bash

{
 l_output="" l_output2=""

 if ! dpkg-query -s tftpd-hpa &>/dev/null; then
  l_output="$l_output tftpd-hpa package is not installed."
 else
  l_enabled="$(systemctl is-enabled tftpd-hpa.service 2>/dev/null | grep 'enabled')"
  l_active="$(systemctl is-active tftpd-hpa.service 2>/dev/null | grep '^active')"

  if [ -z "$l_enabled" ]; then
   l_output="$l_output tftpd-hpa.service is not enabled."
  else
   l_output2="$l_output2 tftpd-hpa.service is enabled."
  fi

  if [ -z "$l_active" ]; then
   l_output="$l_output tftpd-hpa.service is not active."
  else
   l_output2="$l_output2 tftpd-hpa.service is active."
  fi
 fi

 if [ -z "$l_output2" ]; then
  echo "Services / Configure Server Services" >> p1
  echo "Ensure tftp server services are not in use." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "2.1.16" >> p12
 else
  echo "Services / Configure Server Services" >> p1
  echo "Ensure tftp server services are not in use." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "2.1.16" >> p12
 fi
}

#2.1.17
#Ensure web proxy server services are not in use.
#!/usr/bin/env bash

{
 l_output="" l_output2=""

 if ! dpkg-query -s squid &>/dev/null; then
  l_output="$l_output squid package is not installed."
 else
  l_enabled="$(systemctl is-enabled squid.service 2>/dev/null | grep 'enabled')"
  l_active="$(systemctl is-active squid.service 2>/dev/null | grep '^active')"

  if [ -z "$l_enabled" ]; then
   l_output="$l_output squid.service is not enabled."
  else
   l_output2="$l_output2 squid.service is enabled."
  fi

  if [ -z "$l_active" ]; then
   l_output="$l_output squid.service is not active."
  else
   l_output2="$l_output2 squid.service is active."
  fi
 fi

 if [ -z "$l_output2" ]; then
  echo "Services / Configure Server Services" >> p1
  echo "Ensure web proxy server services are not in use." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "2.1.17" >> p12
 else
  echo "Services / Configure Server Services" >> p1
  echo "Ensure web proxy server services are not in use." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "2.1.17" >> p12
 fi
}

#2.1.18
#Ensure web server services are not in use.
#!/usr/bin/env bash

{
 l_output="" l_output2=""

 # Check apache2
 if ! dpkg-query -s apache2 &>/dev/null; then
  l_output="$l_output apache2 package is not installed."
 else
  l_apache="$(systemctl show httpd.socket httpd.service 2>/dev/null \
   -p UnitFileState,ActiveState | grep -Pi '=(enabled|active)')"
  if [ -z "$l_apache" ]; then
   l_output="$l_output apache2 installed but httpd.socket/httpd.service not enabled or active."
  else
   l_output2="$l_output2 httpd.socket or httpd.service is enabled or active."
  fi
 fi

 # Check nginx
 if ! dpkg-query -s nginx &>/dev/null; then
  l_output="$l_output nginx package is not installed."
 else
  l_nginx="$(systemctl show nginx.service 2>/dev/null \
   -p UnitFileState,ActiveState | grep -Pi '=(enabled|active)')"
  if [ -z "$l_nginx" ]; then
   l_output="$l_output nginx installed but nginx.service not enabled or active."
  else
   l_output2="$l_output2 nginx.service is enabled or active."
  fi
 fi

 if [ -z "$l_output2" ]; then
  echo "Services / Configure Server Services" >> p1
  echo "Ensure web server services are not in use." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "2.1.18" >> p12
 else
  echo "Services / Configure Server Services" >> p1
  echo "Ensure web server services are not in use." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "2.1.18" >> p12
 fi
}

#2.1.19
#Ensure xinetd services are not in use.
#!/usr/bin/env bash

{
 l_output="" l_output2=""

 if ! dpkg-query -s xinetd &>/dev/null; then
  l_output="$l_output xinetd package is not installed."
 else
  l_enabled="$(systemctl is-enabled xinetd.service 2>/dev/null | grep 'enabled')"
  l_active="$(systemctl is-active xinetd.service 2>/dev/null | grep '^active')"

  if [ -z "$l_enabled" ]; then
   l_output="$l_output xinetd.service is not enabled."
  else
   l_output2="$l_output2 xinetd.service is enabled."
  fi

  if [ -z "$l_active" ]; then
   l_output="$l_output xinetd.service is not active."
  else
   l_output2="$l_output2 xinetd.service is active."
  fi
 fi

 if [ -z "$l_output2" ]; then
  echo "Services / Configure Server Services" >> p1
  echo "Ensure xinetd services are not in use." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "2.1.19" >> p12
 else
  echo "Services / Configure Server Services" >> p1
  echo "Ensure xinetd services are not in use." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "2.1.19" >> p12
 fi
}


#2.1.21
#Ensure mail transfer agents are configured for local-only mode.
#!/usr/bin/env bash
{
 a_output=(); a_output2=(); a_port_list=("25" "465" "587")
 for l_port_number in "${a_port_list[@]}"; do
  if ss -plntu | grep -P -- ':\'"$l_port_number"'\b' | grep -Pvq -- '\h(127\.0\.0\.1|\[?::1\]?):'"$l_port_number"'\b'; then
   a_output2+=(" - Port \"$l_port_number\" is listening on a non-loopback network interface")
  else
   a_output+=(" - Port \"$l_port_number\" is not listening on a non-loopback network interface")
  fi
 done
 if command -v postconf &> /dev/null; then
  l_interfaces="$(postconf -n inet_interfaces)"
 elif command -v exim &> /dev/null; then
  l_interfaces="$(exim -bP local_interfaces)"
 elif command -v sendmail &> /dev/null; then
  l_interfaces="$(grep -i "O DaemonPortOptions" /etc/mail/sendmail.cf | grep -v '^127\.0\.0\.1[,;+1]*' | grep -v '^::1$')"
 fi
 if [ -n "$l_interfaces" ]; then
  if grep -Pqi '\ball\b' <<< "$l_interfaces"; then
   a_output2+=(" - MTA is bound to all network interfaces")
  elif ! grep -Pqi '(inet_interfaces\h*=\h*)?{0\.0\.0\.0|::1|loopback-only}' <<< "$l_interfaces"; then
   a_output2+=(" - MTA is bound to a network interface: \"$l_interfaces\"")
  else
   a_output+=(" - MTA is not bound to a non loopback network interface \"$l_interfaces\"")
  fi
 else
  a_output+=(" - MTA not detected or in use")
 fi
 if [ "${#a_output2[@]}" -le 0 ]; then
  echo "Services / Configure Server Services" >> p1
  echo "Ensure mail transfer agents are configured for local-only mode." >> p2
  echo "MTA is configured for local-only mode. ${a_output[*]}" >> p3
  echo "Yes" >> p4
  echo "2.1.21" >> p12
 else
  echo "Services / Configure Server Services" >> p1
  echo "Ensure mail transfer agents are configured for local-only mode." >> p2
  echo "MTA is NOT configured for local-only mode. ${a_output2[*]}" >> p3
  echo "No" >> p4
  echo "2.1.21" >> p12
 fi
}

##########################################################################################
#2.2.1
#Ensure NIS Client is not installed.

{
 if dpkg-query -s nis &>/dev/null; then
  echo "Services / Configure Client Services" >> p1
  echo "Ensure NIS Client is not installed." >> p2
  echo "Non-compliant: NIS client (nis) package is installed." >> p3
  echo "No" >> p4
  echo "2.2.1" >> p12
 else
  echo "Services / Configure Client Services" >> p1
  echo "Ensure NIS Client is not installed." >> p2
  echo "Compliant: NIS client (nis) package is not installed." >> p3
  echo "Yes" >> p4
  echo "2.2.1" >> p12
 fi
}

#2.2.2
#Ensure rsh client is not installed.

{
 if dpkg-query -s rsh-client &>/dev/null; then
  echo "Services / Configure Client Services" >> p1
  echo "Ensure rsh client is not installed." >> p2
  echo "Non-compliant: rsh client (rsh-client) package is installed." >> p3
  echo "No" >> p4
  echo "2.2.2" >> p12
 else
  echo "Services / Configure Client Services" >> p1
  echo "Ensure rsh client is not installed." >> p2
  echo "Compliant: rsh client (rsh-client) package is not installed." >> p3
  echo "Yes" >> p4
  echo "2.2.2" >> p12
 fi
}

#2.2.3
#Ensure talk client is not installed.
pac3='talk'
if dpkg-query -W -f='${Status}' $pac3 2>/dev/null | grep -q "ok installed"; then
	echo "Services / Configure Client Services" >> p1
	echo "Ensure talk client is not installed." >> p2
	echo "talk client service is installed." >> p3
	echo "No" >> p4
	echo "2.2.3" >> p12
else
	echo "Services / Configure Client Services" >> p1
  	echo "Ensure talk client is not installed." >> p2
  	echo "talk client service is not installed." >> p3
  	echo "Yes" >> p4
  	echo "2.2.3" >> p12
fi

#2.2.4
#Ensure telnet client is not installed.
pac4='telnet'
if dpkg-query -W -f='${Status}' $pac4 2>/dev/null | grep -q "ok installed"; then
	echo "Services / Configure Client Services" >> p1
	echo "Ensure telnet client is not installed." >> p2
	echo "telnet client service is installed." >> p3
	echo "No" >> p4
	echo "2.2.4" >> p12
else
	echo "Services / Configure Client Services" >> p1
  	echo "Ensure telnet client is not installed." >> p2
  	echo "telnet client service is not installed." >> p3
  	echo "Yes" >> p4
  	echo "2.2.4" >> p12
fi

#2.2.5
#Ensure LDAP client is not installed.
pac5='ldap-utils'
if dpkg-query -W -f='${Status}' $pac5 2>/dev/null | grep -q "ok installed"; then
	echo "Services / Configure Client Services" >> p1
	echo "Ensure LDAP client is not installed." >> p2
	echo "LDAP client service is installed." >> p3
	echo "No" >> p4
	echo "2.2.5" >> p12
else
	echo "Services / Configure Client Services" >> p1
  	echo "Ensure LDAP client is not installed." >> p2
  	echo "LDAP client service is not installed." >> p3
  	echo "Yes" >> p4
  	echo "2.2.5" >> p12
fi

#2.2.6
#Ensure ftp client is not installed.
#!/usr/bin/env bash
{
 l_output="" l_output2=""
 if dpkg-query -l | awk '{print $2}' | grep -E '^ftp$|^tnftp$' &>/dev/null; then
  l_output2="$l_output2 ftp/tnftp client is installed."
 else
  l_output="$l_output ftp/tnftp client is not installed."
 fi
 if [ -z "$l_output2" ]; then
  echo "Services / Configure Client Services" >> p1
  echo "Ensure ftp client is not installed." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "2.2.6" >> p12
 else
  echo "Services / Configure Client Services" >> p1
  echo "Ensure ftp client is not installed." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "2.2.6" >> p12
 fi
}

##############################################################################################################

#2.3.1.1
#Ensure a single time synchronization daemon is in use.
#!/usr/bin/env bash

{
 output="" l_tsd="" l_sdtd="" chrony="" l_ntp=""
 dpkg-query -W chrony > /dev/null 2>&1 && l_chrony="y"
 dpkg-query -W ntp > /dev/null 2>&1 && l_ntp="y" || l_ntp=""
 systemctl list-units --all --type=service | grep -q 'systemd-timesyncd.service' && systemctl is-enabled systemd-timesyncd.service | grep -q 'enabled' && l_sdtd="y"
# ! systemctl is-enabled systemd-timesyncd.service | grep -q 'enabled' && l_nsdtd="y" || l_nsdtd=""
 if [[ "$l_chrony" = "y" && "$l_ntp" != "y" && "$l_sdtd" != "y" ]]; then
 l_tsd="chrony"
 output="$output\n- chrony is in use on the system"
 elif [[ "$l_chrony" != "y" && "$l_ntp" = "y" && "$l_sdtd" != "y" ]]; then
 l_tsd="ntp"
 output="$output\n- ntp is in use on the system"
 elif [[ "$l_chrony" != "y" && "$l_ntp" != "y" ]]; then
 if systemctl list-units --all --type=service | grep -q 'systemd-timesyncd.service' && systemctl is-enabled systemd-timesyncd.service | grep -Eq '(enabled|disabled|masked)'; then
 l_tsd="sdtd"
 output="$output\n- systemd-timesyncd is in use on the system"
 fi
 else
 [[ "$l_chrony" = "y" && "$l_ntp" = "y" ]] && output="$output\n- both chrony and ntp are in use on the system"
 [[ "$l_chrony" = "y" && "$l_sdtd" = "y" ]] && output="$output\n- both chrony and systemd-timesyncd are in use on the system"
 [[ "$l_ntp" = "y" && "$l_sdtd" = "y" ]] && output="$output\n- both ntp and systemd-timesyncd are in use on the system"
 fi
 if [ -n "$l_tsd" ]; then
 echo -e "\n- PASS:\n$output\n"
	echo "Services / Configure Time Synchronization" >> p1
	echo "Ensure a single time synchronization daemon is in use." >> p2
	echo "single time synchronization daemon is in use." >> p3
	echo "Yes" >> p4
	echo "2.3.1.1" >> p12
 else
 echo -e "\n- FAIL:\n$output\n"
	echo "Services / Configure Time Synchronization" >> p1
  	echo "Ensure a single time synchronization daemon is in use." >> p2
  	echo "Multiple time synchronization daemon is in use.Please check.." >> p3
  	echo "No" >> p4
  	echo "2.3.1.1" >> p12
 fi
}

############################################################################################################
#2.3.2.1
#Ensure systemd-timesyncd configured with authorized timeserver.
#!/usr/bin/env bash
{
 l_output="" l_output2=""
 l_config="/etc/systemd/timesyncd.conf"

 if grep -Pqs '^\h*NTP=\S+' "$l_config"; then
  l_output="$l_output NTP is configured in $l_config."
 else
  l_output2="$l_output2 NTP is not configured in $l_config."
 fi

 if grep -Pqs '^\h*FallbackNTP=\S+' "$l_config"; then
  l_output="$l_output FallbackNTP is configured in $l_config."
 else
  l_output2="$l_output2 FallbackNTP is not configured in $l_config."
 fi

 if [ -z "$l_output2" ]; then
  echo "Services / Configure Time Synchronization" >> p1
  echo "Ensure systemd-timesyncd configured with authorized timeserver." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "2.3.2.1" >> p12
 else
  echo "Services / Configure Time Synchronization" >> p1
  echo "Ensure systemd-timesyncd configured with authorized timeserver." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "2.3.2.1" >> p12
 fi
}

#2.3.2.2
#Ensure systemd-timesyncd is enabled and running.
if systemctl is-enabled systemd-timesyncd.service 2>/dev/null | grep 'enabled' && systemctl is-active systemd-timesyncd.service 2>/dev/null | grep '^active'; then 
    echo "Services / Configure Time Synchronization" >> p1
	echo "Ensure systemd-timesyncd is enabled and running." >> p2
	echo "systemd-timesyncd is enabled and running." >> p3
	echo "Yes" >> p4
	echo "2.3.2.2" >> p12
else
    echo "Services / Configure Time Synchronization" >> p1
  	echo "Ensure systemd-timesyncd is enabled and running." >> p2
  	echo "systemd-timesyncd is Not enabled or running." >> p3
  	echo "No" >> p4
  	echo "2.3.2.2" >> p12
fi

############################################################################################################
#2.3.3.1
#Ensure chrony is configured with authorized timeserver.
#!/usr/bin/env bash
{
 l_output="" l_output2=""
 l_config="/etc/chrony/chrony.conf"

 if grep -Pqs '^\h*(server|pool)\h+\S+' "$l_config"; then
  l_output="$l_output chrony is configured with authorized timeserver in $l_config."
 else
  l_output2="$l_output2 No server or pool directive found in $l_config."
 fi

 if [ -z "$l_output2" ]; then
  echo "Services / Configure Time Synchronization" >> p1
  echo "Ensure chrony is configured with authorized timeserver." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "2.3.3.1" >> p12
 else
  echo "Services / Configure Time Synchronization" >> p1
  echo "Ensure chrony is configured with authorized timeserver." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "2.3.3.1" >> p12
 fi
}

#2.3.3.2
#Ensure chrony is running as user _chrony.
if ps -ef | awk '(/[c]hronyd/ && $1!="_chrony") { print $1 }' > /dev/null; then
 echo "Services / Configure Time Synchronization" >> p1
 echo "Ensure chrony is running as user _chrony." >> p2
 echo "chrony is running as user _chrony." >> p3
 echo "Yes" >> p4
 echo "2.3.3.2" >> p12
else
 echo "Services / Configure Time Synchronization" >> p1
 echo "Ensure chrony is running as user _chrony." >> p2
 echo "chronyd service is Not running as _chrony user. Please check." >> p3
 echo "No" >> p4
 echo "2.3.3.2" >> p12
fi

#2.3.3.3
#Ensure chrony is enabled and running.
if systemctl is-enabled chrony.service 2>/dev/null | grep 'enabled' && systemctl is-active chrony.service 2>/dev/null | grep '^active'; then 
    echo "Services / Configure Time Synchronization" >> p1
	echo "Ensure chrony is enabled and running." >> p2
	echo "chrony is enabled and running." >> p3
	echo "Yes" >> p4
	echo "2.3.3.3" >> p12
else
    echo "Services / Configure Time Synchronization" >> p1
	echo "Ensure chrony is enabled and running." >> p2
	echo "chrony is Not enabled or running.Please check.." >> p3
	echo "No" >> p4
	echo "2.3.3.3" >> p12
fi

##########################################################################################################

#2.4.1.1
#Ensure cron daemon is enabled and active (Automated)
#!/usr/bin/env bash
{
 l_output="" l_output2=""

 l_enabled="$(systemctl list-unit-files | awk '$1~/^crond?\.service/{print $2}')"
 l_active="$(systemctl list-units | awk '$1~/^crond?\.service/{print $3}')"

 if [ "$l_enabled" = "enabled" ]; then
  l_output="$l_output cron is enabled."
 else
  l_output2="$l_output2 cron is not enabled."
 fi

 if [ "$l_active" = "active" ]; then
  l_output="$l_output cron is active."
 else
  l_output2="$l_output2 cron is not active."
 fi

 if [ -z "$l_output2" ]; then
  echo "Services / Job Schedulers" >> p1
  echo "Ensure cron daemon is enabled and active." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "2.4.1.1" >> p12
 else
  echo "Services / Job Schedulers" >> p1
  echo "Ensure cron daemon is enabled and active." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "2.4.1.1" >> p12
 fi
}

#2.4.1.2
#Ensure permissions on /etc/crontab are configured.
r_access1="Access: (0600/-rw-------)"
r_uid1="Uid: ( 0/ root)"
r_gid1="Gid: ( 0/ root)"

ac1=$(stat /etc/crontab | grep -m 1 Access | awk '{print $1, $2}')
ud1=$(stat /etc/crontab | grep -m 1 Access | awk '{print $3, $4, $5, $6}')
gd1=$(stat /etc/crontab | grep -m 1 Access | awk '{print $7, $8, $9, $10}')

if [[ "$ac1" == *"$r_access1"* && "$ud1" == *"$r_uid1"* && "$gd1" == *"$r_gid1"* ]]; then
	echo "Services / Job Schedulers" >> p1
	echo "Ensure permissions on /etc/crontab are configured." >> p2
	echo "Permissions on /etc/crontab are configured." >> p3
	echo "Yes" >> p4
	echo "2.4.1.2" >> p12
else
	echo "Services / Job Schedulers" >> p1
  	echo "Ensure permissions on /etc/crontab are configured." >> p2
  	echo "Permissions on /etc/crontab are NOT configured correctly." >> p3
  	echo "No" >> p4
  	echo "2.4.1.2" >> p12
fi

#2.4.1.3
#Ensure permissions on /etc/cron.hourly are configured.
r_access2="Access: (0700/drwx------)"
r_uid2="Uid: ( 0/ root)"
r_gid2="Gid: ( 0/ root)"

ac2=$(stat /etc/cron.hourly/ | grep -m 1 Access | awk '{print $1, $2}')
ud2=$(stat /etc/cron.hourly/ | grep -m 1 Access | awk '{print $3, $4, $5, $6}')
gd2=$(stat /etc/cron.hourly/ | grep -m 1 Access | awk '{print $7, $8, $9, $10}')

if [[ "$ac2" == *"$r_access2"* && "$ud2" == *"$r_uid2"* && "$gd2" == *"$r_gid2"* ]]; then
	echo "Services / Job Schedulers" >> p1
	echo "Ensure permissions on /etc/cron.hourly are configured." >> p2
	echo "Permissions on /etc/cron.hourly are configured." >> p3
	echo "Yes" >> p4
	echo "2.4.1.3" >> p12
else
	echo "Services / Job Schedulers" >> p1
  	echo "Ensure permissions on /etc/cron.hourly are configured." >> p2
  	echo "Permissions on /etc/cron.hourly are NOT configured correctly." >> p3
  	echo "No" >> p4
  	echo "2.4.1.3" >> p12
fi

#2.4.1.4
#Ensure permissions on /etc/cron.daily are configured.
r_access3="Access: (0700/drwx------)"
r_uid3="Uid: ( 0/ root)"
r_gid3="Gid: ( 0/ root)"

ac3=$(stat /etc/cron.daily/ | grep -m 1 Access | awk '{print $1, $2}')
ud3=$(stat /etc/cron.daily/ | grep -m 1 Access | awk '{print $3, $4, $5, $6}')
gd3=$(stat /etc/cron.daily/ | grep -m 1 Access | awk '{print $7, $8, $9, $10}')

if [[ "$ac3" == *"$r_access3"* && "$ud3" == *"$r_uid3"* && "$gd3" == *"$r_gid3"* ]]; then
	echo "Services / Job Schedulers" >> p1
	echo "Ensure permissions on /etc/cron.daily are configured." >> p2
	echo "Permissions on /etc/cron.daily are configured." >> p3
	echo "Yes" >> p4
	echo "2.4.1.4" >> p12
else
	echo "Services / Job Schedulers" >> p1
  	echo "Ensure permissions on /etc/cron.daily are configured." >> p2
  	echo "Permissions on /etc/cron.daily are NOT configured correctly." >> p3
  	echo "No" >> p4
  	echo "2.4.1.4" >> p12
fi

#2.4.1.5
#Ensure permissions on /etc/cron.weekly are configured.
r_access4="Access: (0700/drwx------)"
r_uid4="Uid: ( 0/ root)"
r_gid4="Gid: ( 0/ root)"

ac4=$(stat /etc/cron.weekly/ | grep -m 1 Access | awk '{print $1, $2}')
ud4=$(stat /etc/cron.weekly/ | grep -m 1 Access | awk '{print $3, $4, $5, $6}')
gd4=$(stat /etc/cron.weekly/ | grep -m 1 Access | awk '{print $7, $8, $9, $10}')

if [[ "$ac4" == *"$r_access4"* && "$ud4" == *"$r_uid4"* && "$gd4" == *"$r_gid4"* ]]; then
	echo "Services / Job Schedulers" >> p1
	echo "Ensure permissions on /etc/cron.weekly are configured." >> p2
	echo "Permissions on /etc/cron.weekly/ are configured." >> p3
	echo "Yes" >> p4
	echo "2.4.1.5" >> p12
else
	echo "Services / Job Schedulers" >> p1
  	echo "Ensure permissions on /etc/cron.weekly are configured." >> p2
  	echo "Permissions on /etc/cron.weekly/ are NOT configured correctly." >> p3
  	echo "No" >> p4
  	echo "2.4.1.5" >> p12
fi

#2.4.1.6
#Ensure permissions on /etc/cron.monthly are configured.
r_access5="Access: (0700/drwx------)"
r_uid5="Uid: ( 0/ root)"
r_gid5="Gid: ( 0/ root)"

ac5=$(stat /etc/cron.monthly/ | grep -m 1 Access | awk '{print $1, $2}')
ud5=$(stat /etc/cron.monthly/ | grep -m 1 Access | awk '{print $3, $4, $5, $6}')
gd5=$(stat /etc/cron.monthly/ | grep -m 1 Access | awk '{print $7, $8, $9, $10}')

if [[ "$ac5" == *"$r_access5"* && "$ud5" == *"$r_uid5"* && "$gd5" == *"$r_gid5"* ]]; then
	echo "Services / Job Schedulers" >> p1
	echo "Ensure permissions on /etc/cron.monthly are configured." >> p2
	echo "Permissions on /etc/cron.monthly  are configured." >> p3
	echo "Yes" >> p4
	echo "2.4.1.6" >> p12
else
	echo "Services / Job Schedulers" >> p1
  	echo "Ensure permissions on /etc/cron.monthly are configured." >> p2
  	echo "Permissions on /etc/cron.monthly are NOT configured correctly." >> p3
  	echo "No" >> p4
  	echo "2.4.1.6" >> p12
fi

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

# 2.4.1.8
# Ensure crontab is restricted to authorized users (Automated)

echo "Services / Job Schedulers" >> p1
echo "Ensure crontab is restricted to authorized users" >> p2

# Consider cron "installed" if crontab exists OR a cron unit exists
cron_installed="no"
if command -v crontab >/dev/null 2>&1; then
  cron_installed="yes"
elif systemctl list-unit-files 2>/dev/null | awk '$1~/^crond?\.service$/ {f=1} END{exit !f}'; then
  cron_installed="yes"
fi

if [ "$cron_installed" != "yes" ]; then
  echo "cron not installed: no crontab(1) and no cron[d].service unit" >> p3
  echo "No" >> p4
  echo "2.4.1.8" >> p12
else
  # Helper to check mode<=0640 and root:root; returns 'ok' or 'bad:...' or 'missing'
  check_file() {
    local f="$1"
    if [ ! -e "$f" ]; then
      printf "missing"
      return
    fi
    # stat outputs: <mode> <owner> <group> (mode is numeric like 640 or 0640)
    set -- $(stat -Lc '%a %U %G' "$f" 2>/dev/null)
    local mode="$1" owner="$2" group="$3"
    # normalize to last three digits for compare
    if [ "${#mode}" -eq 3 ]; then
      m_dec=$((10#$mode))
    else
      m_dec=$((10#${mode: -3}))
    fi
    local reasons=""
    if [ "$m_dec" -gt 640 ]; then reasons="${reasons}mode=$mode (>0640); "; fi
    [ "$owner" = "root" ] || reasons="${reasons}owner=$owner (!=root); "
    [ "$group" = "root" ] || reasons="${reasons}group=$group (!=root); "
    if [ -z "$reasons" ]; then printf "ok"; else printf "bad:%s" "${reasons% }"; fi
  }

  allow_status=$(check_file /etc/cron.allow)
  deny_status=$(check_file /etc/cron.deny)

  # Audit decision—strictly per requirement:
  # - /etc/cron.allow must exist and be compliant
  # - /etc/cron.deny must either NOT exist OR be compliant if it does
  if [ "$allow_status" = "ok" ] && { [ "$deny_status" = "missing" ] || [ "$deny_status" = "ok" ]; }; then
    if [ "$deny_status" = "missing" ]; then
      echo "/etc/cron.allow present (<=0640, root:root); /etc/cron.deny not present" >> p3
    else
      echo "/etc/cron.allow present (<=0640, root:root); /etc/cron.deny present (<=0640, root:root)" >> p3
    fi
    echo "Yes" >> p4
  else
    msg=""
    if [ "$allow_status" != "ok" ]; then
      [ "$allow_status" = "missing" ] && msg="/etc/cron.allow missing; " || msg="/etc/cron.allow non-compliant (${allow_status}); "
    fi
    if [ "$deny_status" != "missing" ] && [ "$deny_status" != "ok" ]; then
      msg="${msg}/etc/cron.deny non-compliant (${deny_status}); "
    fi
    echo "${msg% ; }" >> p3
    echo "No" >> p4
  fi

  echo "2.4.1.8" >> p12
fi

################################################################################################################

#2.4.2.1
#Ensure at is restricted to authorized users (Automated)
{
 l_output="" l_output2=""

 if [ -f "/etc/at.allow" ]; then
  l_perms="$(stat -c '%a' /etc/at.allow)"
  l_uid="$(stat -c '%U' /etc/at.allow)"
  l_gid="$(stat -c '%G' /etc/at.allow)"
  if [ "$l_perms" -le 640 ] 2>/dev/null && [ "$l_uid" = "root" ] && { [ "$l_gid" = "root" ] || [ "$l_gid" = "daemon" ]; }; then
   l_output="$l_output /etc/at.allow exists with correct permissions ($l_perms) owner $l_uid group $l_gid."
  else
   l_output2="$l_output2 /etc/at.allow has incorrect permissions ($l_perms) owner $l_uid group $l_gid."
  fi
 else
  l_output2="$l_output2 /etc/at.allow does not exist."
 fi

 if [ -f "/etc/at.deny" ]; then
  l_perms="$(stat -c '%a' /etc/at.deny)"
  l_uid="$(stat -c '%U' /etc/at.deny)"
  l_gid="$(stat -c '%G' /etc/at.deny)"
  if [ "$l_perms" -le 640 ] 2>/dev/null && [ "$l_uid" = "root" ] && { [ "$l_gid" = "root" ] || [ "$l_gid" = "daemon" ]; }; then
   l_output="$l_output /etc/at.deny exists with correct permissions ($l_perms) owner $l_uid group $l_gid."
  else
   l_output2="$l_output2 /etc/at.deny has incorrect permissions ($l_perms) owner $l_uid group $l_gid."
  fi
 else
  l_output="$l_output /etc/at.deny does not exist."
 fi

 if [ -z "$l_output2" ]; then
  echo "Services / Job Schedulers" >> p1
  echo "Ensure at is restricted to authorized users." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "2.4.2.1" >> p12
 else
  echo "Services / Job Schedulers" >> p1
  echo "Ensure access to at is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "2.4.2.1" >> p12
 fi
}

##########################################################################################################
#3.1.2
#Ensure wireless interfaces are disabled (Automated)
#!/usr/bin/env bash
{
 l_output="" l_output2=""
 module_chk()
 {
  l_loadable="$(modprobe -n -v "$l_mname")"
  if grep -Pq -- '^\h*install \/bin\/(true|false)' <<< "$l_loadable"; then
   l_output="$l_output - module: \"$l_mname\" is not loadable"
  else
   l_output2="$l_output2 - module: \"$l_mname\" is loadable"
  fi
  if ! lsmod | grep "$l_mname" > /dev/null 2>&1; then
   l_output="$l_output - module: \"$l_mname\" is not loaded"
  else
   l_output2="$l_output2 - module: \"$l_mname\" is loaded"
  fi
  if modprobe --showconfig | grep -Pq -- "^\h*blacklist\h+$l_mname\b"; then
   l_output="$l_output - module: \"$l_mname\" is deny listed"
  else
   l_output2="$l_output2 - module: \"$l_mname\" is not deny listed"
  fi
 }
 if [ -n "$(find /sys/class/net/*/ -type d -name wireless)" ]; then
  l_dname=$(for driverdir in $(find /sys/class/net/*/ -type d -name wireless | xargs -0 dirname); do
   basename "$(readlink -f "$driverdir"/device/driver/module)"
  done | sort -u)
  for l_mname in $l_dname; do
   module_chk
  done
 fi
 if [ -z "$l_output2" ]; then
  echo "Network / Configure Network Devices" >> p1
  echo "Ensure wireless interfaces are disabled." >> p2
  echo "${l_output:-System has no wireless NICs installed.}" >> p3
  echo "Yes" >> p4
  echo "3.1.2" >> p12
 else
  echo "Network / Configure Network Devices" >> p1
  echo "Ensure wireless interfaces are disabled." >> p2
  echo "Wireless interface issue found. $l_output2" >> p3
  echo "No" >> p4
  echo "3.1.2" >> p12
 fi
}

#3.1.3
#Ensure bluetooth services are not in use.
{
 l_output="" l_output2=""
 # Path 1: Check if bluez package is not installed
 if dpkg-query -s bluez &>/dev/null 2>&1 && echo "bluez is installed" | grep -q "bluez is installed"; then
  # bluez is installed - check if it is a dependency, verify service is stopped/disabled
  if systemctl is-enabled bluetooth.service 2>/dev/null | grep -q 'enabled'; then
   l_output2="$l_output2 bluetooth.service is enabled. Required: not enabled."
  fi
  if systemctl is-active bluetooth.service 2>/dev/null | grep -q '^active'; then
   l_output2="$l_output2 bluetooth.service is active. Required: not active."
  fi
  [ -z "$l_output2" ] && l_output="bluez package is installed as a dependency. bluetooth.service is not enabled and not active (compliant)."
 else
  l_output="bluez package is not installed (compliant)."
 fi
 if [ -z "$l_output2" ]; then
  echo "Network / Configure Network Devices" >> p1
  echo "Ensure bluetooth services are not in use." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "3.1.3" >> p12
 else
  echo "Network / Configure Network Devices" >> p1
  echo "Ensure bluetooth services are not in use." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "3.1.3" >> p12
 fi
}


#############################################################################################################
#3.3.1
#Ensure ip forwarding is disabled.
{
 a_output=(); a_output2=(); l_ipv6_disabled=""
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
   a_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_running_parameter_value\" in the running configuration")
  else
   a_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_running_parameter_value\" in the running configuration and should have a value of: \"$l_value_out\"")
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
     a_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\"")
    else
     a_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\" and should have a value of: \"$l_value_out\"")
    fi
   done < <(grep -Po -- "\h*$l_parameter_name\h*=\h*\H+" "${A_out[$l_fkpname]}")
  else
   a_output2+=(" - \"$l_parameter_name\" is not set in an included file ** Note: \"$l_parameter_name\" May be set in a file that's ignored by load procedure **")
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
    a_output+=(" - IPv6 is disabled on the system, \"$l_parameter_name\" is not applicable")
   else
    f_kernel_parameter_chk
   fi
  else
   f_kernel_parameter_chk
  fi
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ "${#a_output2[@]}" -le 0 ]; then
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure ip forwarding is disabled." >> p2
  echo "IP forwarding is disabled correctly." >> p3
  echo "Yes" >> p4
  echo "3.3.1" >> p12
 else
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure ip forwarding is disabled." >> p2
  echo "${a_output2[*]}" >> p3
  echo "No" >> p4
  echo "3.3.1" >> p12
 fi
}

#3.3.2
#Ensure packet redirect sending is disabled.
{
 a_output=(); a_output2=(); l_ipv6_disabled=""
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
   a_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_running_parameter_value\" in the running configuration")
  else
   a_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_running_parameter_value\" in the running configuration and should have a value of: \"$l_value_out\"")
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
     a_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\"")
    else
     a_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\" and should have a value of: \"$l_value_out\"")
    fi
   done < <(grep -Po -- "\h*$l_parameter_name\h*=\h*\H+" "${A_out[$l_fkpname]}")
  else
   a_output2+=(" - \"$l_parameter_name\" is not set in an included file ** Note: \"$l_parameter_name\" May be set in a file that's ignored by load procedure **")
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
    a_output+=(" - IPv6 is disabled on the system, \"$l_parameter_name\" is not applicable")
   else
    f_kernel_parameter_chk
   fi
  else
   f_kernel_parameter_chk
  fi
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ "${#a_output2[@]}" -le 0 ]; then
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure packet redirect sending is disabled." >> p2
  echo "Packet redirect sending is disabled correctly." >> p3
  echo "Yes" >> p4
  echo "3.3.2" >> p12
 else
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure packet redirect sending is disabled." >> p2
  echo "${a_output2[*]}" >> p3
  echo "No" >> p4
  echo "3.3.2" >> p12
 fi
}

#3.3.3
#Ensure bogus icmp responses are ignored.
{
 a_output=(); a_output2=(); l_ipv6_disabled=""
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
   a_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_running_parameter_value\" in the running configuration")
  else
   a_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_running_parameter_value\" in the running configuration and should have a value of: \"$l_value_out\"")
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
     a_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\"")
    else
     a_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\" and should have a value of: \"$l_value_out\"")
    fi
   done < <(grep -Po -- "\h*$l_parameter_name\h*=\h*\H+" "${A_out[$l_fkpname]}")
  else
   a_output2+=(" - \"$l_parameter_name\" is not set in an included file ** Note: \"$l_parameter_name\" May be set in a file that's ignored by load procedure **")
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
    a_output+=(" - IPv6 is disabled on the system, \"$l_parameter_name\" is not applicable")
   else
    f_kernel_parameter_chk
   fi
  else
   f_kernel_parameter_chk
  fi
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ "${#a_output2[@]}" -le 0 ]; then
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure bogus icmp responses are ignored." >> p2
  echo "Bogus ICMP responses are ignored correctly." >> p3
  echo "Yes" >> p4
  echo "3.3.3" >> p12
 else
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure bogus icmp responses are ignored." >> p2
  echo "${a_output2[*]}" >> p3
  echo "No" >> p4
  echo "3.3.3" >> p12
 fi
}

#3.3.4
#Ensure broadcast icmp requests are ignored.
{
 a_output=(); a_output2=(); l_ipv6_disabled=""
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
   a_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_running_parameter_value\" in the running configuration")
  else
   a_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_running_parameter_value\" in the running configuration and should have a value of: \"$l_value_out\"")
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
     a_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\"")
    else
     a_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\" and should have a value of: \"$l_value_out\"")
    fi
   done < <(grep -Po -- "\h*$l_parameter_name\h*=\h*\H+" "${A_out[$l_fkpname]}")
  else
   a_output2+=(" - \"$l_parameter_name\" is not set in an included file ** Note: \"$l_parameter_name\" May be set in a file that's ignored by load procedure **")
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
    a_output+=(" - IPv6 is disabled on the system, \"$l_parameter_name\" is not applicable")
   else
    f_kernel_parameter_chk
   fi
  else
   f_kernel_parameter_chk
  fi
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ "${#a_output2[@]}" -le 0 ]; then
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure broadcast icmp requests are ignored." >> p2
  echo "Broadcast ICMP requests are ignored correctly." >> p3
  echo "Yes" >> p4
  echo "3.3.4" >> p12
 else
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure broadcast icmp requests are ignored." >> p2
  echo "${a_output2[*]}" >> p3
  echo "No" >> p4
  echo "3.3.4" >> p12
 fi
}

#3.3.5
#Ensure icmp redirects are not accepted.
{
 a_output=(); a_output2=(); l_ipv6_disabled=""
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
   a_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_running_parameter_value\" in the running configuration")
  else
   a_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_running_parameter_value\" in the running configuration and should have a value of: \"$l_value_out\"")
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
     a_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\"")
    else
     a_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\" and should have a value of: \"$l_value_out\"")
    fi
   done < <(grep -Po -- "\h*$l_parameter_name\h*=\h*\H+" "${A_out[$l_fkpname]}")
  else
   a_output2+=(" - \"$l_parameter_name\" is not set in an included file ** Note: \"$l_parameter_name\" May be set in a file that's ignored by load procedure **")
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
    a_output+=(" - IPv6 is disabled on the system, \"$l_parameter_name\" is not applicable")
   else
    f_kernel_parameter_chk
   fi
  else
   f_kernel_parameter_chk
  fi
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ "${#a_output2[@]}" -le 0 ]; then
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure icmp redirects are not accepted." >> p2
  echo "ICMP redirects are not accepted correctly." >> p3
  echo "Yes" >> p4
  echo "3.3.5" >> p12
 else
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure icmp redirects are not accepted." >> p2
  echo "${a_output2[*]}" >> p3
  echo "No" >> p4
  echo "3.3.5" >> p12
 fi
}

#3.3.6
#Ensure secure icmp redirects are not accepted.
{
 a_output=(); a_output2=(); l_ipv6_disabled=""
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
   a_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_running_parameter_value\" in the running configuration")
  else
   a_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_running_parameter_value\" in the running configuration and should have a value of: \"$l_value_out\"")
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
     a_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\"")
    else
     a_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\" and should have a value of: \"$l_value_out\"")
    fi
   done < <(grep -Po -- "\h*$l_parameter_name\h*=\h*\H+" "${A_out[$l_fkpname]}")
  else
   a_output2+=(" - \"$l_parameter_name\" is not set in an included file ** Note: \"$l_parameter_name\" May be set in a file that's ignored by load procedure **")
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
    a_output+=(" - IPv6 is disabled on the system, \"$l_parameter_name\" is not applicable")
   else
    f_kernel_parameter_chk
   fi
  else
   f_kernel_parameter_chk
  fi
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ "${#a_output2[@]}" -le 0 ]; then
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure secure icmp redirects are not accepted." >> p2
  echo "Secure ICMP redirects are not accepted correctly." >> p3
  echo "Yes" >> p4
  echo "3.3.6" >> p12
 else
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure secure icmp redirects are not accepted." >> p2
  echo "${a_output2[*]}" >> p3
  echo "No" >> p4
  echo "3.3.6" >> p12
 fi
}

#3.3.7
#Ensure reverse path filtering is enabled.
{
 a_output=(); a_output2=(); l_ipv6_disabled=""
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
   a_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_running_parameter_value\" in the running configuration")
  else
   a_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_running_parameter_value\" in the running configuration and should have a value of: \"$l_value_out\"")
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
     a_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\"")
    else
     a_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\" and should have a value of: \"$l_value_out\"")
    fi
   done < <(grep -Po -- "\h*$l_parameter_name\h*=\h*\H+" "${A_out[$l_fkpname]}")
  else
   a_output2+=(" - \"$l_parameter_name\" is not set in an included file ** Note: \"$l_parameter_name\" May be set in a file that's ignored by load procedure **")
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
    a_output+=(" - IPv6 is disabled on the system, \"$l_parameter_name\" is not applicable")
   else
    f_kernel_parameter_chk
   fi
  else
   f_kernel_parameter_chk
  fi
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ "${#a_output2[@]}" -le 0 ]; then
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure reverse path filtering is enabled." >> p2
  echo "Reverse path filtering is enabled correctly." >> p3
  echo "Yes" >> p4
  echo "3.3.7" >> p12
 else
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure reverse path filtering is enabled." >> p2
  echo "${a_output2[*]}" >> p3
  echo "No" >> p4
  echo "3.3.7" >> p12
 fi
}

#3.3.8
#Ensure source routed packets are not accepted.
{
 a_output=(); a_output2=(); l_ipv6_disabled=""
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
   a_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_running_parameter_value\" in the running configuration")
  else
   a_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_running_parameter_value\" in the running configuration and should have a value of: \"$l_value_out\"")
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
     a_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\"")
    else
     a_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\" and should have a value of: \"$l_value_out\"")
    fi
   done < <(grep -Po -- "\h*$l_parameter_name\h*=\h*\H+" "${A_out[$l_fkpname]}")
  else
   a_output2+=(" - \"$l_parameter_name\" is not set in an included file ** Note: \"$l_parameter_name\" May be set in a file that's ignored by load procedure **")
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
    a_output+=(" - IPv6 is disabled on the system, \"$l_parameter_name\" is not applicable")
   else
    f_kernel_parameter_chk
   fi
  else
   f_kernel_parameter_chk
  fi
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ "${#a_output2[@]}" -le 0 ]; then
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure source routed packets are not accepted." >> p2
  echo "Source routed packets are not accepted correctly." >> p3
  echo "Yes" >> p4
  echo "3.3.8" >> p12
 else
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure source routed packets are not accepted." >> p2
  echo "${a_output2[*]}" >> p3
  echo "No" >> p4
  echo "3.3.8" >> p12
 fi
}

#3.3.9
#Ensure suspicious packets are logged.
{
 a_output=(); a_output2=(); l_ipv6_disabled=""
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
   a_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_running_parameter_value\" in the running configuration")
  else
   a_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_running_parameter_value\" in the running configuration and should have a value of: \"$l_value_out\"")
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
     a_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\"")
    else
     a_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\" and should have a value of: \"$l_value_out\"")
    fi
   done < <(grep -Po -- "\h*$l_parameter_name\h*=\h*\H+" "${A_out[$l_fkpname]}")
  else
   a_output2+=(" - \"$l_parameter_name\" is not set in an included file ** Note: \"$l_parameter_name\" May be set in a file that's ignored by load procedure **")
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
    a_output+=(" - IPv6 is disabled on the system, \"$l_parameter_name\" is not applicable")
   else
    f_kernel_parameter_chk
   fi
  else
   f_kernel_parameter_chk
  fi
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ "${#a_output2[@]}" -le 0 ]; then
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure suspicious packets are logged." >> p2
  echo "Suspicious packets are logged correctly." >> p3
  echo "Yes" >> p4
  echo "3.3.9" >> p12
 else
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure suspicious packets are logged." >> p2
  echo "${a_output2[*]}" >> p3
  echo "No" >> p4
  echo "3.3.9" >> p12
 fi
}

#3.3.10
#Ensure tcp syn cookies is enabled.
{
 a_output=(); a_output2=(); l_ipv6_disabled=""
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
   a_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_running_parameter_value\" in the running configuration")
  else
   a_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_running_parameter_value\" in the running configuration and should have a value of: \"$l_value_out\"")
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
     a_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\"")
    else
     a_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\" and should have a value of: \"$l_value_out\"")
    fi
   done < <(grep -Po -- "\h*$l_parameter_name\h*=\h*\H+" "${A_out[$l_fkpname]}")
  else
   a_output2+=(" - \"$l_parameter_name\" is not set in an included file ** Note: \"$l_parameter_name\" May be set in a file that's ignored by load procedure **")
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
    a_output+=(" - IPv6 is disabled on the system, \"$l_parameter_name\" is not applicable")
   else
    f_kernel_parameter_chk
   fi
  else
   f_kernel_parameter_chk
  fi
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ "${#a_output2[@]}" -le 0 ]; then
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure tcp syn cookies is enabled." >> p2
  echo "TCP SYN cookies is enabled correctly." >> p3
  echo "Yes" >> p4
  echo "3.3.10" >> p12
 else
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure tcp syn cookies is enabled." >> p2
  echo "${a_output2[*]}" >> p3
  echo "No" >> p4
  echo "3.3.10" >> p12
 fi
}

#3.3.11
#Ensure ipv6 router advertisements are not accepted.
{
 a_output=(); a_output2=(); l_ipv6_disabled=""
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
   a_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_running_parameter_value\" in the running configuration")
  else
   a_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_running_parameter_value\" in the running configuration and should have a value of: \"$l_value_out\"")
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
     a_output+=(" - \"$l_parameter_name\" is correctly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\"")
    else
     a_output2+=(" - \"$l_parameter_name\" is incorrectly set to \"$l_file_parameter_value\" in \"${A_out[$l_fkpname]}\" and should have a value of: \"$l_value_out\"")
    fi
   done < <(grep -Po -- "\h*$l_parameter_name\h*=\h*\H+" "${A_out[$l_fkpname]}")
  else
   a_output2+=(" - \"$l_parameter_name\" is not set in an included file ** Note: \"$l_parameter_name\" May be set in a file that's ignored by load procedure **")
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
    a_output+=(" - IPv6 is disabled on the system, \"$l_parameter_name\" is not applicable")
   else
    f_kernel_parameter_chk
   fi
  else
   f_kernel_parameter_chk
  fi
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ "${#a_output2[@]}" -le 0 ]; then
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure ipv6 router advertisements are not accepted." >> p2
  echo "IPv6 router advertisements are not accepted correctly." >> p3
  echo "Yes" >> p4
  echo "3.3.11" >> p12
 else
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure ipv6 router advertisements are not accepted." >> p2
  echo "${a_output2[*]}" >> p3
  echo "No" >> p4
  echo "3.3.11" >> p12
 fi
}

###############################################################################################################

#4.1.1
#Ensure a single firewall configuration utility is in use.
{
 active_firewall=()
 firewalls=("ufw" "nftables" "iptables")
 # Determine which firewall is in use
 for firewall in "${firewalls[@]}"; do
  case $firewall in
   nftables)
    cmd="nft" ;;
   *)
    cmd=$firewall ;;
  esac
  if command -v $cmd &> /dev/null && systemctl is-enabled --quiet $firewall && systemctl is-active --quiet $firewall; then
   active_firewall+=("$firewall")
  fi
 done

 if [ ${#active_firewall[@]} -eq 1 ]; then
  echo "Network Configuration / Configure a Firewall Utility" >> p1
  echo "Ensure a single firewall configuration utility is in use." >> p2
  echo "A single firewall is in use: ${active_firewall[0]}." >> p3
  echo "Yes" >> p4
  echo "4.1.1" >> p12
 elif [ ${#active_firewall[@]} -eq 0 ]; then
  echo "Network Configuration / Configure a Firewall Utility" >> p1
  echo "Ensure a single firewall configuration utility is in use." >> p2
  echo "No firewall in use or unable to determine firewall status." >> p3
  echo "No" >> p4
  echo "4.1.1" >> p12
 else
  echo "Network Configuration / Configure a Firewall Utility" >> p1
  echo "Ensure a single firewall configuration utility is in use." >> p2
  echo "Multiple firewalls are in use: ${active_firewall[*]}." >> p3
  echo "No" >> p4
  echo "4.1.1" >> p12
 fi
}

###############################################################################################################

#4.2.1
#Ensure ufw is installed.
{
 if dpkg-query -s ufw &>/dev/null; then
  echo "Network Configuration / Configure UncomplicatedFirewall" >> p1
  echo "Ensure ufw is installed." >> p2
  echo "ufw is installed." >> p3
  echo "Yes" >> p4
  echo "4.2.1" >> p12
 else
  echo "Network Configuration / Configure UncomplicatedFirewall" >> p1
  echo "Ensure ufw is installed." >> p2
  echo "ufw is not installed." >> p3
  echo "No" >> p4
  echo "4.2.1" >> p12
 fi
}

#4.2.2
#Ensure iptables-persistent is not installed with ufw.
{
 if ! dpkg-query -s iptables-persistent &>/dev/null; then
  echo "Network Configuration / Configure UncomplicatedFirewall" >> p1
  echo "Ensure iptables-persistent is not installed with ufw." >> p2
  echo "iptables-persistent is not installed." >> p3
  echo "Yes" >> p4
  echo "4.2.2" >> p12
 else
  echo "Network Configuration / Configure UncomplicatedFirewall" >> p1
  echo "Ensure iptables-persistent is not installed with ufw." >> p2
  echo "iptables-persistent is installed and should be removed." >> p3
  echo "No" >> p4
  echo "4.2.2" >> p12
 fi
}

#4.2.3
#Ensure ufw service is enabled.
{
 ufw_enabled=0
 ufw_active=0
 ufw_status=0

 systemctl is-enabled ufw.service &>/dev/null && ufw_enabled=1
 systemctl is-active ufw &>/dev/null && ufw_active=1
 ufw status 2>/dev/null | grep -q "Status: active" && ufw_status=1

 if [ $ufw_enabled -eq 1 ] && [ $ufw_active -eq 1 ] && [ $ufw_status -eq 1 ]; then
  echo "Network Configuration / Configure UncomplicatedFirewall" >> p1
  echo "Ensure ufw service is enabled." >> p2
  echo "ufw service is enabled, active and running." >> p3
  echo "Yes" >> p4
  echo "4.2.3" >> p12
 else
  l_output=""
  [ $ufw_enabled -eq 0 ] && l_output="$l_output ufw.service is not enabled."
  [ $ufw_active -eq 0 ] && l_output="$l_output ufw daemon is not active."
  [ $ufw_status -eq 0 ] && l_output="$l_output ufw status is not active."
  echo "Network Configuration / Configure UncomplicatedFirewall" >> p1
  echo "Ensure ufw service is enabled." >> p2
  echo "$l_output" >> p3
  echo "No" >> p4
  echo "4.2.3" >> p12
 fi
}

#4.2.4
#Ensure ufw loopback traffic is configured.
{
 l_output="" l_output2=""

 # Check loopback interface accept rules in before.rules
 if grep -P -- 'lo\|127\.0\.0\.0' /etc/ufw/before.rules 2>/dev/null | grep -qP -- '-A ufw-before-input -i lo -j ACCEPT' && \
    grep -P -- 'lo\|127\.0\.0\.0' /etc/ufw/before.rules 2>/dev/null | grep -qP -- '-A ufw-before-output -o lo -j ACCEPT'; then
  l_output="$l_output Loopback interface accept rules are configured in /etc/ufw/before.rules."
 else
  l_output2="$l_output2 Loopback interface accept rules are not configured in /etc/ufw/before.rules."
 fi

 # Check deny rules for loopback network via ufw status verbose
 if ufw status verbose 2>/dev/null | grep -qP -- 'Anywhere\s+DENY IN\s+127\.0\.0\.0\/8'; then
  l_output="$l_output Deny rule for 127.0.0.0/8 is configured."
 else
  l_output2="$l_output2 Deny rule for 127.0.0.0/8 is not configured."
 fi

 if ufw status verbose 2>/dev/null | grep -qP -- 'Anywhere \(v6\)\s+DENY IN\s+::1'; then
  l_output="$l_output Deny rule for ::1 (IPv6) is configured."
 else
  l_output2="$l_output2 Deny rule for ::1 (IPv6) is not configured."
 fi

 if [ -z "$l_output2" ]; then
  echo "Network Configuration / Configure UncomplicatedFirewall" >> p1
  echo "Ensure ufw loopback traffic is configured." >> p2
  echo "ufw loopback traffic is configured correctly." >> p3
  echo "Yes" >> p4
  echo "4.2.4" >> p12
 else
  echo "Network Configuration / Configure UncomplicatedFirewall" >> p1
  echo "Ensure ufw loopback traffic is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "4.2.4" >> p12
 fi
}

#4.2.6
#Ensure ufw firewall rules exist for all open ports.
{
 l_ufw_ports="$(ufw status verbose 2>/dev/null | grep -Po '\h*\d+\b' | sort -u)"
 l_open_ports="$(ss -tuln | awk '($5!~/lo:/ && $5!~/127\.0\.0\.1/ && $5!~/\[::1\]/) {split($5,a,":");if(a[2]+0>0)print a[2]}' | sort -u)"
 l_diff="$(printf '%s\n' $l_open_ports $l_ufw_ports | sort | uniq -u | tr '\n' ' ' | sed 's/ $//')"

 if [ -n "$l_diff" ]; then
  echo "Network Configuration / Configure UncomplicatedFirewall" >> p1
  echo "Ensure ufw firewall rules exist for all open ports." >> p2
  echo "The following port(s) do not have a rule in UFW: $l_diff" >> p3
  echo "No" >> p4
  echo "4.2.6" >> p12
 else
  echo "Network Configuration / Configure UncomplicatedFirewall" >> p1
  echo "Ensure ufw firewall rules exist for all open ports." >> p2
  echo "All open ports have a rule in UFW." >> p3
  echo "Yes" >> p4
  echo "4.2.6" >> p12
 fi
}

#4.2.7
#Ensure ufw default deny firewall policy.
{
 l_output="" l_output2=""
 l_defaults="$(ufw status verbose 2>/dev/null | grep -i 'Default:')"

 # Check incoming policy is deny or reject
 if echo "$l_defaults" | grep -qP -- 'deny\s*\(incoming\)|reject\s*\(incoming\)'; then
  l_output="$l_output Incoming default policy is deny/reject."
 else
  l_output2="$l_output2 Incoming default policy is not set to deny or reject."
 fi

 # Check outgoing policy is deny or reject
 if echo "$l_defaults" | grep -qP -- 'deny\s*\(outgoing\)|reject\s*\(outgoing\)'; then
  l_output="$l_output Outgoing default policy is deny/reject."
 else
  l_output2="$l_output2 Outgoing default policy is not set to deny or reject."
 fi

 # Check routed policy is deny, reject or disabled
 if echo "$l_defaults" | grep -qP -- 'deny\s*\(routed\)|reject\s*\(routed\)|disabled\s*\(routed\)'; then
  l_output="$l_output Routed default policy is deny/reject/disabled."
 else
  l_output2="$l_output2 Routed default policy is not set to deny reject or disabled."
 fi

 if [ -z "$l_output2" ]; then
  echo "Network Configuration / Configure UncomplicatedFirewall" >> p1
  echo "Ensure ufw default deny firewall policy." >> p2
  echo "ufw default deny firewall policy is set correctly." >> p3
  echo "Yes" >> p4
  echo "4.2.7" >> p12
 else
  echo "Network Configuration / Configure UncomplicatedFirewall" >> p1
  echo "Ensure ufw default deny firewall policy." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "4.2.7" >> p12
 fi
}

##############################################################################################################

#4.3.1
#Ensure nftables is installed.
{
 if dpkg-query -s nftables &>/dev/null; then
  echo "Network Configuration / Configure nftables" >> p1
  echo "Ensure nftables is installed." >> p2
  echo "nftables is installed." >> p3
  echo "Yes" >> p4
  echo "4.3.1" >> p12
 else
  echo "Network Configuration / Configure nftables" >> p1
  echo "Ensure nftables is installed." >> p2
  echo "nftables is not installed." >> p3
  echo "No" >> p4
  echo "4.3.1" >> p12
 fi
}

#4.3.2
#Ensure ufw is uninstalled or disabled with nftables.
{
 # Pass if ufw is not installed
 if ! dpkg-query -s ufw &>/dev/null; then
  echo "Network Configuration / Configure nftables" >> p1
  echo "Ensure ufw is uninstalled or disabled with nftables." >> p2
  echo "ufw is not installed." >> p3
  echo "Yes" >> p4
  echo "4.3.2" >> p12
 # OR pass if ufw is inactive AND ufw.service is masked/disabled
 elif ufw status 2>/dev/null | grep -q "Status: inactive" && \
      systemctl is-enabled ufw.service 2>/dev/null | grep -qP -- 'masked|disabled'; then
  echo "Network Configuration / Configure nftables" >> p1
  echo "Ensure ufw is uninstalled or disabled with nftables." >> p2
  echo "ufw is installed but inactive and ufw.service is masked/disabled." >> p3
  echo "Yes" >> p4
  echo "4.3.2" >> p12
 else
  echo "Network Configuration / Configure nftables" >> p1
  echo "Ensure ufw is uninstalled or disabled with nftables." >> p2
  echo "ufw is installed and active. ufw should be uninstalled or disabled when using nftables." >> p3
  echo "No" >> p4
  echo "4.3.2" >> p12
 fi
}


#4.3.4
#Ensure a nftables table exists.
{
 l_tables="$(nft list tables 2>/dev/null | tr '\n' ' ' | tr -s ' ' | sed 's/[[:space:]]*$//')"

 if [ -n "$l_tables" ]; then
  echo "Network Configuration / Configure nftables" >> p1
  echo "Ensure a nftables table exists." >> p2
  echo "nftables table(s) exist: $l_tables" >> p3
  echo "Yes" >> p4
  echo "4.3.4" >> p12
 else
  echo "Network Configuration / Configure nftables" >> p1
  echo "Ensure a nftables table exists." >> p2
  echo "No nftables tables exist. A table must be created for nftables to filter traffic." >> p3
  echo "No" >> p4
  echo "4.3.4" >> p12
 fi
}

#4.3.5
#Ensure nftables base chains exist.
{
 l_output="" l_output2=""

 # Check base chain for INPUT hook
 if nft list ruleset 2>/dev/null | grep -q 'hook input'; then
  l_output="$l_output Base chain with hook input exists."
 else
  l_output2="$l_output2 No base chain with hook input found."
 fi

 # Check base chain for FORWARD hook
 if nft list ruleset 2>/dev/null | grep -q 'hook forward'; then
  l_output="$l_output Base chain with hook forward exists."
 else
  l_output2="$l_output2 No base chain with hook forward found."
 fi

 # Check base chain for OUTPUT hook
 if nft list ruleset 2>/dev/null | grep -q 'hook output'; then
  l_output="$l_output Base chain with hook output exists."
 else
  l_output2="$l_output2 No base chain with hook output found."
 fi

 if [ -z "$l_output2" ]; then
  echo "Network Configuration / Configure nftables" >> p1
  echo "Ensure nftables base chains exist." >> p2
  echo "nftables base chains for input, forward and output exist." >> p3
  echo "Yes" >> p4
  echo "4.3.5" >> p12
 else
  echo "Network Configuration / Configure nftables" >> p1
  echo "Ensure nftables base chains exist." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "4.3.5" >> p12
 fi
}

#4.3.6
#Ensure nftables loopback traffic is configured.
{
 l_output="" l_output2=""

 # Check loopback interface accept rule
 if nft list ruleset 2>/dev/null | awk '/hook input/,/}/' | grep -q 'iif "lo" accept'; then
  l_output="$l_output Loopback interface accept rule exists."
 else
  l_output2="$l_output2 No loopback interface accept rule (iif \"lo\" accept) found in input hook."
 fi

 # Check IPv4 loopback drop rule
 if nft list ruleset 2>/dev/null | awk '/hook input/,/}/' | grep -q 'ip saddr'; then
  l_output="$l_output IPv4 loopback drop rule exists."
 else
  l_output2="$l_output2 No IPv4 loopback drop rule (ip saddr 127.0.0.0/8 drop) found in input hook."
 fi

 # Check IPv6 loopback drop rule only if IPv6 is enabled
 if grep -Pqs '^\h*0\b' /sys/module/ipv6/parameters/disable || \
    sysctl net.ipv6.conf.all.disable_ipv6 2>/dev/null | grep -qP '=\s*0'; then
  if nft list ruleset 2>/dev/null | awk '/hook input/,/}/' | grep -q 'ip6 saddr'; then
   l_output="$l_output IPv6 loopback drop rule exists."
  else
   l_output2="$l_output2 No IPv6 loopback drop rule (ip6 saddr ::1 drop) found in input hook."
  fi
 else
  l_output="$l_output IPv6 is disabled, IPv6 loopback rule not required."
 fi

 if [ -z "$l_output2" ]; then
  echo "Network Configuration / Configure nftables" >> p1
  echo "Ensure nftables loopback traffic is configured." >> p2
  echo "nftables loopback traffic is configured correctly." >> p3
  echo "Yes" >> p4
  echo "4.3.6" >> p12
 else
  echo "Network Configuration / Configure nftables" >> p1
  echo "Ensure nftables loopback traffic is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "4.3.6" >> p12
 fi
}

#4.3.8
#Ensure nftables default deny firewall policy.
{
 l_output="" l_output2=""

 # Check input hook has policy drop
 if nft list ruleset 2>/dev/null | grep 'hook input' | grep -q 'policy drop'; then
  l_output="$l_output Input hook has policy drop."
 else
  l_output2="$l_output2 Input hook does not have policy drop."
 fi

 # Check forward hook has policy drop
 if nft list ruleset 2>/dev/null | grep 'hook forward' | grep -q 'policy drop'; then
  l_output="$l_output Forward hook has policy drop."
 else
  l_output2="$l_output2 Forward hook does not have policy drop."
 fi

 # Check output hook has policy drop
 if nft list ruleset 2>/dev/null | grep 'hook output' | grep -q 'policy drop'; then
  l_output="$l_output Output hook has policy drop."
 else
  l_output2="$l_output2 Output hook does not have policy drop."
 fi

 if [ -z "$l_output2" ]; then
  echo "Network Configuration / Configure nftables" >> p1
  echo "Ensure nftables default deny firewall policy." >> p2
  echo "nftables default deny policy is set correctly for all base chains." >> p3
  echo "Yes" >> p4
  echo "4.3.8" >> p12
 else
  echo "Network Configuration / Configure nftables" >> p1
  echo "Ensure nftables default deny firewall policy." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "4.3.8" >> p12
 fi
}

#4.3.9
#Ensure nftables service is enabled.
{
 if systemctl is-enabled nftables 2>/dev/null | grep -q 'enabled'; then
  echo "Network Configuration / Configure nftables" >> p1
  echo "Ensure nftables service is enabled." >> p2
  echo "nftables service is enabled." >> p3
  echo "Yes" >> p4
  echo "4.3.9" >> p12
 else
  echo "Network Configuration / Configure nftables" >> p1
  echo "Ensure nftables service is enabled." >> p2
  echo "nftables service is not enabled." >> p3
  echo "No" >> p4
  echo "4.3.9" >> p12
 fi
}

#4.3.10
#Ensure nftables rules are permanent.
{
 l_output="" l_output2=""

 # Check /etc/nftables.conf exists and has include directives
 if [ ! -f /etc/nftables.conf ]; then
  echo "Network Configuration / Configure nftables" >> p1
  echo "Ensure nftables rules are permanent." >> p2
  echo "/etc/nftables.conf does not exist. nftables rules will not persist on reboot." >> p3
  echo "No" >> p4
  echo "4.3.10" >> p12
 else
  # Check input base chain is in an included file
  if [ -n "$(grep -E '^\s*include' /etc/nftables.conf)" ] && \
     awk '/hook input/,/}/' $(grep -E '^\s*include' /etc/nftables.conf | awk '$1 ~ /^\s*include/ { gsub(/"",",$2); print $2 }') 2>/dev/null | grep -q 'hook input'; then
   l_output="$l_output Input base chain found in an included file."
  else
   l_output2="$l_output2 Input base chain not found in any file included by /etc/nftables.conf."
  fi

  # Check forward base chain is in an included file
  if [ -n "$(grep -E '^\s*include' /etc/nftables.conf)" ] && \
     awk '/hook forward/,/}/' $(grep -E '^\s*include' /etc/nftables.conf | awk '$1 ~ /^\s*include/ { gsub(/"",",$2); print $2 }') 2>/dev/null | grep -q 'hook forward'; then
   l_output="$l_output Forward base chain found in an included file."
  else
   l_output2="$l_output2 Forward base chain not found in any file included by /etc/nftables.conf."
  fi

  # Check output base chain is in an included file
  if [ -n "$(grep -E '^\s*include' /etc/nftables.conf)" ] && \
     awk '/hook output/,/}/' $(grep -E '^\s*include' /etc/nftables.conf | awk '$1 ~ /^\s*include/ { gsub(/"",",$2); print $2 }') 2>/dev/null | grep -q 'hook output'; then
   l_output="$l_output Output base chain found in an included file."
  else
   l_output2="$l_output2 Output base chain not found in any file included by /etc/nftables.conf."
  fi

  if [ -z "$l_output2" ]; then
   echo "Network Configuration / Configure nftables" >> p1
   echo "Ensure nftables rules are permanent." >> p2
   echo "nftables rules are permanent. All base chains found in included files." >> p3
   echo "Yes" >> p4
   echo "4.3.10" >> p12
  else
   echo "Network Configuration / Configure nftables" >> p1
   echo "Ensure nftables rules are permanent." >> p2
   echo "$l_output2" >> p3
   echo "No" >> p4
   echo "4.3.10" >> p12
  fi
 fi
}

#######################################################################################################################

#4.4.1.1
#Ensure iptables packages are installed.
{
 l_output="" l_output2=""

 # Check iptables is installed
 if dpkg-query -s iptables &>/dev/null; then
  l_output="$l_output iptables is installed."
 else
  l_output2="$l_output2 iptables is not installed."
 fi

 # Check iptables-persistent is installed
 if dpkg-query -s iptables-persistent &>/dev/null; then
  l_output="$l_output iptables-persistent is installed."
 else
  l_output2="$l_output2 iptables-persistent is not installed."
 fi

 if [ -z "$l_output2" ]; then
  echo "Network Configuration / Configure iptables" >> p1
  echo "Ensure iptables packages are installed." >> p2
  echo "iptables and iptables-persistent are installed." >> p3
  echo "Yes" >> p4
  echo "4.4.1.1" >> p12
 else
  echo "Network Configuration / Configure iptables" >> p1
  echo "Ensure iptables packages are installed." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "4.4.1.1" >> p12
 fi
}

#4.4.1.2
#Ensure nftables is not in use with iptables.
{
 # Pass if nftables is not installed
 if ! dpkg-query -s nftables &>/dev/null; then
  echo "Network Configuration / Configure iptables" >> p1
  echo "Ensure nftables is not in use with iptables." >> p2
  echo "nftables is not installed." >> p3
  echo "Yes" >> p4
  echo "4.4.1.2" >> p12
 # OR pass if nftables.service is not enabled AND not active
 elif ! systemctl is-enabled nftables.service 2>/dev/null | grep -q 'enabled' && \
      ! systemctl is-active nftables.service 2>/dev/null | grep -q 'active'; then
  echo "Network Configuration / Configure iptables" >> p1
  echo "Ensure nftables is not in use with iptables." >> p2
  echo "nftables is installed but nftables.service is not enabled and not active." >> p3
  echo "Yes" >> p4
  echo "4.4.1.2" >> p12
 else
  echo "Network Configuration / Configure iptables" >> p1
  echo "Ensure nftables is not in use with iptables." >> p2
  echo "nftables is installed and active/enabled. nftables should not be used alongside iptables." >> p3
  echo "No" >> p4
  echo "4.4.1.2" >> p12
 fi
}

#4.4.1.3
#Ensure ufw is not in use with iptables.
{
 # Pass if ufw is not installed
 if ! dpkg-query -s ufw &>/dev/null; then
  echo "Network Configuration / Configure iptables" >> p1
  echo "Ensure ufw is not in use with iptables." >> p2
  echo "ufw is not installed." >> p3
  echo "Yes" >> p4
  echo "4.4.1.3" >> p12
 # OR pass if ufw is inactive AND ufw.service is not enabled AND not active
 elif ufw status 2>/dev/null | grep -q "Status: inactive" && \
      ! systemctl is-enabled ufw 2>/dev/null | grep -q 'enabled' && \
      ! systemctl is-active ufw.service 2>/dev/null | grep -q 'active'; then
  echo "Network Configuration / Configure iptables" >> p1
  echo "Ensure ufw is not in use with iptables." >> p2
  echo "ufw is installed but inactive and ufw.service is not enabled and not active." >> p3
  echo "Yes" >> p4
  echo "4.4.1.3" >> p12
 else
  echo "Network Configuration / Configure iptables" >> p1
  echo "Ensure ufw is not in use with iptables." >> p2
  echo "ufw is installed and active/enabled. ufw should not be used alongside iptables." >> p3
  echo "No" >> p4
  echo "4.4.1.3" >> p12
 fi
}

#################################################################################################################

#4.4.2.1
#Ensure iptables default deny firewall policy.
{
 l_output="" l_output2=""

 # Check INPUT chain policy is DROP or REJECT
 if iptables -L INPUT 2>/dev/null | grep -qP '^Chain INPUT \(policy (DROP|REJECT)\)'; then
  l_output="$l_output INPUT chain policy is DROP/REJECT."
 else
  l_output2="$l_output2 INPUT chain policy is not DROP or REJECT."
 fi

 # Check OUTPUT chain policy is DROP or REJECT
 if iptables -L OUTPUT 2>/dev/null | grep -qP '^Chain OUTPUT \(policy (DROP|REJECT)\)'; then
  l_output="$l_output OUTPUT chain policy is DROP/REJECT."
 else
  l_output2="$l_output2 OUTPUT chain policy is not DROP or REJECT."
 fi

 # Check FORWARD chain policy is DROP or REJECT
 if iptables -L FORWARD 2>/dev/null | grep -qP '^Chain FORWARD \(policy (DROP|REJECT)\)'; then
  l_output="$l_output FORWARD chain policy is DROP/REJECT."
 else
  l_output2="$l_output2 FORWARD chain policy is not DROP or REJECT."
 fi

 if [ -z "$l_output2" ]; then
  echo "Network Configuration / Configure iptables" >> p1
  echo "Ensure iptables default deny firewall policy." >> p2
  echo "iptables default deny policy is set correctly for INPUT, OUTPUT and FORWARD chains." >> p3
  echo "Yes" >> p4
  echo "4.4.2.1" >> p12
 else
  echo "Network Configuration / Configure iptables" >> p1
  echo "Ensure iptables default deny firewall policy." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "4.4.2.1" >> p12
 fi
}

#4.4.2.2
#Ensure iptables loopback traffic is configured.
{
 l_output="" l_output2=""

 # Check INPUT chain accepts loopback interface
 if iptables -L INPUT -v -n 2>/dev/null | grep -qP '^\s*\d+\s+\d+\s+ACCEPT\s+all\s+--\s+lo\s+\*\s+0\.0\.0\.0\/0\s+0\.0\.0\.0\/0'; then
  l_output="$l_output INPUT chain accepts loopback interface traffic."
 else
  l_output2="$l_output2 INPUT chain does not accept loopback interface traffic."
 fi

 # Check INPUT chain drops traffic from 127.0.0.0/8
 if iptables -L INPUT -v -n 2>/dev/null | grep -qP '^\s*\d+\s+\d+\s+DROP\s+all\s+--\s+\*\s+\*\s+127\.0\.0\.0\/8\s+0\.0\.0\.0\/0'; then
  l_output="$l_output INPUT chain drops traffic sourced from 127.0.0.0/8."
 else
  l_output2="$l_output2 INPUT chain does not drop traffic sourced from 127.0.0.0/8."
 fi

 # Check OUTPUT chain accepts loopback interface
 if iptables -L OUTPUT -v -n 2>/dev/null | grep -qP '^\s*\d+\s+\d+\s+ACCEPT\s+all\s+--\s+\*\s+lo\s+0\.0\.0\.0\/0\s+0\.0\.0\.0\/0'; then
  l_output="$l_output OUTPUT chain accepts loopback interface traffic."
 else
  l_output2="$l_output2 OUTPUT chain does not accept loopback interface traffic."
 fi

 if [ -z "$l_output2" ]; then
  echo "Network Configuration / Configure iptables" >> p1
  echo "Ensure iptables loopback traffic is configured." >> p2
  echo "iptables loopback traffic is configured correctly." >> p3
  echo "Yes" >> p4
  echo "4.4.2.2" >> p12
 else
  echo "Network Configuration / Configure iptables" >> p1
  echo "Ensure iptables loopback traffic is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "4.4.2.2" >> p12
 fi
}

#4.4.2.4
#Ensure iptables firewall rules exist for all open ports.
{
 unset a_iptout; unset a_openports

 # Get all ports covered by iptables INPUT rules
 while read -r l_iptport; do
  [ -n "$l_iptport" ] && a_iptout+=("$l_iptport")
 done < <(iptables -L INPUT -v -n 2>/dev/null | grep -Po '\bdpt:\K\d+' | sort -u)

 # Get all open ports on non-loopback interfaces
 while read -r l_openport; do
  [ -n "$l_openport" ] && a_openports+=("$l_openport")
 done < <(ss -4tuln 2>/dev/null | awk '($5!~/127\.0\.0\.0|::1/) {split($5, a, ":"); print a[2]}' | grep -P '^\d+$' | sort -u)

 # Find open ports that don't have an iptables INPUT rule
 a_diff=$(printf '%s\n' "${a_openports[@]}" "${a_iptout[@]}" | sort | uniq -u)

 if [ -n "$a_diff" ]; then
  echo "Network Configuration / Configure iptables" >> p1
  echo "Ensure iptables firewall rules exist for all open ports." >> p2
  echo "The following port(s) do not have an iptables rule: $(printf '%s ' $a_diff)" >> p3
  echo "No" >> p4
  echo "4.4.2.4" >> p12
 else
  echo "Network Configuration / Configure iptables" >> p1
  echo "Ensure iptables firewall rules exist for all open ports." >> p2
  echo "All open ports have an iptables firewall rule." >> p3
  echo "Yes" >> p4
  echo "4.4.2.4" >> p12
 fi
}

############################################################################################################

#4.4.3.1
#Ensure ip6tables default deny firewall policy.
{
 l_output="" l_output2=""

 # First check if IPv6 is enabled
 l_ipv6_enabled="is"
 if grep -Pqs -- '^\h*0\b' /sys/module/ipv6/parameters/disable && l_ipv6_enabled="is not"; then
  : # IPv6 disabled via module parameter
 fi
 if sysctl net.ipv6.conf.all.disable_ipv6 2>/dev/null | grep -Pqs -- "\h*=\h*1\b" && \
    sysctl net.ipv6.conf.default.disable_ipv6 2>/dev/null | grep -Pqs -- "\h*=\h*1\b"; then
  l_ipv6_enabled="is not"
 fi

 if [ "$l_ipv6_enabled" = "is not" ]; then
  echo "Network Configuration / Configure ip6tables" >> p1
  echo "Ensure ip6tables default deny firewall policy." >> p2
  echo "IPv6 is not enabled on the system. ip6tables check not required." >> p3
  echo "Yes" >> p4
  echo "4.4.3.1" >> p12
 else
  # IPv6 is enabled - check ip6tables chain policies
  # Check INPUT chain
  if ip6tables -L INPUT 2>/dev/null | grep -qP '^Chain INPUT \(policy (DROP|REJECT)\)'; then
   l_output="$l_output INPUT chain policy is DROP/REJECT."
  else
   l_output2="$l_output2 INPUT chain policy is not DROP or REJECT."
  fi

  # Check OUTPUT chain
  if ip6tables -L OUTPUT 2>/dev/null | grep -qP '^Chain OUTPUT \(policy (DROP|REJECT)\)'; then
   l_output="$l_output OUTPUT chain policy is DROP/REJECT."
  else
   l_output2="$l_output2 OUTPUT chain policy is not DROP or REJECT."
  fi

  # Check FORWARD chain
  if ip6tables -L FORWARD 2>/dev/null | grep -qP '^Chain FORWARD \(policy (DROP|REJECT)\)'; then
   l_output="$l_output FORWARD chain policy is DROP/REJECT."
  else
   l_output2="$l_output2 FORWARD chain policy is not DROP or REJECT."
  fi

  if [ -z "$l_output2" ]; then
   echo "Network Configuration / Configure ip6tables" >> p1
   echo "Ensure ip6tables default deny firewall policy." >> p2
   echo "ip6tables default deny policy is correctly set for all chains." >> p3
   echo "Yes" >> p4
   echo "4.4.3.1" >> p12
  else
   echo "Network Configuration / Configure ip6tables" >> p1
   echo "Ensure ip6tables default deny firewall policy." >> p2
   echo "$l_output2" >> p3
   echo "No" >> p4
   echo "4.4.3.1" >> p12
  fi
 fi
}

#4.4.3.2
#Ensure ip6tables loopback traffic is configured.
{
 l_output="" l_output2=""

 # Check if IPv6 is enabled
 l_ipv6_enabled="is"
 if grep -Pqs -- '^\h*0\b' /sys/module/ipv6/parameters/disable; then
  l_ipv6_enabled="is not"
 fi
 if sysctl net.ipv6.conf.all.disable_ipv6 2>/dev/null | grep -Pqs -- "\h*=\h*1\b" && \
    sysctl net.ipv6.conf.default.disable_ipv6 2>/dev/null | grep -Pqs -- "\h*=\h*1\b"; then
  l_ipv6_enabled="is not"
 fi

 if [ "$l_ipv6_enabled" = "is not" ]; then
  echo "Network Configuration / Configure ip6tables" >> p1
  echo "Ensure ip6tables loopback traffic is configured." >> p2
  echo "IPv6 is not enabled on the system. ip6tables loopback check not required." >> p3
  echo "Yes" >> p4
  echo "4.4.3.2" >> p12
 else
  # Check INPUT chain accepts loopback interface
  if ip6tables -L INPUT -v -n 2>/dev/null | grep -qP '^\s*\d+\s+\d+\s+ACCEPT\s+all\s+lo\s+\*\s+::\/0\s+::\/0'; then
   l_output="$l_output INPUT chain accepts loopback interface traffic."
  else
   l_output2="$l_output2 INPUT chain does not accept loopback interface traffic."
  fi

  # Check INPUT chain drops traffic from ::1
  if ip6tables -L INPUT -v -n 2>/dev/null | grep -qP '^\s*\d+\s+\d+\s+DROP\s+all\s+\*\s+\*\s+::1\s+::\/0'; then
   l_output="$l_output INPUT chain drops traffic sourced from ::1."
  else
   l_output2="$l_output2 INPUT chain does not drop traffic sourced from ::1."
  fi

  # Check OUTPUT chain accepts loopback interface
  if ip6tables -L OUTPUT -v -n 2>/dev/null | grep -qP '^\s*\d+\s+\d+\s+ACCEPT\s+all\s+\*\s+lo\s+::\/0\s+::\/0'; then
   l_output="$l_output OUTPUT chain accepts loopback interface traffic."
  else
   l_output2="$l_output2 OUTPUT chain does not accept loopback interface traffic."
  fi

  if [ -z "$l_output2" ]; then
   echo "Network Configuration / Configure ip6tables" >> p1
   echo "Ensure ip6tables loopback traffic is configured." >> p2
   echo "ip6tables loopback traffic is configured correctly." >> p3
   echo "Yes" >> p4
   echo "4.4.3.2" >> p12
  else
   echo "Network Configuration / Configure ip6tables" >> p1
   echo "Ensure ip6tables loopback traffic is configured." >> p2
   echo "$l_output2" >> p3
   echo "No" >> p4
   echo "4.4.3.2" >> p12
  fi
 fi
}

#4.4.3.4
#Ensure ip6tables firewall rules exist for all open ports.
{
 # Check if IPv6 is enabled
 l_ipv6_enabled="is"
 if grep -Pqs -- '^\h*0\b' /sys/module/ipv6/parameters/disable; then
  l_ipv6_enabled="is not"
 fi
 if sysctl net.ipv6.conf.all.disable_ipv6 2>/dev/null | grep -Pqs -- "\h*=\h*1\b" && \
    sysctl net.ipv6.conf.default.disable_ipv6 2>/dev/null | grep -Pqs -- "\h*=\h*1\b"; then
  l_ipv6_enabled="is not"
 fi

 if [ "$l_ipv6_enabled" = "is not" ]; then
  echo "Network Configuration / Configure ip6tables" >> p1
  echo "Ensure ip6tables firewall rules exist for all open ports." >> p2
  echo "IPv6 is not enabled on the system. ip6tables open ports check not required." >> p3
  echo "Yes" >> p4
  echo "4.4.3.4" >> p12
 else
  unset a_ip6tout; unset a_openports6

  # Get all ports covered by ip6tables INPUT rules
  while read -r l_ip6port; do
   [ -n "$l_ip6port" ] && a_ip6tout+=("$l_ip6port")
  done < <(ip6tables -L INPUT -v -n 2>/dev/null | grep -Po '\bdpt:\K\d+' | sort -u)

  # Get all open IPv6 ports on non-loopback interfaces
  while read -r l_openport; do
   [ -n "$l_openport" ] && a_openports6+=("$l_openport")
  done < <(ss -6tuln 2>/dev/null | awk '($5!~/\[::1\]/) {split($5, a, ":"); print a[length(a)]}' | grep -P '^\d+$' | sort -u)

  # Find open ports that don't have an ip6tables INPUT rule
  a_diff=$(printf '%s\n' "${a_openports6[@]}" "${a_ip6tout[@]}" | sort | uniq -u)

  if [ -n "$a_diff" ]; then
   echo "Network Configuration / Configure ip6tables" >> p1
   echo "Ensure ip6tables firewall rules exist for all open ports." >> p2
   echo "The following IPv6 port(s) do not have an ip6tables rule: $(printf '%s ' $a_diff)" >> p3
   echo "No" >> p4
   echo "4.4.3.4" >> p12
  else
   echo "Network Configuration / Configure ip6tables" >> p1
   echo "Ensure ip6tables firewall rules exist for all open ports." >> p2
   echo "All open IPv6 ports have an ip6tables firewall rule." >> p3
   echo "Yes" >> p4
   echo "4.4.3.4" >> p12
  fi
 fi
}


##################################################################################################################

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

#5.1.2
#Ensure access to SSH private host key files is configured.
{
 l_output="" l_output2=""
 l_skgn="ssh_keys"
 l_skgid="$(awk -F: '($1 == "'"$l_skgn"'"){print $3}' /etc/group)"
 while read -r l_file l_mode l_owner l_group l_gid; do
  [ -n "$l_skgid" ] && l_cga="$l_skgn" || l_cga="root"
  [ "$l_gid" = "$l_skgid" ] && l_pmask="0137" || l_pmask="0177"
  l_maxperm="$(printf '%o' $(( 0777 & ~$l_pmask )))"
  [ $(( $l_mode & $l_pmask )) -gt 0 ] && l_output2="$l_output2 File: \"$l_file\" is mode \"$l_mode\" should be mode: \"$l_maxperm\" or more restrictive."
  [ "$l_owner" != "root" ] && l_output2="$l_output2 File: \"$l_file\" is owned by: \"$l_owner\" should be owned by \"root\"."
  if [ "$l_group" != "root" ] && [ "$l_gid" != "$l_skgid" ]; then
   l_output2="$l_output2 File: \"$l_file\" is owned by group \"$l_group\" should belong to group \"$l_cga\"."
  fi
  [ -z "$l_output2" ] && l_output="$l_output File: \"$l_file\": Correct mode ($l_mode) owner ($l_owner) group ($l_group)."
 done < <(find /etc/ssh -xdev -type f -name 'ssh_host_*_key' -exec stat -L -c "%n %#a %U %G %g" {} + 2>/dev/null)
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure SSH Server" >> p1
  echo "Ensure access to SSH private host key files is configured." >> p2
  echo "SSH private host key files are configured correctly. $l_output" >> p3
  echo "Yes" >> p4
  echo "5.1.2" >> p12
 else
  echo "Access Control / Configure SSH Server" >> p1
  echo "Ensure access to SSH private host key files is configured." >> p2
  echo "SSH private host key files are NOT configured correctly. $l_output2" >> p3
  echo "No" >> p4
  echo "5.1.2" >> p12
 fi
}

#5.1.3
#Ensure access to SSH public host key files is configured.
{
 l_output="" l_output2=""
 l_pmask="0133"
 l_maxperm="$(printf '%o' $(( 0777 & ~$l_pmask )))"
 while read -r l_file l_mode l_owner l_group; do
  [ $(( $l_mode & $l_pmask )) -gt 0 ] && l_output2="$l_output2 File: \"$l_file\" mode \"$l_mode\" (required: $l_maxperm or more restrictive)."
  [ "$l_owner" != "root" ] && l_output2="$l_output2 File: \"$l_file\" owned by \"$l_owner\" (required: root)."
  [ "$l_group" != "root" ] && l_output2="$l_output2 File: \"$l_file\" group owned by \"$l_group\" (required: root)."
  [ -z "$l_output2" ] && l_output="$l_output File: \"$l_file\": Correct mode ($l_mode), owner ($l_owner), group ($l_group)."
 done < <(find /etc/ssh -xdev -type f -name 'ssh_host_*_key.pub' -exec stat -L -c "%n %#a %U %G" {} + 2>/dev/null)
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure SSH Server" >> p1
  echo "Ensure access to SSH public host key files is configured." >> p2
  echo "SSH public host key files are configured correctly. $(echo "$l_output" | tr ',' ' ')" >> p3
  echo "Yes" >> p4
  echo "5.1.3" >> p12
 else
  echo "Access Control / Configure SSH Server" >> p1
  echo "Ensure access to SSH public host key files is configured." >> p2
  echo "SSH public host key files are NOT configured correctly. $l_output2" >> p3
  echo "No" >> p4
  echo "5.1.3" >> p12
 fi
}


# 5.1.4 Ensure sshd access is configured

{
    l_output=""
    l_output2=""

    # Run sshd command safely
    ssh_output=$(sshd -T 2>/dev/null | grep -Pi '^(allowusers|allowgroups|denyusers|denygroups)' | tr '\n' ' ' | tr -s ' ')

    # Check result
    if [ -n "$ssh_output" ]; then
        l_output="Configured SSH access control found: $ssh_output"
        result="Yes"
    else
        l_output2="No AllowUsers/AllowGroups/DenyUsers/DenyGroups configured in sshd."
        result="No"
    fi

    # Final result handling (prevents blank output)
    final_output="${l_output:-$l_output2}"

    if [ -z "$final_output" ]; then
        final_output="Unable to determine SSH access configuration."
    fi

    # Write output (aligned with your script format)
    echo "Access Control / Configure SSH Server" >> p1
    echo "Ensure sshd access is configured." >> p2
    echo "$final_output" | tr '\t' ' ' | tr '|' '/' >> p3
    echo "$result" >> p4
    echo "5.1.4" >> p12
}

#5.1.5
#Ensure sshd Banner is configured.
{
 l_output="" l_output2=""
 l_banner="$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep "$(hostname)" /etc/hosts | awk '{print $1}')" 2>/dev/null | grep -Pi '^\h*banner\h+' | awk '{print $2}')"
 if [ -n "$l_banner" ] && [ "$l_banner" != "none" ]; then
  l_output="$l_output sshd Banner is set to \"$l_banner\"."
  if [ -f "$l_banner" ]; then
   l_os_info="$(grep -Psi '(\\\v|\\\r|\\\m|\\\s|$(grep '\''^ID='\'' /etc/os-release | cut -d= -f2 | sed -e '\''s/"//g'\''))' "$l_banner" 2>/dev/null)"
   if [ -n "$l_os_info" ]; then
    l_output2="$l_output2 Banner file \"$l_banner\" contains OS/version information which should be removed."
   else
    l_output="$l_output Banner file \"$l_banner\" exists and does not contain OS/version info."
   fi
  else
   l_output2="$l_output2 Banner file \"$l_banner\" does not exist."
  fi
 else
  l_output2="$l_output2 sshd Banner is not set or set to none."
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure SSH Server" >> p1
  echo "Ensure sshd Banner is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.1.5" >> p12
 else
  echo "Access Control / Configure SSH Server" >> p1
  echo "Ensure sshd Banner is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.1.5" >> p12
 fi
}

#5.1.6
#Ensure sshd Ciphers are configured.
{
 l_output="" l_output2=""
 l_weak_ciphers="3des-cbc|aes128-cbc|aes192-cbc|aes256-cbc|chacha20-poly1305@openssh.com"
 l_current_ciphers="$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep "$(hostname)" /etc/hosts | awk '{print $1}')" 2>/dev/null | grep -i '^ciphers' | awk '{print $2}')"
 if [ -z "$l_current_ciphers" ]; then
  l_output2="$l_output2 Could not retrieve ciphers from sshd running config."
 else
  l_found_weak=""
  IFS=',' read -ra l_cipher_list <<< "$l_current_ciphers"
  for cipher in "${l_cipher_list[@]}"; do
   if echo "$cipher" | grep -Piq "$l_weak_ciphers"; then
    l_found_weak="$l_found_weak $cipher"
   fi
  done
  if [ -n "$l_found_weak" ]; then
   l_output2="$l_output2 Weak cipher(s) found in sshd config:$l_found_weak"
  else
   l_current_ciphers="${l_current_ciphers//,/;}"
   l_output="$l_output No weak ciphers found. Current ciphers: $l_current_ciphers"
  fi
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure SSH Server" >> p1
  echo "Ensure sshd Ciphers are configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.1.6" >> p12
 else
  echo "Access Control / Configure SSH Server" >> p1
  echo "Ensure sshd Ciphers are configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.1.6" >> p12
 fi
}

#5.1.7
#Ensure sshd ClientAliveInterval and ClientAliveCountMax are configured.
{
 l_output="" l_output2=""
 l_sshd_params="$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep "$(hostname)" /etc/hosts | awk '{print $1}')" 2>/dev/null)"
 l_interval="$(echo "$l_sshd_params" | grep -i '^clientaliveinterval' | awk '{print $2}')"
 if [ -n "$l_interval" ] && [ "$l_interval" -gt 0 ] 2>/dev/null; then
  l_output="$l_output ClientAliveInterval is set to $l_interval (greater than 0)."
 else
  l_output2="$l_output2 ClientAliveInterval is set to \"$l_interval\" - must be greater than 0."
 fi
 l_countmax="$(echo "$l_sshd_params" | grep -i '^clientalivecountmax' | awk '{print $2}')"
 if [ -n "$l_countmax" ] && [ "$l_countmax" -gt 0 ] 2>/dev/null; then
  l_output="$l_output ClientAliveCountMax is set to $l_countmax (greater than 0)."
 else
  l_output2="$l_output2 ClientAliveCountMax is set to \"$l_countmax\" - must be greater than 0."
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure SSH Server" >> p1
  echo "Ensure sshd ClientAliveInterval and ClientAliveCountMax are configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.1.7" >> p12
 else
  echo "Access Control / Configure SSH Server" >> p1
  echo "Ensure sshd ClientAliveInterval and ClientAliveCountMax are configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.1.7" >> p12
 fi
}

#5.1.10
#Ensure sshd HostbasedAuthentication is disabled.
{
 l_output="" l_output2=""
 l_out="$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep "$(hostname)" /etc/hosts | awk '{print $1}')" 2>/dev/null | grep -i '^hostbasedauthentication')"
 if [ "$(echo "$l_out" | awk '{print $2}')" = "no" ]; then
  l_output="$l_output HostbasedAuthentication is set to no in sshd running config."
 else
  l_output2="$l_output2 HostbasedAuthentication is not set to no in sshd running config (found: \"$l_out\")."
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure SSH Server" >> p1
  echo "Ensure sshd HostbasedAuthentication is disabled." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.1.10" >> p12
 else
  echo "Access Control / Configure SSH Server" >> p1
  echo "Ensure sshd HostbasedAuthentication is disabled." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.1.10" >> p12
 fi
}

#5.1.11
#Ensure sshd IgnoreRhosts is enabled.
{
 l_output="" l_output2=""
 l_out="$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep "$(hostname)" /etc/hosts | awk '{print $1}')" 2>/dev/null | grep -i '^ignorerhosts')"
 if [ "$(echo "$l_out" | awk '{print $2}')" = "yes" ]; then
  l_output="$l_output IgnoreRhosts is set to yes in sshd running config."
 else
  l_output2="$l_output2 IgnoreRhosts is not set to yes in sshd running config (found: \"$l_out\")."
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure SSH Server" >> p1
  echo "Ensure sshd IgnoreRhosts is enabled." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.1.11" >> p12
 else
  echo "Access Control / Configure SSH Server" >> p1
  echo "Ensure sshd IgnoreRhosts is enabled." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.1.11" >> p12
 fi
}

#5.1.12
#Ensure sshd KexAlgorithms is configured.
{
 l_output="" l_output2=""
 l_weak_kex="diffie-hellman-group1-sha1|diffie-hellman-group14-sha1|diffie-hellman-group-exchange-sha1"
 l_current_kex="$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep "$(hostname)" /etc/hosts | awk '{print $1}')" 2>/dev/null | grep -i '^kexalgorithms' | awk '{print $2}')"
 if [ -z "$l_current_kex" ]; then
  l_output2="$l_output2 Could not retrieve KexAlgorithms from sshd running config."
 else
  l_found_weak=""
  IFS=',' read -ra l_kex_list <<< "$l_current_kex"
  for kex in "${l_kex_list[@]}"; do
   if echo "$kex" | grep -Piq "$l_weak_kex"; then
    l_found_weak="$l_found_weak $kex"
   fi
  done
  if [ -n "$l_found_weak" ]; then
   l_output2="$l_output2 Weak KexAlgorithm(s) found in sshd config:$l_found_weak"
  else
   l_current_kex="${l_current_kex//,/;}"
   l_output="$l_output No weak KexAlgorithms found. Current KexAlgorithms: $l_current_kex"
  fi
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure SSH Server" >> p1
  echo "Ensure sshd KexAlgorithms is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.1.12" >> p12
 else
  echo "Access Control / Configure SSH Server" >> p1
  echo "Ensure sshd KexAlgorithms is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.1.12" >> p12
 fi
}

#5.1.13
#Ensure sshd LoginGraceTime is configured.
{
 l_output="" l_output2=""
 l_searchloc="/etc/ssh/sshd_config /etc/ssh/sshd_config.d/*.conf"
 l_value="$(sshd -T 2>/dev/null | grep -i '^logingracetime' | awk '{print $2}')"
 if [ -z "$l_value" ]; then
  l_value="$(grep -Pis '^\h*LoginGraceTime\h+' $l_searchloc 2>/dev/null | awk '{print $2}' | tail -1)"
 fi
 if [ -z "$l_value" ]; then
  l_output2="$l_output2 LoginGraceTime is not explicitly configured - must be set between 1 and 60 seconds per CIS."
 elif [ "$l_value" -ge 1 ] && [ "$l_value" -le 60 ] 2>/dev/null; then
  l_output="$l_output LoginGraceTime is set to $l_value (between 1 and 60 seconds - compliant)."
 else
  l_output2="$l_output2 LoginGraceTime is set to \"$l_value\" - must be between 1 and 60 seconds per CIS."
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure SSH Server" >> p1
  echo "Ensure sshd LoginGraceTime is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.1.13" >> p12
 else
  echo "Access Control / Configure SSH Server" >> p1
  echo "Ensure sshd LoginGraceTime is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.1.13" >> p12
 fi
}

#5.1.14
#Ensure sshd LogLevel is configured.
{
 l_output="" l_output2=""
 l_searchloc="/etc/ssh/sshd_config /etc/ssh/sshd_config.d/*.conf"
 l_value="$(sshd -T 2>/dev/null | grep -i '^loglevel' | awk '{print $2}' | tr '[:upper:]' '[:lower:]')"
 if [ -z "$l_value" ]; then
  l_value="$(grep -Pis '^\h*LogLevel\h+' $l_searchloc 2>/dev/null | awk '{print $2}' | tr '[:upper:]' '[:lower:]' | tail -1)"
 fi
 if [ -z "$l_value" ]; then
  l_output="$l_output LogLevel is not explicitly set - default is INFO which is acceptable per CIS."
 elif [ "$l_value" = "verbose" ] || [ "$l_value" = "info" ]; then
  l_output="$l_output LogLevel is set to \"${l_value^^}\" which is acceptable (VERBOSE or INFO required)."
 else
  l_output2="$l_output2 LogLevel is set to \"${l_value^^}\" - must be VERBOSE or INFO."
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure SSH Server" >> p1
  echo "Ensure sshd LogLevel is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.1.14" >> p12
 else
  echo "Access Control / Configure SSH Server" >> p1
  echo "Ensure sshd LogLevel is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.1.14" >> p12
 fi
}

#5.1.15
#Ensure sshd MACs are configured.
{
 l_output="" l_output2=""
 l_weak_macs="hmac-md5|hmac-md5-96|hmac-ripemd160|hmac-sha1-96|umac-64@openssh.com|umac-128@openssh.com|hmac-md5-etm@openssh.com|hmac-md5-96-etm@openssh.com|hmac-ripemd160-etm@openssh.com|hmac-sha1-etm@openssh.com|hmac-sha1-96-etm@openssh.com|umac-64-etm@openssh.com|umac-128-etm@openssh.com"
 l_current_macs="$(sshd -T 2>/dev/null | grep -i '^macs' | awk '{print $2}')"
 if [ -z "$l_current_macs" ]; then
  l_current_macs="$(grep -Pis '^\h*MACs\h+' /etc/ssh/sshd_config /etc/ssh/sshd_config.d/*.conf 2>/dev/null | awk '{print $2}' | tail -1)"
 fi
 if [ -z "$l_current_macs" ]; then
  l_output2="$l_output2 MACs are not explicitly configured - must be set to strong algorithms only per CIS."
 else
  l_found_weak=""
  IFS=',' read -ra l_mac_list <<< "$l_current_macs"
  for mac in "${l_mac_list[@]}"; do
   if echo "$mac" | grep -Piq "$l_weak_macs"; then
    l_found_weak="$l_found_weak $mac"
   fi
  done
  if [ -n "$l_found_weak" ]; then
   l_output2="$l_output2 Weak MAC(s) found in sshd config:$l_found_weak"
  else
   l_current_macs="${l_current_macs//,/;}"
   l_output="$l_output No weak MACs found. Current MACs: $l_current_macs"
  fi
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure SSH Server" >> p1
  echo "Ensure sshd MACs are configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.1.15" >> p12
 else
  echo "Access Control / Configure SSH Server" >> p1
  echo "Ensure sshd MACs are configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.1.15" >> p12
 fi
}

#5.1.16
#Ensure sshd MaxAuthTries is configured.
{
 l_output="" l_output2=""
 l_value="$(sshd -T 2>/dev/null | grep -i '^maxauthtries' | awk '{print $2}')"
 if [ -z "$l_value" ]; then
  l_value="$(grep -Pis '^\h*MaxAuthTries\h+' /etc/ssh/sshd_config /etc/ssh/sshd_config.d/*.conf 2>/dev/null | awk '{print $2}' | tail -1)"
 fi
 if [ -z "$l_value" ]; then
  l_output2="$l_output2 MaxAuthTries is not explicitly configured - must be set to 4 or less per CIS."
 elif [ "$l_value" -ge 1 ] && [ "$l_value" -le 4 ] 2>/dev/null; then
  l_output="$l_output MaxAuthTries is set to $l_value (4 or less - compliant)."
 else
  l_output2="$l_output2 MaxAuthTries is set to \"$l_value\" - must be 4 or less per CIS."
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure SSH Server" >> p1
  echo "Ensure sshd MaxAuthTries is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.1.16" >> p12
 else
  echo "Access Control / Configure SSH Server" >> p1
  echo "Ensure sshd MaxAuthTries is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.1.16" >> p12
 fi
}

#5.1.17
#Ensure sshd MaxSessions is configured.
{
 l_output="" l_output2=""
 l_value="$(sshd -T 2>/dev/null | grep -i '^maxsessions' | awk '{print $2}')"
 if [ -z "$l_value" ]; then
  l_value="$(grep -Pis '^\h*MaxSessions\h+' /etc/ssh/sshd_config /etc/ssh/sshd_config.d/*.conf 2>/dev/null | awk '{print $2}' | tail -1)"
 fi
 if [ -z "$l_value" ]; then
  l_output="$l_output MaxSessions is not explicitly configured - CIS requires 10 or less. No explicit value found but default is acceptable if compliant."
 elif [ "$l_value" -ge 1 ] && [ "$l_value" -le 10 ] 2>/dev/null; then
  l_output="$l_output MaxSessions is set to $l_value (10 or less - compliant)."
 else
  l_output2="$l_output2 MaxSessions is set to \"$l_value\" - must be 10 or less per CIS."
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure SSH Server" >> p1
  echo "Ensure sshd MaxSessions is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.1.17" >> p12
 else
  echo "Access Control / Configure SSH Server" >> p1
  echo "Ensure sshd MaxSessions is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.1.17" >> p12
 fi
}

#5.1.18
#Ensure sshd MaxStartups is configured.
{
 l_output="" l_output2=""
 l_value="$(sshd -T 2>/dev/null | grep -i '^maxstartups' | awk '{print $2}')"
 if [ -z "$l_value" ]; then
  l_value="$(grep -Pis '^\h*MaxStartups\h+' /etc/ssh/sshd_config /etc/ssh/sshd_config.d/*.conf 2>/dev/null | awk '{print $2}' | tail -1)"
 fi
 if [ -z "$l_value" ]; then
  l_output2="$l_output2 MaxStartups is not explicitly configured - must be set to 10:30:60 or more restrictive."
 else
  l_start="$(echo "$l_value" | cut -d: -f1)"
  l_rate="$(echo "$l_value" | cut -d: -f2)"
  l_full="$(echo "$l_value" | cut -d: -f3)"
  if [ -n "$l_start" ] && [ -n "$l_rate" ] && [ -n "$l_full" ]; then
   if [ "$l_start" -le 10 ] && [ "$l_rate" -le 30 ] && [ "$l_full" -le 60 ] 2>/dev/null; then
    l_output="$l_output MaxStartups is set to $l_value (compliant: start<=10, rate<=30, full<=60)."
   else
    l_output2="$l_output2 MaxStartups is set to \"$l_value\" - must be 10:30:60 or more restrictive."
   fi
  else
   if [ "$l_value" -le 10 ] 2>/dev/null; then
    l_output="$l_output MaxStartups is set to $l_value (compliant)."
   else
    l_output2="$l_output2 MaxStartups is set to \"$l_value\"."
   fi
  fi
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure SSH Server" >> p1
  echo "Ensure sshd MaxStartups is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.1.18" >> p12
 else
  echo "Access Control / Configure SSH Server" >> p1
  echo "Ensure sshd MaxStartups is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.1.18" >> p12
 fi
}
#5.1.19
#Ensure sshd PermitEmptyPasswords is disabled.
{
 l_output="" l_output2=""
 l_value="$(sshd -T 2>/dev/null | grep -i '^permitemptypasswords' | awk '{print $2}' | tr '[:upper:]' '[:lower:]')"
 if [ -z "$l_value" ]; then
  l_value="$(grep -Pis '^\h*PermitEmptyPasswords\h+' /etc/ssh/sshd_config /etc/ssh/sshd_config.d/*.conf 2>/dev/null | awk '{print $2}' | tr '[:upper:]' '[:lower:]' | tail -1)"
 fi
 if [ -z "$l_value" ]; then
  l_output="$l_output PermitEmptyPasswords is not explicitly configured - default is no which is compliant per CIS."
 elif [ "$l_value" = "no" ]; then
  l_output="$l_output PermitEmptyPasswords is set to no (compliant)."
 else
  l_output2="$l_output2 PermitEmptyPasswords is set to \"$l_value\" - must be set to no per CIS."
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure SSH Server" >> p1
  echo "Ensure sshd PermitEmptyPasswords is disabled." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.1.19" >> p12
 else
  echo "Access Control / Configure SSH Server" >> p1
  echo "Ensure sshd PermitEmptyPasswords is disabled." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.1.19" >> p12
 fi
}

#5.1.20
#Ensure sshd PermitRootLogin is disabled.
{
 l_output="" l_output2=""
 l_value="$(sshd -T 2>/dev/null | grep -i '^permitrootlogin' | awk '{print $2}' | tr '[:upper:]' '[:lower:]')"
 if [ -z "$l_value" ]; then
  l_value="$(grep -Pis '^\h*PermitRootLogin\h+' /etc/ssh/sshd_config /etc/ssh/sshd_config.d/*.conf 2>/dev/null | awk '{print $2}' | tr '[:upper:]' '[:lower:]' | tail -1)"
 fi
 if [ -z "$l_value" ]; then
  l_output="$l_output PermitRootLogin is not explicitly configured."
 elif [ "$l_value" = "no" ] || [ "$l_value" = "prohibit-password" ] || [ "$l_value" = "without-password" ] || [ "$l_value" = "forced-commands-only" ]; then
  l_output="$l_output PermitRootLogin is set to \"$l_value\"."
 else
  l_output2="$l_output2 PermitRootLogin is set to \"$l_value\"."
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure SSH Server" >> p1
  echo "Ensure sshd PermitRootLogin is disabled." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.1.20" >> p12
 else
  echo "Access Control / Configure SSH Server" >> p1
  echo "Ensure sshd PermitRootLogin is disabled." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.1.20" >> p12
 fi
}

#5.1.21
#Ensure sshd PermitUserEnvironment is disabled.
{
 l_output="" l_output2=""
 l_value="$(sshd -T 2>/dev/null | grep -i '^permituserenvironment' | awk '{print $2}' | tr '[:upper:]' '[:lower:]')"
 if [ -z "$l_value" ]; then
  l_value="$(grep -Pis '^\h*PermitUserEnvironment\h+' /etc/ssh/sshd_config /etc/ssh/sshd_config.d/*.conf 2>/dev/null | awk '{print $2}' | tr '[:upper:]' '[:lower:]' | tail -1)"
 fi
 if [ -z "$l_value" ]; then
  l_output="$l_output PermitUserEnvironment is not explicitly configured - default is no which is compliant per CIS."
 elif [ "$l_value" = "no" ]; then
  l_output="$l_output PermitUserEnvironment is set to no (compliant)."
 else
  l_output2="$l_output2 PermitUserEnvironment is set to \"$l_value\" - must be set to no per CIS."
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure SSH Server" >> p1
  echo "Ensure sshd PermitUserEnvironment is disabled." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.1.21" >> p12
 else
  echo "Access Control / Configure SSH Server" >> p1
  echo "Ensure sshd PermitUserEnvironment is disabled." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.1.21" >> p12
 fi
}

#5.1.22
#Ensure sshd UsePAM is enabled.
{
 l_output="" l_output2=""
 l_value="$(sshd -T 2>/dev/null | grep -i '^usepam' | awk '{print $2}' | tr '[:upper:]' '[:lower:]')"
 if [ -z "$l_value" ]; then
  l_value="$(grep -Pis '^\h*UsePAM\h+' /etc/ssh/sshd_config /etc/ssh/sshd_config.d/*.conf 2>/dev/null | awk '{print $2}' | tr '[:upper:]' '[:lower:]' | tail -1)"
 fi
 if [ -z "$l_value" ]; then
  l_output="$l_output UsePAM is not explicitly configured - default is yes which is compliant per CIS."
 elif [ "$l_value" = "yes" ]; then
  l_output="$l_output UsePAM is set to yes (compliant)."
 else
  l_output2="$l_output2 UsePAM is set to \"$l_value\" - must be set to yes per CIS."
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure SSH Server" >> p1
  echo "Ensure sshd UsePAM is enabled." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.1.22" >> p12
 else
  echo "Access Control / Configure SSH Server" >> p1
  echo "Ensure sshd UsePAM is enabled." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.1.22" >> p12
 fi
}

#############################################################################################################
#5.2.1
#Ensure sudo is installed.

{
 l_output="" l_output2=""
 l_installed=false
 for l_pkg in "sudo" "sudo-ldap"; do
  if dpkg-query -W -f='${Status}' "$l_pkg" 2>/dev/null | grep -q "install ok installed"; then
   l_installed=true
   l_output="$l_pkg is installed."
   break
  fi
 done
 if $l_installed; then
  echo "Access Control / Configure privilege escalation" >>p1
  echo "Ensure sudo is installed." >>p2
  echo "$l_output" >>p3
  echo "Yes" >>p4
  echo "5.2.1" >>p12
 else
  echo "Access Control / Configure privilege escalation" >>p1
  echo "Ensure sudo is installed." >>p2
  echo "Neither sudo nor sudo-ldap package is installed." >>p3
  echo "No" >>p4
  echo "5.2.1" >>p12
 fi
}

#5.2.2
#Ensure sudo commands use pty.

SUDOERS_FILE="/etc/sudoers"
# Define the pattern to search for
PATTERN='^\h*Defaults\h*use_pty\h*(#.*)?$'
# Use grep to check if the pattern is in the file
if grep -rPi "$PATTERN" "$SUDOERS_FILE" > /dev/null; then
	echo "Access Control / Configure privilege escalation" >>p1
	echo "Ensure sudo commands use pty." >>p2
	echo "sudo commands use pty." >>p3
	echo "Yes" >>p4
	echo "5.2.2" >>p12
else
	echo "Access Control / Configure privilege escalation" >>p1
	echo "Ensure sudo commands use pty." >>p2
	echo "sudo commands NOT configured to use pty." >>p3
	echo "No" >>p4
	echo "5.2.2" >>p12
fi

#5.2.3
#Ensure sudo log file exists.

SUDOERS_FILE1="/etc/sudoers"
# Define the pattern to search for
PATTERN1="^\h*Defaults\h+([^#]+,\h*)?logfile\h*=\h*(\"|\')?\H+(\"|\')?(,\h*\H+\h*)*\h*(#.*)?$"
# Use grep to check if the pattern is in the file
if grep -rPsi "$PATTERN1" "$SUDOERS_FILE1" > /dev/null; then
	echo "Access Control / Configure privilege escalation" >>p1
	echo "Ensure sudo log file exists." >>p2
	echo "sudo log file exists." >>p3
	echo "Yes" >>p4
	echo "5.2.3" >>p12
else
	echo "Access Control / Configure privilege escalation" >>p1
	echo "Ensure sudo log file exists." >>p2
	echo "sudo log file NOT configured." >>p3
	echo "No" >>p4
	echo "5.2.3" >>p12
fi

#5.2.5
#Ensure re-authentication for privilege escalation is not disabled globally.
SUDOERS_FILE2="/etc/sudoers"
# Define the pattern to search for
PATTERN2="^[^#].*\!authenticate"
# Use grep to check if the pattern is in the file
if grep -r "$PATTERN2" "$SUDOERS_FILE2" > /dev/null; then
	echo "Access Control / Configure privilege escalation" >>p1
	echo "Ensure re-authentication for privilege escalation is not disabled globally." >>p2
	echo "re-authentication for privilege escalation is not disabled globally." >>p3
	echo "No" >>p4
	echo "5.2.5" >>p12
else
	echo "Access Control / Configure privilege escalation" >>p1
	echo "Ensure re-authentication for privilege escalation is not disabled globally." >>p2
	echo "re-authentication for privilege escalation is disabled globally." >>p3
	echo "Yes" >>p4
	echo "5.2.5" >>p12
fi

#5.2.6
#Ensure sudo timestamp_timeout is configured.
{
 l_output="" l_output2=""
 l_value="$(grep -roPis 'timestamp_timeout=\K[-0-9]+' /etc/sudoers /etc/sudoers.d/* 2>/dev/null | tail -1)"
 if [ -z "$l_value" ]; then
  l_default="$(sudo -V 2>/dev/null | grep -Po 'Authentication timestamp timeout:\s*\K[0-9.]+' | head -1)"
  if [ -z "$l_default" ]; then
   l_output="$l_output timestamp_timeout is not explicitly configured - default is 5 minutes which is compliant per CIS."
  elif [ "$(echo "$l_default <= 15" | bc 2>/dev/null)" = "1" ] && [ "$(echo "$l_default >= 0" | bc 2>/dev/null)" = "1" ]; then
   l_output="$l_output timestamp_timeout is not explicitly configured - system default is $l_default minutes which is compliant per CIS."
  else
   l_output2="$l_output2 timestamp_timeout is not explicitly configured - system default is $l_default minutes which exceeds 15 minutes per CIS."
  fi
 elif [ "$l_value" -lt 0 ] 2>/dev/null; then
  l_output2="$l_output2 timestamp_timeout is set to $l_value (negative/disabled) - must be between 0 and 15 per CIS."
 elif [ "$l_value" -gt 15 ] 2>/dev/null; then
  l_output2="$l_output2 timestamp_timeout is set to $l_value - must be 15 minutes or less per CIS."
 else
  l_output="$l_output timestamp_timeout is set to $l_value minutes (compliant)."
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure privilege escalation" >> p1
  echo "Ensure sudo timestamp_timeout is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.2.6" >> p12
 else
  echo "Access Control / Configure privilege escalation" >> p1
  echo "Ensure sudo timestamp_timeout is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.2.6" >> p12
 fi
}

#5.2.7
#Ensure access to the su command is restricted.

FILE="/etc/pam.d/su"
# Define the pattern to search for
PATTERN='^\h*auth\h+(?:required|requisite)\h+pam_wheel\.so\h+(?:[^#\n\r]+\h+)?((?!\2)(use_uid\b|group=\H+\b))\h+(?:[^#\n\r]+\h+)?((?!\1)(use_uid\b|group=\H+\b))(\h+.*)?$'
# Use grep to check the file
if grep -Pi "$PATTERN" "$FILE"; then
	echo "Access Control / Configure privilege escalation" >>p1
	echo "Ensure access to the su command is restricted." >>p2
	echo "access to the su command is restricted." >>p3
	echo "Yes" >>p4
	echo "5.2.7" >>p12
else
	echo "Access Control / Configure privilege escalation" >>p1
	echo "Ensure access to the su command is restricted." >>p2
	echo "access to the su command is NOT restricted." >>p3
	echo "No" >>p4
	echo "5.2.7" >>p12
fi

################################################################################################################

#5.3.1.1
#Ensure latest version of pam is installed.
{
 l_output="" l_output2=""
 if dpkg-query -s libpam-runtime &>/dev/null 2>&1; then
  l_installed_ver="$(dpkg-query -W -f='${Version}' libpam-runtime 2>/dev/null)"
  l_upgradable="$(apt list --upgradable 2>/dev/null | grep -P '^libpam-runtime\b')"
  if [ -n "$l_upgradable" ]; then
   l_output2="$l_output2 libpam-runtime is installed (version: $l_installed_ver) but a newer version is available. Run 'apt install libpam-runtime' to upgrade."
  else
   l_output="$l_output libpam-runtime is installed and at the latest available version (version: $l_installed_ver)."
  fi
 else
  l_output2="$l_output2 libpam-runtime is not installed."
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure latest version of pam is installed." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.3.1.1" >> p12
 else
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure latest version of pam is installed." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.3.1.1" >> p12
 fi
}

#5.3.1.2
#Ensure latest version of libpam-modules is installed.
{
 l_output="" l_output2=""
 if dpkg-query -s libpam-modules &>/dev/null 2>&1; then
  l_installed_ver="$(dpkg-query -W -f='${Version}' libpam-modules 2>/dev/null)"
  l_upgradable="$(apt list --upgradable 2>/dev/null | grep -P '^libpam-modules\b')"
  if [ -n "$l_upgradable" ]; then
   l_output2="$l_output2 libpam-modules is installed (version: $l_installed_ver) but a newer version is available. Run 'apt install libpam-modules' to upgrade."
  else
   l_output="$l_output libpam-modules is installed and at the latest available version (version: $l_installed_ver)."
  fi
 else
  l_output2="$l_output2 libpam-modules is not installed."
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure latest version of libpam-modules is installed." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.3.1.2" >> p12
 else
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure latest version of libpam-modules is installed." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.3.1.2" >> p12
 fi
}

#5.3.1.3
#Ensure latest version of libpam-pwquality is installed.
{
 l_output="" l_output2=""
 if dpkg-query -s libpam-pwquality &>/dev/null 2>&1; then
  l_installed_ver="$(dpkg-query -W -f='${Version}' libpam-pwquality 2>/dev/null)"
  l_upgradable="$(apt list --upgradable 2>/dev/null | grep -P '^libpam-pwquality\b')"
  if [ -n "$l_upgradable" ]; then
   l_output2="$l_output2 libpam-pwquality is installed (version: $l_installed_ver) but a newer version is available. Run 'apt install libpam-pwquality' to upgrade."
  else
   l_output="$l_output libpam-pwquality is installed and at the latest available version (version: $l_installed_ver)."
  fi
 else
  l_output2="$l_output2 libpam-pwquality is not installed."
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure latest version of libpam-pwquality is installed." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.3.1.3" >> p12
 else
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure latest version of libpam-pwquality is installed." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.3.1.3" >> p12
 fi
}

#################################################################################################################

#5.3.2.1
#Ensure pam_unix module is enabled.
{
 l_output="" l_output2=""
 l_pam_files=(
  "/etc/pam.d/common-account"
  "/etc/pam.d/common-auth"
  "/etc/pam.d/common-password"
  "/etc/pam.d/common-session"
  "/etc/pam.d/common-session-noninteractive"
 )
 for l_file in "${l_pam_files[@]}"; do
  if [ -f "$l_file" ]; then
   if grep -PH -- '\bpam_unix\.so\b' "$l_file" 2>/dev/null | grep -qv '^\s*#'; then
    l_output="$l_output pam_unix.so is enabled in $l_file."
   else
    l_output2="$l_output2 pam_unix.so is NOT enabled in $l_file."
   fi
  else
   l_output2="$l_output2 PAM file $l_file does not exist."
  fi
 done
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure pam_unix module is enabled." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.3.2.1" >> p12
 else
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure pam_unix module is enabled." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.3.2.1" >> p12
 fi
}

#5.3.2.2
#Ensure pam_faillock module is enabled.
{
 l_output="" l_output2=""
 if grep -PH -- '^\h*auth\h+requisite\h+pam_faillock\.so\h+preauth' /etc/pam.d/common-auth 2>/dev/null | grep -qv '^\s*#'; then
  l_output="$l_output pam_faillock.so preauth (requisite) is configured in /etc/pam.d/common-auth."
 else
  l_output2="$l_output2 pam_faillock.so preauth (requisite) is NOT configured in /etc/pam.d/common-auth."
 fi
 if grep -PH -- '^\h*auth\h+\[default=die\]\h+pam_faillock\.so\h+authfail' /etc/pam.d/common-auth 2>/dev/null | grep -qv '^\s*#'; then
  l_output="$l_output pam_faillock.so authfail ([default=die]) is configured in /etc/pam.d/common-auth."
 else
  l_output2="$l_output2 pam_faillock.so authfail ([default=die]) is NOT configured in /etc/pam.d/common-auth."
 fi
 if grep -PH -- '^\h*account\h+required\h+pam_faillock\.so' /etc/pam.d/common-account 2>/dev/null | grep -qv '^\s*#'; then
  l_output="$l_output pam_faillock.so (required) is configured in /etc/pam.d/common-account."
 else
  l_output2="$l_output2 pam_faillock.so (required) is NOT configured in /etc/pam.d/common-account."
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure pam_faillock module is enabled." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.3.2.2" >> p12
 else
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure pam_faillock module is enabled." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.3.2.2" >> p12
 fi
}

#5.3.2.3
#Ensure pam_pwquality module is enabled.
{
 l_output="" l_output2=""
 l_file="/etc/pam.d/common-password"
 if [ -f "$l_file" ]; then
  l_match="$(grep -P '^\h*password\h+requisite\h+pam_pwquality\.so\b' "$l_file" 2>/dev/null | grep -v '^\s*#')"
  if [ -n "$l_match" ]; then
   l_retry="$(echo "$l_match" | grep -Po 'retry=\K[0-9]+')"
   if [ -z "$l_retry" ] || [ "$l_retry" -le 3 ] 2>/dev/null; then
    l_output="$l_output pam_pwquality.so is enabled as requisite in $l_file${l_retry:+ with retry=$l_retry}."
   else
    l_output2="$l_output2 pam_pwquality.so retry=$l_retry in $l_file - retry must be 3 or less per CIS."
   fi
  else
   l_output2="$l_output2 pam_pwquality.so (requisite) is NOT configured in $l_file."
  fi
 else
  l_output2="$l_output2 PAM file $l_file does not exist."
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure pam_pwquality module is enabled." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.3.2.3" >> p12
 else
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure pam_pwquality module is enabled." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.3.2.3" >> p12
 fi
}

#5.3.2.4
#Ensure pam_pwhistory module is enabled.
{
 l_output="" l_output2=""
 l_file="/etc/pam.d/common-password"
 if [ -f "$l_file" ]; then
  l_match="$(grep -P '^\h*password\h+requisite\h+pam_pwhistory\.so\b' "$l_file" 2>/dev/null | grep -v '^\s*#')"
  if [ -n "$l_match" ]; then
   l_remember="$(echo "$l_match" | grep -Po 'remember=\K[0-9]+')"
   l_enforce="$(echo "$l_match" | grep -o 'enforce_for_root')"
   l_authtok="$(echo "$l_match" | grep -o 'use_authtok')"
   l_fail=0
   if [ -z "$l_remember" ] || [ "$l_remember" -lt 24 ] 2>/dev/null; then
    l_output2="$l_output2 pam_pwhistory.so remember value is \"${l_remember:-not set}\" - must be 24 or more per CIS."
    l_fail=1
   fi
   [ -z "$l_enforce" ] && l_output2="$l_output2 pam_pwhistory.so enforce_for_root is not set in $l_file." && l_fail=1
   [ -z "$l_authtok" ] && l_output2="$l_output2 pam_pwhistory.so use_authtok is not set in $l_file." && l_fail=1
   [ "$l_fail" -eq 0 ] && l_output="$l_output pam_pwhistory.so is enabled in $l_file with remember=$l_remember enforce_for_root use_authtok (compliant)."
  else
   l_output2="$l_output2 pam_pwhistory.so (requisite) is NOT configured in $l_file."
  fi
 else
  l_output2="$l_output2 PAM file $l_file does not exist."
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure pam_pwhistory module is enabled." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.3.2.4" >> p12
 else
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure pam_pwhistory module is enabled." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.3.2.4" >> p12
 fi
}

#################################################################################################################
#5.3.3.1.1
#Ensure password failed attempts lockout is configured.
{
 l_output="" l_output2=""
 l_faillock_conf="/etc/security/faillock.conf"
 if [ -f "$l_faillock_conf" ]; then
  l_deny="$(grep -Pi '^\h*deny\h*=\h*[0-9]+' "$l_faillock_conf" 2>/dev/null | awk -F= '{print $2}' | tr -d ' ' | tail -1)"
  if [ -z "$l_deny" ]; then
   l_output="$l_output deny is not explicitly set in $l_faillock_conf - default is 3 which is compliant per CIS."
  elif [ "$l_deny" -ge 1 ] && [ "$l_deny" -le 5 ] 2>/dev/null; then
   l_output="$l_output deny is set to $l_deny in $l_faillock_conf (5 or less - compliant)."
  else
   l_output2="$l_output2 deny is set to $l_deny in $l_faillock_conf - must be 5 or less per CIS."
  fi
 else
  l_output2="$l_output2 $l_faillock_conf does not exist - deny must be configured."
 fi
 l_pam_deny="$(grep -Pi '^\h*auth\h+(requisite|required|sufficient)\h+pam_faillock\.so\h+([^\n\r]+\h+)?deny=[6-9][0-9]*\b' /etc/pam.d/common-auth 2>/dev/null | grep -v '^\s*#')"
 if [ -n "$l_pam_deny" ]; then
  l_output2="$l_output2 pam_faillock.so has deny value greater than 5 in /etc/pam.d/common-auth: $l_pam_deny"
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure password failed attempts lockout is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.3.3.1.1" >> p12
 else
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure password failed attempts lockout is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.3.3.1.1" >> p12
 fi
}

#5.3.3.1.2
#Ensure password unlock time is configured.
{
 l_output="" l_output2=""
 l_faillock_conf="/etc/security/faillock.conf"
 if [ -f "$l_faillock_conf" ]; then
  l_unlock="$(grep -Pi '^\h*unlock_time\h*=\h*[0-9]+' "$l_faillock_conf" 2>/dev/null | awk -F= '{print $2}' | tr -d ' ' | tail -1)"
  if [ -z "$l_unlock" ]; then
   l_output2="$l_output2 unlock_time is not explicitly configured in $l_faillock_conf - default is 600 seconds which does not meet CIS requirement of 0 (never) or 900 or more seconds."
  elif [ "$l_unlock" -eq 0 ] 2>/dev/null; then
   l_output="$l_output unlock_time is set to 0 (never auto-unlock - compliant)."
  elif [ "$l_unlock" -ge 900 ] 2>/dev/null; then
   l_output="$l_output unlock_time is set to $l_unlock seconds (900 or more - compliant)."
  else
   l_output2="$l_output2 unlock_time is set to $l_unlock seconds - must be 0 (never) or 900 or more seconds per CIS."
  fi
 else
  l_output2="$l_output2 $l_faillock_conf does not exist - unlock_time must be configured."
 fi
 l_pam_unlock="$(grep -Pi '^\h*auth\h+(requisite|required|sufficient)\h+pam_faillock\.so\h+([^\n\r]+\h+)?unlock_time\h*=\h*([1-9][0-9]{0,2}|[1-8][0-9]{2})\b' /etc/pam.d/common-auth 2>/dev/null | grep -v '^\s*#')"
 if [ -n "$l_pam_unlock" ]; then
  l_output2="$l_output2 pam_faillock.so has non-compliant unlock_time in /etc/pam.d/common-auth: $l_pam_unlock"
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure password unlock time is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.3.3.1.2" >> p12
 else
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure password unlock time is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.3.3.1.2" >> p12
 fi
}
##############################################################################################################

#5.3.3.2.1
#Ensure password number of changed characters is configured.
{
 l_output="" l_output2=""
 l_searchloc="/etc/security/pwquality.conf /etc/security/pwquality.conf.d/*.conf"
 l_value="$(grep -Psi '^\h*difok\h*=\h*[0-9]+' $l_searchloc 2>/dev/null | awk -F= '{print $2}' | tr -d ' ' | tail -1)"
 l_pam_difok="$(grep -Psi '^\h*password\h+(requisite|required|sufficient)\h+pam_pwquality\.so\h+([^\n\r]+\h+)?difok\h*=\h*[01]\b' /etc/pam.d/common-password 2>/dev/null | grep -v '^\s*#')"
 if [ -z "$l_value" ]; then
  l_output2="$l_output2 difok is not explicitly configured (default: 1). Required: 2 or more."
 elif [ "$l_value" -ge 2 ] 2>/dev/null; then
  l_output="$l_output difok is set to $l_value (compliant)."
 else
  l_output2="$l_output2 difok is set to $l_value. Required: 2 or more."
 fi
 if [ -n "$l_pam_difok" ]; then
  l_output2="$l_output2 Non-compliant difok override found in /etc/pam.d/common-password: $l_pam_difok"
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure password number of changed characters is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.3.3.2.1" >> p12
 else
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure password number of changed characters is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.3.3.2.1" >> p12
 fi
}

#5.3.3.2.2
#Ensure minimum password length is configured.
{
 l_output="" l_output2=""
 l_searchloc="/etc/security/pwquality.conf /etc/security/pwquality.conf.d/*.conf"
 l_value="$(grep -Psi '^\h*minlen\h*=\h*[0-9]+' $l_searchloc 2>/dev/null | awk -F= '{print $2}' | tr -d ' ' | tail -1)"
 l_pam_minlen="$(grep -Psi '^\h*password\h+(requisite|required|sufficient)\h+pam_pwquality\.so\h+([^\n\r]+\h+)?minlen\h*=\h*([0-9]|1[0-3])\b' /etc/pam.d/common-password /etc/pam.d/system-auth 2>/dev/null | grep -v '^\s*#')"
 if [ -z "$l_value" ]; then
  l_output2="$l_output2 minlen is not explicitly configured (default: 8). Required: 14 or more."
 elif [ "$l_value" -ge 14 ] 2>/dev/null; then
  l_output="$l_output minlen is set to $l_value (compliant)."
 else
  l_output2="$l_output2 minlen is set to $l_value. Required: 14 or more."
 fi
 if [ -n "$l_pam_minlen" ]; then
  l_output2="$l_output2 Non-compliant minlen override found in PAM files: $l_pam_minlen"
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure minimum password length is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.3.3.2.2" >> p12
 else
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure minimum password length is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.3.3.2.2" >> p12
 fi
}


#5.3.3.2.4
#Ensure password same consecutive characters is configured.
{
 l_output="" l_output2=""
 l_searchloc="/etc/security/pwquality.conf /etc/security/pwquality.conf.d/*.conf"
 l_value="$(grep -Psi '^\h*maxrepeat\h*=\h*[0-9]+' $l_searchloc 2>/dev/null | awk -F= '{print $2}' | tr -d ' ' | tail -1)"
 l_pam_maxrepeat="$(grep -Psi '^\h*password\h+(requisite|required|sufficient)\h+pam_pwquality\.so\h+([^\n\r]+\h+)?maxrepeat\h*=\h*(0|[4-9]|[1-9][0-9]+)\b' /etc/pam.d/common-password 2>/dev/null | grep -v '^\s*#')"
 if [ -z "$l_value" ]; then
  l_output2="$l_output2 maxrepeat is not configured (default: 0 = disabled). Required: 1-3."
 elif [ "$l_value" -eq 0 ] 2>/dev/null; then
  l_output2="$l_output2 maxrepeat is set to 0 (disabled). Required: 1-3."
 elif [ "$l_value" -le 3 ] 2>/dev/null; then
  l_output="$l_output maxrepeat is set to $l_value (compliant)."
 else
  l_output2="$l_output2 maxrepeat is set to $l_value. Required: 3 or less, not 0."
 fi
 if [ -n "$l_pam_maxrepeat" ]; then
  l_output2="$l_output2 Non-compliant maxrepeat override found in PAM: $l_pam_maxrepeat"
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure password same consecutive characters is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.3.3.2.4" >> p12
 else
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure password same consecutive characters is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.3.3.2.4" >> p12
 fi
}

#5.3.3.2.5
#Ensure password maximum sequential characters is configured.
{
 l_output="" l_output2=""
 l_searchloc="/etc/security/pwquality.conf /etc/security/pwquality.conf.d/*.conf"
 l_value="$(grep -Psi '^\h*maxsequence\h*=\h*[0-9]+' $l_searchloc 2>/dev/null | awk -F= '{print $2}' | tr -d ' ' | tail -1)"
 l_pam_maxseq="$(grep -Psi '^\h*password\h+(requisite|required|sufficient)\h+pam_pwquality\.so\h+([^\n\r]+\h+)?maxsequence\h*=\h*(0|[4-9]|[1-9][0-9]+)\b' /etc/pam.d/common-password 2>/dev/null | grep -v '^\s*#')"
 if [ -z "$l_value" ]; then
  l_output2="$l_output2 maxsequence is not configured (default: 0 = disabled). Required: 1-3."
 elif [ "$l_value" -eq 0 ] 2>/dev/null; then
  l_output2="$l_output2 maxsequence is set to 0 (disabled). Required: 1-3."
 elif [ "$l_value" -le 3 ] 2>/dev/null; then
  l_output="$l_output maxsequence is set to $l_value (compliant)."
 else
  l_output2="$l_output2 maxsequence is set to $l_value. Required: 3 or less, not 0."
 fi
 if [ -n "$l_pam_maxseq" ]; then
  l_output2="$l_output2 Non-compliant maxsequence override found in PAM: $l_pam_maxseq"
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure password maximum sequential characters is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.3.3.2.5" >> p12
 else
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure password maximum sequential characters is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.3.3.2.5" >> p12
 fi
}

#5.3.3.2.6
#Ensure password dictionary check is enabled.
{
 l_output="" l_output2=""
 l_searchloc="/etc/security/pwquality.conf /etc/security/pwquality.conf.d/*.conf"
 l_value="$(grep -Psi '^\h*dictcheck\h*=\h*[0-9]+' $l_searchloc 2>/dev/null | awk -F= '{print $2}' | tr -d ' ' | tail -1)"
 if [ -z "$l_value" ]; then
  l_output="dictcheck is not explicitly configured (default: 1 = enabled - compliant)."
 elif [ "$l_value" = "1" ]; then
  l_output="dictcheck is set to 1 (enabled - compliant)."
 else
  l_output2="dictcheck is set to $l_value. Required: 1 (enabled)."
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure password dictionary check is enabled." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.3.3.2.6" >> p12
 else
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure password dictionary check is enabled." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.3.3.2.6" >> p12
 fi
}

#5.3.3.2.7
#Ensure password quality checking is enforced.
{
 l_output="" l_output2=""
 l_searchloc="/etc/security/pwquality.conf /etc/security/pwquality.conf.d/*.conf"
 l_value="$(grep -Psi '^\h*enforcing\h*=\h*[0-9]+' $l_searchloc 2>/dev/null | awk -F= '{print $2}' | tr -d ' ' | tail -1)"
 if [ -z "$l_value" ]; then
  l_output="enforcing is not explicitly configured (default: 1 = enabled - compliant)."
 elif [ "$l_value" = "1" ]; then
  l_output="enforcing is set to 1 (enabled - compliant)."
 else
  l_output2="enforcing is set to $l_value. Required: 1 (enabled)."
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure password quality checking is enforced." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.3.3.2.7" >> p12
 else
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure password quality checking is enforced." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.3.3.2.7" >> p12
 fi
}

#5.3.3.2.8
#Ensure password quality is enforced for the root user.
{
 l_output="" l_output2=""
 l_searchloc="/etc/security/pwquality.conf /etc/security/pwquality.conf.d/*.conf"
 l_enforce_root="$(grep -Psi '^\h*enforce_for_root\b' $l_searchloc 2>/dev/null)"
 if [ -n "$l_enforce_root" ]; then
  l_output="$l_output enforce_for_root is configured in pwquality config: $l_enforce_root"
 else
  l_output2="$l_output2 enforce_for_root is not configured in pwquality config. Required: enforce_for_root must be set."
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure password quality is enforced for the root user." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.3.3.2.8" >> p12
 else
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure password quality is enforced for the root user." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.3.3.2.8" >> p12
 fi
}

###############################################################################################################

#5.3.3.3.1
#Ensure password history remember is configured.
{
 l_output="" l_output2=""
 l_file="/etc/pam.d/common-password"
 l_remember="$(grep -Psi '^\h*password\h+[^\n\r]+\h+pam_pwhistory\.so\h+([^\n\r]+\h+)?remember=\d+' "$l_file" 2>/dev/null | grep -v '^\s*#' | grep -Po 'remember=\K[0-9]+' | tail -1)"
 if [ -z "$l_remember" ]; then
  l_output2="$l_output2 remember is not configured in pam_pwhistory line in $l_file. Required: 24 or more."
 elif [ "$l_remember" -ge 24 ] 2>/dev/null; then
  l_output="$l_output remember is set to $l_remember (compliant)."
 else
  l_output2="$l_output2 remember is set to $l_remember. Required: 24 or more."
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure password history remember is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.3.3.3.1" >> p12
 else
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure password history remember is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.3.3.3.1" >> p12
 fi
}

#5.3.3.3.2
#Ensure password history is enforced for the root user.
{
 l_output="" l_output2=""
 l_file="/etc/pam.d/common-password"
 l_enforce="$(grep -Psi '^\h*password\h+[^\n\r]+\h+pam_pwhistory\.so\h+([^\n\r]+\h+)?enforce_for_root\b' "$l_file" 2>/dev/null | grep -v '^\s*#')"
 if [ -n "$l_enforce" ]; then
  l_output="$l_output enforce_for_root is set on pam_pwhistory line in $l_file (compliant)."
 else
  l_output2="$l_output2 enforce_for_root is not set on pam_pwhistory line in $l_file. Required: enforce_for_root must be present."
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure password history is enforced for the root user." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.3.3.3.2" >> p12
 else
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure password history is enforced for the root user." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.3.3.3.2" >> p12
 fi
}

#5.3.3.3.3
#Ensure pam_pwhistory includes use_authtok.
{
 l_output="" l_output2=""
 l_file="/etc/pam.d/common-password"
 l_authtok="$(grep -Psi '^\h*password\h+[^\n\r]+\h+pam_pwhistory\.so\h+([^\n\r]+\h+)?use_authtok\b' "$l_file" 2>/dev/null | grep -v '^\s*#')"
 if [ -n "$l_authtok" ]; then
  l_output="$l_output use_authtok is set on pam_pwhistory line in $l_file (compliant)."
 else
  l_output2="$l_output2 use_authtok is not set on pam_pwhistory line in $l_file. Required: use_authtok must be present."
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure pam_pwhistory includes use_authtok." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.3.3.3.3" >> p12
 else
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure pam_pwhistory includes use_authtok." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.3.3.3.3" >> p12
 fi
}

#############################################################################################################

#5.3.3.4.1
#Ensure pam_unix module does not include nullok

{
 l_output="$(grep -Pi 'pam_unix\.so' /etc/pam.d/common-auth /etc/pam.d/common-account 2>/dev/null)"
 l_nullok="$(echo "$l_output" | grep -Pi '\bnullok\b')"

 echo "Access Control / Configure PAM" >> p1
 echo "Ensure pam_unix module does not include nullok." >> p2

 if [ -z "$l_nullok" ] && [ -n "$l_output" ]; then
  echo "Compliant: pam_unix.so does not include nullok." >> p3
  echo "Yes" >> p4
 else
  echo "Non-compliant: pam_unix.so includes nullok option." >> p3
  echo "No" >> p4
 fi

 echo "5.3.3.4.1" >> p12
}

#5.3.3.4.2
#Ensure pam_unix does not include remember.
{
 l_output="" l_output2=""
 l_pam_files=(
  "/etc/pam.d/common-password"
  "/etc/pam.d/common-auth"
  "/etc/pam.d/common-account"
  "/etc/pam.d/common-session"
  "/etc/pam.d/common-session-noninteractive"
 )
 for l_file in "${l_pam_files[@]}"; do
  if [ -f "$l_file" ]; then
   l_remember="$(grep -PHs -- '^\h*[^#\n\r]+\h+pam_unix\.so\h+([^\n\r]+\h+)?remember=\d+\b' "$l_file" 2>/dev/null | grep -v '^\s*#')"
   if [ -n "$l_remember" ]; then
    l_output2="$l_output2 remember= found on pam_unix.so line in $l_file: $l_remember"
   fi
  fi
 done
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure pam_unix does not include remember." >> p2
  echo "pam_unix.so does not include remember in any PAM file." >> p3
  echo "Yes" >> p4
  echo "5.3.3.4.2" >> p12
 else
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure pam_unix does not include remember." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.3.3.4.2" >> p12
 fi
}


#5.3.3.4.3
#Ensure pam_unix includes a strong password hashing algorithm.
{
 l_output="" l_output2=""
 l_file="/etc/pam.d/common-password"
 l_hash="$(grep -PHs -- '^\h*password\h+[^\n\r]+\h+pam_unix\.so\h+([^\n\r]+\h+)?(sha512|yescrypt)\b' "$l_file" 2>/dev/null | grep -v '^\s*#')"
 if [ -n "$l_hash" ]; then
  l_algo="$(echo "$l_hash" | grep -oP '(sha512|yescrypt)' | tail -1)"
  l_output="pam_unix.so is using strong hashing algorithm: $l_algo (compliant)."
 else
  l_output2="pam_unix.so does not include sha512 or yescrypt in $l_file. Required: sha512 or yescrypt must be set."
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure pam_unix includes a strong password hashing algorithm." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.3.3.4.3" >> p12
 else
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure pam_unix includes a strong password hashing algorithm." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.3.3.4.3" >> p12
 fi
}

#5.3.3.4.4
#Ensure pam_unix includes use_authtok.
{
 l_output="" l_output2=""
 l_file="/etc/pam.d/common-password"
 l_authtok="$(grep -PHs -- '^\h*password\h+[^\n\r]+\h+pam_unix\.so\h+([^\n\r]+\h+)?use_authtok\b' "$l_file" 2>/dev/null | grep -v '^\s*#')"
 if [ -n "$l_authtok" ]; then
  l_output="pam_unix.so includes use_authtok in $l_file (compliant)."
 else
  l_output2="pam_unix.so does not include use_authtok on password line in $l_file. Required: use_authtok must be present."
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure pam_unix includes use_authtok." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.3.3.4.4" >> p12
 else
  echo "Access Control / Configure PAM" >> p1
  echo "Ensure pam_unix includes use_authtok." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.3.3.4.4" >> p12
 fi
}


###############################################################################################

#5.4.1.1
#Ensure password expiration is configured.
{
 l_output="" l_output2=""
 l_max_days="$(grep -Pi '^\h*PASS_MAX_DAYS\h+\d+' /etc/login.defs 2>/dev/null | awk '{print $2}')"
 if [ -z "$l_max_days" ]; then
  l_output2="$l_output2 PASS_MAX_DAYS is not configured in /etc/login.defs."
 elif [ "$l_max_days" -gt 365 ] || [ "$l_max_days" -le 0 ] 2>/dev/null; then
  l_output2="$l_output2 PASS_MAX_DAYS is set to $l_max_days in /etc/login.defs. Required: 1-365."
 else
  l_output="$l_output PASS_MAX_DAYS is set to $l_max_days in /etc/login.defs (compliant)."
 fi
 l_user_fail=""
 while IFS=: read -r l_user _ _ _ l_umax_days _; do
  if [ -n "$l_umax_days" ] && [ "$l_umax_days" -gt 365 ] 2>/dev/null; then
   l_user_fail="$l_user_fail User $l_user has PASS_MAX_DAYS=$l_umax_days (exceeds 365)."
  fi
 done < <(awk -F: '/^[^:]+:[^!*]/{print}' /etc/shadow 2>/dev/null)
 [ -n "$l_user_fail" ] && l_output2="$l_output2$l_user_fail"
 if [ -z "$l_output2" ]; then
  echo "Access Control / User Accounts and Environment" >> p1
  echo "Ensure password expiration is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.4.1.1" >> p12
 else
  echo "Access Control / User Accounts and Environment" >> p1
  echo "Ensure password expiration is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.4.1.1" >> p12
 fi
}

#5.4.1.3
#Ensure password expiration warning days is configured.
{
 l_output="" l_output2=""
 l_warn_age="$(grep -Pi '^\h*PASS_WARN_AGE\h+\d+' /etc/login.defs 2>/dev/null | awk '{print $2}')"
 if [ -z "$l_warn_age" ]; then
  l_output2="$l_output2 PASS_WARN_AGE is not configured in /etc/login.defs. Required: 7 or more."
 elif [ "$l_warn_age" -lt 7 ] 2>/dev/null; then
  l_output2="$l_output2 PASS_WARN_AGE is set to $l_warn_age in /etc/login.defs. Required: 7 or more."
 else
  l_output="$l_output PASS_WARN_AGE is set to $l_warn_age in /etc/login.defs (compliant)."
 fi
 while IFS=: read -r l_user _ _ _ _ l_uwarn _; do
  if [ -n "$l_uwarn" ] && [ "$l_uwarn" -lt 7 ] 2>/dev/null; then
   l_output2="$l_output2 User $l_user has PASS_WARN_AGE=$l_uwarn (less than 7)."
  fi
 done < <(awk -F: '/^[^:]+:[^!*]/{print}' /etc/shadow 2>/dev/null)
 if [ -z "$l_output2" ]; then
  echo "Access Control / User Accounts and Environment" >> p1
  echo "Ensure password expiration warning days is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.4.1.3" >> p12
 else
  echo "Access Control / User Accounts and Environment" >> p1
  echo "Ensure password expiration warning days is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.4.1.3" >> p12
 fi
}

#5.4.1.4
#Ensure strong password hashing algorithm is configured.
{
 l_output="" l_output2=""
 l_encrypt="$(grep -Pi '^\h*ENCRYPT_METHOD\h+(SHA512|YESCRYPT)\b' /etc/login.defs 2>/dev/null | awk '{print $2}')"
 l_encrypt_set="$(grep -Pi '^\h*ENCRYPT_METHOD\h+\S+' /etc/login.defs 2>/dev/null | awk '{print $2}')"
 if [ -z "$l_encrypt_set" ]; then
  l_output2="$l_output2 ENCRYPT_METHOD is not configured in /etc/login.defs. Required: SHA512 or YESCRYPT."
 elif [ -n "$l_encrypt" ]; then
  l_output="ENCRYPT_METHOD is set to $l_encrypt in /etc/login.defs (compliant)."
 else
  l_output2="$l_output2 ENCRYPT_METHOD is set to $l_encrypt_set in /etc/login.defs. Required: SHA512 or YESCRYPT."
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / User Accounts and Environment" >> p1
  echo "Ensure strong password hashing algorithm is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.4.1.4" >> p12
 else
  echo "Access Control / User Accounts and Environment" >> p1
  echo "Ensure strong password hashing algorithm is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.4.1.4" >> p12
 fi
}

#5.4.1.5
#Ensure inactive password lock is configured.
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
  echo "Ensure inactive password lock is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.4.1.5" >> p12
 else
  echo "Access Control / User Accounts and Environment" >> p1
  echo "Ensure inactive password lock is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.4.1.5" >> p12
 fi
}

#5.4.1.6
#Ensure all users last password change date is in the past.

{
 l_output2=""
 l_now="$(date +%s)"
 while read -r usr; do
  l_date_str="$(chage --list "$usr" 2>/dev/null | grep '^Last password change' | cut -d: -f2 | xargs)"
  [ -z "$l_date_str" ] && continue
  [ "$l_date_str" = "never" ] && continue
  l_change="$(date -d "$l_date_str" +%s 2>/dev/null)" || continue
  if [[ "$l_change" -gt "$l_now" ]]; then
   l_output2="$l_output2 User $usr last password change was $l_date_str (future date)."
  fi
 done < <(awk -F: '/^[^:]+:[^!*]/{print $1}' /etc/shadow)
 if [ -z "$l_output2" ]; then
  echo "Access Control / User Accounts and Environment" >> p1
  echo "Ensure all users last password change date is in the past." >> p2
  echo "All users last password change date is in the past." >> p3
  echo "Yes" >> p4
  echo "5.4.1.6" >> p12
 else
  echo "Access Control / User Accounts and Environment" >> p1
  echo "Ensure all users last password change date is in the past." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.4.1.6" >> p12
 fi
}

###############################################################################################################

#5.4.2.1
#Ensure root is the only UID 0 account.

{
 l_output2=""
 while IFS=: read -r l_user l_pass l_uid l_rest; do
  if [ "$l_uid" -eq 0 ] && [ "$l_user" != "root" ]; then
   l_output2="$l_output2 Account $l_user has UID 0."
  fi
 done < /etc/passwd
 if [ -z "$l_output2" ]; then
  echo "Access Control / User Accounts and Environment" >> p1
  echo "Ensure root is the only UID 0 account." >> p2
  echo "Root is the only UID 0 account." >> p3
  echo "Yes" >> p4
  echo "5.4.2.1" >> p12
 else
  echo "Access Control / User Accounts and Environment" >> p1
  echo "Ensure root is the only UID 0 account." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.4.2.1" >> p12
 fi
}


#5.4.2.2
#Ensure root is the only GID 0 account.
{
 l_output="" l_output2=""
 l_gid0_users="$(awk -F: '($1 !~ /^(root|sync|shutdown|halt|operator)$/ && $4=="0") {print $1}' /etc/passwd 2>/dev/null)"
 l_root_gid="$(awk -F: '/^root:/{print $4}' /etc/passwd 2>/dev/null)"
 if [ "$l_root_gid" -ne 0 ] 2>/dev/null; then
  l_output2="$l_output2 root account does not have GID 0 (current GID: $l_root_gid)."
 fi
 if [ -n "$l_gid0_users" ]; then
  l_output2="$l_output2 Non-root accounts found with GID 0: $l_gid0_users"
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / User Accounts and Environment" >> p1
  echo "Ensure root is the only GID 0 account." >> p2
  echo "root is the only account with GID 0." >> p3
  echo "Yes" >> p4
  echo "5.4.2.2" >> p12
 else
  echo "Access Control / User Accounts and Environment" >> p1
  echo "Ensure root is the only GID 0 account." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.4.2.2" >> p12
 fi
}

#5.4.2.3
#Ensure group root is the only GID 0 group.
{
 l_output="" l_output2=""
 l_gid0_groups="$(awk -F: '($3=="0" && $1!="root") {print $1}' /etc/group 2>/dev/null)"
 l_root_group_gid="$(awk -F: '/^root:/{print $3}' /etc/group 2>/dev/null)"
 if [ "$l_root_group_gid" -ne 0 ] 2>/dev/null; then
  l_output2="$l_output2 root group does not have GID 0 (current GID: $l_root_group_gid)."
 fi
 if [ -n "$l_gid0_groups" ]; then
  l_output2="$l_output2 Non-root groups found with GID 0: $l_gid0_groups"
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / User Accounts and Environment" >> p1
  echo "Ensure group root is the only GID 0 group." >> p2
  echo "root is the only group with GID 0." >> p3
  echo "Yes" >> p4
  echo "5.4.2.3" >> p12
 else
  echo "Access Control / User Accounts and Environment" >> p1
  echo "Ensure group root is the only GID 0 group." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.4.2.3" >> p12
 fi
}

#5.4.2.4
#Ensure root account access is controlled.
{
 l_output="" l_output2=""
 l_root_status="$(passwd -S root 2>/dev/null | awk '{print $2}')"
 if [ "$l_root_status" = "P" ]; then
  l_output="root account has a password set (status: P - compliant)."
 elif [ "$l_root_status" = "L" ]; then
  l_output="root account is locked (status: L - compliant)."
 elif [ -z "$l_root_status" ]; then
  l_output2="Unable to determine root account password status. Run as root/sudo."
 else
  l_output2="root account password status is $l_root_status. Required: P (password set) or L (locked)."
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / User Accounts and Environment" >> p1
  echo "Ensure root account access is controlled." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.4.2.4" >> p12
 else
  echo "Access Control / User Accounts and Environment" >> p1
  echo "Ensure root account access is controlled." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.4.2.4" >> p12
 fi
}

#5.4.2.5
#Ensure root PATH Integrity.
RPCV="$(sudo -Hiu root env | grep '^PATH' | cut -d= -f2)"
VALID=true

echo "$RPCV" | grep -q "::" && echo "root's path contains a empty directory (::)" && VALID=false
echo "$RPCV" | grep -q ":$" && echo "root's path contains a trailing (:)" && VALID=false

for x in $(echo "$RPCV" | tr ":" " "); do
 if [ -d "$x" ]; then
 ls -ldH "$x" | awk '$9 == "." {print "PATH contains current working directory (.)"; exit 1}
 $3 != "root" {print $9, "is not owned by root"; exit 1}
 substr($1,6,1) != "-" {print $9, "is group writable"; exit 1}
 substr($1,9,1) != "-" {print $9, "is world writable"; exit 1}' || VALID=false
 else
 echo "$x is not a directory"
 VALID=false
 fi
done
if $VALID; then
	echo "Access Control / User Accounts and Environment" >> p1
    echo "Ensure root PATH Integrity." >> p2
    echo "root PATH Integrity is valid." >> p3
    echo "Yes" >> p4
	echo "5.4.2.5" >> p12
else
	echo "Access Control / User Accounts and Environment" >> p1
    echo "Ensure root PATH Integrity." >> p2
    echo "root PATH Integrity is NOT valid." >> p3
    echo "No" >> p4
	echo "5.4.2.5" >> p12
fi

#5.4.2.6
#Ensure root user umask is configured.
{
 l_output="" l_output2=""
 for l_file in /root/.profile /root/.bashrc; do
  if [ -f "$l_file" ]; then
   l_bad_umask="$(grep -Psi '^\h*umask\h+([0-7][0-7][01][0-7]|[0-7][0-7][0-7][0-6]|[0-7][01][0-7]|[0-7][0-7][0-6]|(u=[rwx]{0,3},)?(g=[rwx]{0,3},)?o=[rwx]+|(u=[rwx]{1,3},)?g=[^rx]{1,3}(,o=[rwx]{0,3})?)\b' "$l_file" 2>/dev/null | grep -v '^\s*#')"
   if [ -n "$l_bad_umask" ]; then
    l_output2="$l_output2 Permissive umask found in $l_file: $l_bad_umask"
   fi
  fi
 done
 if [ -z "$l_output2" ]; then
  echo "Access Control / User Accounts and Environment" >> p1
  echo "Ensure root user umask is configured." >> p2
  echo "No permissive umask found in /root/.profile or /root/.bashrc." >> p3
  echo "Yes" >> p4
  echo "5.4.2.6" >> p12
 else
  echo "Access Control / User Accounts and Environment" >> p1
  echo "Ensure root user umask is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.4.2.6" >> p12
 fi
}

#5.4.2.7
#Ensure system accounts do not have a valid login shell.
{
 l_output="" l_output2=""
 l_valid_shells="^($(sed -rn '/^\//{s,/,\\\\/,g;p}' /etc/shells | paste -s -d'|'))$"
 l_uid_min="$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)"
 while IFS=: read -r l_user _ l_uid _ _ _ l_shell; do
  if [[ "$l_shell" =~ $l_valid_shells ]] && [ "$l_shell" != "/usr/sbin/nologin" ] && [ "$l_shell" != "/bin/false" ]; then
   l_output2="$l_output2 Service account \"$l_user\" (UID=$l_uid) has valid login shell: $l_shell"
  fi
 done < <(awk -v uid_min="$l_uid_min" -F: '($1 !~ /^(root|halt|sync|shutdown|nfsnobody)$/ && $3 < uid_min) {print}' /etc/passwd 2>/dev/null)
 if [ -z "$l_output2" ]; then
  echo "Access Control / User Accounts and Environment" >> p1
  echo "Ensure system accounts do not have a valid login shell." >> p2
  echo "No system accounts found with a valid login shell." >> p3
  echo "Yes" >> p4
  echo "5.4.2.7" >> p12
 else
  echo "Access Control / User Accounts and Environment" >> p1
  echo "Ensure system accounts do not have a valid login shell." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.4.2.7" >> p12
 fi
}

#5.4.2.8
#Ensure accounts without a valid login shell are locked.
{
 l_output="" l_output2=""
 l_valid_shells="^($(sed -rn '/^\//{s,/,\\\\/,g;p}' /etc/shells | paste -s -d'|'))$"
 while IFS= read -r l_user; do
  l_shadow_pass="$(awk -F: -v u="$l_user" '$1==u {print $2}' /etc/shadow 2>/dev/null)"
  if [[ "$l_shadow_pass" != !* ]] && [[ "$l_shadow_pass" != \** ]] && [ -n "$l_shadow_pass" ]; then
   l_output2="$l_output2 Account \"$l_user\" has no valid login shell and is not locked."
  fi
 done < <(awk -v pat="$l_valid_shells" -F: '($1 != "root" && $(NF) !~ pat) {print $1}' /etc/passwd 2>/dev/null)
 if [ -z "$l_output2" ]; then
  echo "Access Control / User Accounts and Environment" >> p1
  echo "Ensure accounts without a valid login shell are locked." >> p2
  echo "All non-root accounts without a valid login shell are locked." >> p3
  echo "Yes" >> p4
  echo "5.4.2.8" >> p12
 else
  echo "Access Control / User Accounts and Environment" >> p1
  echo "Ensure accounts without a valid login shell are locked." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.4.2.8" >> p12
 fi
}

###############################################################################################################

#5.4.3.2
#Ensure default user shell timeout is configured.
{
 l_output="" l_output2=""
 l_tmout_set="" l_tmout_readonly="" l_tmout_export=""
 for l_file in /etc/bash.bashrc /etc/profile /etc/profile.d/*.sh; do
  [ -f "$l_file" ] || continue
  if grep -Pq '^\h*([^#\n\r]+\h+)?TMOUT=(900|[1-8][0-9][0-9]|[1-9][0-9]|[1-9])\b' "$l_file" 2>/dev/null; then
   l_tmout_set="$l_file"
  fi
  if grep -Pq '^\h*([^#\n\r]+;\h*)?readonly\h+TMOUT\b' "$l_file" 2>/dev/null || \
     grep -Pq '^\h*typeset\h+-xr\h+TMOUT\b' "$l_file" 2>/dev/null; then
   l_tmout_readonly="$l_file"
  fi
  if grep -Pq '^\h*([^#\n\r]+;\h*)?export\h+TMOUT\b' "$l_file" 2>/dev/null || \
     grep -Pq '^\h*typeset\h+-xr\h+TMOUT\b' "$l_file" 2>/dev/null; then
   l_tmout_export="$l_file"
  fi
  if grep -Pq '^\h*([^#\n\r]+\h+)?TMOUT=(0|9[0-9][1-9]|9[1-9][0-9]|[1-9][0-9]{3,})\b' "$l_file" 2>/dev/null; then
   l_bad="$(grep -P '^\h*([^#\n\r]+\h+)?TMOUT=(0|9[0-9][1-9]|9[1-9][0-9]|[1-9][0-9]{3,})\b' "$l_file" 2>/dev/null)"
   l_output2="$l_output2 Invalid TMOUT value found in $l_file: $l_bad"
  fi
 done
 if [ -n "$l_tmout_set" ] && [ -n "$l_tmout_readonly" ] && [ -n "$l_tmout_export" ] && [ -z "$l_output2" ]; then
  l_output="TMOUT is configured, readonly and exported in shell config files (compliant)."
 else
  [ -z "$l_tmout_set" ] && l_output2="$l_output2 TMOUT value (1-900) is not set in any shell config file."
  [ -z "$l_tmout_readonly" ] && l_output2="$l_output2 TMOUT is not set as readonly in any shell config file."
  [ -z "$l_tmout_export" ] && l_output2="$l_output2 TMOUT is not exported in any shell config file."
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / User Accounts and Environment" >> p1
  echo "Ensure default user shell timeout is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.4.3.2" >> p12
 else
  echo "Access Control / User Accounts and Environment" >> p1
  echo "Ensure default user shell timeout is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.4.3.2" >> p12
 fi
}

#5.4.3.3
#Ensure default user umask is configured.
{
 l_output="" l_output2=""
 # Check login.defs
 l_umask="$(grep -Pi '^\h*UMASK\h+' /etc/login.defs 2>/dev/null | grep -v '^\s*#' | awk '{print $2}' | tail -1)"
 if [ -z "$l_umask" ]; then
  l_output2="$l_output2 UMASK not set in /etc/login.defs."
 elif [ "$l_umask" = "027" ] || [ "$l_umask" = "0027" ] || [ "$l_umask" = "077" ] || [ "$l_umask" = "0077" ]; then
  l_output="$l_output UMASK in /etc/login.defs: $l_umask (compliant)."
 else
  l_output2="$l_output2 UMASK in /etc/login.defs: $l_umask. Required: 027 or more restrictive."
 fi
 # Check profile.d
 l_profile_umask="$(grep -RPsi '^\h*umask\h+' /etc/profile.d/*.sh 2>/dev/null | grep -v '^\s*#' | awk '{print $NF}' | tail -1)"
 if [ -n "$l_profile_umask" ]; then
  if [ "$l_profile_umask" = "027" ] || [ "$l_profile_umask" = "0027" ] || [ "$l_profile_umask" = "077" ] || [ "$l_profile_umask" = "0077" ]; then
   l_output="$l_output umask in /etc/profile.d/: $l_profile_umask (compliant)."
  else
   l_output2="$l_output2 umask in /etc/profile.d/: $l_profile_umask. Required: 027 or more restrictive."
  fi
 fi
 if [ -z "$l_output2" ]; then
  echo "Access Control / User Accounts and Environment" >> p1
  echo "Ensure default user umask is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "5.4.3.3" >> p12
 else
  echo "Access Control / User Accounts and Environment" >> p1
  echo "Ensure default user umask is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "5.4.3.3" >> p12
 fi
}

############################################################################################################

#6.1.1.1
#Ensure journald service is enabled and active.
{
 l_output="" l_output2=""

 # Check systemd-journald is enabled (should return 'static')
 l_enabled="$(systemctl is-enabled systemd-journald.service 2>/dev/null)"
 if [ "$l_enabled" = "static" ]; then
  l_output="$l_output systemd-journald.service is enabled (static)."
 else
  l_output2="$l_output2 systemd-journald.service is not static (status: $l_enabled). Investigate why."
 fi

 # Check systemd-journald is active
 if systemctl is-active systemd-journald.service 2>/dev/null | grep -q '^active'; then
  l_output="$l_output systemd-journald.service is active."
 else
  l_output2="$l_output2 systemd-journald.service is not active."
 fi

 if [ -z "$l_output2" ]; then
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure journald service is enabled and active." >> p2
  echo "systemd-journald service is enabled (static) and active." >> p3
  echo "Yes" >> p4
  echo "6.1.1.1" >> p12
 else
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure journald service is enabled and active." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "6.1.1.1" >> p12
 fi
}

#6.1.1.4
#Ensure only one logging system is in use.

{
l_output=""
l_output2=""
l_rsyslog=""
l_journal=""

if systemctl is-active --quiet rsyslog; then
 l_rsyslog="active"
fi

if systemctl is-active --quiet systemd-journald; then
 l_journal="active"
fi

if [ "$l_rsyslog" = "active" ] && [ "$l_journal" = "active" ]; then
 l_output2="Both rsyslog and journald are active."
elif [ "$l_rsyslog" = "active" ] && [ -z "$l_journal" ]; then
 l_output="Only rsyslog is active."
elif [ -z "$l_rsyslog" ] && [ "$l_journal" = "active" ]; then
 l_output="Only journald is active."
else
 l_output2="Unable to determine active logging system."
fi

if [ -z "$l_output2" ]; then
 echo "Logging and Auditing / System Logging" >> p1
 echo "Ensure only one logging system is in use." >> p2
 echo "$l_output" >> p3
 echo "Yes" >> p4
 echo "6.1.1.4" >> p12
else
 echo "Logging and Auditing / System Logging" >> p1
 echo "Ensure only one logging system is in use." >> p2
 echo "$l_output2" >> p3
 echo "No" >> p4
 echo "6.1.1.4" >> p12
fi
}

#################################################################################################################

#6.1.2.1.1
#Ensure systemd-journal-remote is installed.

{
l_output=""
l_output2=""

if systemctl is-active --quiet systemd-journald; then

 if dpkg-query -s systemd-journal-remote 2>/dev/null | grep -q "Status: install ok installed"; then
  l_output="systemd-journal-remote is installed."
 else
  l_output2="systemd-journal-remote is NOT installed."
 fi

else
 l_output="journald is not the active logging system (control not applicable)."
fi

if [ -z "$l_output2" ]; then
 echo "Logging and Auditing / System Logging" >> p1
 echo "Ensure systemd-journal-remote is installed." >> p2
 echo "$l_output" >> p3
 echo "Yes" >> p4
 echo "6.1.2.1.1" >> p12
else
 echo "Logging and Auditing / System Logging" >> p1
 echo "Ensure systemd-journal-remote is installed." >> p2
 echo "$l_output2" >> p3
 echo "No" >> p4
 echo "6.1.2.1.1" >> p12
fi
}

#6.1.2.1.3
#Ensure systemd-journal-upload is enabled and active.

{
l_output=""
l_output2=""

if systemctl is-active --quiet systemd-journald; then

 if systemctl is-enabled systemd-journal-upload.service 2>/dev/null | grep -q "enabled" && \
    systemctl is-active systemd-journal-upload.service 2>/dev/null | grep -q "active"; then
  l_output="systemd-journal-upload is enabled and active."
 else
  l_output2="systemd-journal-upload is not enabled and/or not active."
 fi

else
 l_output="journald is not the active logging system (control not applicable)."
fi

if [ -z "$l_output2" ]; then
 echo "Logging and Auditing / System Logging" >> p1
 echo "Ensure systemd-journal-upload is enabled and active." >> p2
 echo "$l_output" >> p3
 echo "Yes" >> p4
 echo "6.1.2.1.3" >> p12
else
 echo "Logging and Auditing / System Logging" >> p1
 echo "Ensure systemd-journal-upload is enabled and active." >> p2
 echo "$l_output2" >> p3
 echo "No" >> p4
 echo "6.1.2.1.3" >> p12
fi
}

#6.1.2.1.4
#Ensure systemd-journal-remote service is not in use.

{
l_output=""
l_output2=""

if systemctl is-active --quiet systemd-journald; then

 if systemctl is-enabled systemd-journal-remote.socket systemd-journal-remote.service 2>/dev/null | grep -q "enabled"; then
  l_output2="systemd-journal-remote service/socket is enabled."
 elif systemctl is-active systemd-journal-remote.socket systemd-journal-remote.service 2>/dev/null | grep -q "active"; then
  l_output2="systemd-journal-remote service/socket is active."
 else
  l_output="systemd-journal-remote service and socket are not in use."
 fi

else
 l_output="journald not in use (control not applicable)."
fi

if [ -z "$l_output2" ]; then
 echo "Logging and Auditing / System Logging" >> p1
 echo "Ensure systemd-journal-remote service is not in use." >> p2
 echo "$l_output" >> p3
 echo "Yes" >> p4
 echo "6.1.2.1.4" >> p12
else
 echo "Logging and Auditing / System Logging" >> p1
 echo "Ensure systemd-journal-remote service is not in use." >> p2
 echo "$l_output2" >> p3
 echo "No" >> p4
 echo "6.1.2.1.4" >> p12
fi
}

#################################################################################################################

#6.1.3.2
#Ensure rsyslog service is enabled and active.
{
 l_output="" l_output2=""

 # Check rsyslog is enabled
 if systemctl is-enabled rsyslog 2>/dev/null | grep -q '^enabled'; then
  l_output="$l_output rsyslog.service is enabled."
 else
  l_output2="$l_output2 rsyslog.service is not enabled."
 fi

 # Check rsyslog is active
 if systemctl is-active rsyslog.service 2>/dev/null | grep -q '^active'; then
  l_output="$l_output rsyslog.service is active."
 else
  l_output2="$l_output2 rsyslog.service is not active."
 fi

 if [ -z "$l_output2" ]; then
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure rsyslog service is enabled and active." >> p2
  echo "rsyslog service is enabled and active." >> p3
  echo "Yes" >> p4
  echo "6.1.3.2" >> p12
 else
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure rsyslog service is enabled and active." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "6.1.3.2" >> p12
 fi
}

#6.1.3.3
#Ensure journald is configured to send logs to rsyslog.
{
 l_output="" l_output2=""
 l_forward="$(systemd-analyze cat-config systemd/journald.conf 2>/dev/null | grep -Pi '^\h*ForwardToSyslog\h*=' | grep -v '^\s*#' | tail -1)"

 if [ -z "$l_forward" ]; then
  l_output2="ForwardToSyslog is not set in journald config. Required: ForwardToSyslog=yes."
 else
  l_val="$(echo "$l_forward" | awk -F= '{print $2}' | tr -d ' ')"
  if [ "${l_val,,}" = "yes" ]; then
   l_output="ForwardToSyslog=yes is set in journald config."
  else
   l_output2="ForwardToSyslog is set to $l_val. Required: yes."
  fi
 fi

 if [ -z "$l_output2" ]; then
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure journald is configured to send logs to rsyslog." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "6.1.3.3" >> p12
 else
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure journald is configured to send logs to rsyslog." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "6.1.3.3" >> p12
 fi
}

#6.1.3.4
#Ensure rsyslog log file creation mode is configured.
{
 a_output=() a_output2=()
 l_analyze_cmd="$(readlink -f /bin/systemd-analyze)"
 l_include="\$IncludeConfig"
 a_config_files=("rsyslog.conf")
 l_parameter_name="\$FileCreateMode"

 f_parameter_chk()
 {
  l_perm_mask="0137"
  l_maxperm="$(printf '%o' $(( 0777 & ~$l_perm_mask )) )"
  l_mode="$(awk '{print $2}' <<< "$l_used_parameter_setting" | xargs)"
  if [ $(( $l_mode & $l_perm_mask )) -gt 0 ]; then
   a_output2+=(" - Parameter: \"${l_parameter_name//\\/\\}\" is incorrectly set to mode: \"$l_mode\" in the file: \"$l_file\"  Should be mode: \"$l_maxperm\" or more restrictive")
  else
   a_output+=(" - Parameter: \"${l_parameter_name//\\/\\}\" is correctly set to mode: \"$l_mode\" in the file: \"$l_file\"  Should be mode: \"$l_maxperm\" or more restrictive")
  fi
 }

 while IFS= read -r l_file; do
  l_conf_loc="$(awk '$1~/\$IncludeConfig$/ {print $2}' <<< "$l_file" | tr -d '#' <<< "$l_file" | tail -n 1)"
  [ -n "$l_conf_loc" ] && break
 done < <("$l_analyze_cmd" cat-config "${a_config_files[@]}" | tac | grep -Pio '^\h*\/[\#\h*\/]*[^\h\r\h]+\.conf\b')

 if [ -n "$l_conf_loc" ]; then
  if grep -Pq '\/\*\.([^\h\r\h]+)\*$' <<< "$l_conf_loc" || [ -f "$(readlink -f "$l_conf_loc")" ]; then
   l_dir="$l_conf_loc" l_ext=""
  else
   l_dir="$(dirname "$l_conf_loc")" l_ext="$(basename "$l_conf_loc")"
  fi
  while read -r -d $'\0' l_file_name; do
   [ -f "$(readlink -f "$l_file_name")" ] && a_config_files+=("$(readlink -f "$l_file_name")")
  done < <(find -L "$l_dir" -type f -name "$l_ext" -print0 2>/dev/null)
 fi

 while IFS= read -r l_file; do
  l_used_parameter_setting="$(grep -PHs -- "^\h*$l_parameter_name\b" "$l_file" | tail -n 1)"
  [ -n "$l_used_parameter_setting" ] && break
 done < <("$l_analyze_cmd" cat-config "${a_config_files[@]}" | tac | grep -Pio '^\h*\/[\#\h*\/]*[^\h\r\h]+\.conf\b')

 if [ -n "$l_used_parameter_setting" ]; then
  f_parameter_chk
 else
  a_output2+=(" - Parameter: \"${l_parameter_name//\\/\\}\" is not set in a configuration file  ** Note: \"${l_parameter_name//\\/\\}\" May be set in a file that's ignored by load procedure ***")
 fi

 if [ "${#a_output2[@]}" -le 0 ]; then
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure rsyslog log file creation mode is configured." >> p2
  echo "rsyslog \$FileCreateMode is set to 0640 or more restrictive." >> p3
  echo "Yes" >> p4
  echo "6.1.3.4" >> p12
 else
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure rsyslog log file creation mode is configured." >> p2
  echo "${a_output2[*]}" >> p3
  echo "No" >> p4
  echo "6.1.3.4" >> p12
 fi
}


#6.1.3.7
#Ensure rsyslog is not configured to receive logs from a remote client.
{
 a_output2=()
 l_analyze_cmd="$(readlink -f /bin/systemd-analyze)"
 l_include='\$IncludeConfig' a_config_files=("rsyslog.conf")
 while IFS= read -r l_file; do
  l_conf_loc="$(awk '/^\s*'"$l_include"'$/ {print $2}' "$(tr -d '# ' <<< "$l_file")" | tail -n 1)"
  [ -n "$l_conf_loc" ] && break
 done < <($l_analyze_cmd cat-config "${a_config_files[0]}" | tac | grep -Pio '^\h*#\h*\/[^#\n\r\h]+\.conf\b')
 if [ -d "$l_conf_loc" ]; then
  l_dir="$l_conf_loc" l_ext="*"
 elif grep -Psq '\/\\.([^#/\n\r]+)?\h$' <<< "$l_conf_loc" || [ -f "$(readlink -f "$l_conf_loc")" ]; then
  l_dir="$(dirname "$l_conf_loc")" l_ext="$(basename "$l_conf_loc")"
 fi
 while read -r -d $'\0' l_file_name; do
  [ -f "$(readlink -f "$l_file_name")" ] && a_config_files+=("$(readlink -f "$l_file_name")")
 done < <(find -L "$l_dir" -type f -name "$l_ext" -print0 2>/dev/null)
 for l_logfile in "${a_config_files[@]}"; do
  l_fail="$(grep -Psi -- '^\h*module\(load=\"?imtcp\"?\)' "$l_logfile")"
  [ -n "$l_fail" ] && a_output2+=("- Advanced format entry to accept incoming logs: \"$l_fail\" found in: \"$l_logfile\"")
  l_fail="$(grep -Psi -- '^\h*input\(type=\"?imtcp\"?\b' "$l_logfile")"
  [ -n "$l_fail" ] && a_output2+=("- Advanced format entry to accept incoming logs: \"$l_fail\" found in: \"$l_logfile\"")
  l_fail="$(grep -Psi -- '^\h*module\(load=\"?imtcp\"?\)' "$l_logfile")"
  [ -n "$l_fail" ] && a_output2+=("- Obsolete format entry to accept incoming logs: \"$l_fail\" found in: \"$l_logfile\"")
  l_fail="$(grep -Psi -- '^\h*input\(type=\"?imtcp\"?\b' "$l_logfile")"
  [ -n "$l_fail" ] && a_output2+=("- Obsolete format entry to accept incoming logs: \"$l_fail\" found in: \"$l_logfile\"")
 done
 if [ "${#a_output2[@]}" -le "0" ]; then
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure rsyslog is not configured to receive logs from a remote client." >> p2
  echo "rsyslog is not configured to receive logs from a remote client." >> p3
  echo "Yes" >> p4
  echo "6.1.3.7" >> p12
 else
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure rsyslog is not configured to receive logs from a remote client." >> p2
  echo "rsyslog is configured to accept incoming logs: $(printf '%s ' "${a_output2[@]}")" >> p3
  echo "No" >> p4
  echo "6.1.3.7" >> p12
 fi
}

#################################################################################################################

#6.1.4.1
#Ensure access to all logfiles has been configured (Automated)
{
 l_output="" l_output2=""
 while read -r fname; do
  bname="$(basename "$fname")"
  case "$bname" in
   lastlog|lastlog.*|wtmp|wtmp.*|btmp|btmp.*)
    stat -Lc "%a" "$fname" | grep -Pq '^\h*[0,2,4,6][0,2,4,6][0,4]\h*$' || \
     l_output2="$l_output2 File: \"$fname\" mode: \"$(stat -Lc '%a' "$fname")\" is too permissive."
    ;;
   *.journal|*.journal~)
    stat -Lc "%a" "$fname" | grep -Pq '^\h*[0,2,4,6][0,4]0\h*$' || \
     l_output2="$l_output2 File: \"$fname\" mode: \"$(stat -Lc '%a' "$fname")\" is too permissive."
    stat -Lc "%U %G" "$fname" | grep -Pq '^\h*(root)\h+(systemd-journal|root)\h*$' || \
     l_output2="$l_output2 File: \"$fname\" ownership: \"$(stat -Lc '%U:%G' "$fname")\" is incorrect."
    ;;
   secure|auth.log|syslog|messages|kern.log)
    stat -Lc "%a" "$fname" | grep -Pq '^\h*[0,2,4,6][0,4]0\h*$' || \
     l_output2="$l_output2 File: \"$fname\" mode: \"$(stat -Lc '%a' "$fname")\" is too permissive."
    ;;
  esac
 done < <(find /var/log -type f 2>/dev/null)
 if [ -z "$l_output2" ]; then
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure access to all logfiles has been configured." >> p2
  echo "All logfiles have appropriate permissions and ownership." >> p3
  echo "Yes" >> p4
  echo "6.1.4.1" >> p12
 else
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure access to all logfiles has been configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "6.1.4.1" >> p12
 fi
}

#################################################################################################################

#6.1.2.2
#Ensure journald ForwardToSyslog is disabled (Automated)
{
 l_output="" l_output2=""
 l_forward="$(systemd-analyze cat-config systemd/journald.conf 2>/dev/null | grep -Pi '^\h*ForwardToSyslog\h*=' | grep -v '^\s*#' | tail -1)"
 if [ -z "$l_forward" ]; then
  l_output="ForwardToSyslog is not set (default: no - compliant)."
 else
  l_value="$(echo "$l_forward" | awk -F= '{print $2}' | tr -d ' ')"
  if [ "${l_value,,}" = "yes" ]; then
   l_output2="ForwardToSyslog is set to yes."
  else
   l_output="ForwardToSyslog is set to $l_value (compliant)."
  fi
 fi
 if [ -z "$l_output2" ]; then
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure journald ForwardToSyslog is disabled." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "6.1.2.2" >> p12
 else
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure journald ForwardToSyslog is disabled." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "6.1.2.2" >> p12
 fi
}


#6.1.2.3
#Ensure journald Compress is configured (Automated)
{
 l_output="" l_output2=""
 l_compress="$(systemd-analyze cat-config systemd/journald.conf 2>/dev/null | grep -Pi '^\h*Compress\h*=' | grep -v '^\s*#' | tail -1)"
 if [ -z "$l_compress" ]; then
  l_output2="Compress is not configured in journald config."
 else
  l_value="$(echo "$l_compress" | awk -F= '{print $2}' | tr -d ' ')"
  if [ "${l_value,,}" = "yes" ]; then
   l_output="Compress is set to yes (compliant)."
  else
   l_output2="Compress is set to $l_value."
  fi
 fi
 if [ -z "$l_output2" ]; then
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure journald Compress is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "6.1.2.3" >> p12
 else
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure journald Compress is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "6.1.2.3" >> p12
 fi
}

#6.1.2.4
#Ensure journald Storage is configured (Automated).
{
 l_output="" l_output2=""
 l_storage="$(systemd-analyze cat-config systemd/journald.conf 2>/dev/null | grep -Pi '^\h*Storage\h*=' | grep -v '^\s*#' | tail -1)"
 if [ -z "$l_storage" ]; then
  l_output2="Storage is not configured in journald config."
 else
  l_value="$(echo "$l_storage" | awk -F= '{print $2}' | tr -d ' ')"
  if [ "${l_value,,}" = "persistent" ]; then
   l_output="Storage is set to persistent (compliant)."
  else
   l_output2="Storage is set to $l_value."
  fi
 fi
 if [ -z "$l_output2" ]; then
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure journald Storage is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "6.1.2.4" >> p12
 else
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure journald Storage is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "6.1.2.4" >> p12
 fi
}

#################################################################################################################
#6.1.3.1
#Ensure rsyslog is installed.
{
 l_output="" l_output2=""
 l_status="$(dpkg-query -W -f='${db:Status-Status}' rsyslog 2>/dev/null)"
 if [ "$l_status" = "installed" ]; then
  l_output="rsyslog package is installed."
 else
  l_output2="rsyslog package is not installed."
 fi
 if [ -z "$l_output2" ]; then
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure rsyslog is installed." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "6.1.3.1" >> p12
 else
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure rsyslog is installed." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "6.1.3.1" >> p12
 fi
}

############################################################################################################
#6.3.1
#Ensure AIDE is installed.
output=$(dpkg-query -W -f='${binary:Package}\t${Status}\t${db:Status-Status}\n' aide aide-common)
if echo "$output" | grep -q 'installed'; then
	echo "Logging and Auditing / Configure Integrity Checking" >> p1
  	echo "Ensure AIDE is installed." >> p2
  	echo "AIDE is installed." >> p3
  	echo "Yes" >> p4
  	echo "6.3.1" >> p12
else
	echo "Logging and Auditing / Configure Integrity Checking" >> p1
  	echo "Ensure AIDE is installed." >> p2
  	echo "AIDE is not installed." >> p3
  	echo "No" >> p4
	echo "6.3.1" >> p12
fi

#6.3.2
#Ensure filesystem integrity is regularly checked.
systemctl is-enabled aidecheck.service &> /dev/null
service_enabled=$?
systemctl is-enabled aidecheck.timer &> /dev/null
timer_enabled=$?
systemctl status aidecheck.timer &> /dev/null
timer_status=$?
if [ $service_enabled -eq 0 ] && [ $timer_enabled -eq 0 ] && [ $timer_status -eq 0 ]
then
		echo "Logging and Auditing / Configure Integrity Checking" >> p1
		echo "Ensure filesystem integrity is regularly checked." >> p2
		echo "AIDE service is running daily to check filesystem integrity" >> p3
		echo "Yes" >> p4
		echo "6.3.2" >> p12
else
		echo "Logging and Auditing / Configure Integrity Checking" >> p1
		echo "Ensure filesystem integrity is regularly checked." >> p2
		echo "AIDE service is not running daily to check filesystem integrity" >> p3
		echo "No" >> p4
		echo "6.3.2" >> p12
fi
############################################################################################################
#7.1.1
#Ensure access to /etc/passwd is configured.
{
 l_output="" l_output2=""
 l_file="/etc/passwd"
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
  l_output2="$l_output2 $l_file owner is $l_owner. Required: root."
 else
  l_output="$l_output Owner is root (compliant)."
 fi
 if [ "$l_gid" -ne 0 ] 2>/dev/null; then
  l_output2="$l_output2 $l_file group is $l_group. Required: root."
 else
  l_output="$l_output Group is root (compliant)."
 fi
 if [ -z "$l_output2" ]; then
  echo "System Maintenance / System File Permissions" >> p1
  echo "Ensure access to /etc/passwd is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "7.1.1" >> p12
 else
  echo "System Maintenance / System File Permissions" >> p1
  echo "Ensure access to /etc/passwd is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "7.1.1" >> p12
 fi
}

#7.1.2
#Ensure access to /etc/passwd- is configured.
{
 l_output="" l_output2=""
 l_file="/etc/passwd-"
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
  l_output2="$l_output2 $l_file owner is $l_owner. Required: root."
 else
  l_output="$l_output Owner is root (compliant)."
 fi
 if [ "$l_gid" -ne 0 ] 2>/dev/null; then
  l_output2="$l_output2 $l_file group is $l_group. Required: root."
 else
  l_output="$l_output Group is root (compliant)."
 fi
 if [ -z "$l_output2" ]; then
  echo "System Maintenance / System File Permissions" >> p1
  echo "Ensure access to /etc/passwd- is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "7.1.2" >> p12
 else
  echo "System Maintenance / System File Permissions" >> p1
  echo "Ensure access to /etc/passwd- is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "7.1.2" >> p12
 fi
}

#7.1.3
#Ensure access to /etc/group is configured.
{
 l_output="" l_output2=""
 l_file="/etc/group"
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
  l_output2="$l_output2 $l_file owner is $l_owner. Required: root."
 else
  l_output="$l_output Owner is root (compliant)."
 fi
 if [ "$l_gid" -ne 0 ] 2>/dev/null; then
  l_output2="$l_output2 $l_file group is $l_group. Required: root."
 else
  l_output="$l_output Group is root (compliant)."
 fi
 if [ -z "$l_output2" ]; then
  echo "System Maintenance / System File Permissions" >> p1
  echo "Ensure access to /etc/group is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "7.1.3" >> p12
 else
  echo "System Maintenance / System File Permissions" >> p1
  echo "Ensure access to /etc/group is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "7.1.3" >> p12
 fi
}

#7.1.4
#Ensure access to /etc/group- is configured.
{
 l_output="" l_output2=""
 l_file="/etc/group-"
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
  l_output2="$l_output2 $l_file owner is $l_owner. Required: root."
 else
  l_output="$l_output Owner is root (compliant)."
 fi
 if [ "$l_gid" -ne 0 ] 2>/dev/null; then
  l_output2="$l_output2 $l_file group is $l_group. Required: root."
 else
  l_output="$l_output Group is root (compliant)."
 fi
 if [ -z "$l_output2" ]; then
  echo "System Maintenance / System File Permissions" >> p1
  echo "Ensure access to /etc/group- is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "7.1.4" >> p12
 else
  echo "System Maintenance / System File Permissions" >> p1
  echo "Ensure access to /etc/group- is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "7.1.4" >> p12
 fi
}

#7.1.5
#Ensure access to /etc/shadow is configured.
{
 l_output="" l_output2=""
 l_file="/etc/shadow"
 l_mode="$(stat -Lc '%#a' $l_file 2>/dev/null)"
 l_uid="$(stat -Lc '%u' $l_file 2>/dev/null)"
 l_gid="$(stat -Lc '%g' $l_file 2>/dev/null)"
 l_owner="$(stat -Lc '%U' $l_file 2>/dev/null)"
 l_group="$(stat -Lc '%G' $l_file 2>/dev/null)"
 if [ $(( l_mode & 0137 )) -gt 0 ] 2>/dev/null; then
  l_output2="$l_output2 $l_file mode is $l_mode. Required: 0640 or more restrictive."
 else
  l_output="$l_output $l_file mode is $l_mode (compliant)."
 fi
 if [ "$l_uid" -ne 0 ] 2>/dev/null; then
  l_output2="$l_output2 $l_file owner is $l_owner. Required: root."
 else
  l_output="$l_output Owner is root (compliant)."
 fi
 if [ "$l_gid" -ne 0 ] && [ "$l_group" != "shadow" ] 2>/dev/null; then
  l_output2="$l_output2 $l_file group is $l_group. Required: root or shadow."
 else
  l_output="$l_output Group is $l_group (compliant)."
 fi
 if [ -z "$l_output2" ]; then
  echo "System Maintenance / System File Permissions" >> p1
  echo "Ensure access to /etc/shadow is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "7.1.5" >> p12
 else
  echo "System Maintenance / System File Permissions" >> p1
  echo "Ensure access to /etc/shadow is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "7.1.5" >> p12
 fi
}

#7.1.6
#Ensure access to /etc/shadow- is configured.
{
 l_output="" l_output2=""
 l_file="/etc/shadow-"
 l_mode="$(stat -Lc '%#a' $l_file 2>/dev/null)"
 l_uid="$(stat -Lc '%u' $l_file 2>/dev/null)"
 l_gid="$(stat -Lc '%g' $l_file 2>/dev/null)"
 l_owner="$(stat -Lc '%U' $l_file 2>/dev/null)"
 l_group="$(stat -Lc '%G' $l_file 2>/dev/null)"
 if [ $(( l_mode & 0137 )) -gt 0 ] 2>/dev/null; then
  l_output2="$l_output2 $l_file mode is $l_mode. Required: 0640 or more restrictive."
 else
  l_output="$l_output $l_file mode is $l_mode (compliant)."
 fi
 if [ "$l_uid" -ne 0 ] 2>/dev/null; then
  l_output2="$l_output2 $l_file owner is $l_owner. Required: root."
 else
  l_output="$l_output Owner is root (compliant)."
 fi
 if [ "$l_gid" -ne 0 ] && [ "$l_group" != "shadow" ] 2>/dev/null; then
  l_output2="$l_output2 $l_file group is $l_group. Required: root or shadow."
 else
  l_output="$l_output Group is $l_group (compliant)."
 fi
 if [ -z "$l_output2" ]; then
  echo "System Maintenance / System File Permissions" >> p1
  echo "Ensure access to /etc/shadow- is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "7.1.6" >> p12
 else
  echo "System Maintenance / System File Permissions" >> p1
  echo "Ensure access to /etc/shadow- is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "7.1.6" >> p12
 fi
}

#7.1.7
#Ensure access to /etc/gshadow is configured.
{
 l_output="" l_output2=""
 l_file="/etc/gshadow"
 l_mode="$(stat -Lc '%#a' $l_file 2>/dev/null)"
 l_uid="$(stat -Lc '%u' $l_file 2>/dev/null)"
 l_gid="$(stat -Lc '%g' $l_file 2>/dev/null)"
 l_owner="$(stat -Lc '%U' $l_file 2>/dev/null)"
 l_group="$(stat -Lc '%G' $l_file 2>/dev/null)"
 if [ $(( l_mode & 0137 )) -gt 0 ] 2>/dev/null; then
  l_output2="$l_output2 $l_file mode is $l_mode. Required: 0640 or more restrictive."
 else
  l_output="$l_output $l_file mode is $l_mode (compliant)."
 fi
 if [ "$l_uid" -ne 0 ] 2>/dev/null; then
  l_output2="$l_output2 $l_file owner is $l_owner. Required: root."
 else
  l_output="$l_output Owner is root (compliant)."
 fi
 if [ "$l_gid" -ne 0 ] && [ "$l_group" != "shadow" ] 2>/dev/null; then
  l_output2="$l_output2 $l_file group is $l_group. Required: root or shadow."
 else
  l_output="$l_output Group is $l_group (compliant)."
 fi
 if [ -z "$l_output2" ]; then
  echo "System Maintenance / System File Permissions" >> p1
  echo "Ensure access to /etc/gshadow is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "7.1.7" >> p12
 else
  echo "System Maintenance / System File Permissions" >> p1
  echo "Ensure access to /etc/gshadow is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "7.1.7" >> p12
 fi
}

#7.1.8
#Ensure access to /etc/gshadow- is configured.
{
 l_output="" l_output2=""
 l_file="/etc/gshadow-"
 l_mode="$(stat -Lc '%#a' $l_file 2>/dev/null)"
 l_uid="$(stat -Lc '%u' $l_file 2>/dev/null)"
 l_gid="$(stat -Lc '%g' $l_file 2>/dev/null)"
 l_owner="$(stat -Lc '%U' $l_file 2>/dev/null)"
 l_group="$(stat -Lc '%G' $l_file 2>/dev/null)"
 if [ $(( l_mode & 0137 )) -gt 0 ] 2>/dev/null; then
  l_output2="$l_output2 $l_file mode is $l_mode. Required: 0640 or more restrictive."
 else
  l_output="$l_output $l_file mode is $l_mode (compliant)."
 fi
 if [ "$l_uid" -ne 0 ] 2>/dev/null; then
  l_output2="$l_output2 $l_file owner is $l_owner. Required: root."
 else
  l_output="$l_output Owner is root (compliant)."
 fi
 if [ "$l_gid" -ne 0 ] && [ "$l_group" != "shadow" ] 2>/dev/null; then
  l_output2="$l_output2 $l_file group is $l_group. Required: root or shadow."
 else
  l_output="$l_output Group is $l_group (compliant)."
 fi
 if [ -z "$l_output2" ]; then
  echo "System Maintenance / System File Permissions" >> p1
  echo "Ensure access to /etc/gshadow- is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "7.1.8" >> p12
 else
  echo "System Maintenance / System File Permissions" >> p1
  echo "Ensure access to /etc/gshadow- is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "7.1.8" >> p12
 fi
}

#7.1.9
#Ensure access to /etc/shells is configured.
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
  l_output2="$l_output2 $l_file owner is $l_owner. Required: root."
 else
  l_output="$l_output Owner is root (compliant)."
 fi
 if [ "$l_gid" -ne 0 ] 2>/dev/null; then
  l_output2="$l_output2 $l_file group is $l_group. Required: root."
 else
  l_output="$l_output Group is root (compliant)."
 fi
 if [ -z "$l_output2" ]; then
  echo "System Maintenance / System File Permissions" >> p1
  echo "Ensure access to /etc/shells is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "7.1.9" >> p12
 else
  echo "System Maintenance / System File Permissions" >> p1
  echo "Ensure access to /etc/shells is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "7.1.9" >> p12
 fi
}

#7.1.10
#Ensure access to /etc/security/opasswd is configured.
{
 l_output="" l_output2=""
 for l_file in /etc/security/opasswd /etc/security/opasswd.old; do
  if [ -f "$l_file" ]; then
   l_mode="$(stat -Lc '%#a' $l_file 2>/dev/null)"
   l_uid="$(stat -Lc '%u' $l_file 2>/dev/null)"
   l_gid="$(stat -Lc '%g' $l_file 2>/dev/null)"
   l_owner="$(stat -Lc '%U' $l_file 2>/dev/null)"
   l_group="$(stat -Lc '%G' $l_file 2>/dev/null)"
   if [ $(( l_mode & 0177 )) -gt 0 ] 2>/dev/null; then
    l_output2="$l_output2 $l_file mode is $l_mode. Required: 0600 or more restrictive."
   else
    l_output="$l_output $l_file mode is $l_mode (compliant)."
   fi
   if [ "$l_uid" -ne 0 ] 2>/dev/null; then
    l_output2="$l_output2 $l_file owner is $l_owner. Required: root."
   else
    l_output="$l_output $l_file owner is root (compliant)."
   fi
   if [ "$l_gid" -ne 0 ] 2>/dev/null; then
    l_output2="$l_output2 $l_file group is $l_group. Required: root."
   else
    l_output="$l_output $l_file group is root (compliant)."
   fi
  fi
 done
 if [ -z "$l_output" ] && [ -z "$l_output2" ]; then
  l_output="Neither /etc/security/opasswd nor /etc/security/opasswd.old exist (compliant)."
 fi
 if [ -z "$l_output2" ]; then
  echo "System Maintenance / System File Permissions" >> p1
  echo "Ensure access to /etc/security/opasswd is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "7.1.10" >> p12
 else
  echo "System Maintenance / System File Permissions" >> p1
  echo "Ensure access to /etc/security/opasswd is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "7.1.10" >> p12
 fi
}

#7.1.11
#Ensure world writable files and directories are secured.
{
 l_output2=""
 l_ww_files="$(df --local -P 2>/dev/null | awk 'NR!=1{print $6}' | xargs -I{} find {} -xdev -type f -perm -0002 2>/dev/null | tr '\n' ' ')"
 l_ww_dirs="$(df --local -P 2>/dev/null | awk 'NR!=1{print $6}' | xargs -I{} find {} -xdev -type d -perm -0002 ! -perm -1000 2>/dev/null | tr '\n' ' ')"
 [ -n "$l_ww_files" ] && l_output2="$l_output2 World writable files found: $l_ww_files"
 [ -n "$l_ww_dirs" ] && l_output2="$l_output2 World writable directories without sticky bit: $l_ww_dirs"
 if [ -z "$l_output2" ]; then
  echo "System Maintenance / System File Permissions" >> p1
  echo "Ensure world writable files and directories are secured." >> p2
  echo "No world writable files or directories without sticky bit found." >> p3
  echo "Yes" >> p4
  echo "7.1.11" >> p12
 else
  echo "System Maintenance / System File Permissions" >> p1
  echo "Ensure world writable files and directories are secured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "7.1.11" >> p12
 fi
}


#7.1.12
#Ensure no files or directories without an owner and a group exist.
{
 l_output2=""
 l_nouser="$(df --local -P 2>/dev/null | awk 'NR!=1{print $6}' | xargs -I{} find {} -xdev -nouser 2>/dev/null | tr '\n' ' ')"
 l_nogroup="$(df --local -P 2>/dev/null | awk 'NR!=1{print $6}' | xargs -I{} find {} -xdev -nogroup 2>/dev/null | tr '\n' ' ')"
 [ -n "$l_nouser" ] && l_output2="$l_output2 Files/directories without an owner found: $l_nouser"
 [ -n "$l_nogroup" ] && l_output2="$l_output2 Files/directories without a group found: $l_nogroup"
 if [ -z "$l_output2" ]; then
  echo "System Maintenance / System File Permissions" >> p1
  echo "Ensure no files or directories without an owner and a group exist." >> p2
  echo "No unowned or ungrouped files or directories found." >> p3
  echo "Yes" >> p4
  echo "7.1.12" >> p12
 else
  echo "System Maintenance / System File Permissions" >> p1
  echo "Ensure no files or directories without an owner and a group exist." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "7.1.12" >> p12
 fi
}

############################################################################################
#7.2.1
#Ensure accounts in /etc/passwd use shadowed passwords.

filepw="/etc/passwd"
# Check if file exists
if [ -f "$filepw" ]; then
    # Check if all accounts use shadowed passwords
    unshadowed_accounts=$(awk -F: '($2 != "x" ) { print $1 }' "$filepw")
    if [ -z "$unshadowed_accounts" ]; then
		echo "System Maintenance / Local User and Group Settings" >> p1
		echo "Ensure accounts in /etc/passwd use shadowed passwords." >>p2
		echo "All accounts in /etc/passwd use shadowed passwords" >>p3
		echo "Yes" >> p4
		echo "7.2.1" >> p12
    else
		echo "System Maintenance / Local User and Group Settings" >> p1
		echo "Ensure accounts in /etc/passwd use shadowed passwords." >>p2
		echo "accounts do not use shadowed passwords: $unshadowed_accounts" >> p3
		echo "No" >> p4
		echo "7.2.1">>p12
    fi
else
	echo "System Maintenance / Local User and Group Settings" >> p1
	echo "Ensure accounts in /etc/passwd use shadowed passwords." >>p2
	echo "$filepw does not exist." >> p3
	echo "No" >> p4
	echo "7.2.1">>p12
fi

#7.2.2
#Ensure /etc/shadow password fields are not empty.

filepws="/etc/shadow"
if [ -f "$filepws" ]; then
    # Check if all accounts use shadowed passwords
    unshadowed_acc=$(awk -F: '($2 == "" ) { print $1 }' "$filepws")
    if [ -z "$unshadowed_acc" ]; then
		echo "System Maintenance / Local User and Group Settings" >> p1
		echo "Ensure /etc/shadow password fields are not empty." >>p2
		echo "All accounts in /etc/shadow password fields are not empty" >>p3
		echo "Yes" >> p4
		echo "7.2.2" >> p12
    else
		echo "System Maintenance / Local User and Group Settings" >> p1
		echo "Ensure /etc/shadow password fields are not empty." >>p2
		echo "accounts password fields are empty: $unshadowed_acc." >> p3
		echo "No" >> p4
		echo "7.2.2">>p12
    fi
else
	echo "System Maintenance / Local User and Group Settings" >> p1
	echo "Ensure /etc/shadow password fields are not empty." >>p2
	echo "$filepws does not exist." >> p3
	echo "No" >> p4
	echo "7.2.2">>p12
fi

#7.2.3
#Ensure all groups in /etc/passwd exist in /etc/group.

{
 l_output2=""
 for i in $(cut -s -d: -f4 /etc/passwd | sort -u); do
  if ! grep -q -P "^.*?:[^:]*:$i:" /etc/group; then
   l_output2="$l_output2 Group $i is referenced by /etc/passwd but does not exist in /etc/group."
  fi
 done
 if [ -z "$l_output2" ]; then
  echo "System Maintenance / Local User and Group Settings" >> p1
  echo "Ensure all groups in /etc/passwd exist in /etc/group." >>p2
  echo "All groups in /etc/passwd exist in /etc/group." >>p3
  echo "Yes" >> p4
  echo "7.2.3" >> p12
 else
  echo "System Maintenance / Local User and Group Settings" >> p1
  echo "Ensure all groups in /etc/passwd exist in /etc/group." >>p2
  echo "$l_output2" >>p3
  echo "No" >> p4
  echo "7.2.3" >> p12
 fi
}



#7.2.4
#Ensure shadow group is empty.

shadow_group_members=$(awk -F: '($1=="shadow") {print $NF}' /etc/group)
# Get the GID of the shadow group
shadow_group_gid=$(awk -F: '($1=="shadow") {print $3}' /etc/group)
# Get the users in /etc/passwd whose GID matches the shadow group's GID
shadow_group_users=$(awk -F: -v GID="$shadow_group_gid" '($4==GID) {print $1}' /etc/passwd)
# Check if the shadow group is empty
if [[ -z "$shadow_group_members" && -z "$shadow_group_users" ]]; then
	echo "System Maintenance / Local User and Group Settings" >> p1
    echo "Ensure shadow group is empty." >> p2
    echo "The shadow group is empty." >> p3
    echo "Yes" >> p4
	echo "7.2.4" >> p12
else
	echo "System Maintenance / Local User and Group Settings" >> p1
    echo "Ensure shadow group is empty." >> p2
    echo "The shadow group is not empty." >> p3
    echo "No" >> p4
	echo "7.2.4" >> p12
fi

#7.2.5
#Ensure no duplicate UIDs exist.

{
 l_output2=""
 while read -r l_count l_uid; do
  if [ "$l_count" -gt 1 ]; then
   l_users="$(awk -F: -v u="$l_uid" '($3==u){print $1}' /etc/passwd | xargs)"
   l_output2="$l_output2 Duplicate UID ($l_uid): $l_users."
  fi
 done < <(cut -f3 -d":" /etc/passwd | sort -n | uniq -c)
 if [ -z "$l_output2" ]; then
  echo "System Maintenance / Local User and Group Settings" >> p1
  echo "Ensure no duplicate UIDs exist." >>p2
  echo "No duplicate UIDs exist." >>p3
  echo "Yes" >> p4
  echo "7.2.5" >> p12
 else
  echo "System Maintenance / Local User and Group Settings" >> p1
  echo "Ensure no duplicate UIDs exist." >>p2
  echo "$l_output2" >>p3
  echo "No" >> p4
  echo "7.2.5" >> p12
 fi
}

#7.2.6
#Ensure no duplicate GIDs exist.

{
 l_output2=""
 if [ -f "/etc/group" ]; then
  declare -A _chk_gids
  while IFS=: read -r l_gname l_pass l_gid l_rest; do
   if [[ -n "${_chk_gids[$l_gid]}" ]]; then
    l_output2="$l_output2 Duplicate GID $l_gid found for group $l_gname."
   fi
   _chk_gids[$l_gid]=1
  done < /etc/group
  unset _chk_gids
 else
  l_output2="$l_output2 /etc/group does not exist."
 fi
 if [ -z "$l_output2" ]; then
  echo "System Maintenance / Local User and Group Settings" >> p1
  echo "Ensure no duplicate GIDs exist." >>p2
  echo "No duplicate GIDs found in /etc/group." >>p3
  echo "Yes" >> p4
  echo "7.2.6" >> p12
 else
  echo "System Maintenance / Local User and Group Settings" >> p1
  echo "Ensure no duplicate GIDs exist." >>p2
  echo "$l_output2" >>p3
  echo "No" >> p4
  echo "7.2.6" >> p12
 fi
}

#7.2.7
#Ensure no duplicate user names exist.

{
 l_output2=""
 if [ -f "/etc/passwd" ]; then
  declare -A _chk_unames
  while IFS=: read -r l_uname l_rest; do
   if [[ -n "${_chk_unames[$l_uname]}" ]]; then
    l_output2="$l_output2 Duplicate login name $l_uname found in /etc/passwd."
   fi
   _chk_unames[$l_uname]=1
  done < /etc/passwd
  unset _chk_unames
 else
  l_output2="$l_output2 /etc/passwd does not exist."
 fi
 if [ -z "$l_output2" ]; then
  echo "System Maintenance / Local User and Group Settings" >> p1
  echo "Ensure no duplicate user names exist." >>p2
  echo "No duplicate login names found in /etc/passwd." >>p3
  echo "Yes" >> p4
  echo "7.2.7" >> p12
 else
  echo "System Maintenance / Local User and Group Settings" >> p1
  echo "Ensure no duplicate user names exist." >>p2
  echo "$l_output2" >>p3
  echo "No" >> p4
  echo "7.2.7" >> p12
 fi
}

#7.2.8
#Ensure no duplicate group names exist.

{
 l_output2=""
 if [ -f "/etc/group" ]; then
  declare -A _chk_gnames
  while IFS=: read -r l_gname l_rest; do
   if [[ -n "${_chk_gnames[$l_gname]}" ]]; then
    l_output2="$l_output2 Duplicate group name $l_gname found in /etc/group."
   fi
   _chk_gnames[$l_gname]=1
  done < /etc/group
  unset _chk_gnames
 else
  l_output2="$l_output2 /etc/group does not exist."
 fi
 if [ -z "$l_output2" ]; then
  echo "System Maintenance / Local User and Group Settings" >> p1
  echo "Ensure no duplicate group names exist." >>p2
  echo "No duplicate group names found in /etc/group." >>p3
  echo "Yes" >> p4
  echo "7.2.8" >> p12
 else
  echo "System Maintenance / Local User and Group Settings" >> p1
  echo "Ensure no duplicate group names exist." >>p2
  echo "$l_output2" >>p3
  echo "No" >> p4
  echo "7.2.8" >> p12
 fi
}


#7.2.9
#Ensure local interactive user home directories are configured.
{
 l_output="" l_output2=""
 l_perm_mask="0027"
 l_maxperm="$(printf '%o' $(( 0777 & ~$l_perm_mask )))"
 l_valid_shells="^($( sed -rn '/^\//{ s,/,\\\\/,g; p }' /etc/shells | paste -s -d'|' - ))$"
 while IFS= read -r l_user l_home; do
  if [ ! -d "$l_home" ]; then
   l_output2="$l_output2 User $l_user: home $l_home does not exist."
   continue
  fi
  l_owner="$(stat -Lc '%U' "$l_home" 2>/dev/null)"
  [ "$l_owner" != "$l_user" ] && l_output2="$l_output2 User $l_user: home $l_home owned by $l_owner (required: $l_user)."
  l_mode="$(stat -Lc '%#a' "$l_home" 2>/dev/null)"
  [ $(( l_mode & l_perm_mask )) -gt 0 ] 2>/dev/null && l_output2="$l_output2 User $l_user: home $l_home mode $l_mode (required: $l_maxperm or more restrictive)."
 done < <(awk -v pat="$l_valid_shells" -F: '$(NF) ~ pat { print $1" "$(NF-1) }' /etc/passwd)
 l_output2="$(echo "$l_output2" | tr '\n' ' ' | tr '|' '/' | tr -s ' ')"
 if [ -z "$l_output2" ]; then
  echo "System Maintenance / Local User and Group Settings" >> p1
  echo "Ensure local interactive user home directories are configured." >> p2
  echo "All local interactive user home directories are configured correctly." >> p3
  echo "Yes" >> p4
  echo "7.2.9" >> p12
 else
  echo "System Maintenance / Local User and Group Settings" >> p1
  echo "Ensure local interactive user home directories are configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "7.2.9" >> p12
 fi
}

#7.2.10
#Ensure local interactive user dot files access is configured.
{
 l_output="" l_output2=""
 l_perm_mask="0133"
 l_maxperm="$(printf '%o' $((0777 & ~$l_perm_mask)))"
 while IFS= read -r l_user l_home; do
  [ -d "$l_home" ] || continue
  l_group="$(id -gn "$l_user" 2>/dev/null)"
  while IFS= read -r l_hdfile; do
   l_fname="$(basename "$l_hdfile")"
   case "$l_fname" in
    .forward|.rhosts)
     l_output2="$l_output2 - User \"$l_user\" Home: \"$l_home\": \"$l_fname\" exists."
     ;;
    .netrc)
     l_mode="$(stat -Lc '%#a' "$l_hdfile" 2>/dev/null)"
     l_owner="$(stat -Lc '%U' "$l_hdfile" 2>/dev/null)"
     l_grpowner="$(stat -Lc '%G' "$l_hdfile" 2>/dev/null)"
     [ $(( $l_mode & 0177 )) -gt 0 ] && l_output2="$l_output2 - User \"$l_user\": \"$l_hdfile\" mode \"$l_mode\" (required: 0600 or more restrictive)."
     [ "$l_owner" != "$l_user" ] && l_output2="$l_output2 - User \"$l_user\": \"$l_hdfile\" owned by \"$l_owner\" (required: $l_user)."
     [ "$l_grpowner" != "$l_group" ] && l_output2="$l_output2 - User \"$l_user\": \"$l_hdfile\" group owned by \"$l_grpowner\" (required: $l_group)."
     ;;
    .bash_history)
     l_mode="$(stat -Lc '%#a' "$l_hdfile" 2>/dev/null)"
     l_owner="$(stat -Lc '%U' "$l_hdfile" 2>/dev/null)"
     [ $(( $l_mode & 0177 )) -gt 0 ] && l_output2="$l_output2 - User \"$l_user\": \"$l_hdfile\" mode \"$l_mode\" (required: 0600 or more restrictive)."
     [ "$l_owner" != "$l_user" ] && l_output2="$l_output2 - User \"$l_user\": \"$l_hdfile\" owned by \"$l_owner\" (required: $l_user)."
     ;;
    .*)
     l_mode="$(stat -Lc '%#a' "$l_hdfile" 2>/dev/null)"
     l_owner="$(stat -Lc '%U' "$l_hdfile" 2>/dev/null)"
     l_grpowner="$(stat -Lc '%G' "$l_hdfile" 2>/dev/null)"
     [ $(( $l_mode & $l_perm_mask )) -gt 0 ] && l_output2="$l_output2 - User \"$l_user\": \"$l_hdfile\" mode \"$l_mode\" (required: $l_maxperm or more restrictive)."
     [ "$l_owner" != "$l_user" ] && l_output2="$l_output2 - User \"$l_user\": \"$l_hdfile\" owned by \"$l_owner\" (required: $l_user)."
     [ "$l_grpowner" != "$l_group" ] && l_output2="$l_output2 - User \"$l_user\": \"$l_hdfile\" group owned by \"$l_grpowner\" (required: $l_group)."
     ;;
   esac
  done < <(find "$l_home" -maxdepth 1 -name '.*' -type f -print 2>/dev/null)
 done < <(awk -F: '($3>=1000 && $3!=65534) {print $1, $6}' /etc/passwd)
 if [ -z "$l_output2" ]; then
  echo "System Maintenance / Local User and Group Settings" >> p1
  echo "Ensure local interactive user dot files access is configured." >> p2
  echo "Local interactive user dot files access is configured correctly." >> p3
  echo "Yes" >> p4
  echo "7.2.10" >> p12
 else
  echo "System Maintenance / Local User and Group Settings" >> p1
  echo "Ensure local interactive user dot files access is configured." >> p2
  echo "Local interactive user dot files access issues found: $l_output2" >> p3
  echo "No" >> p4
  echo "7.2.10" >> p12
 fi
}

#########################################################################################################
# End of Parameter
#########################################################################################################

# Get current date, OS version, and scan version
current_date=$(date +%Y-%m-%d)
os_version=$(grep PRETTY_NAME /etc/os-release | cut -d '=' -f 2- | tr -d '"' | tr ' ' '_')
scan_version="V1.0"  # replace with command or variable that gets your scan version

# Generate filename
filename=$(hostname)_${os_version}-scan_${scan_version}_${current_date}.csv

techSpecVersion="1.0.0"
scanDate=$(date +%Y-%m-%d)
fqdn=$(hostname --fqdn)
ipAddress=$(ip addr show eth0 | grep inet | awk '{print $2}' | head -n 1)
osName=$(grep PRETTY_NAME /etc/os-release | cut -d '=' -f 2- | tr -d '"' | tr ' ' '_')
timestamp=$(date +%T)

# Generate report
echo -e "FQDN:$fqdn \nACCOUNT:$accountName \nACCOUNT BAMID:$accountBAMID \nCIS Benchmark Version: $techSpecVersion \nScan Date: $scanDate \nTime-Stamp: $timestamp \nIP-ADDRESS:$ipAddress \nOS-NAME: $osName \nScan Version: $scan_version \n********************************************************" > $filename
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
rm -rf temp_shadow temp_shadow1 temp1_shadow temp_shadow2 temp_shadow3 temp-ud psw_temp temp_uid temp_uid1 temp_gid temp_gid1 pasd_temp en1 en2 en3 en4  p4 p3 p2 p1 p12 f1 t1 temp_pam.so world-writable-test log_file1 temp_id file1 ff2 temp_home user
