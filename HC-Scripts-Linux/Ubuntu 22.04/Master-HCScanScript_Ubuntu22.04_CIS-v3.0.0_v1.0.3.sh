#!/bin/bash

# Re-exec with bash if run under sh/dash
if [ -z "$BASH_VERSION" ]; then
    exec bash "$0" "$@"
fi
#########################################################################################################
# Author   : Sailen Roy & Ayushman Arora  
# Email    : Sailen.Roy@kyndryl.com & Ayushman.Arora@kyndryl.com
# Modified by: 
# Reviewed by: 
# Platform : Ubuntu 22.04
# Script   : Shell script
# Title    : Security Health Check Scan Script for Ubuntu Linux-22.04 - CIS Benchmark_v3.0.0
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


#1.1.1.11
#Ensure firewire-core kernel module is not available.
#!/usr/bin/env bash

{
 l_output="" l_output2=""
 l_mname="firewire-core"
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
  echo "Ensure firewire-core kernel module is not available." >> p2
  echo "firewire-core kernel module is not available." >> p3
  echo "Yes" >> p4
  echo "1.1.1.11" >> p12
 else
  echo "Initial Setup / Configure Filesystem Kernel Modules" >> p1
  echo "Ensure firewire-core kernel module is not available." >> p2
  echo "firewire-core kernel module is available or loadable." >> p3
  echo "No" >> p4
  echo "1.1.1.11" >> p12
 fi
}

######################################################################################################

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
	echo "Initial Setup / Configure Filesystem Kernel Modules" >> p1
  	echo "Ensure nodev option set on /dev/shm partition." >> p2
  	echo "nodev option is not set for /dev/shm mount." >> p3
  	echo "No" >> p4
	echo "1.1.2.2.2" >> p12
else
	echo "Initial Setup / Configure Filesystem Kernel Modules" >> p1
  	echo "Ensure nodev option set on /dev/shm partition." >> p2
  	echo "nodev option is set for /dev/shm mount." >> p3
  	echo "Yes" >> p4
  	echo "1.1.2.2.2" >> p12
fi

#1.1.2.2.3
#Ensure nosuid option set on /dev/shm partition.
devshm_nosuid=$(findmnt --kernel /dev/shm| grep nosuid)
if [[ -z "$devshm_nosuid" ]]; then
	echo "Initial Setup / Configure Filesystem Kernel Modules" >> p1
  	echo "Ensure nosuid option set on /dev/shm partition." >> p2
  	echo "nosuid option is not set for /dev/shm mount." >> p3
  	echo "No" >> p4
	echo "1.1.2.2.3" >> p12
else
	echo "Initial Setup / Configure Filesystem Kernel Modules" >> p1
  	echo "Ensure nosuid option set on /dev/shm partition." >> p2
  	echo "nosuid option is set for /dev/shm mount." >> p3
  	echo "Yes" >> p4
  	echo "1.1.2.2.3" >> p12
fi

#1.1.2.2.4
#Ensure noexec option set on /dev/shm partition.
devshm_noexec=$(findmnt --kernel /dev/shm| grep noexec)
if [[ -z "$devshm_noexec" ]]; then
	echo "Initial Setup / Configure Filesystem Kernel Modules" >> p1
  	echo "Ensure noexec option set on /dev/shm partition." >> p2
  	echo "noexec option is not set for /dev/shm mount." >> p3
  	echo "No" >> p4
	echo "1.1.2.2.4" >> p12
else
	echo "Initial Setup / Configure Filesystem Kernel Modules" >> p1
  	echo "Ensure noexec option set on /dev/shm partition." >> p2
  	echo "noexec option is set for /dev/shm mount." >> p3
  	echo "Yes" >> p4
  	echo "1.1.2.2.4" >> p12
fi

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

######################################################################################################

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
#Ensure all AppArmor Profiles are not disabled.
#!/usr/bin/env bash

{
 l_output="" l_output2=""

 # Check 1: Profiles loaded and in enforce or complain mode
 l_loaded="$(apparmor_status 2>/dev/null | grep 'profiles are loaded' | awk '{print $1}')"

 if [ -n "$l_loaded" ] && [ "$l_loaded" -gt 0 ]; then
  l_output="$l_output Profiles loaded: $l_loaded."
 else
  l_output2="$l_output2 No AppArmor profiles are loaded."
 fi

 # Check 2: No unconfined processes
 l_unconfined="$(apparmor_status 2>/dev/null | grep 'processes are unconfined' | awk '{print $1}')"

 if [ -n "$l_unconfined" ] && [ "$l_unconfined" -gt 0 ]; then
  l_output2="$l_output2 $l_unconfined unconfined process(es) found."
 else
  l_output="$l_output No unconfined processes found."
 fi

 if [ -z "$l_output2" ]; then
  echo "Initial Setup / Mandatory Access Control" >> p1
  echo "Ensure all AppArmor Profiles are not disabled." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "1.3.1.3" >> p12
 else
  echo "Initial Setup / Mandatory Access Control" >> p1
  echo "Ensure all AppArmor Profiles are not disabled." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "1.3.1.3" >> p12
 fi
}
#########################################################################################################

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
  echo "Secure Initial Setup / Configure Bootloader" >> p1
  echo "Ensure bootloader password is set." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "1.4.1" >> p12
 else
  echo "Secure Initial Setup / Configure Bootloader" >> p1
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

#########################################################################################################

#1.5.1
#Ensure randomize_va_space is configured.
#!/usr/bin/env bash

{
 l_output="" l_output2=""
 l_parameter_name="kernel.randomize_va_space"
 l_expected="2"

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
  echo "Ensure randomize_va_space is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "1.5.1" >> p12
 else
  echo "Initial Setup / Configure Additional Process Hardening" >> p1
  echo "Ensure randomize_va_space is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "1.5.1" >> p12
 fi
}

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
#Ensure suid_dumpable is configured.
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
  echo "Ensure suid_dumpable is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "1.5.3" >> p12
 else
  echo "Initial Setup / Configure Additional Process Hardening" >> p1
  echo "Ensure suid_dumpable is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "1.5.3" >> p12
 fi
}

#1.5.4
#Ensure core file size is configured.
#!/usr/bin/env bash

{
 l_output="" l_output2=""

 # Check: hard limit for core set to 0 for all users
 l_core="$(grep -Psi -- '^\h*\*\h*hard\h+core\b' /etc/security/limits.conf \
  /etc/security/limits.d/* 2>/dev/null)"

 if [ -n "$l_core" ]; then
  l_bad="$(echo "$l_core" | awk '{print $NF}' | grep -v '^0$')"
  if [ -z "$l_bad" ]; then
   l_output="$l_output hard core limit set to 0 in limits config."
  else
   l_output2="$l_output2 hard core limit set to value greater than 0: $l_bad"
  fi
 else
  l_output2="$l_output2 No hard core limit found in /etc/security/limits.conf or limits.d/."
 fi

 if [ -z "$l_output2" ]; then
  echo "Initial Setup / Configure Additional Process Hardening" >> p1
  echo "Ensure core file size is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "1.5.4" >> p12
 else
  echo "Initial Setup / Configure Additional Process Hardening" >> p1
  echo "Ensure core file size is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "1.5.4" >> p12
 fi
}

#1.5.5
#Ensure prelink is not installed.
otp18=$(dpkg-query -W -f='${binary:Package}\t${Status}\t${db:Status-Status}\n' prelink)
if echo "$otp18" | grep -q 'installed'; then
	echo "Initial Setup / Configure Additional Process Hardening" >> p1
  	echo "Ensure prelink is not installed." >> p2
  	echo "prelink is installed." >> p3
  	echo "No" >> p4
  	echo "1.5.5" >> p12
else
	echo "Initial Setup / Configure Additional Process Hardening" >> p1
  	echo "Ensure prelink is not installed." >> p2
  	echo "prelink is not installed." >> p3
  	echo "Yes" >> p4
	echo "1.5.5" >> p12
fi

#1.5.6
#Ensure Automatic Error Reporting is configured.
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
  echo "Ensure Automatic Error Reporting is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "1.5.6" >> p12
 else
  echo "Initial Setup / Configure Additional Process Hardening" >> p1
  echo "Ensure Automatic Error Reporting is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "1.5.6" >> p12
 fi
}

##########################################################################################################

#1.6.1
#Ensure /etc/motd is configured.
#!/usr/bin/env bash

{
 l_output="" l_output2=""
 a_files=()

 for l_file in /etc/motd /etc/motd.d/*; do
  [ -f "$l_file" ] || continue
  if grep -Psqi -- "(\\\v|\\\r|\\\m|\\\s|$(grep '^ID=' /etc/os-release | \
   cut -d= -f2 | sed -e 's/^"//' -e 's/"$//g'))" "$l_file"; then
   l_output2="$l_output2 File: \"$l_file\" includes system information."
  else
   a_files+=("$l_file")
  fi
 done

 if [ "${#a_files[@]}" -gt 0 ]; then
  l_output="$l_output MOTD files with no system info: $(printf '%s ' "${a_files[@]}")"
 fi

 if [ -z "$l_output2" ]; then
  if [ -z "$l_output" ]; then
   l_output="No MOTD files found - conforms to local site policy."
  fi
  echo "Initial Setup / Configure Command Line Warning Banners" >> p1
  echo "Ensure /etc/motd is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "1.6.1" >> p12
 else
  echo "Initial Setup / Configure Command Line Warning Banners" >> p1
  echo "Ensure /etc/motd is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "1.6.1" >> p12
 fi
}

#1.6.2
#Ensure /etc/issue is configured.
#!/usr/bin/env bash

{
 l_output="" l_output2=""

 if [ -f /etc/issue ]; then
  if grep -Psqi -- "(\\\v|\\\r|\\\m|\\\s|$(grep '^ID=' /etc/os-release | \
   cut -d= -f2 | sed -e 's/^"//' -e 's/"$//g'))" /etc/issue; then
   l_output2="$l_output2 /etc/issue includes system information."
  else
   l_output="$l_output /etc/issue exists and contains no system information."
  fi
 else
  l_output2="$l_output2 /etc/issue does not exist."
 fi

 if [ -z "$l_output2" ]; then
  echo "Initial Setup / Configure Command Line Warning Banners" >> p1
  echo "Ensure /etc/issue is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "1.6.2" >> p12
 else
  echo "Initial Setup / Configure Command Line Warning Banners" >> p1
  echo "Ensure /etc/issue is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "1.6.2" >> p12
 fi
}

#1.6.3
#Ensure /etc/issue.net is configured.
#!/usr/bin/env bash

{
 l_output="" l_output2=""

 if [ -f /etc/issue.net ]; then
  if grep -Psqi -- "(\\\v|\\\r|\\\m|\\\s|$(grep '^ID=' /etc/os-release | \
   cut -d= -f2 | sed -e 's/^"//' -e 's/"$//g'))" /etc/issue.net; then
   l_output2="$l_output2 /etc/issue.net includes system information."
  else
   l_output="$l_output /etc/issue.net exists and contains no system information."
  fi
 else
  l_output2="$l_output2 /etc/issue.net does not exist."
 fi

 if [ -z "$l_output2" ]; then
  echo "Initial Setup / Configure Command Line Warning Banners" >> p1
  echo "Ensure /etc/issue.net is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "1.6.3" >> p12
 else
  echo "Initial Setup / Configure Command Line Warning Banners" >> p1
  echo "Ensure /etc/issue.net is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "1.6.3" >> p12
 fi
}

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

######################################################################################################

# 1.7.2
# Ensure GDM login banner is configured
{
output=""
status=""

# Check whether GDM is installed
if ! dpkg-query -W -f='${Status}\n' gdm3 2>/dev/null | grep -q "install ok installed"; then

    output="GNOME Display Manager (GDM) is not installed. Control is Not Applicable"
    status="Not Applicable"
else
    # Verify that a GDM dconf profile exists
    if ! grep -Psiq "user-db|system-db" /etc/dconf/profile/* 2>/dev/null; then

        output="GDM is installed but no dconf profile exists. Control is Not Applicable"
        status="Not Applicable"
    else
        #########################################################
        # Check GDM banner settings using gsettings
        #########################################################
        if gsettings list-schemas 2>/dev/null | grep -qx "org.gnome.login-screen"; then
            banner_enable=$(gsettings get org.gnome.login-screen banner-message-enable 2>/dev/null)
            banner_text=$(gsettings get org.gnome.login-screen banner-message-text 2>/dev/null)
        else
            banner_enable=""
            banner_text=""
        fi
        #########################################################
        # Compliance Evaluation
        #########################################################
        if [[ "$banner_enable" == "true" ]] && \
           [[ -n "$banner_text" ]] && \
           [[ "$banner_text" != "''" ]]; then
            output="GDM login banner is enabled and configured. Banner message: $banner_text"
            status="Yes"
        elif [[ "$banner_enable" != "true" ]]; then
            output="GDM login banner is not enabled."
            status="No"
        else
            output="GDM login banner is enabled but banner message text is not configured"
            status="No"
        fi
    fi
fi

echo "Initial Setup / Configure GNOME Display Manager" >> p1
echo "Ensure GDM login banner is configured" >> p2
echo "$output" >> p3
echo "$status" >> p4
echo "1.7.2" >> p12
}

# 1.7.3
# Ensure GDM disable-user-list option is enabled
{
output=""
status=""
# Check whether GDM is installed
if ! dpkg-query -W -f='${Status}\n' gdm3 2>/dev/null | grep -q "install ok installed"; then
    output="GNOME Display Manager (GDM) is not installed. Control is Not Applicable"
    status="Not Applicable"
else
    # Verify that a GDM dconf profile exists
    if ! grep -Psiq "user-db|system-db" /etc/dconf/profile/* 2>/dev/null; then
        output="GDM is installed but no dconf profile exists. Control is Not Applicable"
        status="Not Applicable"
    else
        #########################################################
        # Check disable-user-list setting using gsettings
        #########################################################
        if gsettings list-schemas 2>/dev/null | grep -qx "org.gnome.login-screen"; then
            disable_user_list=$(gsettings get org.gnome.login-screen disable-user-list 2>/dev/null)
        else
            disable_user_list=""
        fi
        #########################################################
        # Compliance Evaluation
        #########################################################
        if [[ "$disable_user_list" == "true" ]]; then
            output="GDM disable-user-list option is enabled."
            status="Yes"
        elif [[ "$disable_user_list" == "false" ]]; then
            output="GDM disable-user-list option is not enabled."
            status="No"
        else
            output="GDM disable-user-list option is not configured"
            status="No"
        fi
    fi
fi

echo "Initial Setup / Configure GNOME Display Manager" >> p1
echo "Ensure GDM disable-user-list option is enabled" >> p2
echo "$output" >> p3
echo "$status" >> p4
echo "1.7.3" >> p12
}


# 1.7.4
# Ensure GDM screen locks when the user is idle
{
output=""
status=""
# Check whether GDM is installed
if ! dpkg-query -W -f='${Status}\n' gdm3 2>/dev/null | grep -q "install ok installed"; then
    output="GNOME Display Manager (GDM) is not installed. Control is Not Applicable"
    status="Not Applicable"
else
    # Verify that a GDM dconf profile exists
    if ! grep -Psiq "user-db|system-db" /etc/dconf/profile/* 2>/dev/null; then
        output="GDM is installed but no dconf profile exists. Control is Not Applicable"
        status="Not Applicable"
    else
        #########################################################
        # Check GNOME screen lock settings
        #########################################################
        if gsettings list-schemas 2>/dev/null | grep -qx "org.gnome.desktop.screensaver"; then
            lock_delay=$(gsettings get org.gnome.desktop.screensaver lock-delay 2>/dev/null)
            lock_enabled=$(gsettings get org.gnome.desktop.screensaver lock-enabled 2>/dev/null)
            idle_delay=$(gsettings get org.gnome.desktop.session idle-delay 2>/dev/null)
        else
            lock_delay=""
            lock_enabled=""
            idle_delay=""
        fi

        #########################################################
        # Extract numeric values
        #########################################################
        lock_delay_value=$(echo "$lock_delay" | awk '{print $2}')
        idle_delay_value=$(echo "$idle_delay" | awk '{print $2}')

        #########################################################
        # Compliance Evaluation
        #########################################################

        if [[ "$lock_enabled" == "true" ]] && \
           [[ "$lock_delay_value" =~ ^[0-9]+$ ]] && \
           [ "$lock_delay_value" -le 5 ] && \
           [[ "$idle_delay_value" =~ ^[0-9]+$ ]] && \
           [ "$idle_delay_value" -gt 0 ] && \
           [ "$idle_delay_value" -le 900 ]; then

            output="GDM screen lock is configured correctly. lock-delay=${lock_delay_value}s, idle-delay=${idle_delay_value}s, lock-enabled=true"
            status="Yes"
        else
            output="GDM screen lock configuration is not compliant"

            if [[ "$lock_enabled" != "true" ]]; then
                output="$output lock-enabled is not true."
            fi
            if [[ ! "$lock_delay_value" =~ ^[0-9]+$ ]] || [ "$lock_delay_value" -gt 5 ]; then
                output="$output lock-delay should be 5 seconds or less."
            fi
            if [[ ! "$idle_delay_value" =~ ^[0-9]+$ ]] || \
               [ "$idle_delay_value" -eq 0 ] || \
               [ "$idle_delay_value" -gt 900 ]; then
                output="$output idle-delay should be greater than 0 and 900 seconds or less"
            fi
            status="No"
        fi
    fi
fi

echo "Initial Setup / Configure GNOME Display Manager" >> p1
echo "Ensure GDM screen locks when the user is idle" >> p2
echo "$output" >> p3
echo "$status" >> p4
echo "1.7.4" >> p12
}


# 1.7.5
# Ensure GDM screen locks cannot be overridden
{
output=""
status=""
# Check whether GDM is installed
if ! dpkg-query -W -f='${Status}\n' gdm3 2>/dev/null | grep -q "install ok installed"; then
    output="GNOME Display Manager (GDM) is not installed. Control is Not Applicable"
    status="Not Applicable"
else
    # Verify that a GDM dconf profile exists
    if ! grep -Psiq "user-db|system-db" /etc/dconf/profile/* 2>/dev/null; then
        output="GDM is installed but no dconf profile exists. Control is Not Applicable"
        status="Not Applicable"
    else
        #########################################################
        # Check dconf lock files
        #########################################################
        required_locks=(
            "/org/gnome/desktop/session/idle-delay"
            "/org/gnome/desktop/screensaver/lock-delay"
            "/org/gnome/desktop/screensaver/lock-enabled"
        )
        missing_locks=()
        for lock in "${required_locks[@]}"; do
            if ! grep -Rqs "$lock" /etc/dconf/db/*/locks/* 2>/dev/null; then
                missing_locks+=("$lock")
            fi
        done
        #########################################################
        # Compliance Evaluation
        #########################################################
        if [ "${#missing_locks[@]}" -eq 0 ]; then
            output="GDM screen lock settings are locked and cannot be overridden."
            status="Yes"
        else
            output="GDM screen lock settings are not fully locked. Missing locks:"
    
            for item in "${missing_locks[@]}"; do
                output="$output $item"
            done
            status="No"
        fi
    fi
fi

echo "Initial Setup / Configure GNOME Display Manager" >> p1
echo "Ensure GDM screen locks cannot be overridden" >> p2
echo "$output" >> p3
echo "$status" >> p4
echo "1.7.5" >> p12
}

# 1.7.6
# Ensure GDM automatic mounting of removable media is disabled
{
output=""
status=""
# Check whether GDM is installed
if ! dpkg-query -W -f='${Status}\n' gdm3 2>/dev/null | grep -q "install ok installed"; then
    output="GNOME Display Manager (GDM) is not installed. Control is Not Applicable"
    status="Not Applicable"
else
    # Verify that a dconf profile exists
    if ! grep -Psiq "user-db|system-db" /etc/dconf/profile/* 2>/dev/null; then
        output="GDM is installed but no dconf profile exists. Control is Not Applicable"
        status="Not Applicable"
    else
        #########################################################
        # Check GNOME removable media automount settings
        #########################################################
        if gsettings list-schemas 2>/dev/null | grep -qx "org.gnome.desktop.media-handling"; then
            automount=$(gsettings get org.gnome.desktop.media-handling automount 2>/dev/null)
            automount_open=$(gsettings get org.gnome.desktop.media-handling automount-open 2>/dev/null)
        else
            automount=""
            automount_open=""
        fi

        #########################################################
        # Compliance Evaluation
        #########################################################
        if [[ "$automount" == "false" ]] && \
           [[ "$automount_open" == "false" ]]; then
            output="GDM automatic mounting of removable media is disabled. automount=false, automount-open=false"
            status="Yes"
        else
            output="GDM automatic mounting of removable media is not disabled."
            if [[ "$automount" != "false" ]]; then
                output="$output automount is not set to false."
            fi

            if [[ "$automount_open" != "false" ]]; then
                output="$output automount-open is not set to false."
            fi
            status="No"
        fi
    fi
fi

echo "Initial Setup / Configure GNOME Display Manager" >> p1
echo "Ensure GDM automatic mounting of removable media is disabled" >> p2
echo "$output" >> p3
echo "$status" >> p4
echo "1.7.6" >> p12
}


# 1.7.7
# Ensure GDM disabling automatic mounting of removable media is not overridden
{
output=""
status=""
# Check whether GDM is installed
if ! dpkg-query -W -f='${Status}\n' gdm3 2>/dev/null | grep -q "install ok installed"; then
    output="GNOME Display Manager (GDM) is not installed. Control is Not Applicable"
    status="Not Applicable"
else
    # Verify that a GDM dconf profile exists
    if ! grep -Psiq "user-db|system-db" /etc/dconf/profile/* 2>/dev/null; then
        output="GDM is installed but no dconf profile exists. Control is Not Applicable"
        status="Not Applicable"
    else
        #########################################################
        # Check dconf lock files for automount settings
        #########################################################
        required_locks=(
            "automount"
            "automount-open"
        )

        missing_locks=()

        for lock in "${required_locks[@]}"; do
            if ! grep -RPq "^\s*/org/gnome/desktop/media-handling/${lock}\s*$" \
                /etc/dconf/db/*/locks/* 2>/dev/null; then
                missing_locks+=("$lock")
            fi
        done

        #########################################################
        # Compliance Evaluation
        #########################################################
        if [ "${#missing_locks[@]}" -eq 0 ]; then
            output="GDM automatic mounting settings are locked and cannot be overridden."
            status="Yes"
        else
            output="GDM automatic mounting settings are not fully locked. Missing locks:"
            for item in "${missing_locks[@]}"; do
                output="$output $item"
            done
            status="No"
        fi
    fi
fi

echo "Initial Setup / Configure GNOME Display Manager" >> p1
echo "Ensure GDM disabling automatic mounting of removable media is not overridden" >> p2
echo "$output" >> p3
echo "$status" >> p4
echo "1.7.7" >> p12
}


# 1.7.8
# Ensure GDM autorun-never is enabled
{
output=""
status=""
# Check whether GDM is installed
if ! dpkg-query -W -f='${Status}\n' gdm3 2>/dev/null | grep -q "install ok installed"; then
    output="GNOME Display Manager (GDM) is not installed. Control is Not Applicable"
    status="Not Applicable"
else
    # Verify that a GDM dconf profile exists
    if ! grep -Psiq "user-db|system-db" /etc/dconf/profile/* 2>/dev/null; then
        output="GDM is installed but no dconf profile exists. Control is Not Applicable"
        status="Not Applicable"
    else

        #########################################################
        # Check autorun-never setting using gsettings
        #########################################################
        if gsettings list-schemas 2>/dev/null | grep -qx "org.gnome.desktop.media-handling"; then
            autorun_never=$(gsettings get org.gnome.desktop.media-handling autorun-never 2>/dev/null)
        else
            autorun_never=""
        fi

        #########################################################
        # Compliance Evaluation
        #########################################################
        if [[ "$autorun_never" == "true" ]]; then
            output="GDM autorun-never is enabled."
            status="Yes"
        elif [[ "$autorun_never" == "false" ]]; then
            output="GDM autorun-never is not enabled."
            status="No"
        else
            output="GDM autorun-never is not configured."
            status="No"
        fi
    fi
fi

echo "Initial Setup / Configure GNOME Display Manager" >> p1
echo "Ensure GDM autorun-never is enabled" >> p2
echo "$output" >> p3
echo "$status" >> p4
echo "1.7.8" >> p12
}


# 1.7.9
# Ensure GDM autorun-never is not overridden
{
output=""
status=""
# Check whether GDM is installed
if ! dpkg-query -W -f='${Status}\n' gdm3 2>/dev/null | grep -q "install ok installed"; then
    output="GNOME Display Manager (GDM) is not installed. Control is Not Applicable"
    status="Not Applicable"
else
    # Verify that a GDM dconf profile exists
    if ! grep -Psiq "user-db|system-db" /etc/dconf/profile/* 2>/dev/null; then
        output="GDM is installed but no dconf profile exists. Control is Not Applicable"
        status="Not Applicable"
    else
        #########################################################
        # Check dconf lock for autorun-never
        #########################################################
        required_lock="/org/gnome/desktop/media-handling/autorun-never"
        if grep -RPqs "^\s*${required_lock}\s*$" \
            /etc/dconf/db/*/locks/* 2>/dev/null; then
            output="GDM autorun-never setting is locked and cannot be overridden."
            status="Yes"
        else
            output="GDM autorun-never setting is not locked. Users may override this setting."
            status="No"
        fi
    fi
fi

echo "Initial Setup / Configure GNOME Display Manager" >> p1
echo "Ensure GDM autorun-never is not overridden" >> p2
echo "$output" >> p3
echo "$status" >> p4
echo "1.7.9" >> p12
}

# 1.7.10
# Ensure XDMCP is not enabled
{
output=""
status=""
# Check whether GDM is installed
if ! dpkg-query -W -f='${Status}\n' gdm3 2>/dev/null | grep -q "install ok installed"; then
    output="GNOME Display Manager (GDM) is not installed. Control is Not Applicable."
    status="Not Applicable"
else
    #########################################################
    # Check if GDM configuration files exist
    #########################################################
    gdm_files=(
        "/etc/gdm3/custom.conf"
        "/etc/gdm3/daemon.conf"
        "/etc/gdm/custom.conf"
        "/etc/gdm/daemon.conf"
    )
    existing_files=()
    for file in "${gdm_files[@]}"; do
        if [ -f "$file" ]; then
            existing_files+=("$file")
        fi
    done

    if [ "${#existing_files[@]}" -eq 0 ]; then
        output="GDM is installed but no GDM configuration file exists. Control is Not Applicable."
        status="Not Applicable"
    else
        #########################################################
        # Check XDMCP configuration
        #########################################################
        xdmcp_enabled=""
        for file in "${existing_files[@]}"; do
            result=$(awk '
            /^\[xdmcp\]/ {
                f=1
                next
            }
            /^\[/ {
                f=0
            }
            f && /^\s*Enable\s*=\s*true/ {
                print
            }
            ' "$file")
            if [ -n "$result" ]; then
                xdmcp_enabled="$xdmcp_enabled $file: $result"
            fi
        done
        #########################################################
        # Compliance Evaluation
        #########################################################
        if [ -z "$xdmcp_enabled" ]; then
            output="XDMCP is not enabled in GDM configuration."
            status="Yes"
        else
            output="XDMCP is enabled in GDM configuration: $xdmcp_enabled"
            status="No"
        fi
    fi
fi

echo "Initial Setup / Configure GNOME Display Manager" >> p1
echo "Ensure XDMCP is not enabled" >> p2
echo "$output" >> p3
echo "$status" >> p4
echo "1.7.10" >> p12

}

########################################################################################################
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

###########################################################################################################

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

###########################################################################################################

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

###########################################################################################################

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

#########################################################################################################

#2.4.1.1
#Ensure cron daemon is enabled and active.
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
{
 l_output="" l_output2=""
 l_file="/etc/crontab"
 l_mode="$(stat -Lc '%#a' $l_file 2>/dev/null)"
 l_owner="$(stat -Lc '%U' $l_file 2>/dev/null)"
 l_group="$(stat -Lc '%G' $l_file 2>/dev/null)"
 [ $(( l_mode & 0177 )) -gt 0 ] && l_output2="$l_output2 $l_file mode is $l_mode (required: 0600 or more restrictive)."
 [ "$l_owner" != "root" ] && l_output2="$l_output2 $l_file not owned by root (owner: $l_owner)."
 [ "$l_group" != "root" ] && l_output2="$l_output2 $l_file not group-owned by root (group: $l_group)."
 if [ -z "$l_output2" ]; then
  echo "Services / Job Schedulers" >> p1
  echo "Ensure permissions on /etc/crontab are configured." >> p2
  echo "Permissions on /etc/crontab are configured." >> p3
  echo "Yes" >> p4
  echo "2.4.1.2" >> p12
 else
  echo "Services / Job Schedulers" >> p1
  echo "Ensure permissions on /etc/crontab are configured." >> p2
  echo "Permissions on /etc/crontab are NOT configured correctly. $l_output2" >> p3
  echo "No" >> p4
  echo "2.4.1.2" >> p12
 fi
}

#2.4.1.3
#Ensure permissions on /etc/cron.hourly are configured.
{
 l_output="" l_output2=""
 l_file="/etc/cron.hourly"
 l_mode="$(stat -Lc '%#a' $l_file 2>/dev/null)"
 l_owner="$(stat -Lc '%U' $l_file 2>/dev/null)"
 l_group="$(stat -Lc '%G' $l_file 2>/dev/null)"
 [ "$l_mode" != "0700" ] && l_output2="$l_output2 $l_file mode is $l_mode (required: 0700)."
 [ "$l_owner" != "root" ] && l_output2="$l_output2 $l_file not owned by root (owner: $l_owner)."
 [ "$l_group" != "root" ] && l_output2="$l_output2 $l_file not group-owned by root (group: $l_group)."
 if [ -z "$l_output2" ]; then
  echo "Services / Job Schedulers" >> p1
  echo "Ensure permissions on /etc/cron.hourly are configured." >> p2
  echo "Permissions on /etc/cron.hourly are configured." >> p3
  echo "Yes" >> p4
  echo "2.4.1.3" >> p12
 else
  echo "Services / Job Schedulers" >> p1
  echo "Ensure permissions on /etc/cron.hourly are configured." >> p2
  echo "Permissions on /etc/cron.hourly are NOT configured correctly. $l_output2" >> p3
  echo "No" >> p4
  echo "2.4.1.3" >> p12
 fi
}

#2.4.1.4
#Ensure permissions on /etc/cron.daily are configured.
{
 l_output="" l_output2=""
 l_file="/etc/cron.daily"
 l_mode="$(stat -Lc '%#a' $l_file 2>/dev/null)"
 l_owner="$(stat -Lc '%U' $l_file 2>/dev/null)"
 l_group="$(stat -Lc '%G' $l_file 2>/dev/null)"
 [ "$l_mode" != "0700" ] && l_output2="$l_output2 $l_file mode is $l_mode (required: 0700)."
 [ "$l_owner" != "root" ] && l_output2="$l_output2 $l_file not owned by root (owner: $l_owner)."
 [ "$l_group" != "root" ] && l_output2="$l_output2 $l_file not group-owned by root (group: $l_group)."
 if [ -z "$l_output2" ]; then
  echo "Services / Job Schedulers" >> p1
  echo "Ensure permissions on /etc/cron.daily are configured." >> p2
  echo "Permissions on /etc/cron.daily are configured." >> p3
  echo "Yes" >> p4
  echo "2.4.1.4" >> p12
 else
  echo "Services / Job Schedulers" >> p1
  echo "Ensure permissions on /etc/cron.daily are configured." >> p2
  echo "Permissions on /etc/cron.daily are NOT configured correctly. $l_output2" >> p3
  echo "No" >> p4
  echo "2.4.1.4" >> p12
 fi
}

#2.4.1.5
#Ensure permissions on /etc/cron.weekly are configured.
{
 l_output="" l_output2=""
 l_file="/etc/cron.weekly"
 l_mode="$(stat -Lc '%#a' $l_file 2>/dev/null)"
 l_owner="$(stat -Lc '%U' $l_file 2>/dev/null)"
 l_group="$(stat -Lc '%G' $l_file 2>/dev/null)"
 [ "$l_mode" != "0700" ] && l_output2="$l_output2 $l_file mode is $l_mode (required: 0700)."
 [ "$l_owner" != "root" ] && l_output2="$l_output2 $l_file not owned by root (owner: $l_owner)."
 [ "$l_group" != "root" ] && l_output2="$l_output2 $l_file not group-owned by root (group: $l_group)."
 if [ -z "$l_output2" ]; then
  echo "Services / Job Schedulers" >> p1
  echo "Ensure permissions on /etc/cron.weekly are configured." >> p2
  echo "Permissions on /etc/cron.weekly/ are configured." >> p3
  echo "Yes" >> p4
  echo "2.4.1.5" >> p12
 else
  echo "Services / Job Schedulers" >> p1
  echo "Ensure permissions on /etc/cron.weekly are configured." >> p2
  echo "Permissions on /etc/cron.weekly/ are NOT configured correctly. $l_output2" >> p3
  echo "No" >> p4
  echo "2.4.1.5" >> p12
 fi
}

#2.4.1.6
#Ensure permissions on /etc/cron.monthly are configured.
{
 l_output="" l_output2=""
 l_file="/etc/cron.monthly"
 l_mode="$(stat -Lc '%#a' $l_file 2>/dev/null)"
 l_owner="$(stat -Lc '%U' $l_file 2>/dev/null)"
 l_group="$(stat -Lc '%G' $l_file 2>/dev/null)"
 [ "$l_mode" != "0700" ] && l_output2="$l_output2 $l_file mode is $l_mode (required: 0700)."
 [ "$l_owner" != "root" ] && l_output2="$l_output2 $l_file not owned by root (owner: $l_owner)."
 [ "$l_group" != "root" ] && l_output2="$l_output2 $l_file not group-owned by root (group: $l_group)."
 if [ -z "$l_output2" ]; then
  echo "Services / Job Schedulers" >> p1
  echo "Ensure permissions on /etc/cron.monthly are configured." >> p2
  echo "Permissions on /etc/cron.monthly are configured." >> p3
  echo "Yes" >> p4
  echo "2.4.1.6" >> p12
 else
  echo "Services / Job Schedulers" >> p1
  echo "Ensure permissions on /etc/cron.monthly are configured." >> p2
  echo "Permissions on /etc/cron.monthly are NOT configured correctly. $l_output2" >> p3
  echo "No" >> p4
  echo "2.4.1.6" >> p12
 fi
}

#2.4.1.7
#Ensure access to /etc/cron.yearly is configured.
{
 l_output="" l_output2=""
 l_file="/etc/cron.yearly"

 if [ -d "$l_file" ]; then
  l_perms="$(stat -c '%a' $l_file)"
  l_uid="$(stat -c '%U' $l_file)"
  l_gid="$(stat -c '%G' $l_file)"

  if [ "$l_perms" = "700" ] && [ "$l_uid" = "root" ] && [ "$l_gid" = "root" ]; then
   l_output="Permissions on $l_file are configured. Access: ($l_perms) Uid: root Gid: root."
  else
   l_output2="Permissions on $l_file are NOT configured correctly. Access: ($l_perms) Uid: $l_uid Gid: $l_gid."
  fi
 else
  l_output="$l_file does not exist. Not applicable."
 fi

 if [ -z "$l_output2" ]; then
  echo "Services / Job Schedulers" >> p1
  echo "Ensure access to /etc/cron.yearly is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "2.4.1.7" >> p12
 else
  echo "Services / Job Schedulers" >> p1
  echo "Ensure access to /etc/cron.yearly is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "2.4.1.7" >> p12
 fi
}

#2.4.1.8
#Ensure permissions on /etc/cron.d are configured.
{
 l_output="" l_output2=""
 l_file="/etc/cron.d"
 l_mode="$(stat -Lc '%#a' $l_file 2>/dev/null)"
 l_owner="$(stat -Lc '%U' $l_file 2>/dev/null)"
 l_group="$(stat -Lc '%G' $l_file 2>/dev/null)"
 [ "$l_mode" != "0700" ] && l_output2="$l_output2 $l_file mode is $l_mode (required: 0700)."
 [ "$l_owner" != "root" ] && l_output2="$l_output2 $l_file not owned by root (owner: $l_owner)."
 [ "$l_group" != "root" ] && l_output2="$l_output2 $l_file not group-owned by root (group: $l_group)."
 if [ -z "$l_output2" ]; then
  echo "Services / Job Schedulers" >> p1
  echo "Ensure permissions on /etc/cron.d are configured." >> p2
  echo "Permissions on /etc/cron.d/ are configured." >> p3
  echo "Yes" >> p4
  echo "2.4.1.8" >> p12
 else
  echo "Services / Job Schedulers" >> p1
  echo "Ensure permissions on /etc/cron.d are configured." >> p2
  echo "Permissions on /etc/cron.d/ are NOT configured correctly. $l_output2" >> p3
  echo "No" >> p4
  echo "2.4.1.8" >> p12
 fi
}

#2.4.1.9
#Ensure cron is restricted to authorized users.
{
 l_output="" l_output2=""
 fi1=/etc/cron.deny
 fi2=/etc/cron.allow

 # Check 1: /etc/cron.deny must NOT exist
 if [ -f "$fi1" ]; then
  l_output2="$l_output2 File $fi1 exists. Required: must not exist."
 else
  l_output="$l_output File $fi1 does not exist (compliant)."
 fi

 # Check 2: /etc/cron.allow must exist with correct permissions (0640, root:root)
 if [ -f "$fi2" ]; then
  r_access="0640/-rw-r-----"
  r_uid="root"
  r_gid="root"
  ac=$(stat -c '%a' "$fi2" 2>/dev/null)
  ud=$(stat -c '%U' "$fi2" 2>/dev/null)
  gd=$(stat -c '%G' "$fi2" 2>/dev/null)
  if [[ "$ac" == "640" && "$ud" == "$r_uid" && "$gd" == "$r_gid" ]]; then
   l_output="$l_output $fi2 exists with correct permissions ($ac, $ud:$gd) (compliant)."
  else
   l_output2="$l_output2 $fi2 exists but permissions are incorrect (mode: $ac, owner: $ud, group: $gd). Required: 0640, root:root."
  fi
 else
  l_output2="$l_output2 File $fi2 does not exist. Required: must exist."
 fi

 if [ -z "$l_output2" ]; then
  echo "Services / Job Schedulers" >> p1
  echo "Ensure cron is restricted to authorized users." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "2.4.1.9" >> p12
 else
  echo "Services / Job Schedulers" >> p1
  echo "Ensure cron is restricted to authorized users." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "2.4.1.9" >> p12
 fi
}

#2.4.2.1
#Ensure access to at is configured.
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
  echo "Ensure access to at is configured." >> p2
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

####################################################################################################################

#3.1.2
#Ensure wireless interfaces are not available.
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
  echo "Ensure wireless interfaces are not available." >> p2
  echo "${l_output:-System has no wireless NICs installed.}" >> p3
  echo "Yes" >> p4
  echo "3.1.2" >> p12
 else
  echo "Network / Configure Network Devices" >> p1
  echo "Ensure wireless interfaces are not available." >> p2
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

###############################################################################################################

#3.2.1
#Ensure dccp kernel module is not available.
#!/usr/bin/env bash
{
 l_output="" l_output2=""
 l_mname="dccp"
 l_loadable="$(modprobe -n -v "$l_mname")"
 if grep -Pq -- '^\h*install \/bin\/(true|false)' <<< "$l_loadable"; then
  l_output="$l_output\n - module: \"$l_mname\" is not loadable"
 else
  l_output2="$l_output2\n - module: \"$l_mname\" is loadable"
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
  echo "Network Configuration / Configure Network Kernel Modules" >> p1
  echo "Ensure dccp kernel module is not available." >> p2
  echo "dccp kernel module is not available." >> p3
  echo "Yes" >> p4
  echo "3.2.1" >> p12
 else
  echo "Network Configuration / Configure Network Kernel Modules" >> p1
  echo "Ensure dccp kernel module is not available." >> p2
  echo "dccp kernel module is available or loadable." >> p3
  echo "No" >> p4
  echo "3.2.1" >> p12
 fi
}

#3.2.2
#Ensure tipc kernel module is not available.
#!/usr/bin/env bash
{
 l_output="" l_output2=""
 l_mname="tipc"
 l_loadable="$(modprobe -n -v "$l_mname")"
 if grep -Pq -- '^\h*install \/bin\/(true|false)' <<< "$l_loadable"; then
  l_output="$l_output\n - module: \"$l_mname\" is not loadable"
 else
  l_output2="$l_output2\n - module: \"$l_mname\" is loadable"
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
  echo "Network Configuration / Configure Network Kernel Modules" >> p1
  echo "Ensure tipc kernel module is not available." >> p2
  echo "tipc kernel module is not available." >> p3
  echo "Yes" >> p4
  echo "3.2.2" >> p12
 else
  echo "Network Configuration / Configure Network Kernel Modules" >> p1
  echo "Ensure tipc kernel module is not available." >> p2
  echo "tipc kernel module is available or loadable." >> p3
  echo "No" >> p4
  echo "3.2.2" >> p12
 fi
}

#3.2.3
#Ensure rds kernel module is not available.
#!/usr/bin/env bash
{
 l_output="" l_output2=""
 l_mname="rds"
 l_loadable="$(modprobe -n -v "$l_mname")"
 if grep -Pq -- '^\h*install \/bin\/(true|false)' <<< "$l_loadable"; then
  l_output="$l_output\n - module: \"$l_mname\" is not loadable"
 else
  l_output2="$l_output2\n - module: \"$l_mname\" is loadable"
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
  echo "Network Configuration / Configure Network Kernel Modules" >> p1
  echo "Ensure rds kernel module is not available." >> p2
  echo "rds kernel module is not available." >> p3
  echo "Yes" >> p4
  echo "3.2.3" >> p12
 else
  echo "Network Configuration / Configure Network Kernel Modules" >> p1
  echo "Ensure rds kernel module is not available." >> p2
  echo "rds kernel module is available or loadable." >> p3
  echo "No" >> p4
  echo "3.2.3" >> p12
 fi
}

#3.2.4
#Ensure sctp kernel module is not available.
#!/usr/bin/env bash
{
 l_output="" l_output2=""
 l_mname="sctp"
 l_loadable="$(modprobe -n -v "$l_mname")"
 if grep -Pq -- '^\h*install \/bin\/(true|false)' <<< "$l_loadable"; then
  l_output="$l_output\n - module: \"$l_mname\" is not loadable"
 else
  l_output2="$l_output2\n - module: \"$l_mname\" is loadable"
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
  echo "Network Configuration / Configure Network Kernel Modules" >> p1
  echo "Ensure sctp kernel module is not available." >> p2
  echo "sctp kernel module is not available." >> p3
  echo "Yes" >> p4
  echo "3.2.4" >> p12
 else
  echo "Network Configuration / Configure Network Kernel Modules" >> p1
  echo "Ensure sctp kernel module is not available." >> p2
  echo "sctp kernel module is available or loadable." >> p3
  echo "No" >> p4
  echo "3.2.4" >> p12
 fi
}

###########################################################################################
#3.3.1.2
#Ensure net.ipv4.conf.all.forwarding is configured.
#!/usr/bin/env bash
{
 l_output="" l_output2=""
 l_parameter_name="net.ipv4.conf.all.forwarding"
 l_expected="0"
 l_searchloc="/run/sysctl.d/*.conf /etc/sysctl.d/*.conf /usr/local/lib/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /lib/sysctl.d/*.conf /etc/sysctl.conf"

 l_running="$(sysctl $l_parameter_name 2>/dev/null | awk -F= '{print $2}' | tr -d ' ')"
 if [ "$l_running" = "$l_expected" ]; then
  l_output="$l_output $l_parameter_name is set to $l_running in running config."
 else
  l_output2="$l_output2 $l_parameter_name is set to $l_running in running config (expected $l_expected)."
 fi

 l_conf_val="$(grep -rPois "^\h*$l_parameter_name\h*=\h*$l_expected\b" $l_searchloc 2>/dev/null | tail -1)"
 if [ -n "$l_conf_val" ]; then
  l_output="$l_output $l_parameter_name = $l_expected found in sysctl conf."
 else
  l_output2="$l_output2 $l_parameter_name = $l_expected not found in any sysctl conf file."
 fi

 if [ -z "$l_output2" ]; then
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure net.ipv4.conf.all.forwarding is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "3.3.1.2" >> p12
 else
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure net.ipv4.conf.all.forwarding is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "3.3.1.2" >> p12
 fi
}

#3.3.1.3
#Ensure net.ipv4.conf.default.forwarding is configured.
#!/usr/bin/env bash
{
 l_output="" l_output2=""
 l_parameter_name="net.ipv4.conf.default.forwarding"
 l_expected="0"
 l_searchloc="/run/sysctl.d/*.conf /etc/sysctl.d/*.conf /usr/local/lib/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /lib/sysctl.d/*.conf /etc/sysctl.conf"

 l_running="$(sysctl $l_parameter_name 2>/dev/null | awk -F= '{print $2}' | tr -d ' ')"
 if [ "$l_running" = "$l_expected" ]; then
  l_output="$l_output $l_parameter_name is set to $l_running in running config."
 else
  l_output2="$l_output2 $l_parameter_name is set to $l_running in running config (expected $l_expected)."
 fi

 l_conf_val="$(grep -rPois "^\h*$l_parameter_name\h*=\h*$l_expected\b" $l_searchloc 2>/dev/null | tail -1)"
 if [ -n "$l_conf_val" ]; then
  l_output="$l_output $l_parameter_name = $l_expected found in sysctl conf."
 else
  l_output2="$l_output2 $l_parameter_name = $l_expected not found in any sysctl conf file."
 fi

 if [ -z "$l_output2" ]; then
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure net.ipv4.conf.default.forwarding is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "3.3.1.3" >> p12
 else
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure net.ipv4.conf.default.forwarding is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "3.3.1.3" >> p12
 fi
}

#3.3.1.4
#Ensure net.ipv4.conf.all.send_redirects is configured.
#!/usr/bin/env bash
{
 l_output="" l_output2=""
 l_parameter_name="net.ipv4.conf.all.send_redirects"
 l_expected="0"
 l_searchloc="/run/sysctl.d/*.conf /etc/sysctl.d/*.conf /usr/local/lib/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /lib/sysctl.d/*.conf /etc/sysctl.conf"

 l_running="$(sysctl $l_parameter_name 2>/dev/null | awk -F= '{print $2}' | tr -d ' ')"
 if [ "$l_running" = "$l_expected" ]; then
  l_output="$l_output $l_parameter_name is set to $l_running in running config."
 else
  l_output2="$l_output2 $l_parameter_name is set to $l_running in running config (expected $l_expected)."
 fi

 l_conf_val="$(grep -rPois "^\h*$l_parameter_name\h*=\h*$l_expected\b" $l_searchloc 2>/dev/null | tail -1)"
 if [ -n "$l_conf_val" ]; then
  l_output="$l_output $l_parameter_name = $l_expected found in sysctl conf."
 else
  l_output2="$l_output2 $l_parameter_name = $l_expected not found in any sysctl conf file."
 fi

 if [ -z "$l_output2" ]; then
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure net.ipv4.conf.all.send_redirects is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "3.3.1.4" >> p12
 else
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure net.ipv4.conf.all.send_redirects is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "3.3.1.4" >> p12
 fi
}


#3.3.1.5
#Ensure net.ipv4.conf.default.send_redirects is configured.
#!/usr/bin/env bash
{
 l_output="" l_output2=""
 l_parameter_name="net.ipv4.conf.default.send_redirects"
 l_expected="0"
 l_searchloc="/run/sysctl.d/*.conf /etc/sysctl.d/*.conf /usr/local/lib/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /lib/sysctl.d/*.conf /etc/sysctl.conf"

 l_running="$(sysctl $l_parameter_name 2>/dev/null | awk -F= '{print $2}' | tr -d ' ')"
 if [ "$l_running" = "$l_expected" ]; then
  l_output="$l_output $l_parameter_name is set to $l_running in running config."
 else
  l_output2="$l_output2 $l_parameter_name is set to $l_running in running config (expected $l_expected)."
 fi

 l_conf_val="$(grep -rPois "^\h*$l_parameter_name\h*=\h*$l_expected\b" $l_searchloc 2>/dev/null | tail -1)"
 if [ -n "$l_conf_val" ]; then
  l_output="$l_output $l_parameter_name = $l_expected found in sysctl conf."
 else
  l_output2="$l_output2 $l_parameter_name = $l_expected not found in any sysctl conf file."
 fi

 if [ -z "$l_output2" ]; then
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure net.ipv4.conf.default.send_redirects is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "3.3.1.5" >> p12
 else
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure net.ipv4.conf.default.send_redirects is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "3.3.1.5" >> p12
 fi
}

#3.3.1.6
#Ensure net.ipv4.icmp_ignore_bogus_error_responses is configured.
#!/usr/bin/env bash
{
 l_output="" l_output2=""
 l_parameter_name="net.ipv4.icmp_ignore_bogus_error_responses"
 l_expected="1"
 l_searchloc="/run/sysctl.d/*.conf /etc/sysctl.d/*.conf /usr/local/lib/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /lib/sysctl.d/*.conf /etc/sysctl.conf"

 l_running="$(sysctl $l_parameter_name 2>/dev/null | awk -F= '{print $2}' | tr -d ' ')"
 if [ "$l_running" = "$l_expected" ]; then
  l_output="$l_output $l_parameter_name is set to $l_running in running config."
 else
  l_output2="$l_output2 $l_parameter_name is set to $l_running in running config (expected $l_expected)."
 fi

 l_conf_val="$(grep -rPois "^\h*$l_parameter_name\h*=\h*$l_expected\b" $l_searchloc 2>/dev/null | tail -1)"
 if [ -n "$l_conf_val" ]; then
  l_output="$l_output $l_parameter_name = $l_expected found in sysctl conf."
 else
  l_output2="$l_output2 $l_parameter_name = $l_expected not found in any sysctl conf file."
 fi

 if [ -z "$l_output2" ]; then
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure net.ipv4.icmp_ignore_bogus_error_responses is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "3.3.1.6" >> p12
 else
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure net.ipv4.icmp_ignore_bogus_error_responses is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "3.3.1.6" >> p12
 fi
}

#3.3.1.7
#Ensure net.ipv4.icmp_echo_ignore_broadcasts is configured.
#!/usr/bin/env bash
{
 l_output="" l_output2=""
 l_parameter_name="net.ipv4.icmp_echo_ignore_broadcasts"
 l_expected="1"
 l_searchloc="/run/sysctl.d/*.conf /etc/sysctl.d/*.conf /usr/local/lib/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /lib/sysctl.d/*.conf /etc/sysctl.conf"

 l_running="$(sysctl $l_parameter_name 2>/dev/null | awk -F= '{print $2}' | tr -d ' ')"
 if [ "$l_running" = "$l_expected" ]; then
  l_output="$l_output $l_parameter_name is set to $l_running in running config."
 else
  l_output2="$l_output2 $l_parameter_name is set to $l_running in running config (expected $l_expected)."
 fi

 l_conf_val="$(grep -rPois "^\h*$l_parameter_name\h*=\h*$l_expected\b" $l_searchloc 2>/dev/null | tail -1)"
 if [ -n "$l_conf_val" ]; then
  l_output="$l_output $l_parameter_name = $l_expected found in sysctl conf."
 else
  l_output2="$l_output2 $l_parameter_name = $l_expected not found in any sysctl conf file."
 fi

 if [ -z "$l_output2" ]; then
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure net.ipv4.icmp_echo_ignore_broadcasts is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "3.3.1.7" >> p12
 else
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure net.ipv4.icmp_echo_ignore_broadcasts is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "3.3.1.7" >> p12
 fi
}

#3.3.1.8
#Ensure net.ipv4.conf.all.accept_redirects is configured.
#!/usr/bin/env bash
{
 l_output="" l_output2=""
 l_parameter_name="net.ipv4.conf.all.accept_redirects"
 l_expected="0"
 l_searchloc="/run/sysctl.d/*.conf /etc/sysctl.d/*.conf /usr/local/lib/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /lib/sysctl.d/*.conf /etc/sysctl.conf"

 l_running="$(sysctl $l_parameter_name 2>/dev/null | awk -F= '{print $2}' | tr -d ' ')"
 if [ "$l_running" = "$l_expected" ]; then
  l_output="$l_output $l_parameter_name is set to $l_running in running config."
 else
  l_output2="$l_output2 $l_parameter_name is set to $l_running in running config (expected $l_expected)."
 fi

 l_conf_val="$(grep -rPois "^\h*$l_parameter_name\h*=\h*$l_expected\b" $l_searchloc 2>/dev/null | tail -1)"
 if [ -n "$l_conf_val" ]; then
  l_output="$l_output $l_parameter_name = $l_expected found in sysctl conf."
 else
  l_output2="$l_output2 $l_parameter_name = $l_expected not found in any sysctl conf file."
 fi

 if [ -z "$l_output2" ]; then
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure net.ipv4.conf.all.accept_redirects is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "3.3.1.8" >> p12
 else
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure net.ipv4.conf.all.accept_redirects is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "3.3.1.8" >> p12
 fi
}

#3.3.1.9
#Ensure net.ipv4.conf.default.accept_redirects is configured.
#!/usr/bin/env bash
{
 l_output="" l_output2=""
 l_parameter_name="net.ipv4.conf.default.accept_redirects"
 l_expected="0"
 l_searchloc="/run/sysctl.d/*.conf /etc/sysctl.d/*.conf /usr/local/lib/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /lib/sysctl.d/*.conf /etc/sysctl.conf"

 l_running="$(sysctl $l_parameter_name 2>/dev/null | awk -F= '{print $2}' | tr -d ' ')"
 if [ "$l_running" = "$l_expected" ]; then
  l_output="$l_output $l_parameter_name is set to $l_running in running config."
 else
  l_output2="$l_output2 $l_parameter_name is set to $l_running in running config (expected $l_expected)."
 fi

 l_conf_val="$(grep -rPois "^\h*$l_parameter_name\h*=\h*$l_expected\b" $l_searchloc 2>/dev/null | tail -1)"
 if [ -n "$l_conf_val" ]; then
  l_output="$l_output $l_parameter_name = $l_expected found in sysctl conf."
 else
  l_output2="$l_output2 $l_parameter_name = $l_expected not found in any sysctl conf file."
 fi

 if [ -z "$l_output2" ]; then
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure net.ipv4.conf.default.accept_redirects is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "3.3.1.9" >> p12
 else
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure net.ipv4.conf.default.accept_redirects is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "3.3.1.9" >> p12
 fi
}

#3.3.1.10
#Ensure net.ipv4.conf.all.secure_redirects is configured.
#!/usr/bin/env bash
{
 l_output="" l_output2=""
 l_parameter_name="net.ipv4.conf.all.secure_redirects"
 l_expected="0"
 l_searchloc="/run/sysctl.d/*.conf /etc/sysctl.d/*.conf /usr/local/lib/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /lib/sysctl.d/*.conf /etc/sysctl.conf"

 l_running="$(sysctl $l_parameter_name 2>/dev/null | awk -F= '{print $2}' | tr -d ' ')"
 if [ "$l_running" = "$l_expected" ]; then
  l_output="$l_output $l_parameter_name is set to $l_running in running config."
 else
  l_output2="$l_output2 $l_parameter_name is set to $l_running in running config (expected $l_expected)."
 fi

 l_conf_val="$(grep -rPois "^\h*$l_parameter_name\h*=\h*$l_expected\b" $l_searchloc 2>/dev/null | tail -1)"
 if [ -n "$l_conf_val" ]; then
  l_output="$l_output $l_parameter_name = $l_expected found in sysctl conf."
 else
  l_output2="$l_output2 $l_parameter_name = $l_expected not found in any sysctl conf file."
 fi

 if [ -z "$l_output2" ]; then
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure net.ipv4.conf.all.secure_redirects is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "3.3.1.10" >> p12
 else
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure net.ipv4.conf.all.secure_redirects is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "3.3.1.10" >> p12
 fi
}


#3.3.1.11
#Ensure net.ipv4.conf.default.secure_redirects is configured.
#!/usr/bin/env bash
{
 l_output="" l_output2=""
 l_parameter_name="net.ipv4.conf.default.secure_redirects"
 l_expected="0"
 l_searchloc="/run/sysctl.d/*.conf /etc/sysctl.d/*.conf /usr/local/lib/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /lib/sysctl.d/*.conf /etc/sysctl.conf"

 l_running="$(sysctl $l_parameter_name 2>/dev/null | awk -F= '{print $2}' | tr -d ' ')"
 if [ "$l_running" = "$l_expected" ]; then
  l_output="$l_output $l_parameter_name is set to $l_running in running config."
 else
  l_output2="$l_output2 $l_parameter_name is set to $l_running in running config (expected $l_expected)."
 fi

 l_conf_val="$(grep -rPois "^\h*$l_parameter_name\h*=\h*$l_expected\b" $l_searchloc 2>/dev/null | tail -1)"
 if [ -n "$l_conf_val" ]; then
  l_output="$l_output $l_parameter_name = $l_expected found in sysctl conf."
 else
  l_output2="$l_output2 $l_parameter_name = $l_expected not found in any sysctl conf file."
 fi

 if [ -z "$l_output2" ]; then
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure net.ipv4.conf.default.secure_redirects is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "3.3.1.11" >> p12
 else
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure net.ipv4.conf.default.secure_redirects is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "3.3.1.11" >> p12
 fi
}


#3.3.1.12
#Ensure net.ipv4.conf.all.rp_filter is configured.
#!/usr/bin/env bash
{
 l_output="" l_output2=""
 l_parameter_name="net.ipv4.conf.all.rp_filter"
 l_expected="1"
 l_searchloc="/run/sysctl.d/*.conf /etc/sysctl.d/*.conf /usr/local/lib/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /lib/sysctl.d/*.conf /etc/sysctl.conf"

 l_running="$(sysctl $l_parameter_name 2>/dev/null | awk -F= '{print $2}' | tr -d ' ')"
 if [ "$l_running" = "$l_expected" ]; then
  l_output="$l_output $l_parameter_name is set to $l_running in running config."
 else
  l_output2="$l_output2 $l_parameter_name is set to $l_running in running config (expected $l_expected)."
 fi

 l_conf_val="$(grep -rPois "^\h*$l_parameter_name\h*=\h*$l_expected\b" $l_searchloc 2>/dev/null | tail -1)"
 if [ -n "$l_conf_val" ]; then
  l_output="$l_output $l_parameter_name = $l_expected found in sysctl conf."
 else
  l_output2="$l_output2 $l_parameter_name = $l_expected not found in any sysctl conf file."
 fi

 if [ -z "$l_output2" ]; then
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure net.ipv4.conf.all.rp_filter is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "3.3.1.12" >> p12
 else
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure net.ipv4.conf.all.rp_filter is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "3.3.1.12" >> p12
 fi
}

#3.3.1.13
#Ensure net.ipv4.conf.default.rp_filter is configured.
#!/usr/bin/env bash
{
 l_output="" l_output2=""
 l_parameter_name="net.ipv4.conf.default.rp_filter"
 l_expected="1"
 l_searchloc="/run/sysctl.d/*.conf /etc/sysctl.d/*.conf /usr/local/lib/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /lib/sysctl.d/*.conf /etc/sysctl.conf"

 l_running="$(sysctl $l_parameter_name 2>/dev/null | awk -F= '{print $2}' | tr -d ' ')"
 if [ "$l_running" = "$l_expected" ]; then
  l_output="$l_output $l_parameter_name is set to $l_running in running config."
 else
  l_output2="$l_output2 $l_parameter_name is set to $l_running in running config (expected $l_expected)."
 fi

 l_conf_val="$(grep -rPois "^\h*$l_parameter_name\h*=\h*$l_expected\b" $l_searchloc 2>/dev/null | tail -1)"
 if [ -n "$l_conf_val" ]; then
  l_output="$l_output $l_parameter_name = $l_expected found in sysctl conf."
 else
  l_output2="$l_output2 $l_parameter_name = $l_expected not found in any sysctl conf file."
 fi

 if [ -z "$l_output2" ]; then
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure net.ipv4.conf.default.rp_filter is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "3.3.1.13" >> p12
 else
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure net.ipv4.conf.default.rp_filter is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "3.3.1.13" >> p12
 fi
}

#3.3.1.14
#Ensure net.ipv4.conf.all.accept_source_route is configured.
#!/usr/bin/env bash
{
 l_output="" l_output2=""
 l_parameter_name="net.ipv4.conf.all.accept_source_route"
 l_expected="0"
 l_searchloc="/run/sysctl.d/*.conf /etc/sysctl.d/*.conf /usr/local/lib/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /lib/sysctl.d/*.conf /etc/sysctl.conf"

 l_running="$(sysctl $l_parameter_name 2>/dev/null | awk -F= '{print $2}' | tr -d ' ')"
 if [ "$l_running" = "$l_expected" ]; then
  l_output="$l_output $l_parameter_name is set to $l_running in running config."
 else
  l_output2="$l_output2 $l_parameter_name is set to $l_running in running config (expected $l_expected)."
 fi

 l_conf_val="$(grep -rPois "^\h*$l_parameter_name\h*=\h*$l_expected\b" $l_searchloc 2>/dev/null | tail -1)"
 if [ -n "$l_conf_val" ]; then
  l_output="$l_output $l_parameter_name = $l_expected found in sysctl conf."
 else
  l_output2="$l_output2 $l_parameter_name = $l_expected not found in any sysctl conf file."
 fi

 if [ -z "$l_output2" ]; then
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure net.ipv4.conf.all.accept_source_route is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "3.3.1.14" >> p12
 else
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure net.ipv4.conf.all.accept_source_route is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "3.3.1.14" >> p12
 fi
}

#3.3.1.15
#Ensure net.ipv4.conf.default.accept_source_route is configured.
#!/usr/bin/env bash
{
 l_output="" l_output2=""
 l_parameter_name="net.ipv4.conf.default.accept_source_route"
 l_expected="0"
 l_searchloc="/run/sysctl.d/*.conf /etc/sysctl.d/*.conf /usr/local/lib/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /lib/sysctl.d/*.conf /etc/sysctl.conf"

 l_running="$(sysctl $l_parameter_name 2>/dev/null | awk -F= '{print $2}' | tr -d ' ')"
 if [ "$l_running" = "$l_expected" ]; then
  l_output="$l_output $l_parameter_name is set to $l_running in running config."
 else
  l_output2="$l_output2 $l_parameter_name is set to $l_running in running config (expected $l_expected)."
 fi

 l_conf_val="$(grep -rPois "^\h*$l_parameter_name\h*=\h*$l_expected\b" $l_searchloc 2>/dev/null | tail -1)"
 if [ -n "$l_conf_val" ]; then
  l_output="$l_output $l_parameter_name = $l_expected found in sysctl conf."
 else
  l_output2="$l_output2 $l_parameter_name = $l_expected not found in any sysctl conf file."
 fi

 if [ -z "$l_output2" ]; then
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure net.ipv4.conf.default.accept_source_route is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "3.3.1.15" >> p12
 else
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure net.ipv4.conf.default.accept_source_route is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "3.3.1.15" >> p12
 fi
}


#3.3.1.16
#Ensure net.ipv4.conf.all.log_martians is configured.
#!/usr/bin/env bash
{
 l_output="" l_output2=""
 l_parameter_name="net.ipv4.conf.all.log_martians"
 l_expected="1"
 l_searchloc="/run/sysctl.d/*.conf /etc/sysctl.d/*.conf /usr/local/lib/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /lib/sysctl.d/*.conf /etc/sysctl.conf"

 l_running="$(sysctl $l_parameter_name 2>/dev/null | awk -F= '{print $2}' | tr -d ' ')"
 if [ "$l_running" = "$l_expected" ]; then
  l_output="$l_output $l_parameter_name is set to $l_running in running config."
 else
  l_output2="$l_output2 $l_parameter_name is set to $l_running in running config (expected $l_expected)."
 fi

 l_conf_val="$(grep -rPois "^\h*$l_parameter_name\h*=\h*$l_expected\b" $l_searchloc 2>/dev/null | tail -1)"
 if [ -n "$l_conf_val" ]; then
  l_output="$l_output $l_parameter_name = $l_expected found in sysctl conf."
 else
  l_output2="$l_output2 $l_parameter_name = $l_expected not found in any sysctl conf file."
 fi

 if [ -z "$l_output2" ]; then
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure net.ipv4.conf.all.log_martians is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "3.3.1.16" >> p12
 else
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure net.ipv4.conf.all.log_martians is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "3.3.1.16" >> p12
 fi
}

#3.3.1.17
#Ensure net.ipv4.conf.default.log_martians is configured.
#!/usr/bin/env bash
{
 l_output="" l_output2=""
 l_parameter_name="net.ipv4.conf.default.log_martians"
 l_expected="1"
 l_searchloc="/run/sysctl.d/*.conf /etc/sysctl.d/*.conf /usr/local/lib/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /lib/sysctl.d/*.conf /etc/sysctl.conf"

 l_running="$(sysctl $l_parameter_name 2>/dev/null | awk -F= '{print $2}' | tr -d ' ')"
 if [ "$l_running" = "$l_expected" ]; then
  l_output="$l_output $l_parameter_name is set to $l_running in running config."
 else
  l_output2="$l_output2 $l_parameter_name is set to $l_running in running config (expected $l_expected)."
 fi

 l_conf_val="$(grep -rPois "^\h*$l_parameter_name\h*=\h*$l_expected\b" $l_searchloc 2>/dev/null | tail -1)"
 if [ -n "$l_conf_val" ]; then
  l_output="$l_output $l_parameter_name = $l_expected found in sysctl conf."
 else
  l_output2="$l_output2 $l_parameter_name = $l_expected not found in any sysctl conf file."
 fi

 if [ -z "$l_output2" ]; then
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure net.ipv4.conf.default.log_martians is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "3.3.1.17" >> p12
 else
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure net.ipv4.conf.default.log_martians is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "3.3.1.17" >> p12
 fi
}


#3.3.1.18
#Ensure net.ipv4.tcp_syncookies is configured.
#!/usr/bin/env bash
{
 l_output="" l_output2=""
 l_parameter_name="net.ipv4.tcp_syncookies"
 l_expected="1"
 l_searchloc="/run/sysctl.d/*.conf /etc/sysctl.d/*.conf /usr/local/lib/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /lib/sysctl.d/*.conf /etc/sysctl.conf"

 l_running="$(sysctl $l_parameter_name 2>/dev/null | awk -F= '{print $2}' | tr -d ' ')"
 if [ "$l_running" = "$l_expected" ]; then
  l_output="$l_output $l_parameter_name is set to $l_running in running config."
 else
  l_output2="$l_output2 $l_parameter_name is set to $l_running in running config (expected $l_expected)."
 fi

 l_conf_val="$(grep -rPois "^\h*$l_parameter_name\h*=\h*$l_expected\b" $l_searchloc 2>/dev/null | tail -1)"
 if [ -n "$l_conf_val" ]; then
  l_output="$l_output $l_parameter_name = $l_expected found in sysctl conf."
 else
  l_output2="$l_output2 $l_parameter_name = $l_expected not found in any sysctl conf file."
 fi

 if [ -z "$l_output2" ]; then
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure net.ipv4.tcp_syncookies is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "3.3.1.18" >> p12
 else
  echo "Network Configuration / Network Kernel Parameters" >> p1
  echo "Ensure net.ipv4.tcp_syncookies is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "3.3.1.18" >> p12
 fi
}

###############################################################################################################
#3.3.2.1
#Ensure net.ipv6.conf.all.forwarding is configured.

#!/usr/bin/env bash

{
 l_output=""
 l_output2=""
 l_result=""

 l_parameter_name="net.ipv6.conf.all.forwarding"
 l_expected="0"

 l_searchloc="/run/sysctl.d/*.conf \
 /etc/sysctl.d/*.conf \
 /usr/local/lib/sysctl.d/*.conf \
 /usr/lib/sysctl.d/*.conf \
 /lib/sysctl.d/*.conf \
 /etc/sysctl.conf"

 # Check whether IPv6 is disabled
 if [ -f /sys/module/ipv6/parameters/disable ] && \
    grep -Pqs '^\h*1\b' /sys/module/ipv6/parameters/disable; then

  l_output="IPv6 is disabled on the system. ${l_parameter_name} is not applicable."

  l_result="Not Applicable"

 else

  # Running configuration validation
  l_running="$(sysctl "$l_parameter_name" 2>/dev/null | awk -F= '{print $2}' | tr -d ' ')"

  if [ "$l_running" = "$l_expected" ]; then

   l_output="${l_output} ${l_parameter_name} is set to ${l_running} in running configuration."

  else

   l_output2="${l_output2} ${l_parameter_name} is set to ${l_running} in running configuration (expected ${l_expected})."

  fi

  # Persistent configuration validation
  l_conf_val="$(grep -rPs "^\h*${l_parameter_name}\h*=\h*${l_expected}\b" $l_searchloc 2>/dev/null)"

  if [ -n "$l_conf_val" ]; then

   l_output="${l_output} ${l_parameter_name}=${l_expected} found in sysctl configuration."

  else

   l_output2="${l_output2} ${l_parameter_name}=${l_expected} not found in any sysctl configuration file."

  fi

  # Final Result
  if [ -z "$l_output2" ]; then
   l_result="Yes"
  else
   l_result="No"
  fi

 fi

 # Remove newlines
 l_output=$(echo "$l_output" | tr '\n' ' ')
 l_output2=$(echo "$l_output2" | tr '\n' ' ')

 # Escape quotes
 l_output=$(echo "$l_output" | sed 's/"/""/g')
 l_output2=$(echo "$l_output2" | sed 's/"/""/g')

 # CSV Output
 echo "\"Network Configuration / Network Kernel Parameters\"" >> p1
 echo "\"Ensure net.ipv6.conf.all.forwarding is configured.\"" >> p2

 if [ "$l_result" = "No" ]; then
  echo "\"$l_output2\"" >> p3
 else
  echo "\"$l_output\"" >> p3
 fi

 echo "\"$l_result\"" >> p4
 echo "\"3.3.2.1\"" >> p12

}

#3.3.2.2
#Ensure net.ipv6.conf.default.forwarding is configured.

#!/usr/bin/env bash

{
 l_output=""
 l_output2=""
 l_result=""

 l_parameter_name="net.ipv6.conf.default.forwarding"
 l_expected="0"

 l_searchloc="/run/sysctl.d/*.conf \
 /etc/sysctl.d/*.conf \
 /usr/local/lib/sysctl.d/*.conf \
 /usr/lib/sysctl.d/*.conf \
 /lib/sysctl.d/*.conf \
 /etc/sysctl.conf"

 # Check whether IPv6 is disabled
 if [ -f /sys/module/ipv6/parameters/disable ] && \
    grep -Pqs '^\h*1\b' /sys/module/ipv6/parameters/disable; then

  l_output="IPv6 is disabled on the system. ${l_parameter_name} is not applicable."

  l_result="Not Applicable"

 else

  # Running configuration validation
  l_running="$(sysctl "$l_parameter_name" 2>/dev/null | awk -F= '{print $2}' | tr -d ' ')"

  if [ "$l_running" = "$l_expected" ]; then

   l_output="$l_output ${l_parameter_name} is set to ${l_running} in running configuration."

  else

   l_output2="$l_output2 ${l_parameter_name} is set to ${l_running} in running configuration (expected ${l_expected})."

  fi

  # Persistent configuration validation
  l_conf_val="$(grep -rPs "^\h*${l_parameter_name}\h*=\h*${l_expected}\b" $l_searchloc 2>/dev/null)"

  if [ -n "$l_conf_val" ]; then

   l_output="$l_output ${l_parameter_name}=${l_expected} found in sysctl configuration."

  else

   l_output2="$l_output2 ${l_parameter_name}=${l_expected} not found in any sysctl configuration file."

  fi

  # Final result
  if [ -z "$l_output2" ]; then
   l_result="Yes"
  else
   l_result="No"
  fi

 fi

 # Remove newlines
 l_output=$(echo "$l_output" | tr '\n' ' ')
 l_output2=$(echo "$l_output2" | tr '\n' ' ')

 # Escape quotes
 l_output=$(echo "$l_output" | sed 's/"/""/g')
 l_output2=$(echo "$l_output2" | sed 's/"/""/g')

 # CSV output
 echo "\"Network Configuration / Network Kernel Parameters\"" >> p1
 echo "\"Ensure net.ipv6.conf.default.forwarding is configured.\"" >> p2

 if [ "$l_result" = "No" ]; then
  echo "\"$l_output2\"" >> p3
 else
  echo "\"$l_output\"" >> p3
 fi

 echo "\"$l_result\"" >> p4
 echo "\"3.3.2.2\"" >> p12

}

#3.3.2.3
#Ensure net.ipv6.conf.all.accept_redirects is configured.

#!/usr/bin/env bash

{
 l_output=""
 l_output2=""
 l_result=""

 l_parameter_name="net.ipv6.conf.all.accept_redirects"
 l_expected="0"

 l_searchloc="/run/sysctl.d/*.conf \
 /etc/sysctl.d/*.conf \
 /usr/local/lib/sysctl.d/*.conf \
 /usr/lib/sysctl.d/*.conf \
 /lib/sysctl.d/*.conf \
 /etc/sysctl.conf"

  # Check whether IPv6 is disabled
 if [ -f /sys/module/ipv6/parameters/disable ] && \
    grep -Pqs '^\h*1\b' /sys/module/ipv6/parameters/disable; then

  l_output="IPv6 is disabled on the system. ${l_parameter_name} is not applicable."

  l_result="Not Applicable"

 else

  # Running configuration validation
  l_running="$(sysctl "$l_parameter_name" 2>/dev/null | awk -F= '{print $2}' | tr -d ' ')"

  if [ "$l_running" = "$l_expected" ]; then

   l_output="$l_output ${l_parameter_name} is set to ${l_running} in running configuration."

  else

   l_output2="$l_output2 ${l_parameter_name} is set to ${l_running} in running configuration (expected ${l_expected})."

  fi

  # Persistent configuration validation
  l_conf_val="$(grep -rPs "^\h*${l_parameter_name}\h*=\h*${l_expected}\b" $l_searchloc 2>/dev/null)"

  if [ -n "$l_conf_val" ]; then

   l_output="$l_output ${l_parameter_name}=${l_expected} found in sysctl configuration."

  else

   l_output2="$l_output2 ${l_parameter_name}=${l_expected} not found in any sysctl configuration file."

  fi

  # Final result
  if [ -z "$l_output2" ]; then
   l_result="Yes"
  else
   l_result="No"
  fi

 fi

 # Remove newlines
 l_output=$(echo "$l_output" | tr '\n' ' ')
 l_output2=$(echo "$l_output2" | tr '\n' ' ')

 # Escape quotes
 l_output=$(echo "$l_output" | sed 's/"/""/g')
 l_output2=$(echo "$l_output2" | sed 's/"/""/g')

 # CSV output
 echo "\"Network Configuration / Network Kernel Parameters\"" >> p1
 echo "\"Ensure net.ipv6.conf.all.accept_redirects is configured.\"" >> p2

 if [ "$l_result" = "No" ]; then
  echo "\"$l_output2\"" >> p3
 else
  echo "\"$l_output\"" >> p3
 fi

 echo "\"$l_result\"" >> p4
 echo "\"3.3.2.3\"" >> p12

}

#3.3.2.4
#Ensure net.ipv6.conf.default.accept_redirects is configured.

#!/usr/bin/env bash

{
 l_output=""
 l_output2=""
 l_result=""

 l_parameter_name="net.ipv6.conf.default.accept_redirects"
 l_expected="0"

 l_searchloc="/run/sysctl.d/*.conf \
 /etc/sysctl.d/*.conf \
 /usr/local/lib/sysctl.d/*.conf \
 /usr/lib/sysctl.d/*.conf \
 /lib/sysctl.d/*.conf \
 /etc/sysctl.conf"

 # Check whether IPv6 is disabled
 if [ -f /sys/module/ipv6/parameters/disable ] && \
    grep -Pqs '^\h*1\b' /sys/module/ipv6/parameters/disable; then

  l_output="IPv6 is disabled on the system. ${l_parameter_name} is not applicable."

  l_result="Not Applicable"

 else

  # Running configuration validation
  l_running="$(sysctl "$l_parameter_name" 2>/dev/null | awk -F= '{print $2}' | tr -d ' ')"

  if [ "$l_running" = "$l_expected" ]; then

   l_output="$l_output ${l_parameter_name} is set to ${l_running} in running configuration."

  else

   l_output2="$l_output2 ${l_parameter_name} is set to ${l_running} in running configuration (expected ${l_expected})."

  fi

  # Persistent configuration validation
  l_conf_val="$(grep -rPs "^\h*${l_parameter_name}\h*=\h*${l_expected}\b" $l_searchloc 2>/dev/null)"

  if [ -n "$l_conf_val" ]; then

   l_output="$l_output ${l_parameter_name}=${l_expected} found in sysctl configuration."

  else

   l_output2="$l_output2 ${l_parameter_name}=${l_expected} not found in any sysctl configuration file."

  fi

  # Final result
  if [ -z "$l_output2" ]; then
   l_result="Yes"
  else
   l_result="No"
  fi

 fi

 # Remove newlines
 l_output=$(echo "$l_output" | tr '\n' ' ')
 l_output2=$(echo "$l_output2" | tr '\n' ' ')

 # Escape quotes
 l_output=$(echo "$l_output" | sed 's/"/""/g')
 l_output2=$(echo "$l_output2" | sed 's/"/""/g')

 # CSV output
 echo "\"Network Configuration / Network Kernel Parameters\"" >> p1
 echo "\"Ensure net.ipv6.conf.default.accept_redirects is configured.\"" >> p2

 if [ "$l_result" = "No" ]; then
  echo "\"$l_output2\"" >> p3
 else
  echo "\"$l_output\"" >> p3
 fi

 echo "\"$l_result\"" >> p4
 echo "\"3.3.2.4\"" >> p12

}

#3.3.2.5
#Ensure net.ipv6.conf.all.accept_source_route is configured.

#!/usr/bin/env bash

{
 l_output=""
 l_output2=""
 l_result=""

 l_parameter_name="net.ipv6.conf.all.accept_source_route"
 l_expected="0"

 l_searchloc="/run/sysctl.d/*.conf \
 /etc/sysctl.d/*.conf \
 /usr/local/lib/sysctl.d/*.conf \
 /usr/lib/sysctl.d/*.conf \
 /lib/sysctl.d/*.conf \
 /etc/sysctl.conf"

 # Check whether IPv6 is disabled
 if [ -f /sys/module/ipv6/parameters/disable ] && \
    grep -Pqs '^\h*1\b' /sys/module/ipv6/parameters/disable; then

  l_output="IPv6 is disabled on the system. ${l_parameter_name} is not applicable."

  l_result="Not Applicable"

 else

  # Running configuration validation
  l_running="$(sysctl "$l_parameter_name" 2>/dev/null | awk -F= '{print $2}' | tr -d ' ')"

  if [ "$l_running" = "$l_expected" ]; then

   l_output="$l_output ${l_parameter_name} is set to ${l_running} in running configuration."

  else

   l_output2="$l_output2 ${l_parameter_name} is set to ${l_running} in running configuration (expected ${l_expected})."

  fi

  # Persistent configuration validation
  l_conf_val="$(grep -rPs "^\h*${l_parameter_name}\h*=\h*${l_expected}\b" $l_searchloc 2>/dev/null)"

  if [ -n "$l_conf_val" ]; then

   l_output="$l_output ${l_parameter_name}=${l_expected} found in sysctl configuration."

  else

   l_output2="$l_output2 ${l_parameter_name}=${l_expected} not found in any sysctl configuration file."

  fi

  # Final result
  if [ -z "$l_output2" ]; then
   l_result="Yes"
  else
   l_result="No"
  fi

 fi

 # Remove newlines
 l_output=$(echo "$l_output" | tr '\n' ' ')
 l_output2=$(echo "$l_output2" | tr '\n' ' ')

 # Escape quotes
 l_output=$(echo "$l_output" | sed 's/"/""/g')
 l_output2=$(echo "$l_output2" | sed 's/"/""/g')

 # CSV output
 echo "\"Network Configuration / Network Kernel Parameters\"" >> p1
 echo "\"Ensure net.ipv6.conf.all.accept_source_route is configured.\"" >> p2

 if [ "$l_result" = "No" ]; then
  echo "\"$l_output2\"" >> p3
 else
  echo "\"$l_output\"" >> p3
 fi

 echo "\"$l_result\"" >> p4
 echo "\"3.3.2.5\"" >> p12

}

#3.3.2.6
#Ensure net.ipv6.conf.default.accept_source_route is configured.

#!/usr/bin/env bash

{
 l_output=""
 l_output2=""
 l_result=""

 l_parameter_name="net.ipv6.conf.default.accept_source_route"
 l_expected="0"

 l_searchloc="/run/sysctl.d/*.conf \
 /etc/sysctl.d/*.conf \
 /usr/local/lib/sysctl.d/*.conf \
 /usr/lib/sysctl.d/*.conf \
 /lib/sysctl.d/*.conf \
 /etc/sysctl.conf"

  # Check whether IPv6 is disabled
 if [ -f /sys/module/ipv6/parameters/disable ] && \
    grep -Pqs '^\h*1\b' /sys/module/ipv6/parameters/disable; then

  l_output="IPv6 is disabled on the system. ${l_parameter_name} is not applicable."

  l_result="Not Applicable"

 else

  # Running configuration validation
  l_running="$(sysctl "$l_parameter_name" 2>/dev/null | awk -F= '{print $2}' | tr -d ' ')"

  if [ "$l_running" = "$l_expected" ]; then

   l_output="$l_output ${l_parameter_name} is set to ${l_running} in running configuration."

  else

   l_output2="$l_output2 ${l_parameter_name} is set to ${l_running} in running configuration (expected ${l_expected})."

  fi

  # Persistent configuration validation
  l_conf_val="$(grep -rPs "^\h*${l_parameter_name}\h*=\h*${l_expected}\b" $l_searchloc 2>/dev/null)"

  if [ -n "$l_conf_val" ]; then

   l_output="$l_output ${l_parameter_name}=${l_expected} found in sysctl configuration."

  else

   l_output2="$l_output2 ${l_parameter_name}=${l_expected} not found in any sysctl configuration file."

  fi

  # Final result
  if [ -z "$l_output2" ]; then
   l_result="Yes"
  else
   l_result="No"
  fi

 fi

 # Remove newlines
 l_output=$(echo "$l_output" | tr '\n' ' ')
 l_output2=$(echo "$l_output2" | tr '\n' ' ')

 # Escape quotes
 l_output=$(echo "$l_output" | sed 's/"/""/g')
 l_output2=$(echo "$l_output2" | sed 's/"/""/g')

 # CSV output
 echo "\"Network Configuration / Network Kernel Parameters\"" >> p1
 echo "\"Ensure net.ipv6.conf.default.accept_source_route is configured.\"" >> p2

 if [ "$l_result" = "No" ]; then
  echo "\"$l_output2\"" >> p3
 else
  echo "\"$l_output\"" >> p3
 fi

 echo "\"$l_result\"" >> p4
 echo "\"3.3.2.6\"" >> p12

}

#3.3.2.7
#Ensure net.ipv6.conf.all.accept_ra is configured.

#!/usr/bin/env bash

{
 l_output=""
 l_output2=""
 l_result=""

 l_parameter_name="net.ipv6.conf.all.accept_ra"
 l_expected="0"

 l_searchloc="/run/sysctl.d/*.conf \
 /etc/sysctl.d/*.conf \
 /usr/local/lib/sysctl.d/*.conf \
 /usr/lib/sysctl.d/*.conf \
 /lib/sysctl.d/*.conf \
 /etc/sysctl.conf"

 # Check whether IPv6 is disabled
 if [ -f /sys/module/ipv6/parameters/disable ] && \
    grep -Pqs '^\h*1\b' /sys/module/ipv6/parameters/disable; then

  l_output="IPv6 is disabled on the system. ${l_parameter_name} is not applicable."

  l_result="Not Applicable"

 else

  # Running configuration validation
  l_running="$(sysctl "$l_parameter_name" 2>/dev/null | awk -F= '{print $2}' | tr -d ' ')"

  if [ "$l_running" = "$l_expected" ]; then

   l_output="$l_output ${l_parameter_name} is set to ${l_running} in running configuration."

  else

   l_output2="$l_output2 ${l_parameter_name} is set to ${l_running} in running configuration (expected ${l_expected})."

  fi

  # Persistent configuration validation
  l_conf_val="$(grep -rPs "^\h*${l_parameter_name}\h*=\h*${l_expected}\b" $l_searchloc 2>/dev/null)"

  if [ -n "$l_conf_val" ]; then

   l_output="$l_output ${l_parameter_name}=${l_expected} found in sysctl configuration."

  else

   l_output2="$l_output2 ${l_parameter_name}=${l_expected} not found in any sysctl configuration file."

  fi

  # Final result
  if [ -z "$l_output2" ]; then
   l_result="Yes"
  else
   l_result="No"
  fi

 fi

 # Remove newlines
 l_output=$(echo "$l_output" | tr '\n' ' ')
 l_output2=$(echo "$l_output2" | tr '\n' ' ')

 # Escape quotes
 l_output=$(echo "$l_output" | sed 's/"/""/g')
 l_output2=$(echo "$l_output2" | sed 's/"/""/g')

 # CSV output
 echo "\"Network Configuration / Network Kernel Parameters\"" >> p1
 echo "\"Ensure net.ipv6.conf.all.accept_ra is configured.\"" >> p2

 if [ "$l_result" = "No" ]; then
  echo "\"$l_output2\"" >> p3
 else
  echo "\"$l_output\"" >> p3
 fi

 echo "\"$l_result\"" >> p4
 echo "\"3.3.2.7\"" >> p12

}

#3.3.2.8
#Ensure net.ipv6.conf.default.accept_ra is configured.

#!/usr/bin/env bash

{
 l_output=""
 l_output2=""
 l_result=""

 l_parameter_name="net.ipv6.conf.default.accept_ra"
 l_expected="0"

 l_searchloc="/run/sysctl.d/*.conf \
 /etc/sysctl.d/*.conf \
 /usr/local/lib/sysctl.d/*.conf \
 /usr/lib/sysctl.d/*.conf \
 /lib/sysctl.d/*.conf \
 /etc/sysctl.conf"

 # Check whether IPv6 is disabled
 if [ -f /sys/module/ipv6/parameters/disable ] && \
    grep -Pqs '^\h*1\b' /sys/module/ipv6/parameters/disable; then

  l_output="IPv6 is disabled on the system. ${l_parameter_name} is not applicable."

  l_result="Not Applicable"

 else

  # Running configuration validation
  l_running="$(sysctl "$l_parameter_name" 2>/dev/null | awk -F= '{print $2}' | tr -d ' ')"

  if [ "$l_running" = "$l_expected" ]; then

   l_output="$l_output ${l_parameter_name} is set to ${l_running} in running configuration."

  else

   l_output2="$l_output2 ${l_parameter_name} is set to ${l_running} in running configuration (expected ${l_expected})."

  fi

  # Persistent configuration validation
  l_conf_val="$(grep -rPs "^\h*${l_parameter_name}\h*=\h*${l_expected}\b" $l_searchloc 2>/dev/null)"

  if [ -n "$l_conf_val" ]; then

   l_output="$l_output ${l_parameter_name}=${l_expected} found in sysctl configuration."

  else

   l_output2="$l_output2 ${l_parameter_name}=${l_expected} not found in any sysctl configuration file."

  fi

  # Final result
  if [ -z "$l_output2" ]; then
   l_result="Yes"
  else
   l_result="No"
  fi

 fi

 # Remove newlines
 l_output=$(echo "$l_output" | tr '\n' ' ')
 l_output2=$(echo "$l_output2" | tr '\n' ' ')

 # Escape quotes
 l_output=$(echo "$l_output" | sed 's/"/""/g')
 l_output2=$(echo "$l_output2" | sed 's/"/""/g')

 # CSV output
 echo "\"Network Configuration / Network Kernel Parameters\"" >> p1
 echo "\"Ensure net.ipv6.conf.default.accept_ra is configured.\"" >> p2

 if [ "$l_result" = "No" ]; then
  echo "\"$l_output2\"" >> p3
 else
  echo "\"$l_output\"" >> p3
 fi

 echo "\"$l_result\"" >> p4
 echo "\"3.3.2.8\"" >> p12

}

###############################################################################################################

#4.1.1
#Ensure ufw is installed.
pac11='ufw'
if dpkg-query -W -f='${Status}' $pac11 2>/dev/null | grep -q "ok installed"; then
	echo "Host Based Firewall / Configure Uncomplicated Firewall" >> p1
	echo "Ensure ufw is installed." >> p2
	echo "ufw is installed." >> p3
	echo "Yes" >> p4
	echo "4.1.1" >> p12
else
	echo "Host Based Firewall / Configure Uncomplicated Firewall" >> p1
	echo "Ensure ufw is installed." >> p2
	echo "ufw is not installed." >> p3
	echo "No" >> p4
	echo "4.1.1" >> p12
fi


#4.1.2
#Ensure ufw service is configured.
{
 l_output="" l_output2=""
 # Check 1: ufw.service is enabled
 if systemctl is-enabled ufw.service 2>/dev/null | grep -q "enabled"; then
  l_output="$l_output ufw.service is enabled."
 else
  l_output2="$l_output2 ufw.service is not enabled."
 fi
 # Check 2: ufw.service is active
 if systemctl is-active ufw.service 2>/dev/null | grep -q "^active"; then
  l_output="$l_output ufw.service is active."
 else
  l_output2="$l_output2 ufw.service is not active."
 fi
 # Check 3: ufw status is active
 if ufw status 2>/dev/null | grep -q "Status: active"; then
  l_output="$l_output ufw status is active."
 else
  l_output2="$l_output2 ufw status is not active."
 fi
 if [ -z "$l_output2" ]; then
  echo "Host Based Firewall / Configure Uncomplicated Firewall" >> p1
  echo "Ensure ufw service is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "4.1.2" >> p12
 else
  echo "Host Based Firewall / Configure Uncomplicated Firewall" >> p1
  echo "Ensure ufw service is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "4.1.2" >> p12
 fi
}

#4.1.3
#Ensure ufw incoming default is configured.
{
 l_output="" l_output2=""
 # Check incoming default policy is deny or reject
 l_incoming="$(ufw status verbose 2>/dev/null | awk -F',' '/^Default:/ {print $1}' | awk '{print $NF}')"
 if [[ "$l_incoming" == "deny" || "$l_incoming" == "reject" ]]; then
  l_output="$l_output ufw default incoming policy is set to \"$l_incoming\"."
 else
  l_output2="$l_output2 ufw default incoming policy is set to \"$l_incoming\" (expected: deny or reject)."
 fi
 if [ -z "$l_output2" ]; then
  echo "Host Based Firewall / Configure Uncomplicated Firewall" >> p1
  echo "Ensure ufw incoming default is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "4.1.3" >> p12
 else
  echo "Host Based Firewall / Configure Uncomplicated Firewall" >> p1
  echo "Ensure ufw incoming default is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "4.1.3" >> p12
 fi
}



#4.1.5
#Ensure ufw routed default is configured.
{
 l_output="" l_output2=""
 # Check routed default policy is disabled or deny
 l_routed="$(ufw status verbose 2>/dev/null | awk -F',' '/^Default:/ {print $3}' | awk '{print $1}')"
 if [[ "$l_routed" == "disabled" || "$l_routed" == "deny" ]]; then
  l_output="$l_output ufw default routed policy is set to \"$l_routed\"."
 else
  l_output2="$l_output2 ufw default routed policy is set to \"$l_routed\" (expected: disabled or deny)."
 fi
 if [ -z "$l_output2" ]; then
  echo "Host Based Firewall / Configure Uncomplicated Firewall" >> p1
  echo "Ensure ufw routed default is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "4.1.5" >> p12
 else
  echo "Host Based Firewall / Configure Uncomplicated Firewall" >> p1
  echo "Ensure ufw routed default is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "4.1.5" >> p12
 fi
}

############################################################################################################

#5.1.1
#Ensure access to /etc/ssh/sshd_config is configured.

{
 l_output=""
 l_output2=""
 l_perm_mask="0177"
 l_maxperm="600"

 f_sshd_files_chk() {

  l_mode="$(stat -Lc '%a' "$l_file" 2>/dev/null)"
  l_user="$(stat -Lc '%U' "$l_file" 2>/dev/null)"
  l_group="$(stat -Lc '%G' "$l_file" 2>/dev/null)"

  if [ -n "$l_mode" ]; then

   if [ "$l_mode" -gt "$l_maxperm" ]; then
    l_output2="$l_output2 File: \"$l_file\" mode \"$l_mode\" should be 600 or more restrictive."
   fi

   if [ "$l_user" != "root" ]; then
    l_output2="$l_output2 File: \"$l_file\" owned by \"$l_user\" should be owned by root."
   fi

   if [ "$l_group" != "root" ]; then
    l_output2="$l_output2 File: \"$l_file\" group owned by \"$l_group\" should belong to root."
   fi

   if [ -z "$l_output2" ]; then
    l_output="$l_output File: \"$l_file\" has correct permissions ($l_mode), owner ($l_user), and group ($l_group)."
   fi

  else

   l_output2="$l_output2 Unable to read file details for \"$l_file\"."

  fi

 }

 # Main sshd config
 if [ -f "/etc/ssh/sshd_config" ]; then
  l_file="/etc/ssh/sshd_config"
  f_sshd_files_chk
 fi

 # Additional sshd config files
 if [ -d "/etc/ssh/sshd_config.d" ]; then

  while IFS= read -r -d $'\0' l_file; do
   f_sshd_files_chk
  done < <(find /etc/ssh/sshd_config.d -type f -name '*.conf' -print0 2>/dev/null)

 fi

 # Remove newlines
 l_output=$(echo "$l_output" | tr '\n' ' ')
 l_output2=$(echo "$l_output2" | tr '\n' ' ')

 # Escape quotes
 l_output=$(echo "$l_output" | sed 's/"/""/g')
 l_output2=$(echo "$l_output2" | sed 's/"/""/g')

 if [ -z "$l_output2" ]; then

  echo "\"Access Control / Configure SSH Server\"" >> p1
  echo "\"Ensure access to /etc/ssh/sshd_config is configured.\"" >> p2
  echo "\"$l_output\"" >> p3
  echo "\"Yes\"" >> p4
  echo "\"5.1.1\"" >> p12

 else

  echo "\"Access Control / Configure SSH Server\"" >> p1
  echo "\"Ensure access to /etc/ssh/sshd_config is configured.\"" >> p2
  echo "\"$l_output2\"" >> p3
  echo "\"No\"" >> p4
  echo "\"5.1.1\"" >> p12

 fi
}

#5.1.2
#Ensure access to SSH private host key files is configured.

{
 l_output=""
 l_output2=""
 l_skgn="ssh_keys"

 l_skgid="$(awk -F: '($1 == "'"$l_skgn"'"){print $3}' /etc/group)"

 while read -r l_file l_mode l_owner l_group l_gid; do

  [ -n "$l_skgid" ] && l_cga="$l_skgn" || l_cga="root"

  [ "$l_gid" = "$l_skgid" ] && l_pmask="0137" || l_pmask="0177"

  l_maxperm="$(printf '%o' $(( 0777 & ~$l_pmask )))"

  if [ $(( $l_mode & $l_pmask )) -gt 0 ]; then
   l_output2="${l_output2} File: ${l_file} is mode ${l_mode} should be mode ${l_maxperm} or more restrictive."
  fi

  if [ "$l_owner" != "root" ]; then
   l_output2="${l_output2} File: ${l_file} is owned by ${l_owner} should be owned by root."
  fi

  if [ "$l_group" != "root" ] && [ "$l_gid" != "$l_skgid" ]; then
   l_output2="${l_output2} File: ${l_file} is owned by group ${l_group} should belong to group ${l_cga}."
  fi

  if [ -z "$l_output2" ]; then
   l_output="${l_output} File: ${l_file}: Correct mode (${l_mode}) owner (${l_owner}) group (${l_group})."
  fi

 done < <(find /etc/ssh -xdev -type f -name 'ssh_host_*_key' \
           -exec stat -L -c "%n %#a %U %G %g" {} + 2>/dev/null)

 # Remove new lines
 l_output=$(echo "$l_output" | tr '\n' ' ')
 l_output2=$(echo "$l_output2" | tr '\n' ' ')

 # Escape double quotes for CSV
 l_output=$(echo "$l_output" | sed 's/"/""/g')
 l_output2=$(echo "$l_output2" | sed 's/"/""/g')

 if [ -z "$l_output2" ]; then

  echo "\"Access Control / Configure SSH Server\"" >> p1
  echo "\"Ensure access to SSH private host key files is configured.\"" >> p2
  echo "\"SSH private host key files are configured correctly. $l_output\"" >> p3
  echo "\"Yes\"" >> p4
  echo "\"5.1.2\"" >> p12

 else

  echo "\"Access Control / Configure SSH Server\"" >> p1
  echo "\"Ensure access to SSH private host key files is configured.\"" >> p2
  echo "\"SSH private host key files are NOT configured correctly. $l_output2\"" >> p3
  echo "\"No\"" >> p4
  echo "\"5.1.2\"" >> p12

 fi
}


#5.1.3
#Ensure access to SSH public host key files is configured.

{
 l_output=""
 l_output2=""
 l_pmask="0133"
 l_maxperm="$(printf '%o' $(( 0777 & ~$l_pmask )))"

 while read -r l_file l_mode l_owner l_group; do

  if [ $(( $l_mode & $l_pmask )) -gt 0 ]; then
   l_output2="${l_output2} File: ${l_file} mode ${l_mode} (required: ${l_maxperm} or more restrictive)."
  fi

  if [ "$l_owner" != "root" ]; then
   l_output2="${l_output2} File: ${l_file} owned by ${l_owner} (required: root)."
  fi

  if [ "$l_group" != "root" ]; then
   l_output2="${l_output2} File: ${l_file} group owned by ${l_group} (required: root)."
  fi

  if [ -z "$l_output2" ]; then
   l_output="${l_output} File: ${l_file}: Correct mode (${l_mode}) owner (${l_owner}) group (${l_group})."
  fi

 done < <(find /etc/ssh -xdev -type f -name 'ssh_host_*_key.pub' \
           -exec stat -L -c "%n %#a %U %G" {} + 2>/dev/null)

 # Remove line breaks
 l_output=$(echo "$l_output" | tr '\n' ' ')
 l_output2=$(echo "$l_output2" | tr '\n' ' ')

 # Escape double quotes
 l_output=$(echo "$l_output" | sed 's/"/""/g')
 l_output2=$(echo "$l_output2" | sed 's/"/""/g')

 if [ -z "$l_output2" ]; then

  echo "\"Access Control / Configure SSH Server\"" >> p1
  echo "\"Ensure access to SSH public host key files is configured.\"" >> p2
  echo "\"SSH public host key files are configured correctly. $l_output\"" >> p3
  echo "\"Yes\"" >> p4
  echo "\"5.1.3\"" >> p12

 else

  echo "\"Access Control / Configure SSH Server\"" >> p1
  echo "\"Ensure access to SSH public host key files is configured.\"" >> p2
  echo "\"SSH public host key files are NOT configured correctly. $l_output2\"" >> p3
  echo "\"No\"" >> p4
  echo "\"5.1.3\"" >> p12

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
 l_output=""
 l_result=""
 l_current_value=""

 l_weak_kex="diffie-hellman-group1-sha1|diffie-hellman-group14-sha1|diffie-hellman-group-exchange-sha1"

 l_current_kex="$(sshd -T -C user=root \
                    -C host="$(hostname)" \
                    -C addr="$(hostname -I | awk '{print $1}')" 2>/dev/null \
                    | awk '/^kexalgorithms / {print $2}')"

 # Set current value
 if [ -z "$l_current_kex" ]; then
  l_current_value="Not Configured"
 else
  l_current_value="$l_current_kex"
 fi

 # Replace commas with semicolon to avoid CSV column shifting
 l_current_value=$(echo "$l_current_value" | sed 's/,/;/g')

 # Validation
 if [ -z "$l_current_kex" ]; then

  l_output="KexAlgorithms could not be retrieved. Current Value: ${l_current_value}"

  l_result="No"

 else

  l_found_weak=""

  IFS=',' read -ra l_kex_list <<< "$l_current_kex"

  for kex in "${l_kex_list[@]}"; do

   if echo "$kex" | grep -Piq "$l_weak_kex"; then
    l_found_weak="${l_found_weak} ${kex}"
   fi

  done

  if [ -n "$l_found_weak" ]; then

   l_output="Weak KexAlgorithms found: ${l_found_weak}. Current Value: ${l_current_value}"

   l_result="No"

  else

   l_output="No weak KexAlgorithms found. Current Value: ${l_current_value}"

   l_result="Yes"

  fi

 fi

 # Remove newlines
 l_output=$(echo "$l_output" | tr '\n' ' ')

 # Escape quotes
 l_output=$(echo "$l_output" | sed 's/"/""/g')

 # Write output
 echo "\"Access Control / Configure SSH Server\"" >> p1
 echo "\"Ensure sshd KexAlgorithms is configured.\"" >> p2
 echo "\"$l_output\"" >> p3
 echo "\"$l_result\"" >> p4
 echo "\"5.1.12\"" >> p12
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
 l_output=""
 l_output2=""

 l_value="$(sshd -T 2>/dev/null | grep -i '^maxstartups' | awk '{print $2}')"

 if [ -z "$l_value" ]; then
  l_value="$(grep -Pis '^\h*MaxStartups\h+' /etc/ssh/sshd_config /etc/ssh/sshd_config.d/*.conf 2>/dev/null \
              | awk '{print $2}' \
              | tail -1)"
 fi

 if [ -z "$l_value" ]; then

  l_output2="MaxStartups is not explicitly configured - must be set to 10:30:60 or more restrictive per CIS."

 else

  l_start="$(echo "$l_value" | cut -d: -f1)"
  l_rate="$(echo "$l_value" | cut -d: -f2)"
  l_full="$(echo "$l_value" | cut -d: -f3)"

  if [ -n "$l_start" ] && [ -n "$l_rate" ] && [ -n "$l_full" ]; then

   if [ "$l_start" -le 10 ] && \
      [ "$l_rate" -le 30 ] && \
      [ "$l_full" -le 60 ] 2>/dev/null; then

    l_output="MaxStartups is set to ${l_value} (compliant: start<=10 rate<=30 full<=60)."

   else

    l_output2="MaxStartups is set to ${l_value} - must be 10:30:60 or more restrictive per CIS (start<=10 rate<=30 full<=60)."

   fi

  else

   if [ "$l_value" -le 10 ] 2>/dev/null; then

    l_output="MaxStartups is set to ${l_value} (compliant)."

   else

    l_output2="MaxStartups is set to ${l_value} - must be 10 or less per CIS."

   fi

  fi

 fi

 # Remove newlines
 l_output=$(echo "$l_output" | tr '\n' ' ')
 l_output2=$(echo "$l_output2" | tr '\n' ' ')

 # Escape double quotes for CSV
 l_output=$(echo "$l_output" | sed 's/"/""/g')
 l_output2=$(echo "$l_output2" | sed 's/"/""/g')

 if [ -z "$l_output2" ]; then

  echo "\"Access Control / Configure SSH Server\"" >> p1
  echo "\"Ensure sshd MaxStartups is configured.\"" >> p2
  echo "\"$l_output\"" >> p3
  echo "\"Yes\"" >> p4
  echo "\"5.1.18\"" >> p12

 else

  echo "\"Access Control / Configure SSH Server\"" >> p1
  echo "\"Ensure sshd MaxStartups is configured.\"" >> p2
  echo "\"$l_output2\"" >> p3
  echo "\"No\"" >> p4
  echo "\"5.1.18\"" >> p12

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
 l_output=""
 l_value=""
 l_current_value=""
 l_result=""

 l_value="$(sshd -T 2>/dev/null | awk '/^permitrootlogin / {print tolower($2)}')"

 if [ -z "$l_value" ]; then
  l_value="$(grep -iE '^[[:space:]]*PermitRootLogin[[:space:]]+' \
   /etc/ssh/sshd_config /etc/ssh/sshd_config.d/*.conf 2>/dev/null \
   | awk '{print tolower($2)}' | tail -1)"
 fi

 # Current value
 if [ -z "$l_value" ]; then
  l_current_value="Not Configured"
 else
  l_current_value="$l_value"
 fi

 # Compliance check
 if [ "$l_value" = "no" ] || \
    [ "$l_value" = "prohibit-password" ] || \
    [ "$l_value" = "forced-commands-only" ]; then

  l_output="PermitRootLogin is set to ${l_current_value} (COMPLIANT)"

  l_result="Yes"

 else

  l_output="PermitRootLogin is set to ${l_current_value} - NON COMPLIANT. Must be set to no or prohibit-password or forced-commands-only per CIS"

  l_result="No"

 fi

 # Remove newlines
 l_output=$(echo "$l_output" | tr '\n' ' ')

 # Escape quotes
 l_output=$(echo "$l_output" | sed 's/"/""/g')

 # Output
 echo "\"Access Control / Configure SSH Server\"" >> p1
 echo "\"Ensure sshd PermitRootLogin is disabled.\"" >> p2
 echo "\"$l_output\"" >> p3
 echo "\"$l_result\"" >> p4
 echo "\"5.1.20\"" >> p12
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


###########################################################################################

#5.2.1
#Ensure sudo is installed.

packages=("sudo" "sudo-ldap")
is_installed=false
# Loop through the packages
for package in "${packages[@]}"; do
    # Check if the package is installed
    if dpkg-query -W -f='${Status}' "$package" 2>/dev/null | grep -q "install ok installed"; then
        echo "PASS: Package \"$package\" is installed"
		echo "Access Control / Configure privilege escalation" >>p1
		echo "Ensure sudo is installed." >>p2
		echo "sudo is installed." >>p3
		echo "Yes" >>p4
		echo "5.2.1" >>p12
        is_installed=true
    fi
done
# If none of the packages are installed, print a failure message
if ! $is_installed; then
	echo "Access Control / Configure privilege escalation" >>p1
	echo "Ensure sudo is installed." >>p2
	echo "FAIL: Neither \"sudo\" nor \"sudo-ldap\" package is installed." >>p3
	echo "No" >>p4
	echo "5.2.1" >>p12
fi

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

############################################################################################################

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

#######################################################################################################################

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


#########################################################################################################################

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

#######################################################################################################################


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

####################################################################################################################

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

#######################################################################################################################

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

###########################################################################################################


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

################################################################################################################

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

flag=0
while read -r usr; do
    change=$(date -d "$(chage --list $usr | grep '^Last password change' | cut -d: -f2 | grep -v 'never$')" +%s)
    if [[ "$change" -gt "$(date +%s)" ]]; then
        echo "Access Control / User Accounts and Environment" >> p1
        echo "Ensure all users last password change date is in the past." >> p2
        echo "User: \"$usr\" last password change was \"$(chage --list $usr | grep '^Last password change' | cut -d: -f2)\".Please check.." >> p3
        echo "No" >> p4
        echo "5.4.1.6" >> p12
        flag=1
    fi
done < <(awk -F: '/^[^:]+:[^!*]/{print $1}' /etc/shadow)
if [[ "$flag" -eq 0 ]]; then
    echo "Access Control / User Accounts and Environment" >> p1
    echo "Ensure all users last password change date is in the past." >> p2
    echo "All users' last password change date is in the past." >> p3
    echo "Yes" >> p4
    echo "5.4.1.6" >> p12
fi

###############################################################################################################

#5.4.2.1
#Ensure root is the only UID 0 account.

# Initialize a variable to track if another account with UID 0 is found
other_account_found=0
# Read /etc/passwd file line by line
while IFS=: read -r f1 f2 f3 f4 f5 f6 f7
do
  # Check if UID (field 3) is 0
  if [ "$f3" -eq 0 ]; then
    # Check if the account name (field 1) is not root
    if [ "$f1" != "root" ]; then
	  echo "Access Control / User Accounts and Environment" >> p1
	  echo "Ensure root is the only UID 0 account." >> p2
      echo "Account $f1 has UID 0. " >> p3
      echo "No" >> p4
	  echo "5.4.2.1" >> p12
      other_account_found=1
    fi
  fi
done < /etc/passwd

# If no other account with UID 0 was found, print a message
if [ "$other_account_found" -eq 0 ]; then
  echo "Access Control / User Accounts and Environment" >> p1
  echo "Ensure root is the only UID 0 account." >> p2
  echo "Root is the only UID 0 account." >> p3
  echo "Yes" >> p4
  echo "5.4.2.1" >> p12
fi


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

#######################################################################################################

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


#####################################################################################################################

#6.1.1.1.1
#Ensure journald service is active.
{
 l_output="" l_output2=""
 l_service="systemd-journald.service"
 if systemctl is-active "$l_service" > /dev/null 2>&1; then
  l_output="$l_service is active (running)."
 else
  l_output2="$l_service is not active. Required: service must be running."
 fi
 if [ -z "$l_output2" ]; then
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure journald service is active." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "6.1.1.1.1" >> p12
 else
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure journald service is active." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "6.1.1.1.1" >> p12
 fi
}

#6.1.1.1.4
#Ensure journald ForwardToSyslog is disabled.
{
 l_output="" l_output2=""
 l_forward="$(systemd-analyze cat-config systemd/journald.conf 2>/dev/null | grep -Pi '^\h*ForwardToSyslog\h*=' | grep -v '^\s*#' | tail -1)"
 if [ -z "$l_forward" ]; then
  l_output="ForwardToSyslog is not set (default: no - compliant)."
 else
  l_value="$(echo "$l_forward" | awk -F= '{print $2}' | tr -d ' ')"
  if [ "${l_value,,}" = "yes" ]; then
   l_output2="ForwardToSyslog is set to yes. Required: not set or set to no."
  else
   l_output="ForwardToSyslog is set to $l_value (compliant)."
  fi
 fi
 if [ -z "$l_output2" ]; then
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure journald ForwardToSyslog is disabled." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "6.1.1.1.4" >> p12
 else
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure journald ForwardToSyslog is disabled." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "6.1.1.1.4" >> p12
 fi
}

#6.1.1.1.5
#Ensure journald Storage is configured.
{
 l_output="" l_output2=""
 l_storage="$(systemd-analyze cat-config systemd/journald.conf 2>/dev/null | grep -Pi '^\h*Storage\h*=' | grep -v '^\s*#' | tail -1)"
 if [ -z "$l_storage" ]; then
  l_output2="Storage is not configured in journald config. Required: Storage=persistent."
 else
  l_value="$(echo "$l_storage" | awk -F= '{print $2}' | tr -d ' ')"
  if [ "${l_value,,}" = "persistent" ]; then
   l_output="Storage is set to persistent (compliant)."
  else
   l_output2="Storage is set to $l_value. Required: persistent."
  fi
 fi
 if [ -z "$l_output2" ]; then
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure journald Storage is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "6.1.1.1.5" >> p12
 else
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure journald Storage is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "6.1.1.1.5" >> p12
 fi
}

#6.1.1.1.6
#Ensure journald Compress is configured.
{
 l_output="" l_output2=""
 l_compress="$(systemd-analyze cat-config systemd/journald.conf 2>/dev/null | grep -Pi '^\h*Compress\h*=' | grep -v '^\s*#' | tail -1)"
 if [ -z "$l_compress" ]; then
  l_output2="Compress is not configured in journald config. Required: Compress=yes."
 else
  l_value="$(echo "$l_compress" | awk -F= '{print $2}' | tr -d ' ')"
  if [ "${l_value,,}" = "yes" ]; then
   l_output="Compress is set to yes (compliant)."
  else
   l_output2="Compress is set to $l_value. Required: yes."
  fi
 fi
 if [ -z "$l_output2" ]; then
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure journald Compress is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "6.1.1.1.6" >> p12
 else
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure journald Compress is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "6.1.1.1.6" >> p12
 fi
}

###########################################################################################################

#6.1.1.2.1
#Ensure systemd-journal-remote is installed.
{
 l_output="" l_output2=""
 l_status="$(dpkg-query -W -f='${db:Status-Status}' systemd-journal-remote 2>/dev/null)"
 if [ "$l_status" = "installed" ]; then
  l_output="systemd-journal-remote package is installed."
 else
  l_output2="systemd-journal-remote package is not installed (status: ${l_status:-not found})."
 fi
 if [ -z "$l_output2" ]; then
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure systemd-journal-remote is installed." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "6.1.1.2.1" >> p12
 else
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure systemd-journal-remote is installed." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "6.1.1.2.1" >> p12
 fi
}


#6.1.1.2.3
#Ensure systemd-journal-upload is enabled and active.
{
 l_output="" l_output2=""
 l_service="systemd-journal-upload.service"
 if systemctl is-enabled "$l_service" > /dev/null 2>&1; then
  l_output="$l_output $l_service is enabled."
 else
  l_output2="$l_output2 $l_service is not enabled."
 fi
 if systemctl is-active "$l_service" > /dev/null 2>&1; then
  l_output="$l_output $l_service is active."
 else
  l_output2="$l_output2 $l_service is not active."
 fi
 if [ -z "$l_output2" ]; then
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure systemd-journal-upload is enabled and active." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "6.1.1.2.3" >> p12
 else
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure systemd-journal-upload is enabled and active." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "6.1.1.2.3" >> p12
 fi
}

#6.1.1.2.4
#Ensure systemd-journal-remote service is not in use.
{
 l_output="" l_output2=""
 for l_unit in systemd-journal-remote.socket systemd-journal-remote.service; do
  if systemctl is-enabled "$l_unit" 2>/dev/null | grep -qP '^enabled'; then
   l_output2="$l_output2 $l_unit is enabled. Required: not enabled."
  fi
  if systemctl is-active "$l_unit" 2>/dev/null | grep -qP '^active'; then
   l_output2="$l_output2 $l_unit is active. Required: not active."
  fi
 done
 if [ -z "$l_output2" ]; then
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure systemd-journal-remote service is not in use." >> p2
  echo "systemd-journal-remote.socket and systemd-journal-remote.service are not enabled or active." >> p3
  echo "Yes" >> p4
  echo "6.1.1.2.4" >> p12
 else
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure systemd-journal-remote service is not in use." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "6.1.1.2.4" >> p12
 fi
}

#######################################################################################################

#6.1.2.1
#Ensure rsyslog is installed.
{
 l_output="" l_output2=""
 l_status="$(dpkg-query -W -f='${db:Status-Status}' rsyslog 2>/dev/null)"
 if [ "$l_status" = "installed" ]; then
  l_output="rsyslog package is installed."
 else
  l_output2="rsyslog package is not installed (status: ${l_status:-not found})."
 fi
 if [ -z "$l_output2" ]; then
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure rsyslog is installed." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "6.1.2.1" >> p12
 else
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure rsyslog is installed." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "6.1.2.1" >> p12
 fi
}


#6.1.2.2
#Ensure rsyslog service is enabled and active.
{
 l_output="" l_output2=""
 l_service="rsyslog.service"
 if systemctl is-enabled "$l_service" > /dev/null 2>&1; then
  l_output="$l_output $l_service is enabled."
 else
  l_output2="$l_output2 $l_service is not enabled."
 fi
 if systemctl is-active "$l_service" > /dev/null 2>&1; then
  l_output="$l_output $l_service is active."
 else
  l_output2="$l_output2 $l_service is not active."
 fi
 if [ -z "$l_output2" ]; then
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure rsyslog service is enabled and active." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "6.1.2.2" >> p12
 else
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure rsyslog service is enabled and active." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "6.1.2.2" >> p12
 fi
}

#6.1.2.3
#Ensure journald is configured to send logs to rsyslog.
{
 l_output="" l_output2=""
 l_forward="$(systemd-analyze cat-config systemd/journald.conf 2>/dev/null | grep -Pi '^\h*ForwardToSyslog\h*=' | grep -v '^\s*#' | tail -1)"
 if [ -z "$l_forward" ]; then
  l_output2="$l_output2 ForwardToSyslog is not configured in journald config. Required: ForwardToSyslog=yes."
 else
  l_value="$(echo "$l_forward" | awk -F= '{print $2}' | tr -d ' ')"
  if [ "${l_value,,}" = "yes" ]; then
   l_output="$l_output ForwardToSyslog=yes is set in journald config."
  else
   l_output2="$l_output2 ForwardToSyslog is set to $l_value. Required: yes."
  fi
 fi
 for l_svc in rsyslog.service systemd-journald.service; do
  if systemctl list-units --type=service 2>/dev/null | grep -qP "^\s*$l_svc\s+loaded\s+active"; then
   l_output="$l_output $l_svc is loaded and active."
  else
   l_output2="$l_output2 $l_svc is not loaded and active."
  fi
 done
 if [ -z "$l_output2" ]; then
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure journald is configured to send logs to rsyslog." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "6.1.2.3" >> p12
 else
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure journald is configured to send logs to rsyslog." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "6.1.2.3" >> p12
 fi
}

#6.1.2.4
#Ensure rsyslog log file creation mode is configured.
{
 l_output="" l_output2=""
 l_fcm="$(grep -Ps '^\h*\$FileCreateMode\h+0[0,2,4,6][0,2,4]0\b' /etc/rsyslog.conf /etc/rsyslog.d/*.conf 2>/dev/null | grep -v '^\s*#')"
 if [ -n "$l_fcm" ]; then
  l_output="\$FileCreateMode is configured to 0640 or more restrictive: $l_fcm"
 else
  l_fcm_any="$(grep -Ps '^\h*\$FileCreateMode\h+' /etc/rsyslog.conf /etc/rsyslog.d/*.conf 2>/dev/null | grep -v '^\s*#')"
  if [ -n "$l_fcm_any" ]; then
   l_output2="\$FileCreateMode is configured but not 0640 or more restrictive: $l_fcm_any"
  else
   l_output2="\$FileCreateMode is not configured in /etc/rsyslog.conf or /etc/rsyslog.d/*.conf. Required: 0640 or more restrictive."
  fi
 fi
 if [ -z "$l_output2" ]; then
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure rsyslog log file creation mode is configured." >> p2
  echo "$l_output" >> p3
  echo "Yes" >> p4
  echo "6.1.2.4" >> p12
 else
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure rsyslog log file creation mode is configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "6.1.2.4" >> p12
 fi
}

#6.1.2.7
#Ensure rsyslog is not configured to receive logs from a remote client.

output1="$(grep -P '^\h*module\(load="imtcp"\)' /etc/rsyslog.conf /etc/rsyslog.d/*.conf 2>/dev/null)"
output2="$(grep -P '^\h*input\(type="imtcp" port="514"\)' /etc/rsyslog.conf /etc/rsyslog.d/*.conf 2>/dev/null)"

if [[ -z "$output1" && -z "$output2" ]]; then
    echo "Logging and Auditing / System Logging" >> p1
    echo "Ensure rsyslog is not configured to receive logs from a remote client." >> p2
    echo "Rsyslog is not configured to receive logs from a remote client." >> p3
    echo "Yes" >> p4
    echo "6.1.2.7" >> p12
else
    combined="$(echo "$output1 $output2" | tr '\n' ' ' | tr -s ' ')"
    echo "Logging and Auditing / System Logging" >> p1
    echo "Ensure rsyslog is not configured to receive logs from a remote client." >> p2
    echo "Rsyslog is configured to receive logs from a remote client: $combined" >> p3
    echo "No" >> p4
    echo "6.1.2.7" >> p12
fi

#########################################################################################################

#6.1.3.1
#Ensure access to all logfiles has been configured.
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
  echo "6.1.3.1" >> p12
 else
  echo "Logging and Auditing / System Logging" >> p1
  echo "Ensure access to all logfiles has been configured." >> p2
  echo "$l_output2" >> p3
  echo "No" >> p4
  echo "6.1.3.1" >> p12
 fi
}

###############################################################################################################

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

###############################################################################################################

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

##################################################################################################

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
#Ensure all groups in /etc/passwd exist in /etc/group .
all_groups_exist=true

for i in $(cut -s -d: -f4 /etc/passwd | sort -u ); do
 grep -q -P "^.*?:[^:]*:$i:" /etc/group
 if [ $? -ne 0 ]; then
    all_groups_exist=false
    echo "System Maintenance / Local User and Group Settings" >> p1
    echo "Ensure all groups in /etc/passwd exist in /etc/group ." >>p2
    echo "Group $i is referenced by /etc/passwd but does not exist in /etc/group." >>p3
    echo "No" >> p4
	echo "7.2.3" >> p12
 fi
done
if $all_groups_exist ; then
    echo "System Maintenance / Local User and Group Settings" >> p1
    echo "Ensure all groups in /etc/passwd exist in /etc/group ." >>p2
    echo "All groups in /etc/passwd exist in /etc/group." >>p3
    echo "Yes" >> p4
	echo "7.2.3" >> p12
fi



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
duplicate_uids_exist=false

cut -f3 -d":" /etc/passwd | sort -n | uniq -c | while read x ; do
 [ -z "$x" ] && break
 set - $x
 if [ $1 -gt 1 ]; then
 users=$(awk -F: '($3 == n) { print $1 }' n=$2 /etc/passwd | xargs)
    echo "System Maintenance / Local User and Group Settings" >> p1
    echo "Ensure no duplicate UIDs exist." >>p2
    echo "Duplicate UID ($2): $users." >> p3
    echo "No" >> p4
	echo "7.2.5">>p12
    duplicate_uids_exist=true
 fi
done
if ! $duplicate_uids_exist ; then
    echo "System Maintenance / Local User and Group Settings" >> p1
    echo "Ensure no duplicate UIDs exist." >>p2
    echo "No Duplicate UIDs exists" >>p3
    echo "Yes" >> p4
	echo "7.2.5" >> p12
fi

#7.2.6
#Ensure no duplicate GIDs exist.

filegrp="/etc/group"
if [ -f "$filegrp" ]; then
    # Initialize an associative array
    declare -A gids

    # Flag to check if any duplicate was found
    duplicate_found=0

    # Read the file line by line
    while IFS=: read -r name pass gid rest; do
        # If the GID is already in the array, it's a duplicate
        if [[ -n ${gids[$gid]} ]]; then
			echo "System Maintenance / Local User and Group Settings" >> p1
			echo "Ensure no duplicate GIDs exist." >> p2
			echo "Duplicate GID $gid found for group $name." >> p3
			echo "No" >> p4
			echo "7.2.6" >> p12
            duplicate_found=1
        fi
        # Add the GID to the array
        gids[$gid]=1
    done < "$filegrp"

    # If no duplicate was found, print a message
    if [[ $duplicate_found -eq 0 ]]; then
		echo "System Maintenance / Local User and Group Settings" >> p1
		echo "Ensure no duplicate GIDs exist." >>p2
		echo "No duplicate GIDs found in /etc/group" >>p3
		echo "Yes" >> p4
		echo "7.2.6" >> p12
    fi
else
	echo "System Maintenance / Local User and Group Settings" >> p1
	echo "Ensure no duplicate GIDs exist." >> p2
	echo "$filegrp does not exist." >> p3
	echo "No" >> p4
	echo "7.2.6" >> p12
fi

#7.2.7
#Ensure no duplicate user names exist.
filepswd="/etc/passwd"
if [ -f "$filepswd" ]; then
    # Initialize an associative array
    declare -A login_names
    # Flag to check if any duplicate was found
    duplicate_found=0
    # Read the file line by line
    while IFS=: read -r name rest; do
        # If the login name is already in the array, it's a duplicate
        if [[ -n ${login_names[$name]} ]]; then
			echo "System Maintenance / Local User and Group Settings" >> p1
			echo "Ensure no duplicate user names exist." >> p2
			echo "Duplicate login name $name found in $filepswd." >> p3
			echo "No" >> p4
			echo "7.2.7" >> p12
            duplicate_found=1
        fi
        # Add the login name to the array
        login_names[$name]=1
    done < "$filepswd"
    # If no duplicate was found, print a message
    if [[ $duplicate_found -eq 0 ]]; then
		echo "System Maintenance / Local User and Group Settings" >> p1
		echo "Ensure no duplicate user names exist." >>p2
		echo "No duplicate login names found in $filepswd." >>p3
		echo "Yes" >> p4
		echo "7.2.7" >> p12
    fi
else
	echo "System Maintenance / Local User and Group Settings" >> p1
	echo "Ensure no duplicate user names exist." >> p2
	echo "$filepswd does not exist." >> p3
	echo "No" >> p4
	echo "7.2.7" >> p12
fi

#7.2.8
#Ensure no duplicate group names exist.

filegroup="/etc/group"

if [ -f "$filegroup" ]; then
    # Initialize an associative array
    declare -A group_names

    # Flag to check if any duplicate was found
    duplicate_found=0

    # Read the file line by line
    while IFS=: read -r name rest; do
        # If the group name is already in the array, it's a duplicate
        if [[ -n ${group_names[$name]} ]]; then
			echo "System Maintenance / Local User and Group Settings" >> p1
			echo "Ensure no duplicate group names exist." >> p2
			echo "Duplicate group name $name found in $filegroup." >> p3
			echo "No" >> p4
			echo "7.2.8" >> p12
            duplicate_found=1
        fi

        # Add the group name to the array
        group_names[$name]=1
    done < "$filegroup"

    # If no duplicate was found, print a message
    if [[ $duplicate_found -eq 0 ]]; then
		echo "System Maintenance / Local User and Group Settings" >> p1
		echo "Ensure no duplicate group names exist." >>p2
		echo "No duplicate group names found in $filegroup." >>p3
		echo "Yes" >> p4
		echo "7.2.8" >> p12
    fi
else
	echo "System Maintenance / Local User and Group Settings" >> p1
	echo "Ensure no duplicate group names exist." >> p2
	echo "$filegroup does not exist." >> p3
	echo "No" >> p4
	echo "7.2.8" >> p12
fi


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

techSpecVersion="3.0.0"
scanDate=$(date +%Y-%m-%d)
fqdn=$(hostname --fqdn)
ipAddress=$(ip addr show eth0 | grep inet | awk '{print $2}' | head -n 1)
osName=$(grep PRETTY_NAME /etc/os-release | cut -d '=' -f 2- | tr -d '"' | tr ' ' '_')
timestamp=$(date +%T)

# Generate report
echo -e "FQDN:$fqdn \nACCOUNT:$accountName \nACCOUNT BAMID:$accountBAMID \nCIS Benchmark Version: $techSpecVersion \nScan Date: $scanDate \nTime-Stamp: $timestamp\nIP-ADDRESS:$ipAddress \nOS-NAME: $osName \nScan Version: $scan_version\n********************************************************" > $filename
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
