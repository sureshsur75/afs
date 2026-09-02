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

#Author / Developer : Nisarg.Nalawade@kyndryl.com

#Date Created : 23-March-2025

########################End########################

########################Developed########################

#OS : Linux RHEL 8

########################End########################

rm -rf c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 `hostname`.csv package output timeout shadow inactive maxage uid emptylist shadowed chrony systemaccounts disabledaccounts active audit_file

clear

########################Customer########################

#Please enter the customer name
CustomerName="Oxxo"

#Please enter the customer inventory id
CustomerInventoryID="BAMFFA6000"

#Please enter the policy name & policy version
PolicyNameVersion="CSD v4.0"

#Please enter the technical specification name & technical specification version
TechnicalSpecificationNameVersion="Linux RHEL 8 CIS v4.0.0"

########################End########################

########################Customization########################

#Please enter the customization date
CustomizationDate="24-July-2026"
#Customized By - Sailen Roy
#Please enter the email id
EmailId="Manne.vishnu.vardhan.rao@kyndryl.com"

########################End########################

customer=$CustomerName

custinvid=$CustomerInventoryID

policy=$PolicyNameVersion

doc=$TechnicalSpecificationNameVersion

server=`hostname`

ip=$(hostname -I | awk '{print $1}')

#os=`hostnamectl | grep -i "operating system" | cut -d ":" -f 2 | xargs` #This command to be used when OS is Ubuntu and can be used for CentOS OS

os=`cat /etc/redhat-release | xargs` #This command to be used when OS is Red Hat Enterprise Linux and can be used for CentOS OS
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

#2.1.7 Ensure ftp server services are not in use

pkg_status=$(rpm -q vsftpd 2>/dev/null)

if [[ "$pkg_status" == *"not installed"* ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.7" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure ftp server services are not in use" c10
write_col "FTP is a traditional and widely used protocol used for file transfer which transmits data in clear text and should not be used" c11
write_col "FTP server package must not be installed" c12
write_col "vsftpd package is not installed Output : $pkg_status" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16

else

service_enabled=$(systemctl is-enabled vsftpd.service 2>/dev/null)
service_active=$(systemctl is-active vsftpd.service 2>/dev/null)

if [[ "$service_enabled" == "disabled" && "$service_active" != "active" ]]; then

result="OK"
msg="vsftpd installed but service is not enabled and not active"

else

result="KO"
msg="vsftpd installed and service is enabled or active"

fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.7" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure ftp server services are not in use" c10
write_col "FTP is a traditional and widely used protocol used for file transfer which transmits data in clear text and should not be used" c11
write_col "FTP server package must not be installed" c12
write_col "$msg Output : package=$pkg_status enabled=$service_enabled active=$service_active" c13
write_col "$result" c14
write_col "$severity" c15
write_col "$scandate" c16

fi

#2.1.1 Ensure autofs services are not in use

pkg_status=$(rpm -q autofs 2>/dev/null)

if [[ "$pkg_status" == *"not installed"* ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.1" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure autofs services are not in use" c10
write_col "Autofs allows automatic mounting of devices such as USB drives and network shares" c11
write_col "autofs package must not be installed" c12
write_col "autofs package is not installed Output : $pkg_status" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16

else

service_enabled=$(systemctl is-enabled autofs.service 2>/dev/null)
service_active=$(systemctl is-active autofs.service 2>/dev/null)

if [[ "$service_enabled" != "enabled" && "$service_active" != "active" ]]; then
result="OK"
msg="autofs installed but service is not enabled and not active"
else
result="KO"
msg="autofs installed and service is enabled or active"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.1" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure autofs services are not in use" c10
write_col "Autofs allows automatic mounting of devices such as USB drives and network shares" c11
write_col "autofs package must not be installed" c12
write_col "$msg Output : package=$pkg_status enabled=$service_enabled active=$service_active" c13
write_col "$result" c14
write_col "$severity" c15
write_col "$scandate" c16

fi

#2.1.16 Ensure telnet server services are not in use

pkg_status=$(rpm -q telnet-server 2>/dev/null)

if [[ "$pkg_status" == *"not installed"* ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.16" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure telnet server services are not in use" c10
write_col "The telnet-server package contains the telnet daemon which allows remote login using the insecure telnet protocol" c11
write_col "telnet-server package must not be installed" c12
write_col "telnet-server package is not installed Output : $pkg_status" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16

else

service_enabled=$(systemctl is-enabled telnet.socket 2>/dev/null)
service_active=$(systemctl is-active telnet.socket 2>/dev/null)

if [[ "$service_enabled" != "enabled" && "$service_active" != "active" ]]; then
result="OK"
msg="telnet-server installed but telnet.socket is not enabled and not active"
else
result="KO"
msg="telnet-server installed and telnet.socket is enabled or active"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.16" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure telnet server services are not in use" c10
write_col "The telnet-server package contains the telnet daemon which allows remote login using the insecure telnet protocol" c11
write_col "telnet-server package must not be installed" c12
write_col "$msg Output : package=$pkg_status enabled=$service_enabled active=$service_active" c13
write_col "$result" c14
write_col "$severity" c15
write_col "$scandate" c16

fi

#2.1.9 Ensure network file system services are not in use

pkg_status=$(rpm -q nfs-utils 2>/dev/null)

if [[ "$pkg_status" == *"not installed"* ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.9" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure network file system services are not in use" c10
write_col "NFS provides the ability for systems to mount file systems from remote servers across the network" c11
write_col "nfs-utils package must not be installed or nfs-server.service must be disabled" c12
write_col "nfs-utils package is not installed Output : $pkg_status" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16

else

service_enabled=$(systemctl is-enabled nfs-server.service 2>/dev/null)
service_active=$(systemctl is-active nfs-server.service 2>/dev/null)

if [[ "$service_enabled" != "enabled" && "$service_active" != "active" ]]; then
result="OK"
msg="nfs-utils installed but nfs-server.service is not enabled and not active"
else
result="KO"
msg="nfs-utils installed and nfs-server.service is enabled or active"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.9" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure network file system services are not in use" c10
write_col "NFS provides the ability for systems to mount file systems from remote servers across the network" c11
write_col "nfs-utils package must not be installed or nfs-server.service must be disabled" c12
write_col "$msg Output : package=$pkg_status enabled=$service_enabled active=$service_active" c13
write_col "$result" c14
write_col "$severity" c15
write_col "$scandate" c16

fi

#2.1.20 Ensure xinetd services are not in use

pkg_status=$(rpm -q xinetd 2>/dev/null)

if [[ "$pkg_status" == *"not installed"* ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.20" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure xinetd services are not in use" c10
write_col "xinetd is a super-server daemon used to manage network services such as telnet, ftp and others" c11
write_col "xinetd package must not be installed" c12
write_col "xinetd package is not installed Output : $pkg_status" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16

else

service_enabled=$(systemctl is-enabled xinetd.service 2>/dev/null)
service_active=$(systemctl is-active xinetd.service 2>/dev/null)

if [[ "$service_enabled" != "enabled" && "$service_active" != "active" ]]; then
result="OK"
msg="xinetd installed but service is not enabled and not active"
else
result="KO"
msg="xinetd installed and service is enabled or active"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.20" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure xinetd services are not in use" c10
write_col "xinetd is a super-server daemon used to manage network services such as telnet, ftp and others" c11
write_col "xinetd package must not be installed" c12
write_col "$msg Output : package=$pkg_status enabled=$service_enabled active=$service_active" c13
write_col "$result" c14
write_col "$severity" c15
write_col "$scandate" c16

fi

#2.1.18 Ensure web proxy server services are not in use

pkg_status=$(rpm -q squid 2>/dev/null)

if [[ "$pkg_status" == *"not installed"* ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.18" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure web proxy server services are not in use" c10
write_col "Squid is a web proxy server used for caching and forwarding HTTP requests" c11
write_col "squid package must not be installed" c12
write_col "squid package is not installed Output : $pkg_status" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16

else

service_enabled=$(systemctl is-enabled squid.service 2>/dev/null)
service_active=$(systemctl is-active squid.service 2>/dev/null)

if [[ "$service_enabled" != "enabled" && "$service_active" != "active" ]]; then
result="OK"
msg="squid installed but service is not enabled and not active"
else
result="KO"
msg="squid installed and service is enabled or active"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.18" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure web proxy server services are not in use" c10
write_col "Squid is a web proxy server used for caching and forwarding HTTP requests" c11
write_col "squid package must not be installed" c12
write_col "$msg Output : package=$pkg_status enabled=$service_enabled active=$service_active" c13
write_col "$result" c14
write_col "$severity" c15
write_col "$scandate" c16

fi

#2.1.12 Ensure rpcbind services are not in use

pkg_status=$(rpm -q rpcbind 2>/dev/null)

if [[ "$pkg_status" == *"not installed"* ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.12" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure rpcbind services are not in use" c10
write_col "The rpcbind service maps RPC services to network ports and should not run unless required by NFS or similar services" c11
write_col "rpcbind package must not be installed" c12
write_col "rpcbind package is not installed Output : $pkg_status" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16

else

socket_enabled=$(systemctl is-enabled rpcbind.socket 2>/dev/null)
service_enabled=$(systemctl is-enabled rpcbind.service 2>/dev/null)

socket_active=$(systemctl is-active rpcbind.socket 2>/dev/null)
service_active=$(systemctl is-active rpcbind.service 2>/dev/null)

if [[ "$socket_enabled" != "enabled" && "$service_enabled" != "enabled" && "$socket_active" != "active" && "$service_active" != "active" ]]; then
result="OK"
msg="rpcbind installed but rpcbind.socket and rpcbind.service are not enabled and not active"
else
result="KO"
msg="rpcbind installed and rpcbind.socket or rpcbind.service is enabled or active"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.12" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure rpcbind services are not in use" c10
write_col "The rpcbind service maps RPC services to network ports and should not run unless required by NFS or similar services" c11
write_col "rpcbind package must not be installed" c12
write_col "$msg Output : package=$pkg_status socket_enabled=$socket_enabled service_enabled=$service_enabled socket_active=$socket_active service_active=$service_active" c13
write_col "$result" c14
write_col "$severity" c15
write_col "$scandate" c16

fi

#2.1.2 Ensure avahi daemon services are not in use

pkg_status=$(rpm -q avahi 2>/dev/null)

if [[ "$pkg_status" == *"not installed"* ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.2" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure avahi daemon services are not in use" c10
write_col "Avahi provides service discovery on local networks using multicast DNS" c11
write_col "avahi package must not be installed" c12
write_col "avahi package is not installed Output : $pkg_status" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16

else

socket_enabled=$(systemctl is-enabled avahi-daemon.socket 2>/dev/null)
service_enabled=$(systemctl is-enabled avahi-daemon.service 2>/dev/null)

socket_active=$(systemctl is-active avahi-daemon.socket 2>/dev/null)
service_active=$(systemctl is-active avahi-daemon.service 2>/dev/null)

if [[ "$socket_enabled" != "enabled" && "$service_enabled" != "enabled" && "$socket_active" != "active" && "$service_active" != "active" ]]; then
result="OK"
msg="avahi installed but avahi-daemon.socket and avahi-daemon.service are not enabled and not active"
else
result="KO"
msg="avahi installed and avahi-daemon.socket or avahi-daemon.service is enabled or active"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.2" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure avahi daemon services are not in use" c10
write_col "Avahi provides service discovery on local networks using multicast DNS" c11
write_col "avahi package must not be installed" c12
write_col "$msg Output : package=$pkg_status socket_enabled=$socket_enabled service_enabled=$service_enabled socket_active=$socket_active service_active=$service_active" c13
write_col "$result" c14
write_col "$severity" c15
write_col "$scandate" c16

fi

#2.1.13 Ensure rsync services are not in use

pkg_status=$(rpm -q rsync-daemon 2>/dev/null)

if [[ "$pkg_status" == *"not installed"* ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.13" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure rsync services are not in use" c10
write_col "rsync daemon allows file synchronization between systems over the network" c11
write_col "rsync-daemon package must not be installed" c12
write_col "rsync-daemon package is not installed Output : $pkg_status" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16

else

socket_enabled=$(systemctl is-enabled rsyncd.socket 2>/dev/null)
service_enabled=$(systemctl is-enabled rsyncd.service 2>/dev/null)

socket_active=$(systemctl is-active rsyncd.socket 2>/dev/null)
service_active=$(systemctl is-active rsyncd.service 2>/dev/null)

if [[ "$socket_enabled" != "enabled" && "$service_enabled" != "enabled" && "$socket_active" != "active" && "$service_active" != "active" ]]; then
result="OK"
msg="rsync-daemon installed but rsyncd.socket and rsyncd.service are not enabled and not active"
else
result="KO"
msg="rsync-daemon installed and rsyncd.socket or rsyncd.service is enabled or active"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.13" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure rsync services are not in use" c10
write_col "rsync daemon allows file synchronization between systems over the network" c11
write_col "rsync-daemon package must not be installed" c12
write_col "$msg Output : package=$pkg_status socket_enabled=$socket_enabled service_enabled=$service_enabled socket_active=$socket_active service_active=$service_active" c13
write_col "$result" c14
write_col "$severity" c15
write_col "$scandate" c16

fi

#2.1.11 Ensure print server services are not in use

pkg_status=$(rpm -q cups 2>/dev/null)

if [[ "$pkg_status" == *"not installed"* ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.11" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure print server services are not in use" c10
write_col "CUPS provides printing services for local and network printers" c11
write_col "cups package must not be installed" c12
write_col "cups package is not installed Output : $pkg_status" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16

else

socket_enabled=$(systemctl is-enabled cups.socket 2>/dev/null)
service_enabled=$(systemctl is-enabled cups.service 2>/dev/null)

socket_active=$(systemctl is-active cups.socket 2>/dev/null)
service_active=$(systemctl is-active cups.service 2>/dev/null)

if [[ "$socket_enabled" != "enabled" && "$service_enabled" != "enabled" && "$socket_active" != "active" && "$service_active" != "active" ]]; then
result="OK"
msg="cups installed but cups.socket and cups.service are not enabled and not active"
else
result="KO"
msg="cups installed and cups.socket or cups.service is enabled or active"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.11" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure print server services are not in use" c10
write_col "CUPS provides printing services for local and network printers" c11
write_col "cups package must not be installed" c12
write_col "$msg Output : package=$pkg_status socket_enabled=$socket_enabled service_enabled=$service_enabled socket_active=$socket_active service_active=$service_active" c13
write_col "$result" c14
write_col "$severity" c15
write_col "$scandate" c16

fi

#2.1.4 Ensure dhcp server services are not in use

pkg_status=$(rpm -q dhcp-server 2>/dev/null)

if [[ "$pkg_status" == *"not installed"* ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.4" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure dhcp server services are not in use" c10
write_col "DHCP server dynamically assigns IP addresses to systems on the network" c11
write_col "dhcp-server package must not be installed" c12
write_col "dhcp-server package is not installed Output : $pkg_status" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16

else

dhcp_enabled=$(systemctl is-enabled dhcpd.service 2>/dev/null)
dhcp6_enabled=$(systemctl is-enabled dhcpd6.service 2>/dev/null)

dhcp_active=$(systemctl is-active dhcpd.service 2>/dev/null)
dhcp6_active=$(systemctl is-active dhcpd6.service 2>/dev/null)

if [[ "$dhcp_enabled" != "enabled" && "$dhcp6_enabled" != "enabled" && "$dhcp_active" != "active" && "$dhcp6_active" != "active" ]]; then
result="OK"
msg="dhcp-server installed but dhcpd.service and dhcpd6.service are not enabled and not active"
else
result="KO"
msg="dhcp-server installed and dhcpd.service or dhcpd6.service is enabled or active"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.4" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure dhcp server services are not in use" c10
write_col "DHCP server dynamically assigns IP addresses to systems on the network" c11
write_col "dhcp-server package must not be installed" c12
write_col "$msg Output : package=$pkg_status dhcpd_enabled=$dhcp_enabled dhcpd6_enabled=$dhcp6_enabled dhcpd_active=$dhcp_active dhcpd6_active=$dhcp6_active" c13
write_col "$result" c14
write_col "$severity" c15
write_col "$scandate" c16

fi

#2.1.5 Ensure dns server services are not in use

pkg_status=$(rpm -q bind 2>/dev/null)

if [[ "$pkg_status" == *"not installed"* ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.5" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure dns server services are not in use" c10
write_col "DNS servers resolve hostnames to IP addresses for systems on the network" c11
write_col "bind package must not be installed" c12
write_col "bind package is not installed Output : $pkg_status" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16

else

named_enabled=$(systemctl is-enabled named.service 2>/dev/null)
named_active=$(systemctl is-active named.service 2>/dev/null)

if [[ "$named_enabled" != "enabled" && "$named_active" != "active" ]]; then
result="OK"
msg="bind installed but named.service is not enabled and not active"
else
result="KO"
msg="bind installed and named.service is enabled or active"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.5" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure dns server services are not in use" c10
write_col "DNS servers resolve hostnames to IP addresses for systems on the network" c11
write_col "bind package must not be installed" c12
write_col "$msg Output : package=$pkg_status named_enabled=$named_enabled named_active=$named_active" c13
write_col "$result" c14
write_col "$severity" c15
write_col "$scandate" c16

fi


#2.1.8 Ensure message access server services are not in use

pkg_status=$(rpm -q dovecot cyrus-imapd 2>/dev/null)

dovecot_pkg=$(rpm -q dovecot 2>/dev/null)
cyrus_pkg=$(rpm -q cyrus-imapd 2>/dev/null)

if [[ "$dovecot_pkg" == *"not installed"* && "$cyrus_pkg" == *"not installed"* ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.8" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure message access server services are not in use" c10
write_col "dovecot and cyrus-imapd are open source IMAP and POP3 server packages and should not be used unless required" c11
write_col "dovecot and cyrus-imapd packages must not be installed" c12
write_col "dovecot and cyrus-imapd packages are not installed" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16

else

dovecot_socket_enabled=$(systemctl is-enabled dovecot.socket 2>/dev/null)
dovecot_service_enabled=$(systemctl is-enabled dovecot.service 2>/dev/null)
cyrus_service_enabled=$(systemctl is-enabled cyrus-imapd.service 2>/dev/null)

dovecot_socket_active=$(systemctl is-active dovecot.socket 2>/dev/null)
dovecot_service_active=$(systemctl is-active dovecot.service 2>/dev/null)
cyrus_service_active=$(systemctl is-active cyrus-imapd.service 2>/dev/null)


if [[ "$dovecot_socket_enabled" == "enabled" || \
      "$dovecot_service_enabled" == "enabled" || \
      "$cyrus_service_enabled" == "enabled" || \
      "$dovecot_socket_active" == "active" || \
      "$dovecot_service_active" == "active" || \
      "$cyrus_service_active" == "active" ]]; then

result="KO"
msg="Message access server packages installed and service/socket is enabled or active"

else

result="OK"
msg="Message access server packages installed but services and sockets are not enabled or active"

fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.8" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure message access server services are not in use" c10
write_col "dovecot and cyrus-imapd are open source IMAP and POP3 server packages and should not be used unless required" c11
write_col "dovecot and cyrus-imapd packages must not be installed" c12
write_col "$msg Output : package=$pkg_status dovecot.socket enabled=$dovecot_socket_enabled active=$dovecot_socket_active dovecot.service enabled=$dovecot_service_enabled active=$dovecot_service_active cyrus-imapd.service enabled=$cyrus_service_enabled active=$cyrus_service_active" c13
write_col "$result" c14
write_col "$severity" c15
write_col "$scandate" c16

fi


#2.1.19 Ensure web server services are not in use

check_web_service() {

pkg=$1
socket=$2
service=$3

pkg_status=$(rpm -q $pkg 2>/dev/null)

if [[ "$pkg_status" == *"not installed"* ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.19" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure web server services are not in use" c10
write_col "Web servers provide the ability to host web content and should not run unless required" c11
write_col "Web server packages must not be installed" c12
write_col "$pkg package is not installed Output : $pkg_status" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16

else

socket_enabled=$(systemctl is-enabled $socket 2>/dev/null)
service_enabled=$(systemctl is-enabled $service 2>/dev/null)

socket_active=$(systemctl is-active $socket 2>/dev/null)
service_active=$(systemctl is-active $service 2>/dev/null)

if [[ "$socket_enabled" != "enabled" && "$service_enabled" != "enabled" && "$socket_active" != "active" && "$service_active" != "active" ]]; then
result="OK"
msg="$pkg installed but $socket and $service are not enabled and not active"
else
result="KO"
msg="$pkg installed and $socket or $service is enabled or active"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.19" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure web server services are not in use" c10
write_col "Web servers provide the ability to host web content and should not run unless required" c11
write_col "Web server packages must not be installed" c12
write_col "$msg Output : package=$pkg_status socket_enabled=$socket_enabled service_enabled=$service_enabled socket_active=$socket_active service_active=$service_active" c13
write_col "$result" c14
write_col "$severity" c15
write_col "$scandate" c16

fi
}

# Check Apache httpd
check_web_service httpd httpd.socket httpd.service

# Check nginx
check_web_service nginx none nginx.service

#2.1.14 Ensure samba file server services are not in use

pkg_status=$(rpm -q samba 2>/dev/null)

if [[ "$pkg_status" == *"not installed"* ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.14" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure samba file server services are not in use" c10
write_col "Samba allows Linux systems to share files with Windows systems using SMB protocol" c11
write_col "samba package must not be installed" c12
write_col "samba package is not installed Output : $pkg_status" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16

else

smb_enabled=$(systemctl is-enabled smb.service 2>/dev/null)
smb_active=$(systemctl is-active smb.service 2>/dev/null)

if [[ "$smb_enabled" != "enabled" && "$smb_active" != "active" ]]; then
result="OK"
msg="samba installed but smb.service is not enabled and not active"
else
result="KO"
msg="samba installed and smb.service is enabled or active"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.14" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure samba file server services are not in use" c10
write_col "Samba allows Linux systems to share files with Windows systems using SMB protocol" c11
write_col "samba package must not be installed" c12
write_col "$msg Output : package=$pkg_status smb_enabled=$smb_enabled smb_active=$smb_active" c13
write_col "$result" c14
write_col "$severity" c15
write_col "$scandate" c16

fi

#2.1.10 Ensure nis server services are not in use

pkg_status=$(rpm -q ypserv 2>/dev/null)

if [[ "$pkg_status" == *"not installed"* ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.10" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure nis server services are not in use" c10
write_col "NIS (Network Information Service) distributes system configuration data across network systems" c11
write_col "ypserv package must not be installed" c12
write_col "ypserv package is not installed Output : $pkg_status" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16

else

yp_enabled=$(systemctl is-enabled ypserv.service 2>/dev/null)
yp_active=$(systemctl is-active ypserv.service 2>/dev/null)

if [[ "$yp_enabled" != "enabled" && "$yp_active" != "active" ]]; then
result="OK"
msg="ypserv installed but ypserv.service is not enabled and not active"
else
result="KO"
msg="ypserv installed and ypserv.service is enabled or active"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.10" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure nis server services are not in use" c10
write_col "NIS (Network Information Service) distributes system configuration data across network systems" c11
write_col "ypserv package must not be installed" c12
write_col "$msg Output : package=$pkg_status ypserv_enabled=$yp_enabled ypserv_active=$yp_active" c13
write_col "$result" c14
write_col "$severity" c15
write_col "$scandate" c16

fi

#2.1.17 Ensure tftp server services are not in use

pkg_status=$(rpm -q tftp-server 2>/dev/null)

if [[ "$pkg_status" == *"not installed"* ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.17" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure tftp server services are not in use" c10
write_col "TFTP allows simple file transfers over UDP and should not run unless required" c11
write_col "tftp-server package must not be installed" c12
write_col "tftp-server package is not installed Output : $pkg_status" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16

else

tftp_socket_enabled=$(systemctl is-enabled tftp.socket 2>/dev/null)
tftp_service_enabled=$(systemctl is-enabled tftp.service 2>/dev/null)

tftp_socket_active=$(systemctl is-active tftp.socket 2>/dev/null)
tftp_service_active=$(systemctl is-active tftp.service 2>/dev/null)

if [[ "$tftp_socket_enabled" != "enabled" && "$tftp_service_enabled" != "enabled" && "$tftp_socket_active" != "active" && "$tftp_service_active" != "active" ]]; then
result="OK"
msg="tftp-server installed but tftp.socket and tftp.service are not enabled and not active"
else
result="KO"
msg="tftp-server installed and tftp.socket or tftp.service is enabled or active"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.17" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure tftp server services are not in use" c10
write_col "TFTP allows simple file transfers over UDP and should not run unless required" c11
write_col "tftp-server package must not be installed" c12
write_col "$msg Output : package=$pkg_status tftp_socket_enabled=$tftp_socket_enabled tftp_service_enabled=$tftp_service_enabled tftp_socket_active=$tftp_socket_active tftp_service_active=$tftp_service_active" c13
write_col "$result" c14
write_col "$severity" c15
write_col "$scandate" c16

fi

#2.1.15 Ensure snmp services are not in use

pkg_status=$(rpm -q net-snmp 2>/dev/null)

if [[ "$pkg_status" == *"not installed"* ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.15" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure snmp services are not in use" c10
write_col "SNMP is used for monitoring network and system devices and should not run unless required" c11
write_col "net-snmp package must not be installed" c12
write_col "net-snmp package is not installed Output : $pkg_status" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16

else

snmp_enabled=$(systemctl is-enabled snmpd.service 2>/dev/null)
snmp_active=$(systemctl is-active snmpd.service 2>/dev/null)

if [[ "$snmp_enabled" != "enabled" && "$snmp_active" != "active" ]]; then
result="OK"
msg="net-snmp installed but snmpd.service is not enabled and not active"
else
result="KO"
msg="net-snmp installed and snmpd.service is enabled or active"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.15" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure snmp services are not in use" c10
write_col "SNMP is used for monitoring network and system devices and should not run unless required" c11
write_col "net-snmp package must not be installed" c12
write_col "$msg Output : package=$pkg_status snmpd_enabled=$snmp_enabled snmpd_active=$snmp_active" c13
write_col "$result" c14
write_col "$severity" c15
write_col "$scandate" c16

fi

#2.1.6 Ensure dnsmasq services are not in use

pkg_status=$(rpm -q dnsmasq 2>/dev/null)

if [[ "$pkg_status" == *"not installed"* ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.6" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure dnsmasq services are not in use" c10
write_col "Dnsmasq provides DNS caching forwarding and DHCP services and should not run unless required" c11
write_col "dnsmasq package must not be installed" c12
write_col "dnsmasq package is not installed Output : $pkg_status" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16

else

dns_enabled=$(systemctl is-enabled dnsmasq.service 2>/dev/null)
dns_active=$(systemctl is-active dnsmasq.service 2>/dev/null)

if [[ "$dns_enabled" != "enabled" && "$dns_active" != "active" ]]; then
result="OK"
msg="dnsmasq installed but dnsmasq.service is not enabled and not active"
else
result="KO"
msg="dnsmasq installed and dnsmasq.service is enabled or active"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.6" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure dnsmasq services are not in use" c10
write_col "Dnsmasq provides DNS caching forwarding and DHCP services and should not run unless required" c11
write_col "dnsmasq package must not be installed" c12
write_col "$msg Output : package=$pkg_status dnsmasq_enabled=$dns_enabled dnsmasq_active=$dns_active" c13
write_col "$result" c14
write_col "$severity" c15
write_col "$scandate" c16

fi

#5.4.1.6 Ensure all users last password change date is in the past

# Initialize a flag to check if any user has a future password change date
found_future_change=false

# Read each user from /etc/shadow
while IFS= read -r l_user; do
  # Get the last password change date in seconds since epoch
  l_change=$(date -d "$(chage --list "$l_user" | grep '^Last password change' | cut -d: -f2 | grep -v 'never$')" +%s)
  
  # Check if the last password change date is in the future
  if [[ "$l_change" -gt "$(date +%s)" ]]; then
	write_col "$customer" c1
	write_col "$custinvid" c2
	write_col "$policy" c3
	write_col "$doc" c4
	write_col "$server" c5
	write_col "$ip" c6
	write_col "$os" c7
	write_col "5.4.1.6" c8
	write_col "Configure shadow password suite parameters" c9
	write_col "Ensure all users last password change date is in the past" c10
	write_col "All users should have a password change date in the past" c11
	write_col "Field 3 of /etc/shadow (last password change date) are not dates in the future" c12
    echo "User: \"$l_user\" last password change was \"$(chage --list "$l_user" | grep '^Last password change' | cut -d: -f2 | sed 's/,/ /g')\"" >>c13
	write_col "KO" c14
	write_col "$severity" c15
	write_col "$scandate" c16
    found_future_change=true
  fi
done < <(awk -F: '/^[^:\n\r]+:[^!*xX\n\r]/{print $1}' /etc/shadow)

# If no user has a future password change date, display a message
if ! $found_future_change; then
	write_col "$customer" c1
	write_col "$custinvid" c2
	write_col "$policy" c3
	write_col "$doc" c4
	write_col "$server" c5
	write_col "$ip" c6
	write_col "$os" c7
	write_col "5.4.1.6" c8
	write_col "Configure shadow password suite parameters" c9
	write_col "Ensure all users last password change date is in the past" c10
	write_col "All users should have a password change date in the past" c11
	write_col "Field 3 of /etc/shadow (last password change date) are not dates in the future" c12
	write_col "All users last password change date is in the past" c13
	write_col "OK" c14
	write_col "$severity" c15
	write_col "$scandate" c16
fi

# 2.1.23 Ensure mail transfer agents are configured for local-only mode

status="OK"
details="No Mail Transfer Agent detected"

postfix_conf="/etc/postfix/main.cf"
sendmail_conf="/etc/mail/sendmail.cf"
exim_conf="/etc/exim/exim.conf"

# ---- Check Postfix ----
if rpm -q postfix &>/dev/null; then
    if grep -Eq '^\s*inet_interfaces\s*=\s*(localhost|127\.0\.0\.1)' "$postfix_conf" 2>/dev/null; then
        details="Postfix installed and configured for local-only mode"
    else
        status="KO"
        details="Postfix installed but not restricted to localhost"
    fi
fi

# ---- Check Sendmail ----
if rpm -q sendmail &>/dev/null; then
    if grep -Eq 'Addr=127\.0\.0\.1' "$sendmail_conf" 2>/dev/null; then
        details="Sendmail installed and configured for local-only mode"
    else
        status="KO"
        details="Sendmail installed but not restricted to localhost"
    fi
fi

# ---- Check Exim ----
if rpm -q exim &>/dev/null; then
    if grep -Eq '^\s*local_interfaces\s*=\s*127\.0\.0\.1' "$exim_conf" 2>/dev/null; then
        details="Exim installed and configured for local-only mode"
    else
        status="KO"
        details="Exim installed but not restricted to localhost"
    fi
fi

# ---- Write CIS Output ----
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.1.23" c8
write_col "Configure Special Purpose Services" c9
write_col "Ensure mail transfer agents are configured for local-only mode" c10
write_col "Mail Transfer Agents should listen only on localhost to reduce network attack surface" c11
write_col "MTA must listen only on localhost (127.0.0.1)" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

# 1.1.1.10 Ensure usb-storage kernel module is not available

module="usb-storage"
modprobe_conf="/etc/modprobe.d"

blacklist=$(grep -R "^\s*blacklist\s\+$module" $modprobe_conf 2>/dev/null)
install_rule=$(grep -R "^\s*install\s\+$module\s\+/bin/true" $modprobe_conf 2>/dev/null)
loaded=$(lsmod | awk '{print $1}' | grep -x "$module")

if [[ -n "$loaded" ]]; then
  status="KO"
  details="usb-storage module is currently loaded"
elif [[ -z "$blacklist" && -z "$install_rule" ]]; then
  status="KO"
  details="usb-storage module is available and can be loaded"
else
  status="OK"
  details="usb-storage module is disabled (blacklisted or install rule configured)"
fi

severity="Critical"

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.1.10" c8
write_col "Ensure usb-storage kernel module is not available" c9
write_col "Ensure usb-storage kernel module is not available" c10
write_col "usb-storage module should be disabled to prevent unauthorized data exfiltration via removable media" c11
write_col "usb-storage module should be blacklisted and install rule set to /bin/true" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

#2.2.3 Ensure NIS Client is not installed

pack_nis=`rpm -q ypbind`

if [[ $pack_nis != "package ypbind is not installed" ]]; then
rpm -q ypbind >package
for out in `cat package`
do
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.2.3" c8
write_col "Configure Service Clients" c9
write_col "Ensure NIS Client is not installed" c10
write_col "The NIS is a client-server directory service protocol used to distribute system configuration files" c11
write_col "NIS Client is not installed" c12
write_col "NIS client is installed Output : $out" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
done
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.2.3" c8
write_col "Configure Service Clients" c9
write_col "Ensure NIS Client is not installed" c10
write_col "The NIS is a client-server directory service protocol used to distribute system configuration files" c11
write_col "NIS Client is not installed" c12
write_col "NIS client is not installed Output : $(rpm -q ypbind)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

rm -rf package

#2.2.5 Ensure TFTP client is not installed

pack_tftp=`rpm -q tftp`

if [[ $pack_tftp != "package tftp is not installed" ]]; then
rpm -q tftp >package
for out in `cat package`
do
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.2.5" c8
write_col "Configure Service Clients" c9
write_col "Ensure TFTP client is not installed" c10
write_col "TFTP is a simple protocol for exchanging files between two TCP/IP machines" c11
write_col "TFTP package is not installed" c12
write_col "TFTP package is installed Output : $out" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
done
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.2.5" c8
write_col "Configure Service Clients" c9
write_col "Ensure TFTP client is not installed" c10
write_col "TFTP is a simple protocol for exchanging files between two TCP/IP machines" c11
write_col "TFTP package is not installed" c12
write_col "TFTP package is not installed Output : $(rpm -q tftp)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

rm -rf package

#2.2.4 Ensure telnet client is not installed

pack_telnet=`rpm -q telnet`

if [[ $pack_telnet != "package telnet is not installed" ]]; then
rpm -q telnet >package
for out in `cat package`
do
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.2.4" c8
write_col "Configure Service Clients" c9
write_col "Ensure telnet client is not installed" c10
write_col "The telnet package contains the telnet client which allows users to start connections to other systems via the telnet protocol" c11
write_col "Telnet client is not installed" c12
write_col "Telnet client is installed Output : $out" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
done
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.2.4" c8
write_col "Configure Service Clients" c9
write_col "Ensure telnet client is not installed" c10
write_col "The telnet package contains the telnet client which allows users to start connections to other systems via the telnet protocol" c11
write_col "Telnet client is not installed" c12
write_col "Telnet client is not installed Output : $(rpm -q telnet)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

rm -rf package

#2.2.1 Ensure ftp client is not installed

pack_ftp=`rpm -q ftp`

if [[ $pack_ftp != "package ftp is not installed" ]]; then
rpm -q ftp >package
for out in `cat package`
do
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.2.1" c8
write_col "Configure Service Clients" c9
write_col "Ensure ftp client is not installed" c10
write_col "FTP is a traditional and widely used standard tool for transferring files between a server and clients over a network especially where no authentication is necessary" c11
write_col "Ftp client is not installed" c12
write_col "Ftp client is installed Output : $out" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
done
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.2.1" c8
write_col "Configure Service Clients" c9
write_col "Ensure ftp client is not installed" c10
write_col "FTP is a traditional and widely used standard tool for transferring files between a server and clients over a network especially where no authentication is necessary" c11
write_col "Ftp client is not installed" c12
write_col "Ftp client is not installed Output : $(rpm -q ftp)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

rm -rf package

# 3.2.5 Ensure SCTP kernel module is not available

{
 l_output=""
 l_output2=""
 module_name="sctp"

 mod_exists="no"

 for path in /usr/lib/modules/*/kernel/net /lib/modules/*/kernel/net; do
   if [ -d "$path/$module_name" ] && [ -n "$(ls -A "$path/$module_name" 2>/dev/null)" ]; then
     mod_exists="yes"
     l_output="$l_output sctp module exists in $path"
   fi
 done

 # If module not present → PASS
 if [[ "$mod_exists" == "no" ]]; then
   status="OK"
   details="sctp module not present on system"

 else

   loaded=$(lsmod | grep -w "$module_name")

   if [[ -n "$loaded" ]]; then
     l_output2="$l_output2 sctp module is currently loaded"
   else
     l_output="$l_output | Module is not loaded"
   fi

   mod_conf=$(modprobe --showconfig 2>/dev/null)

   blacklist=$(echo "$mod_conf" | grep -P "^\s*blacklist\s+$module_name\b")
   install_rule=$(echo "$mod_conf" | grep -P "^\s*install\s+$module_name\s+/bin/(true|false)")

   if [[ -n "$blacklist" && -n "$install_rule" ]]; then
     l_output="$l_output | Module is properly disabled (blacklist + install rule)"
   else
     l_output2="$l_output2 sctp module is not properly disabled (missing blacklist or install rule)"
   fi

   if [[ -z "$l_output2" ]]; then
     status="OK"
     details="$l_output"
   else
     status="KO"
     details="$l_output2"
   fi

 fi

 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "3.2.5" c8
 write_col "Network Configuration" c9
 write_col "Ensure SCTP kernel module is not available" c10
 write_col "Disable SCTP to reduce attack surface and prevent unnecessary network protocols" c11
 write_col "Module must not be loaded and must be blacklisted with install rule" c12
 write_col "$details" c13
 write_col "$status" c14
 write_col "$severity" c15
 write_col "$scandate" c16

}

# 3.2.6 Ensure tipc kernel module is not available

{
 l_output=""
 l_output2=""
 module_name="tipc"

 mod_exists="no"

 for path in /usr/lib/modules/*/kernel/net /lib/modules/*/kernel/net; do
   if [ -d "$path/$module_name" ] && [ -n "$(ls -A "$path/$module_name" 2>/dev/null)" ]; then
     mod_exists="yes"
     l_output="$l_output tipc module exists in $path"
   fi
 done

 # If module not present → PASS
 if [[ "$mod_exists" == "no" ]]; then
   status="OK"
   details="tipc module not present on system"

 else

   loaded=$(lsmod | grep -w "$module_name")

   if [[ -n "$loaded" ]]; then
     l_output2="$l_output2 tipc module is currently loaded"
   else
     l_output="$l_output | Module is not loaded"
   fi

   mod_conf=$(modprobe --showconfig 2>/dev/null)

   blacklist=$(echo "$mod_conf" | grep -P "^\s*blacklist\s+$module_name\b")
   install_rule=$(echo "$mod_conf" | grep -P "^\s*install\s+$module_name\s+/bin/(true|false)")

   if [[ -n "$blacklist" && -n "$install_rule" ]]; then
     l_output="$l_output | Module is properly disabled (blacklist + install rule)"
   else
     l_output2="$l_output2 tipc module is not properly disabled (missing blacklist or install rule)"
   fi

   if [[ -z "$l_output2" ]]; then
     status="OK"
     details="$l_output"
   else
     status="KO"
     details="$l_output2"
   fi

 fi

 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "3.2.6" c8
 write_col "Network Parameters (Host Only)" c9
 write_col "Ensure tipc kernel module is not available" c10
 write_col "Disable TIPC to reduce unnecessary network exposure" c11
 write_col "Module must not be loaded and must be blacklisted with install rule" c12
 write_col "$details" c13
 write_col "$status" c14
 write_col "$severity" c15
 write_col "$scandate" c16

}

# 4.1.3 Ensure firewalld.service is configured

enabled=$(systemctl is-enabled firewalld 2>/dev/null)
active=$(systemctl is-active firewalld 2>/dev/null)

if [[ "$enabled" == "enabled" && "$active" == "active" ]]; then
  status="OK"
  details="firewalld service is enabled and running"
else
  status="KO"
  details="firewalld service not properly configured (enabled=$enabled, active=$active)"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "4.1.3" c8
write_col "Ensure firewalld.service is configured" c9
write_col "Ensure firewalld.service is configured" c10
write_col "firewalld must be enabled and running to provide continuous host-based firewall protection" c11
write_col "firewalld service must be enabled and active" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

#4.1.4 Ensure firewalld active zone target is configured

zones=$(firewall-cmd --get-active-zones 2>/dev/null | awk 'NR%2==1')
bad_zones=""

for zone in $zones; do
  target=$(firewall-cmd --zone="$zone" --get-target 2>/dev/null)
  if [[ "$target" != "DROP" && "$target" != "BLOCK" ]]; then
    bad_zones+="$zone(target=$target) "
  fi
done

if [[ -z "$zones" ]]; then
  status="KO"
  details="No active firewalld zones found"
elif [[ -z "$bad_zones" ]]; then
  status="OK"
  details="All active firewalld zones have secure target (DROP/BLOCK)"
else
  status="KO"
  details="Zones with insecure target: $bad_zones"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "4.1.4" c8
write_col "Ensure firewalld active zone target is configured" c9
write_col "Ensure firewalld active zone target is configured" c10
write_col "Firewalld zones should default to DROP or BLOCK to deny unsolicited inbound traffic" c11
write_col "All active zones must have target set to DROP or BLOCK" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

########################End########################

########################System File Permissions########################

#7.1.1 Ensure access to /etc/passwd is configured

File="/etc/passwd"

if [ -e $File ]; then

file_permission=`stat -c %a $File`
owner=`stat -c %u $File`
group=`stat -c %g $File`

if [[ "$file_permission" == "644" || "$file_permission" == "640" || "$file_permission" == "600" || "$file_permission" == "400" || "$file_permission" == "0" ]] && [[ "$owner" == "0" ]] && [[ "$group" == "0" ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.1.1" c8
write_col "System File Permissions" c9
write_col "Ensure access to /etc/passwd is configured" c10
write_col "The /etc/passwd file contains user account information that is used by many system utilities and therefore must be readable for these utilities to operate" c11
write_col "UID and GID are both 0/root and Access is 644" c12
write_col "File : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.1.1" c8
write_col "System File Permissions" c9
write_col "Ensure access to /etc/passwd is configured" c10
write_col "The /etc/passwd file contains user account information that is used by many system utilities and therefore must be readable for these utilities to operate" c11
write_col "UID and GID are both 0/root and Access is 644" c12
write_col "File : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.1.1" c8
write_col "System File Permissions" c9
write_col "Ensure access to /etc/passwd is configured" c10
write_col "The /etc/passwd file contains user account information that is used by many system utilities and therefore must be readable for these utilities to operate" c11
write_col "UID and GID are both 0/root and Access is 644" c12
write_col "File $File does not exist on the server $server" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#7.1.3 Ensure permissions on /etc/group are configured

File="/etc/group"

if [ -e $File ]; then

file_permission=`stat -c %a $File`
owner=`stat -c %u $File`
group=`stat -c %g $File`

if [[ "$file_permission" == "644" || "$file_permission" == "640" || "$file_permission" == "600" || "$file_permission" == "400" || "$file_permission" == "0" ]] && [[ "$owner" == "0" ]] && [[ "$group" == "0" ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.1.3" c8
write_col "System File Permissions" c9
write_col "Ensure access to /etc/group is configured" c10
write_col "The /etc/group file contains a list of all the valid groups defined in the system" c11
write_col "UID and GID are both 0/root and Access is 644" c12
write_col "File : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.1.3" c8
write_col "System File Permissions" c9
write_col "Ensure access to /etc/group is configured" c10
write_col "The /etc/group file contains a list of all the valid groups defined in the system" c11
write_col "UID and GID are both 0/root and Access is 644" c12
write_col "File : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.1.3" c8
write_col "System File Permissions" c9
write_col "Ensure access to /etc/group is configured" c10
write_col "The /etc/group file contains a list of all the valid groups defined in the system" c11
write_col "UID and GID are both 0/root and Access is 644" c12
write_col "File $File does not exist on the server $server" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#7.1.2 Ensure access to /etc/passwd- is configured

File="/etc/passwd-"

if [ -e $File ]; then

file_permission=`stat -c %a $File`
owner=`stat -c %u $File`
group=`stat -c %g $File`

if [[ "$file_permission" == "644" || "$file_permission" == "640" || "$file_permission" == "600" || "$file_permission" == "400" || "$file_permission" == "0" ]] && [[ "$owner" == "0" ]] && [[ "$group" == "0" ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.1.2" c8
write_col "System File Permissions" c9
write_col "Ensure access to /etc/passwd- is configured" c10
write_col "The /etc/passwd- file contains backup user account information" c11
write_col "UID and GID are both 0/root and Access is 644" c12
write_col "File : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.1.2" c8
write_col "System File Permissions" c9
write_col "Ensure access to /etc/passwd- is configured" c10
write_col "The /etc/passwd- file contains backup user account information" c11
write_col "UID and GID are both 0/root and Access is 644" c12
write_col "File : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.1.2" c8
write_col "System File Permissions" c9
write_col "Ensure access to /etc/passwd- is configured" c10
write_col "The /etc/passwd- file contains backup user account information" c11
write_col "UID and GID are both 0/root and Access is 644" c12
write_col "File $File does not exist on the server $server" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#7.1.4 Ensure access to /etc/group- is configured

File="/etc/group-"

if [ -e $File ]; then

file_permission=`stat -c %a $File`
owner=`stat -c %u $File`
group=`stat -c %g $File`

if [[ "$file_permission" == "644" || "$file_permission" == "640" || "$file_permission" == "600" || "$file_permission" == "400" || "$file_permission" == "0" ]] && [[ "$owner" == "0" ]] && [[ "$group" == "0" ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.1.4" c8
write_col "System File Permissions" c9
write_col "Ensure access to /etc/group- is configured" c10
write_col "The /etc/group- file contains a backup list of all the valid groups defined in the system" c11
write_col "UID and GID are both 0/root and Access is 644" c12
write_col "File : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.1.4" c8
write_col "System File Permissions" c9
write_col "Ensure access to /etc/group- is configured" c10
write_col "The /etc/group- file contains a backup list of all the valid groups defined in the system" c11
write_col "UID and GID are both 0/root and Access is 644" c12
write_col "File : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.1.4" c8
write_col "System File Permissions" c9
write_col "Ensure access to /etc/group- is configured" c10
write_col "The /etc/group- file contains a backup list of all the valid groups defined in the system" c11
write_col "UID and GID are both 0/root and Access is 644" c12
write_col "File $File does not exist on the server $server" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#7.1.5 Ensure access to /etc/shadow is configured

File="/etc/shadow"

if [ -e $File ]; then

file_permission=`stat -c %a $File`
owner=`stat -c %u $File`
group=`stat -c %g $File`

if [[ "$file_permission" == "0" ]] && [[ "$owner" == "0" ]] && [[ "$group" == "0" ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.1.5" c8
write_col "System File Permissions" c9
write_col "Ensure access to /etc/shadow is configured" c10
write_col "The /etc/shadow file is used to store the information about user accounts that is critical to the security of those accounts such as the hashed password and other security information" c11
write_col "File permissions must be set ---------" c12
write_col "File : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.1.5" c8
write_col "System File Permissions" c9
write_col "Ensure access to /etc/shadow is configured" c10
write_col "The /etc/shadow file is used to store the information about user accounts that is critical to the security of those accounts such as the hashed password and other security information" c11
write_col "File permissions must be set ---------" c12
write_col "File : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.1.5" c8
write_col "System File Permissions" c9
write_col "Ensure access to /etc/shadow is configured" c10
write_col "The /etc/shadow file is used to store the information about user accounts that is critical to the security of those accounts such as the hashed password and other security information" c11
write_col "File permissions must be set ---------" c12
write_col "File $File does not exist on the server $server" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#7.1.7 Ensure access to /etc/gshadow is configured

File="/etc/gshadow"

if [ -e $File ]; then

file_permission=`stat -c %a $File`
owner=`stat -c %u $File`
group=`stat -c %g $File`

if [[ "$file_permission" == "0" ]] && [[ "$owner" == "0" ]] && [[ "$group" == "0" ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.1.7" c8
write_col "System File Permissions" c9
write_col "Ensure access to /etc/gshadow is configured" c10
write_col "The /etc/gshadow file is used to store the information about groups that is critical to the security of those accounts such as the hashed password and other security information" c11
write_col "Permissions of 0000 and ownership of 0:0" c12
write_col "File : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.1.7" c8
write_col "System File Permissions" c9
write_col "Ensure access to /etc/gshadow is configured" c10
write_col "The /etc/gshadow file is used to store the information about groups that is critical to the security of those accounts such as the hashed password and other security information" c11
write_col "Permissions of 0000 and ownership of 0:0" c12
write_col "File : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.1.7" c8
write_col "System File Permissions" c9
write_col "Ensure access to /etc/gshadow is configured" c10
write_col "The /etc/gshadow file is used to store the information about groups that is critical to the security of those accounts such as the hashed password and other security information" c11
write_col "Permissions of 0000 and ownership of 0:0" c12
write_col "File $File does not exist on the server $server" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#7.1.6 Ensure access to /etc/shadow- is configured

File="/etc/shadow-"

if [ -e $File ]; then

file_permission=`stat -c %a $File`
owner=`stat -c %u $File`
group=`stat -c %g $File`

if [[ "$file_permission" == "0" ]] && [[ "$owner" == "0" ]] && [[ "$group" == "0" ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.1.6" c8
write_col "System File Permissions" c9
write_col "Ensure access to /etc/shadow- is configured" c10
write_col "The /etc/shadow- file is used to store backup information about user accounts that is critical to the security of those accounts such as the hashed password and other security information" c11
write_col "Permissions of 0000 and ownership of 0:0" c12
write_col "File : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.1.6" c8
write_col "System File Permissions" c9
write_col "Ensure access to /etc/shadow- is configured" c10
write_col "The /etc/shadow- file is used to store backup information about user accounts that is critical to the security of those accounts such as the hashed password and other security information" c11
write_col "Permissions of 0000 and ownership of 0:0" c12
write_col "File : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.1.6" c8
write_col "System File Permissions" c9
write_col "Ensure access to /etc/shadow- is configured" c10
write_col "The /etc/shadow- file is used to store backup information about user accounts that is critical to the security of those accounts such as the hashed password and other security information" c11
write_col "Permissions of 0000 and ownership of 0:0" c12
write_col "File $File does not exist on the server $server" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#7.1.8 Ensure access to /etc/gshadow- is configured

File="/etc/gshadow-"

if [ -e $File ]; then

file_permission=`stat -c %a $File`
owner=`stat -c %u $File`
group=`stat -c %g $File`

if [[ "$file_permission" == "0" ]] && [[ "$owner" == "0" ]] && [[ "$group" == "0" ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.1.8" c8
write_col "System File Permissions" c9
write_col "Ensure access to /etc/gshadow- is configured" c10
write_col "The /etc/gshadow- file is used to store backup information about groups that is critical to the security of those accounts such as the hashed password and other security information" c11
write_col "Permissions of 0000 and ownership of 0:0" c12
write_col "File : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.1.8" c8
write_col "System File Permissions" c9
write_col "Ensure access to /etc/gshadow- is configured" c10
write_col "The /etc/gshadow- file is used to store backup information about groups that is critical to the security of those accounts such as the hashed password and other security information" c11
write_col "Permissions of 0000 and ownership of 0:0" c12
write_col "File : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.1.8" c8
write_col "System File Permissions" c9
write_col "Ensure access to /etc/gshadow is configured" c10
write_col "The /etc/gshadow- file is used to store backup information about groups that is critical to the security of those accounts such as the hashed password and other security information" c11
write_col "Permissions of 0000 and ownership of 0:0" c12
write_col "File $File does not exist on the server $server" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#7.1.10 Ensure access to /etc/security/opasswd is configured

File="/etc/security/opasswd"

if [ -e $File ]; then

file_permission=`stat -c %a $File`
owner=`stat -c %u $File`
group=`stat -c %g $File`

if [[ "$file_permission" == "600" || "$file_permission" == "400" || "$file_permission" == "0" ]] && [[ "$owner" == "0" ]] && [[ "$group" == "0" ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.1.10" c8
write_col "System File Permissions" c9
write_col "Ensure access to /etc/security/opasswd is configured" c10
write_col "/etc/security/opasswd and its backup /etc/security/opasswd.old hold users previous passwords if pam_unix or pam_pwhistory is in use on the system" c11
write_col "Permissions on /etc/opasswd are configured" c12
write_col "File : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.1.10" c8
write_col "System File Permissions" c9
write_col "Ensure access to /etc/security/opasswd is configured" c10
write_col "/etc/security/opasswd and its backup /etc/security/opasswd.old hold users previous passwords if pam_unix or pam_pwhistory is in use on the system" c11
write_col "Permissions on /etc/opasswd are configured" c12
write_col "File : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.1.10" c8
write_col "System File Permissions" c9
write_col "Ensure access to /etc/security/opasswd is configured" c10
write_col "/etc/security/opasswd and its backup /etc/security/opasswd.old hold users previous passwords if pam_unix or pam_pwhistory is in use on the system" c11
write_col "Permissions on /etc/opasswd are configured" c12
write_col "File $File does not exist on the server $server" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

File="/etc/security/opasswd.old"

if [ -e $File ]; then

file_permission=`stat -c %a $File`
owner=`stat -c %u $File`
group=`stat -c %g $File`

if [[ "$file_permission" == "600" || "$file_permission" == "400" || "$file_permission" == "0" ]] && [[ "$owner" == "0" ]] && [[ "$group" == "0" ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.1.10" c8
write_col "System File Permissions" c9
write_col "Ensure access to /etc/security/opasswd is configured" c10
write_col "/etc/security/opasswd and its backup /etc/security/opasswd.old hold users previous passwords if pam_unix or pam_pwhistory is in use on the system" c11
write_col "Permissions on /etc/opasswd are configured" c12
write_col "File : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.1.10" c8
write_col "System File Permissions" c9
write_col "Ensure access to /etc/security/opasswd is configured" c10
write_col "/etc/security/opasswd and its backup /etc/security/opasswd.old hold users previous passwords if pam_unix or pam_pwhistory is in use on the system" c11
write_col "Permissions on /etc/opasswd are configured" c12
write_col "File : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.1.10" c8
write_col "System File Permissions" c9
write_col "Ensure access to /etc/security/opasswd is configured" c10
write_col "/etc/security/opasswd and its backup /etc/security/opasswd.old hold users previous passwords if pam_unix or pam_pwhistory is in use on the system" c11
write_col "Permissions on /etc/opasswd are configured" c12
write_col "File $File does not exist on the server $server" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#7.1.9 Ensure access to /etc/shells is configured

File="/etc/shells"

if [ -e $File ]; then

file_permission=`stat -c %a $File`
owner=`stat -c %u $File`
group=`stat -c %g $File`

if [[ "$file_permission" == "644" || "$file_permission" == "640" || "$file_permission" == "600" || "$file_permission" == "400" || "$file_permission" == "0" ]] && [[ "$owner" == "0" ]] && [[ "$group" == "0" ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.1.9" c8
write_col "System File Permissions" c9
write_col "Ensure access to /etc/shells is configured" c10
write_col "/etc/shells is a text file which contains the full pathnames of valid login shells" c11
write_col "Permissions on /etc/shells are configured" c12
write_col "File : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.1.9" c8
write_col "System File Permissions" c9
write_col "Ensure access to /etc/shells is configured" c10
write_col "/etc/shells is a text file which contains the full pathnames of valid login shells" c11
write_col "Permissions on /etc/shells are configured" c12
write_col "File : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.1.9" c8
write_col "System File Permissions" c9
write_col "Ensure access to /etc/shells is configured" c10
write_col "/etc/shells is a text file which contains the full pathnames of valid login shells" c11
write_col "Permissions on /etc/shells are configured" c12
write_col "File $File does not exist on the server $server" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#7.1.11 Ensure world writable files and directories are secured

#!/usr/bin/env bash

{
 l_output=""
 l_output2=""
 l_smask='01000'
 a_path=(); a_arr=(); a_file=(); a_dir=() # Initialize arrays
 a_path=(! -path "/run/user/*" -a ! -path "/proc/*" -a ! -path "*/containerd/*" -a ! -path "*/kubelet/pods/*" -a ! -path "/sys/kernel/security/apparmor/*" -a ! -path "/snap/*" -a ! -path "/sys/fs/cgroup/memory/*" -a ! -path "/sys/fs/selinux/*" -a ! -path "/var/lib/containers/storage/overlay/*" -a ! -path "*/.local/share/containers/storage/overlay/*")
 while read -r l_bfs; do
 a_path+=( -a ! -path ""$l_bfs"/*")
 done < <(findmnt -Dkerno fstype,target | awk '$1 ~ /^\s*(nfs|proc|smb)/ {print $2}')
 # Populate array with files that will possibly fail one of the audits
 while IFS= read -r -d $'\0' l_file; do
 [ -e "$l_file" ] && a_arr+=("$(stat -Lc '%n^%#a' "$l_file")")
 done < <(find / \( "${a_path[@]}" \) \( -type f -o -type d \) -perm -0002 -print0 2>/dev/null)
 while IFS="^" read -r l_fname l_mode; do # Test files in the array
 [ -f "$l_fname" ] && a_file+=("$l_fname") # Add WR files
 if [ -d "$l_fname" ]; then # Add directories w/o sticky bit
 [ ! $(( $l_mode & $l_smask )) -gt 0 ] && a_dir+=("$l_fname")
 fi
 done < <(printf '%s\n' "${a_arr[@]}")
 if ! (( ${#a_file[@]} > 0 )); then
 l_output="$l_output No world writable files exist on the local filesystem."
 else
 l_output2="$l_output2 There are \"$(printf '%s' "${#a_file[@]}")\" World writable files on the system.\n - The following is a list of World writable files:\n$(printf '%s\n' "${a_file[@]}")\n - end of list\n" >/dev/null
 l_output2="$l_output2 There are \"$(printf '%s' "${#a_file[@]}")\" World writable files on the system."
 echo "$(printf '%s\n' "${a_file[@]}")" >world_writable_files
 fi
 if ! (( ${#a_dir[@]} > 0 )); then
 l_output="$l_output Sticky bit is set on world writable directories on the local filesystem."
 else
 l_output2="$l_output2 There are \"$(printf '%s' "${#a_dir[@]}")\" World writable directories without the sticky bit on the system.\n - The following is a list of World writable directories without the sticky bit:\n$(printf '%s\n' "${a_dir[@]}")\n - end of list\n" >/dev/null
 l_output2="$l_output2 There are \"$(printf '%s' "${#a_dir[@]}")\" World writable directories without the sticky bit on the system."
 echo "$(printf '%s\n' "${a_dir[@]}")" >world_writable_directory_without_the_sticky_bit
 fi
 unset a_path; unset a_arr; unset a_file; unset a_dir # Remove arrays
 # If l_output2 is empty, we pass
 if [ -z "$l_output2" ]; then
 echo -e "\n- Audit Result:\n ** PASS **\n - * Correctly configured * :\n$l_output\n" >/dev/null
 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "7.1.11" c8
 write_col "System File Permissions" c9
 write_col "Ensure world writable files and directories are secured" c10
 write_col "World writable files are the least secure" c11
 write_col "World writable files and directories are secured" c12
 write_col "$l_output" c13
 write_col "OK" c14
 write_col "$severity" c15
 write_col "$scandate" c16
 else
 echo -e "\n- Audit Result:\n ** FAIL **\n - * Reasons for audit failure * :\n$l_output2" >/dev/null
 
 output_files=`cat world_writable_files | wc -l`
 
 if [[ "$output_files" -ge "1" ]]; then
 
 while IFS= read -r out; do
 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "7.1.11" c8
 write_col "System File Permissions" c9
 write_col "Ensure world writable files and directories are secured" c10
 write_col "World writable files are the least secure" c11
 write_col "World writable files and directories are secured" c12
 echo "World writable File : $out Access : $(stat -c %a/%A "$out")" >>c13
 write_col "KO" c14
 write_col "$severity" c15
 write_col "$scandate" c16
 done < world_writable_files
 
 fi
 
 output_directory=`cat world_writable_directory_without_the_sticky_bit | wc -l`
 
 if [[ "$output_directory" -ge "1" ]]; then
 
 while IFS= read -r out; do
 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "7.1.11" c8
 write_col "System File Permissions" c9
 write_col "Ensure world writable files and directories are secured" c10
 write_col "World writable files are the least secure" c11
 write_col "World writable files and directories are secured" c12
 echo "World writable directory without the sticky bit Directory : $out Access : $(stat -c %a/%A "$out")" >>c13
 write_col "KO" c14
 write_col "$severity" c15
 write_col "$scandate" c16
 done < world_writable_directory_without_the_sticky_bit
 
 fi
 
 [ -n "$l_output" ] && echo -e "- * Correctly configured * :\n$l_output\n"
 fi
}

rm -rf world_writable_files
rm -rf world_writable_directory_without_the_sticky_bit

#7.1.12 Ensure no unowned or ungrouped files or directories exist

#!/usr/bin/env bash

{
 l_output=""
 l_output2=""
 a_path=(); a_arr=(); a_nouser=(); a_nogroup=() # Initialize arrays
 a_path=(! -path "/run/user/*" -a ! -path "/proc/*" -a ! -path "*/containerd/*" -a ! -path "*/kubelet/pods/*" -a ! -path "/sys/fs/cgroup/memory/*" -a ! -path "/var/lib/containers/storage/overlay/*" -a ! -path "*/.local/share/containers/storage/overlay/*")
 while read -r l_bfs; do
 a_path+=( -a ! -path ""$l_bfs"/*")
 done < <(findmnt -Dkerno fstype,target | awk '$1 ~ /^\s*(nfs|proc|smb)/ {print $2}')
 while IFS= read -r -d $'\0' l_file; do
 [ -e "$l_file" ] && a_arr+=("$(stat -Lc '%n^%U^%G' "$l_file")") && echo "Adding: $l_file"
 done < <(find / \( "${a_path[@]}" \) \( -type f -o -type d \) \( -nouser -o -nogroup \) -print0 2> /dev/null)
 while IFS="^" read -r l_fname l_user l_group; do # Test files in the array
 [ "$l_user" = "UNKNOWN" ] && a_nouser+=("$l_fname")
 [ "$l_group" = "UNKNOWN" ] && a_nogroup+=("$l_fname")
 done <<< "$(printf '%s\n' "${a_arr[@]}")"
 if ! (( ${#a_nouser[@]} > 0 )); then
 l_output="$l_output No unowned files or directories exist on the local filesystem."
 else
 l_output2="$l_output2 There are \"$(printf '%s' "${#a_nouser[@]}")\" unowned files or directories on the system.\n - The following is a list of unowned files and/or directories:\n$(printf '%s\n' "${a_nouser[@]}")\n - end of list" >/dev/null
 l_output2="$l_output2 There are \"$(printf '%s' "${#a_nouser[@]}")\" unowned files or directories on the system."
 echo "$(printf '%s\n' "${a_nouser[@]}")" >unowned_files_directories
 fi
 if ! (( ${#a_nogroup[@]} > 0 )); then
 l_output="$l_output No ungrouped files or directories exist on the local filesystem."
 else
 l_output2="$l_output2 There are \"$(printf '%s' "${#a_nogroup[@]}")\" ungrouped files or directories on the system.\n - The following is a list of ungrouped files and/or directories:\n$(printf '%s\n' "${a_nogroup[@]}")\n - end of list" >/dev/null
 l_output2="$l_output2 There are \"$(printf '%s' "${#a_nogroup[@]}")\" ungrouped files or directories on the system."
 echo "$(printf '%s\n' "${a_nogroup[@]}")" >ungrouped_files_directories
 fi 
 unset a_path; unset a_arr ; unset a_nouser; unset a_nogroup # Remove arrays
 if [ -z "$l_output2" ]; then # If l_output2 is empty, we pass
 echo -e "\n- Audit Result:\n ** PASS **\n - * Correctly configured * :\n$l_output\n" >/dev/null
 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "7.1.12" c8
 write_col "System File Permissions" c9
 write_col "Ensure no unowned or ungrouped files or directories exist" c10
 write_col "Administrators may delete users or groups from the system and neglect to remove all files and/or directories owned by those users or groups" c11
 write_col "No unowned or ungrouped files or directories exist" c12
 write_col "$l_output" c13
 write_col "OK" c14
 write_col "$severity" c15
 write_col "$scandate" c16
 else
 echo -e "\n- Audit Result:\n ** FAIL **\n - * Reasons for audit failure * :\n$l_output2" >/dev/null
 
 unowned_directory=`cat unowned_files_directories | wc -l`
 
 if [[ "$unowned_directory" -ge "1" ]]; then
 
 while IFS= read -r output; do
 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "7.1.12" c8
 write_col "System File Permissions" c9
 write_col "Ensure no unowned or ungrouped files or directories exist" c10
 write_col "Administrators may delete users or groups from the system and neglect to remove all files and/or directories owned by those users or groups" c11
 write_col "No unowned or ungrouped files or directories exist" c12
 write_col "Unowned File / Directory : $output" c13
 write_col "KO" c14
 write_col "$severity" c15
 write_col "$scandate" c16
 done < unowned_files_directories
 
 fi
 
 directory_ungrouped=`cat ungrouped_files_directories | wc -l`
 
 if [[ "$directory_ungrouped" -ge "1" ]]; then
 
 while IFS= read -r output; do
 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "7.1.12" c8
 write_col "System File Permissions" c9
 write_col "Ensure no unowned or ungrouped files or directories exist" c10
 write_col "Administrators may delete users or groups from the system and neglect to remove all files and/or directories owned by those users or groups" c11
 write_col "No unowned or ungrouped files or directories exist" c12
 write_col "Ungrouped File / Directory : $output" c13
 write_col "KO" c14
 write_col "$severity" c15
 write_col "$scandate" c16
 done < ungrouped_files_directories
 
 fi
 
 [ -n "$l_output" ] && echo -e "\n- * Correctly configured * :\n$l_output\n" >/dev/null
 fi
}

rm -rf unowned_files_directories
rm -rf ungrouped_files_directories

########################End########################
 
########################Configure Network Devices########################

#3.1.3 Ensure bluetooth services are not in use

if [[ $(rpm -q bluez) != "package bluez is not installed" ]]; then

rpm -q bluez >package

for out in `cat package`
do

service_enabled=`systemctl is-enabled bluetooth.service 2>/dev/null | grep 'enabled' | wc -l`
service_active=`systemctl is-active bluetooth.service 2>/dev/null | grep '^active' | wc -l`

enabled29=`systemctl is-enabled bluetooth.service`
active29=`systemctl is-active bluetooth.service`

if [[ "$service_enabled" -eq "0" && "$service_active" -eq "0" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "3.1.3" c8
write_col "Configure Network Devices" c9
write_col "Ensure bluetooth services are not in use" c10
write_col "Bluetooth is a short-range wireless technology standard that is used for exchanging data between devices over short distances" c11
write_col "Bluetooth services are not in use" c12
write_col "Package bluez is installed however bluetooth.service is not enabled and not active Output : is_package_installed ? = $out is_service_enabled ? = $enabled29 is_service_active ? = $active29" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
elif [[ "$service_enabled" -eq "0" && "$service_active" -ne "0" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "3.1.3" c8
write_col "Configure Network Devices" c9
write_col "Ensure bluetooth services are not in use" c10
write_col "Bluetooth is a short-range wireless technology standard that is used for exchanging data between devices over short distances" c11
write_col "Bluetooth services are not in use" c12
write_col "Package bluez is installed and bluetooth.service is not enabled however bluetooth.service is active Output : is_package_installed ? = $out is_service_enabled ? = $enabled29 is_service_active ? = $active29" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
elif [[ "$service_enabled" -ne "0" && "$service_active" -eq "0" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "3.1.3" c8
write_col "Configure Network Devices" c9
write_col "Ensure bluetooth services are not in use" c10
write_col "Bluetooth is a short-range wireless technology standard that is used for exchanging data between devices over short distances" c11
write_col "Bluetooth services are not in use" c12
write_col "Package bluez is installed and bluetooth.service is not active however bluetooth.service is enabled Output : is_package_installed ? = $out is_service_enabled ? = $enabled29 is_service_active ? = $active29" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "3.1.3" c8
write_col "Configure Network Devices" c9
write_col "Ensure bluetooth services are not in use" c10
write_col "Bluetooth is a short-range wireless technology standard that is used for exchanging data between devices over short distances" c11
write_col "Bluetooth services are not in use" c12
write_col "Package bluez is installed and bluetooth.service is enabled and active Output : is_package_installed ? = $out is_service_enabled ? = $enabled29 is_service_active ? = $active29" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
done
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "3.1.3" c8
write_col "Configure Network Devices" c9
write_col "Ensure bluetooth services are not in use" c10
write_col "Bluetooth is a short-range wireless technology standard that is used for exchanging data between devices over short distances" c11
write_col "Bluetooth services are not in use" c12
write_col "Package bluez is not installed Output : $(rpm -q bluez)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

rm -rf package

#3.1.2 Ensure wireless interfaces are not available

#!/usr/bin/env bash
{
 l_output=""
 l_output2=""
 module_chk()
 {
 # Check how module will be loaded
 l_loadable="$(modprobe -n -v "$l_mname")"
 if grep -Pq -- '^\h*install \/bin\/(true|false)' <<< "$l_loadable"; then
 l_output="$l_output module: \"$l_mname\" is not loadable: \"$l_loadable\""
 else
 l_output2="$l_output2 module: \"$l_mname\" is loadable: \"$l_loadable\""
 fi
 # Check is the module currently loaded
 if ! lsmod | grep "$l_mname" > /dev/null 2>&1; then
 l_output="$l_output module: \"$l_mname\" is not loaded"
 else
 l_output2="$l_output2 module: \"$l_mname\" is loaded"
 fi
 # Check if the module is deny listed
 if modprobe --showconfig | grep -Pq -- "^\h*blacklist\h+$l_mname\b"; then
 l_output="$l_output module: \"$l_mname\" is deny listed in: \"$(grep -Pl -- "^\h*blacklist\h+$l_mname\b" /etc/modprobe.d/*)\""
 else
 l_output2="$l_output2 module: \"$l_mname\" is not deny listed"
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
 echo -e "\n- Audit Result:\n ** PASS **" >/dev/null
 if [ -z "$l_output" ]; then
 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "3.1.2" c8
 write_col "Configure Network Devices" c9
 write_col "Ensure wireless interfaces are not available" c10
 write_col "Wireless networking is used when wired networks are unavailable" c11
 write_col "Wireless interfaces are disabled" c12
 write_col "System has no wireless NICs installed" c13
 echo -e "\n - System has no wireless NICs installed" >/dev/null
 write_col "OK" c14
 write_col "$severity" c15
 write_col "$scandate" c16
 else
 echo -e "\n$l_output\n" >/dev/null
 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "3.1.2" c8
 write_col "Configure Network Devices" c9
 write_col "Ensure wireless interfaces are not available" c10
 write_col "Wireless networking is used when wired networks are unavailable" c11
 write_col "Wireless interfaces are disabled" c12
 write_col "$l_output" c13
 write_col "OK" c14
 write_col "$severity" c15
 write_col "$scandate" c16
 fi
 else
 echo -e "\n- Audit Result:\n ** FAIL **\n - Reason(s) for audit failure:\n$l_output2\n" >/dev/null
 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "3.1.2" c8
 write_col "Configure Network Devices" c9
 write_col "Ensure wireless interfaces are not available" c10
 write_col "Wireless networking is used when wired networks are unavailable" c11
 write_col "Wireless interfaces are disabled" c12
 write_col "$l_output2" c13
 write_col "KO" c14
 write_col "$severity" c15
 write_col "$scandate" c16
 [ -n "$l_output" ] && echo -e "\n- Correctly set:\n$l_output\n" >/dev/null
 fi
}

# 3.2.1 Ensure atm kernel module is not available

{
 l_output=""
 l_output2=""
 module_name="atm"

 mod_exists="no"

 for path in /usr/lib/modules/*/kernel/net /lib/modules/*/kernel/net; do
   if [ -d "$path/$module_name" ] && [ -n "$(ls -A "$path/$module_name" 2>/dev/null)" ]; then
     mod_exists="yes"
     l_output="$l_output atm module exists in $path"
   fi
 done

 # If module not present → PASS
 if [[ "$mod_exists" == "no" ]]; then
   status="OK"
   details="atm module not present on system"

 else

   loaded=$(lsmod | grep -w "$module_name")

   if [[ -n "$loaded" ]]; then
     l_output2="$l_output2 atm module is currently loaded"
   else
     l_output="$l_output | Module is not loaded"
   fi

   mod_conf=$(modprobe --showconfig 2>/dev/null)

   blacklist=$(echo "$mod_conf" | grep -P "^\s*blacklist\s+$module_name\b")
   install_rule=$(echo "$mod_conf" | grep -P "^\s*install\s+$module_name\s+/bin/(true|false)")

   if [[ -n "$blacklist" && -n "$install_rule" ]]; then
     l_output="$l_output | Module is properly disabled (blacklist + install rule)"
   else
     l_output2="$l_output2 atm module is not properly disabled (missing blacklist or install rule)"
   fi

   if [[ -z "$l_output2" ]]; then
     status="OK"
     details="$l_output"
   else
     status="KO"
     details="$l_output2"
   fi

 fi

 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "3.2.1" c8
 write_col "Network Parameters (Host Only)" c9
 write_col "Ensure atm kernel module is not available" c10
 write_col "Disable ATM protocol to reduce unnecessary network attack surface" c11
 write_col "Module must not be loaded and must be blacklisted with install rule" c12
 write_col "$details" c13
 write_col "$status" c14
 write_col "$severity" c15
 write_col "$scandate" c16

}

# 3.2.2 Ensure can kernel module is not available

{
 l_output=""
 l_output2=""
 module_name="can"

 mod_exists="no"

 for path in /usr/lib/modules/*/kernel/net /lib/modules/*/kernel/net; do
   if [ -d "$path/$module_name" ] && [ -n "$(ls -A "$path/$module_name" 2>/dev/null)" ]; then
     mod_exists="yes"
     l_output="$l_output can module exists in $path"
   fi
 done

 # If module not present → PASS
 if [[ "$mod_exists" == "no" ]]; then
   status="OK"
   details="can module not present on system"

 else

   loaded=$(lsmod | grep -w "$module_name")

   if [[ -n "$loaded" ]]; then
     l_output2="$l_output2 can module is currently loaded"
   else
     l_output="$l_output | Module is not loaded"
   fi

   mod_conf=$(modprobe --showconfig 2>/dev/null)

   blacklist=$(echo "$mod_conf" | grep -P "^\s*blacklist\s+$module_name\b")
   install_rule=$(echo "$mod_conf" | grep -P "^\s*install\s+$module_name\s+/bin/(true|false)")

   if [[ -n "$blacklist" && -n "$install_rule" ]]; then
     l_output="$l_output | Module is properly disabled (blacklist + install rule)"
   else
     l_output2="$l_output2 can module is not properly disabled (missing blacklist or install rule)"
   fi

   if [[ -z "$l_output2" ]]; then
     status="OK"
     details="$l_output"
   else
     status="KO"
     details="$l_output2"
   fi

 fi

 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "3.2.2" c8
 write_col "Network Parameters (Host Only)" c9
 write_col "Ensure can kernel module is not available" c10
 write_col "Disable CAN protocol to reduce unnecessary kernel attack surface" c11
 write_col "Module must not be loaded and must be blacklisted with install rule" c12
 write_col "$details" c13
 write_col "$status" c14
 write_col "$severity" c15
 write_col "$scandate" c16

}

# 3.2.3 Ensure dccp kernel module is not available

{
 l_output=""
 l_output2=""
 module_name="dccp"

 mod_exists="no"

 for path in /usr/lib/modules/*/kernel/net /lib/modules/*/kernel/net; do
   if [ -d "$path/$module_name" ] && [ -n "$(ls -A "$path/$module_name" 2>/dev/null)" ]; then
     mod_exists="yes"
     l_output="$l_output dccp module exists in $path"
   fi
 done

 # If module not present → PASS
 if [[ "$mod_exists" == "no" ]]; then
   status="OK"
   details="dccp module not present on system"

 else

   loaded=$(lsmod | grep -w "$module_name")

   if [[ -n "$loaded" ]]; then
     l_output2="$l_output2 dccp module is currently loaded"
   else
     l_output="$l_output | Module is not loaded"
   fi

   mod_conf=$(modprobe --showconfig 2>/dev/null)

   blacklist=$(echo "$mod_conf" | grep -P "^\s*blacklist\s+$module_name\b")
   install_rule=$(echo "$mod_conf" | grep -P "^\s*install\s+$module_name\s+/bin/(true|false)")

   if [[ -n "$blacklist" && -n "$install_rule" ]]; then
     l_output="$l_output | Module is properly disabled (blacklist + install rule)"
   else
     l_output2="$l_output2 dccp module is not properly disabled (missing blacklist or install rule)"
   fi

   if [[ -z "$l_output2" ]]; then
     status="OK"
     details="$l_output"
   else
     status="KO"
     details="$l_output2"
   fi

 fi

 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "3.2.3" c8
 write_col "Network Parameters (Host Only)" c9
 write_col "Ensure dccp kernel module is not available" c10
 write_col "Disable DCCP protocol to reduce unnecessary network attack surface" c11
 write_col "Module must not be loaded and must be blacklisted with install rule" c12
 write_col "$details" c13
 write_col "$status" c14
 write_col "$severity" c15
 write_col "$scandate" c16

}

# 3.2.4 Ensure rds kernel module is not available

{
 l_output=""
 l_output2=""
 module_name="rds"

 mod_exists="no"

 for path in /usr/lib/modules/*/kernel/net /lib/modules/*/kernel/net; do
   if [ -d "$path/$module_name" ] && [ -n "$(ls -A "$path/$module_name" 2>/dev/null)" ]; then
     mod_exists="yes"
     l_output="$l_output rds module exists in $path"
   fi
 done

 # If module not present → PASS
 if [[ "$mod_exists" == "no" ]]; then
   status="OK"
   details="rds module not present on system"

 else

   loaded=$(lsmod | grep -w "$module_name")

   if [[ -n "$loaded" ]]; then
     l_output2="$l_output2 rds module is currently loaded"
   else
     l_output="$l_output | Module is not loaded"
   fi

   mod_conf=$(modprobe --showconfig 2>/dev/null)

   blacklist=$(echo "$mod_conf" | grep -P "^\s*blacklist\s+$module_name\b")
   install_rule=$(echo "$mod_conf" | grep -P "^\s*install\s+$module_name\s+/bin/(true|false)")

   if [[ -n "$blacklist" && -n "$install_rule" ]]; then
     l_output="$l_output | Module is properly disabled (blacklist + install rule)"
   else
     l_output2="$l_output2 rds module is not properly disabled (missing blacklist or install rule)"
   fi

   if [[ -z "$l_output2" ]]; then
     status="OK"
     details="$l_output"
   else
     status="KO"
     details="$l_output2"
   fi

 fi

 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "3.2.4" c8
 write_col "Network Parameters (Host Only)" c9
 write_col "Ensure rds kernel module is not available" c10
 write_col "Disable RDS protocol to reduce unnecessary network attack surface" c11
 write_col "Module must not be loaded and must be blacklisted with install rule" c12
 write_col "$details" c13
 write_col "$status" c14
 write_col "$severity" c15
 write_col "$scandate" c16

}

########################End########################

########################Configure a firewall utility########################

# 4.1.1 Ensure firewalld is installed

if rpm -q firewalld &>/dev/null || dpkg -l firewalld &>/dev/null; then
  status="OK"
  details="firewalld package is installed"
else
  status="KO"
  details="firewalld package is not installed"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "4.1.1" c8
write_col "Ensure firewalld is installed" c9
write_col "Ensure firewalld is installed" c10
write_col "A host-based firewall provides network traffic filtering to reduce exposure to network-based attacks" c11
write_col "firewalld package must be installed" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

# 4.1.2 Ensure firewalld backend is configured

conf="/etc/firewalld/firewalld.conf"

if [[ -f "$conf" ]]; then
  backend=$(grep -Ei '^\s*FirewallBackend\s*=' "$conf" | awk -F= '{print $2}' | tr -d ' "')

  if [[ "$backend" == "nftables" || "$backend" == "iptables" ]]; then
    status="OK"
    details="firewalld backend is properly configured (FirewallBackend=$backend)"
  else
    status="KO"
    details="firewalld backend is not properly set (current=${backend:-Not Set})"
  fi
else
  status="KO"
  details="firewalld configuration file not found"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "4.1.2" c8
write_col "Ensure firewalld backend is configured" c9
write_col "Ensure firewalld backend is configured" c10
write_col "Firewalld should use a supported backend to ensure proper firewall rule enforcement" c11
write_col "FirewallBackend must be set to nftables or iptables" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

########################End########################

########################Configure rsyslog########################

#6.2.2.1 Ensure rsyslog is installed

pack_rsyslog=`rpm -q rsyslog`

if [[ $pack_rsyslog != "package rsyslog is not installed" ]]; then
rpm -q rsyslog >package
for out in `cat package`
do
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "6.2.2.1" c8
write_col "Configure rsyslog" c9
write_col "Ensure ryslog is installed" c10
write_col "The rsyslog software is recommended in environments where journald does not meet operation requirements" c11
write_col "Package rsyslog is installed" c12
write_col "Package rsyslog is installed Output : $out" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
done
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "6.2.2.1" c8
write_col "Configure rsyslog" c9
write_col "Ensure ryslog is installed" c10
write_col "The rsyslog software is recommended in environments where journald does not meet operation requirements" c11
write_col "Package rsyslog is installed" c12
write_col "Package rsyslog is not installed Output : $(rpm -q rsyslog)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

rm -rf package

# 6.2.2.7 Ensure rsyslog is not configured to accept incoming logs

files="/etc/rsyslog.conf /etc/rsyslog.d/*.conf"

# -------- CIS Checks --------

# Advanced format checks
adv_module=$(grep -Psi -- '^\h*module\(load=\"?imtcp\"?\)' $files 2>/dev/null)
adv_input=$(grep -Psi -- '^\h*input\(type=\"?imtcp\"?\b' $files 2>/dev/null)

# Legacy format checks
legacy_module=$(grep -Psi -- '^\h*\$ModLoad\h+imtcp\b' $files 2>/dev/null)
legacy_input=$(grep -Psi -- '^\h*\$InputTCPServerRun\b' $files 2>/dev/null)

# -------- Decision Logic --------

if [[ -z "$adv_module" && -z "$adv_input" && -z "$legacy_module" && -z "$legacy_input" ]]; then
  status="OK"
  details="rsyslog is not configured to accept incoming logs"
else
  status="KO"
  details="Incoming log configuration found:"

  [[ -n "$adv_module" ]] && details="$details Advanced module: $adv_module;"
  [[ -n "$adv_input" ]] && details="$details Advanced input: $adv_input;"
  [[ -n "$legacy_module" ]] && details="$details Legacy module: $legacy_module;"
  [[ -n "$legacy_input" ]] && details="$details Legacy input: $legacy_input;"
fi

# -------- Sanitize Output --------
details=$(echo "$details" | tr '\r\n' ' ' | sed 's/[[:space:]]\+/ /g' | xargs)

# -------- Output --------
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "6.2.2.7" c8
write_col "Logging Configuration" c9
write_col "Ensure rsyslog is not configured to accept incoming logs" c10
write_col "System should not act as a log server unless explicitly required" c11
write_col "No imtcp module or TCP input should be configured" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

#6.2.2.2 Ensure rsyslog service is enabled and active

pkg_status=$(rpm -q rsyslog 2>/dev/null)

if [[ "$pkg_status" == *"not installed"* ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "6.2.2.2" c8
write_col "Configure rsyslog" c9
write_col "Ensure rsyslog service is enabled and active" c10
write_col "Once the rsyslog package is installed ensure that the service is enabled and active" c11
write_col "rsyslog package must be installed and service must be enabled and active" c12
write_col "Package rsyslog is not installed Output : $pkg_status" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16

else

service_enabled=$(systemctl is-enabled rsyslog 2>/dev/null)
service_active=$(systemctl is-active rsyslog.service 2>/dev/null)

if [[ "$service_enabled" == "enabled" && "$service_active" == "active" ]]; then

result="OK"
msg="rsyslog package is installed and service is enabled and active"

else

result="KO"
msg="rsyslog package is installed but service is not enabled and/or not active"

fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "6.2.2.2" c8
write_col "Configure rsyslog" c9
write_col "Ensure rsyslog service is enabled and active" c10
write_col "Once the rsyslog package is installed ensure that the service is enabled and active" c11
write_col "rsyslog package must be installed and service must be enabled and active" c12
write_col "$msg Output : package=$pkg_status enabled=$service_enabled active=$service_active" c13
write_col "$result" c14
write_col "$severity" c15
write_col "$scandate" c16

fi

#6.2.2.4 Ensure rsyslog log file creation mode is configured

main_conf="/etc/rsyslog.conf"
dropin_dir="/etc/rsyslog.d"

# Extract $FileCreateMode (last match wins)
fcm=$(
  {
    [[ -f "$main_conf" ]] && grep -Eih '^\s*\$FileCreateMode\s+' "$main_conf" 2>/dev/null
    [[ -d "$dropin_dir" ]] && grep -REih '^\s*\$FileCreateMode\s+' "$dropin_dir"/*.conf 2>/dev/null
  } | tail -n 1 | awk '{print $2}' | tr -d ' "'
)

# Validation: recommended secure value 0640
if [[ "$fcm" == "0640" ]]; then
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "6.2.2.4" c8
  write_col "Ensure rsyslog log file creation mode is configured" c9
  write_col "Ensure rsyslog log file creation mode is configured" c10
  write_col "rsyslog should create log files with restricted permissions to prevent unauthorized access to log data" c11
  write_col "\$FileCreateMode should be set to 0640" c12
  write_col "FileCreateMode is securely configured Output : \$FileCreateMode=$fcm" c13
  write_col "OK" c14
  write_col "$severity" c15
  write_col "$scandate" c16
else
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "6.2.2.4" c8
  write_col "Ensure rsyslog log file creation mode is configured" c9
  write_col "Ensure rsyslog log file creation mode is configured" c10
  write_col "rsyslog should create log files with restricted permissions to prevent unauthorized access to log data" c11
  write_col "\$FileCreateMode should be set to 0640" c12
  write_col "FileCreateMode is NOT properly configured Output : \$FileCreateMode=${fcm:-Not Set}" c13
  write_col "KO" c14
  write_col "$severity" c15
  write_col "$scandate" c16
fi

#6.2.2.7 Ensure rsyslog is not configured to receive logs from a remote client

main_conf="/etc/rsyslog.conf"
dropin_dir="/etc/rsyslog.d"

# Search patterns that indicate remote log receiving enabled
# Covers both old-style and new-style configuration
match_lines=$(
  {
    [[ -f "$main_conf" ]] && grep -Eih \
      '^\s*\$ModLoad\s+imudp|^\s*\$ModLoad\s+imtcp|^\s*\$UDPServerRun|^\s*\$InputTCPServerRun|module\s*\(\s*load\s*=\s*"?imudp"?|module\s*\(\s*load\s*=\s*"?imtcp"?|input\s*\(\s*type\s*=\s*"?imudp"?|input\s*\(\s*type\s*=\s*"?imtcp"?' \
      "$main_conf" 2>/dev/null

    [[ -d "$dropin_dir" ]] && grep -REih \
      '^\s*\$ModLoad\s+imudp|^\s*\$ModLoad\s+imtcp|^\s*\$UDPServerRun|^\s*\$InputTCPServerRun|module\s*\(\s*load\s*=\s*"?imudp"?|module\s*\(\s*load\s*=\s*"?imtcp"?|input\s*\(\s*type\s*=\s*"?imudp"?|input\s*\(\s*type\s*=\s*"?imtcp"?' \
      "$dropin_dir"/*.conf 2>/dev/null
  } | sed '/^\s*#/d' | sed '/^\s*$/d'
)

if [[ -z "$match_lines" ]]; then
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "6.2.2.7" c8
  write_col "Ensure rsyslog is not configured to receive logs from a remote client" c9
  write_col "Ensure rsyslog is not configured to receive logs from a remote client" c10
  write_col "Rsyslog should not be configured as a remote log receiver unless intentionally acting as a centralized log server" c11
  write_col "No imudp/imtcp listener modules or UDP/TCP server inputs should be enabled" c12
  write_col "Remote log receiving is NOT configured Output : No imudp/imtcp input/server directives found" c13
  write_col "OK" c14
  write_col "$severity" c15
  write_col "$scandate" c16
else
  # show only first 3 matched lines in output to keep report clean
  evidence=$(echo "$match_lines" | head -n 3 | tr '\n' '; ' | sed 's/; $//')

  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "6.2.2.7" c8
  write_col "Ensure rsyslog is not configured to receive logs from a remote client" c9
  write_col "Ensure rsyslog is not configured to receive logs from a remote client" c10
  write_col "Rsyslog should not be configured as a remote log receiver unless intentionally acting as a centralized log server" c11
  write_col "No imudp/imtcp listener modules or UDP/TCP server inputs should be enabled" c12
  write_col "Remote log receiving IS configured Output : $evidence" c13
  write_col "KO" c14
  write_col "$severity" c15
  write_col "$scandate" c16
fi

#6.2.3.1 Ensure access to all logfiles has been configured

logdir="/var/log"

# Find log files with insecure permissions:
# - world writable OR world readable OR group writable
# Excluding directories and links.
bad_files=$(find "$logdir" -type f ! -lname '*' -perm /022 -o -perm /004 2>/dev/null)

# More accurate list (detailed check):
# /022 => group/other writable
# /004 => other readable

if [[ -z "$bad_files" ]]; then
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "6.2.3.1" c8
  write_col "Ensure access to all logfiles has been configured" c9
  write_col "Ensure access to all logfiles has been configured" c10
  write_col "Logfiles must have secure permissions to prevent unauthorized access/modification and protect system audit integrity" c11
  write_col "Logfiles under /var/log should not be group/other writable and should not be world-readable" c12
  write_col "All logfiles are securely configured Output : No insecure logfile permissions found under /var/log" c13
  write_col "OK" c14
  write_col "$severity" c15
  write_col "$scandate" c16
else
  # Keep report output clean: only show first 5 bad files
  evidence=$(echo "$bad_files" | head -n 5 | tr '\n' '; ' | sed 's/; $//')

  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "6.2.3.1" c8
  write_col "Ensure access to all logfiles has been configured" c9
  write_col "Ensure access to all logfiles has been configured" c10
  write_col "Logfiles must have secure permissions to prevent unauthorized access/modification and protect system audit integrity" c11
  write_col "Logfiles under /var/log should not be group/other writable and should not be world-readable" c12
  write_col "Insecure logfile permissions found Output : $evidence" c13
  write_col "KO" c14
  write_col "$severity" c15
  write_col "$scandate" c16
fi


########################End########################

######################kernel parameters###########################################3

#3.3.1.2 Ensure net.ipv4.conf.all.forwarding is configured

{
 l_output=""
 l_output2=""
 a_parlist=("net.ipv4.conf.all.forwarding=0")
 l_ufwscf="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"

 kernel_parameter_chk()
 { 
  l_krp="$(sysctl "$l_kpname" | awk -F= '{print $2}' | xargs)" # Check running configuration

  if [ "$l_krp" = "$l_kpvalue" ]; then
   l_output="$l_output \"$l_kpname\" is correctly set to \"$l_krp\" in the running configuration"
  else
   l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_krp\" in the running configuration and should have a value of: \"$l_kpvalue\""
  fi

  unset A_out; declare -A A_out # Check durable setting (files)
  while read -r l_out; do
   if [ -n "$l_out" ]; then
    if [[ $l_out =~ ^\s*# ]]; then
     l_file="${l_out//# /}"
    else
     l_kpar="$(awk -F= '{print $1}' <<< "$l_out" | xargs)"
     [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_file")
    fi
   fi
  done < <(/usr/lib/systemd/systemd-sysctl --cat-config | grep -Po '^\h*([^#\n\r]+|#\h*\/[^#\n\r\h]+\.conf\b)')

  if [ -n "$l_ufwscf" ]; then # Account for systems with UFW (Not covered by systemd-sysctl --cat-config)
   l_kpar="$(grep -Po "^\h*$l_kpname\b" "$l_ufwscf" | xargs)"
   l_kpar="${l_kpar//\//.}"
   [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_ufwscf")
  fi

  if (( ${#A_out[@]} > 0 )); then # Assess output from files and generate output
   while IFS="=" read -r l_fkpname l_fkpvalue; do
    l_fkpname="${l_fkpname// /}"; l_fkpvalue="${l_fkpvalue// /}"

    if [ "$l_fkpvalue" = "$l_kpvalue" ]; then
     l_output="$l_output \"$l_kpname\" is correctly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\""
    else
     l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\" and should have a value of: \"$l_kpvalue\""
    fi
   done < <(grep -Po -- "^\h*$l_kpname\h*=\h*\H+" "${A_out[@]}")
  else
   l_output2="$l_output2 \"$l_kpname\" is not set in an included file ** Note: \"$l_kpname\" May be set in a file that's ignored by load procedure **"
  fi
 }

 while IFS="=" read -r l_kpname l_kpvalue; do # Assess and check parameters
  l_kpname="${l_kpname// /}"; l_kpvalue="${l_kpvalue// /}"
  kernel_parameter_chk
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ -z "$l_output2" ]; then # Provide output from checks
  echo -e "\n- Audit Result:\n ** PASS **\n$l_output\n" >/dev/null

  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.1.2" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv4.conf.all.forwarding is configured" c10
  write_col "The net.ipv4.conf.all.forwarding flag controls whether the system forwards IPv4 packets globally." c11
  write_col "net.ipv4.conf.all.forwarding = 0" c12
  write_col "$l_output" c13
  write_col "OK" c14
  write_col "$severity" c15
  write_col "$scandate" c16

 else
  echo -e "\n- Audit Result:\n ** FAIL **\n - Reason(s) for audit failure:\n$l_output2\n" >/dev/null

  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.1.2" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv4.conf.all.forwarding is configured" c10
  write_col "The net.ipv4.conf.all.forwarding flag controls whether the system forwards IPv4 packets globally." c11
  write_col "net.ipv4.conf.all.forwarding = 0" c12
  write_col "$l_output2" c13
  write_col "KO" c14
  write_col "$severity" c15
  write_col "$scandate" c16

  [ -n "$l_output" ] && echo -e "\n- Correctly set:\n$l_output\n" >/dev/null
 fi
}


#3.3.1.3 Ensure net.ipv4.conf.default.forwarding is configured

{
 l_output=""
 l_output2=""
 a_parlist=("net.ipv4.conf.default.forwarding=0")
 l_ufwscf="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"

 kernel_parameter_chk()
 { 
  l_krp="$(sysctl "$l_kpname" | awk -F= '{print $2}' | xargs)" # Check running configuration

  if [ "$l_krp" = "$l_kpvalue" ]; then
   l_output="$l_output \"$l_kpname\" is correctly set to \"$l_krp\" in the running configuration"
  else
   l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_krp\" in the running configuration and should have a value of: \"$l_kpvalue\""
  fi

  unset A_out; declare -A A_out # Check durable setting (files)
  while read -r l_out; do
   if [ -n "$l_out" ]; then
    if [[ $l_out =~ ^\s*# ]]; then
     l_file="${l_out//# /}"
    else
     l_kpar="$(awk -F= '{print $1}' <<< "$l_out" | xargs)"
     [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_file")
    fi
   fi
  done < <(/usr/lib/systemd/systemd-sysctl --cat-config | grep -Po '^\h*([^#\n\r]+|#\h*\/[^#\n\r\h]+\.conf\b)')

  if [ -n "$l_ufwscf" ]; then # Account for systems with UFW (Not covered by systemd-sysctl --cat-config)
   l_kpar="$(grep -Po "^\h*$l_kpname\b" "$l_ufwscf" | xargs)"
   l_kpar="${l_kpar//\//.}"
   [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_ufwscf")
  fi

  if (( ${#A_out[@]} > 0 )); then # Assess output from files and generate output
   while IFS="=" read -r l_fkpname l_fkpvalue; do
    l_fkpname="${l_fkpname// /}"; l_fkpvalue="${l_fkpvalue// /}"

    if [ "$l_fkpvalue" = "$l_kpvalue" ]; then
     l_output="$l_output \"$l_kpname\" is correctly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\""
    else
     l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\" and should have a value of: \"$l_kpvalue\""
    fi
   done < <(grep -Po -- "^\h*$l_kpname\h*=\h*\H+" "${A_out[@]}")
  else
   l_output2="$l_output2 \"$l_kpname\" is not set in an included file ** Note: \"$l_kpname\" May be set in a file that's ignored by load procedure **"
  fi
 }

 while IFS="=" read -r l_kpname l_kpvalue; do # Assess and check parameters
  l_kpname="${l_kpname// /}"; l_kpvalue="${l_kpvalue// /}"
  kernel_parameter_chk
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ -z "$l_output2" ]; then # Provide output from checks
  echo -e "\n- Audit Result:\n ** PASS **\n$l_output\n" >/dev/null

  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.1.3" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv4.conf.default.forwarding is configured" c10
  write_col "The net.ipv4.conf.default.forwarding flag controls whether new interfaces will forward IPv4 packets by default." c11
  write_col "net.ipv4.conf.default.forwarding = 0" c12
  write_col "$l_output" c13
  write_col "OK" c14
  write_col "$severity" c15
  write_col "$scandate" c16

 else
  echo -e "\n- Audit Result:\n ** FAIL **\n - Reason(s) for audit failure:\n$l_output2\n" >/dev/null

  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.1.3" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv4.conf.default.forwarding is configured" c10
  write_col "The net.ipv4.conf.default.forwarding flag controls whether new interfaces will forward IPv4 packets by default." c11
  write_col "net.ipv4.conf.default.forwarding = 0" c12
  write_col "$l_output2" c13
  write_col "KO" c14
  write_col "$severity" c15
  write_col "$scandate" c16

  [ -n "$l_output" ] && echo -e "\n- Correctly set:\n$l_output\n" >/dev/null
 fi
}

#3.3.1.4 Ensure net.ipv4.conf.all.send_redirects is configured

{
 l_output=""
 l_output2=""
 a_parlist=("net.ipv4.conf.all.send_redirects=0")
 l_ufwscf="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"

 kernel_parameter_chk()
 { 
  l_krp="$(sysctl "$l_kpname" | awk -F= '{print $2}' | xargs)" # Check running configuration

  if [ "$l_krp" = "$l_kpvalue" ]; then
   l_output="$l_output \"$l_kpname\" is correctly set to \"$l_krp\" in the running configuration"
  else
   l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_krp\" in the running configuration and should have a value of: \"$l_kpvalue\""
  fi

  unset A_out; declare -A A_out # Check durable setting (files)
  while read -r l_out; do
   if [ -n "$l_out" ]; then
    if [[ $l_out =~ ^\s*# ]]; then
     l_file="${l_out//# /}"
    else
     l_kpar="$(awk -F= '{print $1}' <<< "$l_out" | xargs)"
     [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_file")
    fi
   fi
  done < <(/usr/lib/systemd/systemd-sysctl --cat-config | grep -Po '^\h*([^#\n\r]+|#\h*\/[^#\n\r\h]+\.conf\b)')

  if [ -n "$l_ufwscf" ]; then # Account for systems with UFW (Not covered by systemd-sysctl --cat-config)
   l_kpar="$(grep -Po "^\h*$l_kpname\b" "$l_ufwscf" | xargs)"
   l_kpar="${l_kpar//\//.}"
   [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_ufwscf")
  fi

  if (( ${#A_out[@]} > 0 )); then # Assess output from files and generate output
   while IFS="=" read -r l_fkpname l_fkpvalue; do
    l_fkpname="${l_fkpname// /}"; l_fkpvalue="${l_fkpvalue// /}"

    if [ "$l_fkpvalue" = "$l_kpvalue" ]; then
     l_output="$l_output \"$l_kpname\" is correctly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\""
    else
     l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\" and should have a value of: \"$l_kpvalue\""
    fi
   done < <(grep -Po -- "^\h*$l_kpname\h*=\h*\H+" "${A_out[@]}")
  else
   l_output2="$l_output2 \"$l_kpname\" is not set in an included file ** Note: \"$l_kpname\" May be set in a file that's ignored by load procedure **"
  fi
 }

 while IFS="=" read -r l_kpname l_kpvalue; do # Assess and check parameters
  l_kpname="${l_kpname// /}"; l_kpvalue="${l_kpvalue// /}"
  kernel_parameter_chk
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ -z "$l_output2" ]; then # Provide output from checks
  echo -e "\n- Audit Result:\n ** PASS **\n$l_output\n" >/dev/null

  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.1.4" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv4.conf.all.send_redirects is configured" c10
  write_col "The net.ipv4.conf.all.send_redirects flag controls whether the system sends ICMP redirect messages for IPv4." c11
  write_col "net.ipv4.conf.all.send_redirects = 0" c12
  write_col "$l_output" c13
  write_col "OK" c14
  write_col "$severity" c15
  write_col "$scandate" c16

 else
  echo -e "\n- Audit Result:\n ** FAIL **\n - Reason(s) for audit failure:\n$l_output2\n" >/dev/null

  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.1.4" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv4.conf.all.send_redirects is configured" c10
  write_col "The net.ipv4.conf.all.send_redirects flag controls whether the system sends ICMP redirect messages for IPv4." c11
  write_col "net.ipv4.conf.all.send_redirects = 0" c12
  write_col "$l_output2" c13
  write_col "KO" c14
  write_col "$severity" c15
  write_col "$scandate" c16

  [ -n "$l_output" ] && echo -e "\n- Correctly set:\n$l_output\n" >/dev/null
 fi
}

#3.3.1.5 Ensure net.ipv4.conf.default.send_redirects is configured

{
 l_output=""
 l_output2=""
 a_parlist=("net.ipv4.conf.default.send_redirects=0")
 l_ufwscf="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"

 kernel_parameter_chk()
 { 
  l_krp="$(sysctl "$l_kpname" | awk -F= '{print $2}' | xargs)" # Check running configuration

  if [ "$l_krp" = "$l_kpvalue" ]; then
   l_output="$l_output \"$l_kpname\" is correctly set to \"$l_krp\" in the running configuration"
  else
   l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_krp\" in the running configuration and should have a value of: \"$l_kpvalue\""
  fi

  unset A_out; declare -A A_out # Check durable setting (files)
  while read -r l_out; do
   if [ -n "$l_out" ]; then
    if [[ $l_out =~ ^\s*# ]]; then
     l_file="${l_out//# /}"
    else
     l_kpar="$(awk -F= '{print $1}' <<< "$l_out" | xargs)"
     [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_file")
    fi
   fi
  done < <(/usr/lib/systemd/systemd-sysctl --cat-config | grep -Po '^\h*([^#\n\r]+|#\h*\/[^#\n\r\h]+\.conf\b)')

  if [ -n "$l_ufwscf" ]; then # Account for systems with UFW (Not covered by systemd-sysctl --cat-config)
   l_kpar="$(grep -Po "^\h*$l_kpname\b" "$l_ufwscf" | xargs)"
   l_kpar="${l_kpar//\//.}"
   [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_ufwscf")
  fi

  if (( ${#A_out[@]} > 0 )); then # Assess output from files and generate output
   while IFS="=" read -r l_fkpname l_fkpvalue; do
    l_fkpname="${l_fkpname// /}"; l_fkpvalue="${l_fkpvalue// /}"

    if [ "$l_fkpvalue" = "$l_kpvalue" ]; then
     l_output="$l_output \"$l_kpname\" is correctly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\""
    else
     l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\" and should have a value of: \"$l_kpvalue\""
    fi
   done < <(grep -Po -- "^\h*$l_kpname\h*=\h*\H+" "${A_out[@]}")
  else
   l_output2="$l_output2 \"$l_kpname\" is not set in an included file ** Note: \"$l_kpname\" May be set in a file that's ignored by load procedure **"
  fi
 }

 while IFS="=" read -r l_kpname l_kpvalue; do # Assess and check parameters
  l_kpname="${l_kpname// /}"; l_kpvalue="${l_kpvalue// /}"
  kernel_parameter_chk
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ -z "$l_output2" ]; then # Provide output from checks
  echo -e "\n- Audit Result:\n ** PASS **\n$l_output\n" >/dev/null

  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.1.5" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv4.conf.default.send_redirects is configured" c10
  write_col "The net.ipv4.conf.default.send_redirects flag controls whether the system sends ICMP redirect messages by default for new interfaces." c11
  write_col "net.ipv4.conf.default.send_redirects = 0" c12
  write_col "$l_output" c13
  write_col "OK" c14
  write_col "$severity" c15
  write_col "$scandate" c16

 else
  echo -e "\n- Audit Result:\n ** FAIL **\n - Reason(s) for audit failure:\n$l_output2\n" >/dev/null

  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.1.5" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv4.conf.default.send_redirects is configured" c10
  write_col "The net.ipv4.conf.default.send_redirects flag controls whether the system sends ICMP redirect messages by default for new interfaces." c11
  write_col "net.ipv4.conf.default.send_redirects = 0" c12
  write_col "$l_output2" c13
  write_col "KO" c14
  write_col "$severity" c15
  write_col "$scandate" c16

  [ -n "$l_output" ] && echo -e "\n- Correctly set:\n$l_output\n" >/dev/null
 fi
}

#3.3.1.6 Ensure net.ipv4.icmp_ignore_bogus_error_responses is configured

{
 l_output=""
 l_output2=""
 a_parlist=("net.ipv4.icmp_ignore_bogus_error_responses=1")
 l_ufwscf="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"

 kernel_parameter_chk()
 { 
  l_krp="$(sysctl "$l_kpname" | awk -F= '{print $2}' | xargs)" # Check running configuration

  if [ "$l_krp" = "$l_kpvalue" ]; then
   l_output="$l_output \"$l_kpname\" is correctly set to \"$l_krp\" in the running configuration"
  else
   l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_krp\" in the running configuration and should have a value of: \"$l_kpvalue\""
  fi

  unset A_out; declare -A A_out # Check durable setting (files)
  while read -r l_out; do
   if [ -n "$l_out" ]; then
    if [[ $l_out =~ ^\s*# ]]; then
     l_file="${l_out//# /}"
    else
     l_kpar="$(awk -F= '{print $1}' <<< "$l_out" | xargs)"
     [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_file")
    fi
   fi
  done < <(/usr/lib/systemd/systemd-sysctl --cat-config | grep -Po '^\h*([^#\n\r]+|#\h*\/[^#\n\r\h]+\.conf\b)')

  if [ -n "$l_ufwscf" ]; then # Account for systems with UFW (Not covered by systemd-sysctl --cat-config)
   l_kpar="$(grep -Po "^\h*$l_kpname\b" "$l_ufwscf" | xargs)"
   l_kpar="${l_kpar//\//.}"
   [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_ufwscf")
  fi

  if (( ${#A_out[@]} > 0 )); then # Assess output from files and generate output
   while IFS="=" read -r l_fkpname l_fkpvalue; do
    l_fkpname="${l_fkpname// /}"; l_fkpvalue="${l_fkpvalue// /}"

    if [ "$l_fkpvalue" = "$l_kpvalue" ]; then
     l_output="$l_output \"$l_kpname\" is correctly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\""
    else
     l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\" and should have a value of: \"$l_kpvalue\""
    fi
   done < <(grep -Po -- "^\h*$l_kpname\h*=\h*\H+" "${A_out[@]}")
  else
   l_output2="$l_output2 \"$l_kpname\" is not set in an included file ** Note: \"$l_kpname\" May be set in a file that's ignored by load procedure **"
  fi
 }

 while IFS="=" read -r l_kpname l_kpvalue; do # Assess and check parameters
  l_kpname="${l_kpname// /}"; l_kpvalue="${l_kpvalue// /}"
  kernel_parameter_chk
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ -z "$l_output2" ]; then # Provide output from checks
  echo -e "\n- Audit Result:\n ** PASS **\n$l_output\n" >/dev/null

  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.1.6" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv4.icmp_ignore_bogus_error_responses is configured" c10
  write_col "This parameter enables ignoring bogus ICMP error responses to improve system security and reduce log noise." c11
  write_col "net.ipv4.icmp_ignore_bogus_error_responses = 1" c12
  write_col "$l_output" c13
  write_col "OK" c14
  write_col "$severity" c15
  write_col "$scandate" c16

 else
  echo -e "\n- Audit Result:\n ** FAIL **\n - Reason(s) for audit failure:\n$l_output2\n" >/dev/null

  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.1.6" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv4.icmp_ignore_bogus_error_responses is configured" c10
  write_col "This parameter enables ignoring bogus ICMP error responses to improve system security and reduce log noise." c11
  write_col "net.ipv4.icmp_ignore_bogus_error_responses = 1" c12
  write_col "$l_output2" c13
  write_col "KO" c14
  write_col "$severity" c15
  write_col "$scandate" c16

  [ -n "$l_output" ] && echo -e "\n- Correctly set:\n$l_output\n" >/dev/null
 fi
}

#3.3.1.7 Ensure net.ipv4.icmp_echo_ignore_broadcasts is configured

{
 l_output=""
 l_output2=""
 a_parlist=("net.ipv4.icmp_echo_ignore_broadcasts=1")
 l_ufwscf="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"

 kernel_parameter_chk()
 { 
  l_krp="$(sysctl "$l_kpname" | awk -F= '{print $2}' | xargs)" # Check running configuration

  if [ "$l_krp" = "$l_kpvalue" ]; then
   l_output="$l_output \"$l_kpname\" is correctly set to \"$l_krp\" in the running configuration"
  else
   l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_krp\" in the running configuration and should have a value of: \"$l_kpvalue\""
  fi

  unset A_out; declare -A A_out # Check durable setting (files)
  while read -r l_out; do
   if [ -n "$l_out" ]; then
    if [[ $l_out =~ ^\s*# ]]; then
     l_file="${l_out//# /}"
    else
     l_kpar="$(awk -F= '{print $1}' <<< "$l_out" | xargs)"
     [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_file")
    fi
   fi
  done < <(/usr/lib/systemd/systemd-sysctl --cat-config | grep -Po '^\h*([^#\n\r]+|#\h*\/[^#\n\r\h]+\.conf\b)')

  if [ -n "$l_ufwscf" ]; then # Account for systems with UFW (Not covered by systemd-sysctl --cat-config)
   l_kpar="$(grep -Po "^\h*$l_kpname\b" "$l_ufwscf" | xargs)"
   l_kpar="${l_kpar//\//.}"
   [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_ufwscf")
  fi

  if (( ${#A_out[@]} > 0 )); then # Assess output from files and generate output
   while IFS="=" read -r l_fkpname l_fkpvalue; do
    l_fkpname="${l_fkpname// /}"; l_fkpvalue="${l_fkpvalue// /}"

    if [ "$l_fkpvalue" = "$l_kpvalue" ]; then
     l_output="$l_output \"$l_kpname\" is correctly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\""
    else
     l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\" and should have a value of: \"$l_kpvalue\""
    fi
   done < <(grep -Po -- "^\h*$l_kpname\h*=\h*\H+" "${A_out[@]}")
  else
   l_output2="$l_output2 \"$l_kpname\" is not set in an included file ** Note: \"$l_kpname\" May be set in a file that's ignored by load procedure **"
  fi
 }

 while IFS="=" read -r l_kpname l_kpvalue; do # Assess and check parameters
  l_kpname="${l_kpname// /}"; l_kpvalue="${l_kpvalue// /}"
  kernel_parameter_chk
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ -z "$l_output2" ]; then # Provide output from checks
  echo -e "\n- Audit Result:\n ** PASS **\n$l_output\n" >/dev/null

  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.1.7" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv4.icmp_echo_ignore_broadcasts is configured" c10
  write_col "This setting prevents the system from responding to ICMP echo requests sent to broadcast addresses (protection against Smurf attacks)." c11
  write_col "net.ipv4.icmp_echo_ignore_broadcasts = 1" c12
  write_col "$l_output" c13
  write_col "OK" c14
  write_col "$severity" c15
  write_col "$scandate" c16

 else
  echo -e "\n- Audit Result:\n ** FAIL **\n - Reason(s) for audit failure:\n$l_output2\n" >/dev/null

  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.1.7" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv4.icmp_echo_ignore_broadcasts is configured" c10
  write_col "This setting prevents the system from responding to ICMP echo requests sent to broadcast addresses (protection against Smurf attacks)." c11
  write_col "net.ipv4.icmp_echo_ignore_broadcasts = 1" c12
  write_col "$l_output2" c13
  write_col "KO" c14
  write_col "$severity" c15
  write_col "$scandate" c16

  [ -n "$l_output" ] && echo -e "\n- Correctly set:\n$l_output\n" >/dev/null
 fi
}

# 3.3.1.8 Ensure net.ipv4.conf.all.accept_redirects is configured

param="net.ipv4.conf.all.accept_redirects"

# ---- Runtime Check ----
runtime_value=$(sysctl "$param" 2>/dev/null | awk -F= '{print $2}' | xargs)

# ---- Persistent Check (CIS method) ----
grep_param="${param//./(\\.|\\/)}"
persistent_output=""
persistent_value=""

# Get systemd-sysctl binary
systemd_sysctl="$(readlink -e /lib/systemd/systemd-sysctl || readlink -e /usr/lib/systemd/systemd-sysctl)"

# Collect sysctl config files
files=()

# Include UFW sysctl file if exists
ufw_file="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"
[ -f "$(readlink -e "$ufw_file")" ] && files+=("$ufw_file")

# Add main config
files+=("/etc/sysctl.conf")

# Collect all systemd sysctl config files
while IFS= read -r fname; do
  file="$(readlink -e "${fname//# /}")"
  [[ -n "$file" && ! " ${files[*]} " =~ " $file " ]] && files+=("$file")
done < <("$systemd_sysctl" --cat-config 2>/dev/null | tac | grep -Pio '^\h*#\h*\/[^#\n\r\h]+\.conf\b')

# Parse values
for f in "${files[@]}"; do
  [[ -f "$f" ]] || continue
  line=$(grep -Poi "^\h*$grep_param\h*=\h*\H+" "$f" | tail -1)
  value=$(echo "$line" | cut -d= -f2 | xargs)

  if [[ -n "$value" ]]; then
    persistent_output="$persistent_output \"$param = $value\" set in: $f;"
    persistent_value="$value"
  fi
done

if [[ "$runtime_value" == "0" && "$persistent_value" == "0" ]]; then
  status="OK"
  details="$param correctly set (runtime=0, persistent=0) $persistent_output"
elif [[ "$runtime_value" != "0" ]]; then
  status="KO"
  details="Runtime value is incorrect (current=$runtime_value, expected=0)"
elif [[ "$persistent_value" != "0" ]]; then
  status="KO"
  details="Persistent value is incorrect (current=$persistent_value, expected=0) $persistent_output"
else
  status="KO"
  details="Unable to determine correct configuration"
fi

# ---- Output ----
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "3.3.1.8" c8
write_col "Configure network parameters" c9
write_col "Ensure net.ipv4.conf.all.accept_redirects is configured" c10
write_col "ICMP redirects can be used by attackers to modify routing tables" c11
write_col "Net.ipv4.conf.all.accept_redirects = 0" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

# 3.3.1.9 Ensure net.ipv4.conf.default.accept_redirects is configured

param="net.ipv4.conf.default.accept_redirects"

# ---- Runtime Check ----
runtime_value=$(sysctl "$param" 2>/dev/null | awk -F= '{print $2}' | xargs)

# ---- Persistent Check (CIS systemd logic) ----
grep_param="${param//./(\\.|\\/)}"
persistent_output=""
persistent_value=""

# Get systemd-sysctl binary
systemd_sysctl="$(readlink -e /lib/systemd/systemd-sysctl || readlink -e /usr/lib/systemd/systemd-sysctl)"

# Collect config files
files=()

# Include UFW sysctl file if exists
ufw_file="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"
[ -f "$(readlink -e "$ufw_file")" ] && files+=("$ufw_file")

# Add main config
files+=("/etc/sysctl.conf")

# Collect all systemd sysctl files
while IFS= read -r fname; do
  file="$(readlink -e "${fname//# /}")"
  [[ -n "$file" && ! " ${files[*]} " =~ " $file " ]] && files+=("$file")
done < <("$systemd_sysctl" --cat-config 2>/dev/null | tac | grep -Pio '^\h*#\h*\/[^#\n\r\h]+\.conf\b')

# Parse values from files
for f in "${files[@]}"; do
  [[ -f "$f" ]] || continue
  line=$(grep -Poi "^\h*$grep_param\h*=\h*\H+" "$f" | tail -1)
  value=$(echo "$line" | cut -d= -f2 | xargs)

  if [[ -n "$value" ]]; then
    persistent_output="$persistent_output \"$param = $value\" set in: $f;"
    persistent_value="$value"
  fi
done

# ---- Final Decision ----
if [[ "$runtime_value" == "0" && "$persistent_value" == "0" ]]; then
  status="OK"
  details="$param correctly set (runtime=0, persistent=0) $persistent_output"
elif [[ "$runtime_value" != "0" ]]; then
  status="KO"
  details="Runtime value is incorrect (current=$runtime_value, expected=0)"
elif [[ "$persistent_value" != "0" ]]; then
  status="KO"
  details="Persistent value is incorrect (current=$persistent_value, expected=0) $persistent_output"
else
  status="KO"
  details="Unable to determine correct configuration"
fi

# ---- Output ----
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "3.3.1.9" c8
write_col "Configure network parameters" c9
write_col "Ensure net.ipv4.conf.default.accept_redirects is configured" c10
write_col "ICMP redirects can be used by attackers to modify routing tables" c11
write_col "Net.ipv4.conf.all.accept_redirects = 0" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

#3.3.1.10 Ensure net.ipv4.conf.all.secure_redirects is configured

{
 l_output=""
 l_output2=""
 a_parlist=("net.ipv4.conf.all.secure_redirects=0")
 l_ufwscf="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"

 kernel_parameter_chk()
 { 
  l_krp="$(sysctl "$l_kpname" | awk -F= '{print $2}' | xargs)"
  if [ "$l_krp" = "$l_kpvalue" ]; then
   l_output="$l_output \"$l_kpname\" is correctly set to \"$l_krp\" in the running configuration"
  else
   l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_krp\" in the running configuration and should have a value of: \"$l_kpvalue\""
  fi

  unset A_out; declare -A A_out
  while read -r l_out; do
   if [ -n "$l_out" ]; then
    if [[ $l_out =~ ^\s*# ]]; then
     l_file="${l_out//# /}"
    else
     l_kpar="$(awk -F= '{print $1}' <<< "$l_out" | xargs)"
     [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_file")
    fi
   fi
  done < <(/usr/lib/systemd/systemd-sysctl --cat-config | grep -Po '^\h*([^#\n\r]+|#\h*\/[^#\n\r\h]+\.conf\b)')

  if [ -n "$l_ufwscf" ]; then
   l_kpar="$(grep -Po "^\h*$l_kpname\b" "$l_ufwscf" | xargs)"
   l_kpar="${l_kpar//\//.}"
   [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_ufwscf")
  fi

  if (( ${#A_out[@]} > 0 )); then
   while IFS="=" read -r l_fkpname l_fkpvalue; do
    l_fkpname="${l_fkpname// /}"; l_fkpvalue="${l_fkpvalue// /}"
    if [ "$l_fkpvalue" = "$l_kpvalue" ]; then
     l_output="$l_output \"$l_kpname\" is correctly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\""
    else
     l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\" and should have a value of: \"$l_kpvalue\""
    fi
   done < <(grep -Po -- "^\h*$l_kpname\h*=\h*\H+" "${A_out[@]}")
  else
   l_output2="$l_output2 \"$l_kpname\" is not set in an included file ** Note: \"$l_kpname\" May be set in a file that's ignored by load procedure **"
  fi
 }

 while IFS="=" read -r l_kpname l_kpvalue; do
  l_kpname="${l_kpname// /}"; l_kpvalue="${l_kpvalue// /}"
  kernel_parameter_chk
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ -z "$l_output2" ]; then
  echo -e "\n- Audit Result:\n ** PASS **\n$l_output\n" >/dev/null
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.1.10" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv4.conf.all.secure_redirects is configured" c10
  write_col "This setting disables secure ICMP redirects and prevents route manipulation." c11
  write_col "net.ipv4.conf.all.secure_redirects = 0" c12
  write_col "$l_output" c13
  write_col "OK" c14
  write_col "$severity" c15
  write_col "$scandate" c16
 else
  echo -e "\n- Audit Result:\n ** FAIL **\n - Reason(s) for audit failure:\n$l_output2\n" >/dev/null
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.1.10" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv4.conf.all.secure_redirects is configured" c10
  write_col "This setting disables secure ICMP redirects and prevents route manipulation." c11
  write_col "net.ipv4.conf.all.secure_redirects = 0" c12
  write_col "$l_output2" c13
  write_col "KO" c14
  write_col "$severity" c15
  write_col "$scandate" c16
  [ -n "$l_output" ] && echo -e "\n- Correctly set:\n$l_output\n" >/dev/null
 fi
}

#3.3.1.11 Ensure net.ipv4.conf.default.secure_redirects is configured

{
 l_output=""
 l_output2=""
 a_parlist=("net.ipv4.conf.default.secure_redirects=0")
 l_ufwscf="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"

 kernel_parameter_chk()
 { 
  l_krp="$(sysctl "$l_kpname" | awk -F= '{print $2}' | xargs)"
  if [ "$l_krp" = "$l_kpvalue" ]; then
   l_output="$l_output \"$l_kpname\" is correctly set to \"$l_krp\" in the running configuration"
  else
   l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_krp\" in the running configuration and should have a value of: \"$l_kpvalue\""
  fi

  unset A_out; declare -A A_out
  while read -r l_out; do
   if [ -n "$l_out" ]; then
    if [[ $l_out =~ ^\s*# ]]; then
     l_file="${l_out//# /}"
    else
     l_kpar="$(awk -F= '{print $1}' <<< "$l_out" | xargs)"
     [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_file")
    fi
   fi
  done < <(/usr/lib/systemd/systemd-sysctl --cat-config | grep -Po '^\h*([^#\n\r]+|#\h*\/[^#\n\r\h]+\.conf\b)')

  if [ -n "$l_ufwscf" ]; then
   l_kpar="$(grep -Po "^\h*$l_kpname\b" "$l_ufwscf" | xargs)"
   l_kpar="${l_kpar//\//.}"
   [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_ufwscf")
  fi

  if (( ${#A_out[@]} > 0 )); then
   while IFS="=" read -r l_fkpname l_fkpvalue; do
    l_fkpname="${l_fkpname// /}"; l_fkpvalue="${l_fkpvalue// /}"
    if [ "$l_fkpvalue" = "$l_kpvalue" ]; then
     l_output="$l_output \"$l_kpname\" is correctly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\""
    else
     l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\" and should have a value of: \"$l_kpvalue\""
    fi
   done < <(grep -Po -- "^\h*$l_kpname\h*=\h*\H+" "${A_out[@]}")
  else
   l_output2="$l_output2 \"$l_kpname\" is not set in an included file ** Note: \"$l_kpname\" May be set in a file that's ignored by load procedure **"
  fi
 }

 while IFS="=" read -r l_kpname l_kpvalue; do
  l_kpname="${l_kpname// /}"; l_kpvalue="${l_kpvalue// /}"
  kernel_parameter_chk
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ -z "$l_output2" ]; then
  echo -e "\n- Audit Result:\n ** PASS **\n$l_output\n" >/dev/null
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.1.11" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv4.conf.default.secure_redirects is configured" c10
  write_col "This setting disables secure ICMP redirects by default for new interfaces." c11
  write_col "net.ipv4.conf.default.secure_redirects = 0" c12
  write_col "$l_output" c13
  write_col "OK" c14
  write_col "$severity" c15
  write_col "$scandate" c16
 else
  echo -e "\n- Audit Result:\n ** FAIL **\n - Reason(s) for audit failure:\n$l_output2\n" >/dev/null
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.1.11" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv4.conf.default.secure_redirects is configured" c10
  write_col "This setting disables secure ICMP redirects by default for new interfaces." c11
  write_col "net.ipv4.conf.default.secure_redirects = 0" c12
  write_col "$l_output2" c13
  write_col "KO" c14
  write_col "$severity" c15
  write_col "$scandate" c16
  [ -n "$l_output" ] && echo -e "\n- Correctly set:\n$l_output\n" >/dev/null
 fi
}

#3.3.1.16 Ensure net.ipv4.conf.all.log_martians is configured

{
 l_output=""
 l_output2=""
 a_parlist=("net.ipv4.conf.all.log_martians=1")
 l_ufwscf="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"

 kernel_parameter_chk()
 { 
  l_krp="$(sysctl "$l_kpname" | awk -F= '{print $2}' | xargs)"
  if [ "$l_krp" = "$l_kpvalue" ]; then
   l_output="$l_output \"$l_kpname\" is correctly set to \"$l_krp\" in the running configuration"
  else
   l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_krp\" in the running configuration and should have a value of: \"$l_kpvalue\""
  fi

  unset A_out; declare -A A_out
  while read -r l_out; do
   if [ -n "$l_out" ]; then
    if [[ $l_out =~ ^\s*# ]]; then
     l_file="${l_out//# /}"
    else
     l_kpar="$(awk -F= '{print $1}' <<< "$l_out" | xargs)"
     [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_file")
    fi
   fi
  done < <(/usr/lib/systemd/systemd-sysctl --cat-config | grep -Po '^\h*([^#\n\r]+|#\h*\/[^#\n\r\h]+\.conf\b)')

  if [ -n "$l_ufwscf" ]; then
   l_kpar="$(grep -Po "^\h*$l_kpname\b" "$l_ufwscf" | xargs)"
   l_kpar="${l_kpar//\//.}"
   [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_ufwscf")
  fi

  if (( ${#A_out[@]} > 0 )); then
   while IFS="=" read -r l_fkpname l_fkpvalue; do
    l_fkpname="${l_fkpname// /}"; l_fkpvalue="${l_fkpvalue// /}"
    if [ "$l_fkpvalue" = "$l_kpvalue" ]; then
     l_output="$l_output \"$l_kpname\" is correctly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\""
    else
     l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\" and should have a value of: \"$l_kpvalue\""
    fi
   done < <(grep -Po -- "^\h*$l_kpname\h*=\h*\H+" "${A_out[@]}")
  else
   l_output2="$l_output2 \"$l_kpname\" is not set in an included file ** Note: \"$l_kpname\" May be set in a file that's ignored by load procedure **"
  fi
 }

 while IFS="=" read -r l_kpname l_kpvalue; do
  l_kpname="${l_kpname// /}"; l_kpvalue="${l_kpvalue// /}"
  kernel_parameter_chk
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ -z "$l_output2" ]; then
  echo -e "\n- Audit Result:\n ** PASS **\n$l_output\n" >/dev/null
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.1.16" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv4.conf.all.log_martians is configured" c10
  write_col "This setting enables logging of suspicious packets (martians) received on all interfaces." c11
  write_col "net.ipv4.conf.all.log_martians = 1" c12
  write_col "$l_output" c13
  write_col "OK" c14
  write_col "$severity" c15
  write_col "$scandate" c16
 else
  echo -e "\n- Audit Result:\n ** FAIL **\n - Reason(s) for audit failure:\n$l_output2\n" >/dev/null
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.1.16" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv4.conf.all.log_martians is configured" c10
  write_col "This setting enables logging of suspicious packets (martians) received on all interfaces." c11
  write_col "net.ipv4.conf.all.log_martians = 1" c12
  write_col "$l_output2" c13
  write_col "KO" c14
  write_col "$severity" c15
  write_col "$scandate" c16
  [ -n "$l_output" ] && echo -e "\n- Correctly set:\n$l_output\n" >/dev/null
 fi
}

#3.3.1.17 Ensure net.ipv4.conf.default.log_martians is configured

{
 l_output=""
 l_output2=""
 a_parlist=("net.ipv4.conf.default.log_martians=1")
 l_ufwscf="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"

 kernel_parameter_chk()
 { 
  l_krp="$(sysctl "$l_kpname" | awk -F= '{print $2}' | xargs)"
  if [ "$l_krp" = "$l_kpvalue" ]; then
   l_output="$l_output \"$l_kpname\" is correctly set to \"$l_krp\" in the running configuration"
  else
   l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_krp\" in the running configuration and should have a value of: \"$l_kpvalue\""
  fi

  unset A_out; declare -A A_out
  while read -r l_out; do
   if [ -n "$l_out" ]; then
    if [[ $l_out =~ ^\s*# ]]; then
     l_file="${l_out//# /}"
    else
     l_kpar="$(awk -F= '{print $1}' <<< "$l_out" | xargs)"
     [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_file")
    fi
   fi
  done < <(/usr/lib/systemd/systemd-sysctl --cat-config | grep -Po '^\h*([^#\n\r]+|#\h*\/[^#\n\r\h]+\.conf\b)')

  if [ -n "$l_ufwscf" ]; then
   l_kpar="$(grep -Po "^\h*$l_kpname\b" "$l_ufwscf" | xargs)"
   l_kpar="${l_kpar//\//.}"
   [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_ufwscf")
  fi

  if (( ${#A_out[@]} > 0 )); then
   while IFS="=" read -r l_fkpname l_fkpvalue; do
    l_fkpname="${l_fkpname// /}"; l_fkpvalue="${l_fkpvalue// /}"
    if [ "$l_fkpvalue" = "$l_kpvalue" ]; then
     l_output="$l_output \"$l_kpname\" is correctly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\""
    else
     l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\" and should have a value of: \"$l_kpvalue\""
    fi
   done < <(grep -Po -- "^\h*$l_kpname\h*=\h*\H+" "${A_out[@]}")
  else
   l_output2="$l_output2 \"$l_kpname\" is not set in an included file ** Note: \"$l_kpname\" May be set in a file that's ignored by load procedure **"
  fi
 }

 while IFS="=" read -r l_kpname l_kpvalue; do
  l_kpname="${l_kpname// /}"; l_kpvalue="${l_kpvalue// /}"
  kernel_parameter_chk
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ -z "$l_output2" ]; then
  echo -e "\n- Audit Result:\n ** PASS **\n$l_output\n" >/dev/null
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.1.17" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv4.conf.default.log_martians is configured" c10
  write_col "This setting enables logging of suspicious packets (martians) by default for new interfaces." c11
  write_col "net.ipv4.conf.default.log_martians = 1" c12
  write_col "$l_output" c13
  write_col "OK" c14
  write_col "$severity" c15
  write_col "$scandate" c16
 else
  echo -e "\n- Audit Result:\n ** FAIL **\n - Reason(s) for audit failure:\n$l_output2\n" >/dev/null
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.1.17" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv4.conf.default.log_martians is configured" c10
  write_col "This setting enables logging of suspicious packets (martians) by default for new interfaces." c11
  write_col "net.ipv4.conf.default.log_martians = 1" c12
  write_col "$l_output2" c13
  write_col "KO" c14
  write_col "$severity" c15
  write_col "$scandate" c16
  [ -n "$l_output" ] && echo -e "\n- Correctly set:\n$l_output\n" >/dev/null
 fi
}

#3.3.1.12 Ensure net.ipv4.conf.all.rp_filter is configured

{
 l_output=""
 l_output2=""
 a_parlist=("net.ipv4.conf.all.rp_filter=1")
 l_ufwscf="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"

 kernel_parameter_chk()
 { 
  l_krp="$(sysctl "$l_kpname" | awk -F= '{print $2}' | xargs)" # Check running configuration

  if [ "$l_krp" = "$l_kpvalue" ]; then
   l_output="$l_output \"$l_kpname\" is correctly set to \"$l_krp\" in the running configuration"
  else
   l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_krp\" in the running configuration and should have a value of: \"$l_kpvalue\""
  fi

  unset A_out; declare -A A_out # Check durable setting (files)
  while read -r l_out; do
   if [ -n "$l_out" ]; then
    if [[ $l_out =~ ^\s*# ]]; then
     l_file="${l_out//# /}"
    else
     l_kpar="$(awk -F= '{print $1}' <<< "$l_out" | xargs)"
     [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_file")
    fi
   fi
  done < <(/usr/lib/systemd/systemd-sysctl --cat-config | grep -Po '^\h*([^#\n\r]+|#\h*\/[^#\n\r\h]+\.conf\b)')

  if [ -n "$l_ufwscf" ]; then # Account for systems with UFW (Not covered by systemd-sysctl --cat-config)
   l_kpar="$(grep -Po "^\h*$l_kpname\b" "$l_ufwscf" | xargs)"
   l_kpar="${l_kpar//\//.}"
   [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_ufwscf")
  fi

  if (( ${#A_out[@]} > 0 )); then # Assess output from files and generate output
   while IFS="=" read -r l_fkpname l_fkpvalue; do
    l_fkpname="${l_fkpname// /}"; l_fkpvalue="${l_fkpvalue// /}"

    if [ "$l_fkpvalue" = "$l_kpvalue" ]; then
     l_output="$l_output \"$l_kpname\" is correctly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\""
    else
     l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\" and should have a value of: \"$l_kpvalue\""
    fi
   done < <(grep -Po -- "^\h*$l_kpname\h*=\h*\H+" "${A_out[@]}")
  else
   l_output2="$l_output2 \"$l_kpname\" is not set in an included file ** Note: \"$l_kpname\" May be set in a file that's ignored by load procedure **"
  fi
 }

 while IFS="=" read -r l_kpname l_kpvalue; do # Assess and check parameters
  l_kpname="${l_kpname// /}"; l_kpvalue="${l_kpvalue// /}"
  kernel_parameter_chk
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ -z "$l_output2" ]; then # Provide output from checks
  echo -e "\n- Audit Result:\n ** PASS **\n$l_output\n" >/dev/null

  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.1.12" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv4.conf.all.rp_filter is configured" c10
  write_col "Reverse Path Filtering validates packet source addresses to reduce IP spoofing attacks." c11
  write_col "net.ipv4.conf.all.rp_filter = 1" c12
  write_col "$l_output" c13
  write_col "OK" c14
  write_col "$severity" c15
  write_col "$scandate" c16

 else
  echo -e "\n- Audit Result:\n ** FAIL **\n - Reason(s) for audit failure:\n$l_output2\n" >/dev/null

  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.1.12" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv4.conf.all.rp_filter is configured" c10
  write_col "Reverse Path Filtering validates packet source addresses to reduce IP spoofing attacks." c11
  write_col "net.ipv4.conf.all.rp_filter = 1" c12
  write_col "$l_output2" c13
  write_col "KO" c14
  write_col "$severity" c15
  write_col "$scandate" c16

  [ -n "$l_output" ] && echo -e "\n- Correctly set:\n$l_output\n" >/dev/null
 fi
}

#3.3.1.13 Ensure net.ipv4.conf.default.rp_filter is configured

{
 l_output=""
 l_output2=""
 a_parlist=("net.ipv4.conf.default.rp_filter=1")
 l_ufwscf="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"

 kernel_parameter_chk()
 { 
  l_krp="$(sysctl "$l_kpname" | awk -F= '{print $2}' | xargs)" # Check running configuration

  if [ "$l_krp" = "$l_kpvalue" ]; then
   l_output="$l_output \"$l_kpname\" is correctly set to \"$l_krp\" in the running configuration"
  else
   l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_krp\" in the running configuration and should have a value of: \"$l_kpvalue\""
  fi

  unset A_out; declare -A A_out # Check durable setting (files)
  while read -r l_out; do
   if [ -n "$l_out" ]; then
    if [[ $l_out =~ ^\s*# ]]; then
     l_file="${l_out//# /}"
    else
     l_kpar="$(awk -F= '{print $1}' <<< "$l_out" | xargs)"
     [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_file")
    fi
   fi
  done < <(/usr/lib/systemd/systemd-sysctl --cat-config | grep -Po '^\h*([^#\n\r]+|#\h*\/[^#\n\r\h]+\.conf\b)')

  if [ -n "$l_ufwscf" ]; then
   l_kpar="$(grep -Po "^\h*$l_kpname\b" "$l_ufwscf" | xargs)"
   l_kpar="${l_kpar//\//.}"
   [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_ufwscf")
  fi

  if (( ${#A_out[@]} > 0 )); then
   while IFS="=" read -r l_fkpname l_fkpvalue; do
    l_fkpname="${l_fkpname// /}"; l_fkpvalue="${l_fkpvalue// /}"

    if [ "$l_fkpvalue" = "$l_kpvalue" ]; then
     l_output="$l_output \"$l_kpname\" is correctly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\""
    else
     l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\" and should have a value of: \"$l_kpvalue\""
    fi
   done < <(grep -Po -- "^\h*$l_kpname\h*=\h*\H+" "${A_out[@]}")
  else
   l_output2="$l_output2 \"$l_kpname\" is not set in an included file ** Note: \"$l_kpname\" may be set in a file that's ignored by load procedure **"
  fi
 }

 while IFS="=" read -r l_kpname l_kpvalue; do
  l_kpname="${l_kpname// /}"; l_kpvalue="${l_kpvalue// /}"
  kernel_parameter_chk
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ -z "$l_output2" ]; then

  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.1.13" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv4.conf.default.rp_filter is configured" c10
  write_col "Reverse Path Filtering validates packet source addresses to reduce IP spoofing attacks." c11
  write_col "net.ipv4.conf.default.rp_filter = 1" c12
  write_col "$l_output" c13
  write_col "OK" c14
  write_col "$severity" c15
  write_col "$scandate" c16

 else

  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.1.13" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv4.conf.default.rp_filter is configured" c10
  write_col "Reverse Path Filtering validates packet source addresses to reduce IP spoofing attacks." c11
  write_col "net.ipv4.conf.default.rp_filter = 1" c12
  write_col "$l_output2" c13
  write_col "KO" c14
  write_col "$severity" c15
  write_col "$scandate" c16

 fi
}


#3.3.1.14 Ensure net.ipv4.conf.all.accept_source_route is configured

{
 l_output=""; l_output2=""
 a_parlist=("net.ipv4.conf.all.accept_source_route=0")
 l_ufwscf="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"

 kernel_parameter_chk()
 {
  l_krp="$(sysctl "$l_kpname" | awk -F= '{print $2}' | xargs)"
  if [ "$l_krp" = "$l_kpvalue" ]; then
   l_output="$l_output \"$l_kpname\" is correctly set to \"$l_krp\" in the running configuration"
  else
   l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_krp\" in the running configuration and should have a value of: \"$l_kpvalue\""
  fi

  unset A_out; declare -A A_out
  while read -r l_out; do
   if [ -n "$l_out" ]; then
    if [[ $l_out =~ ^\s*# ]]; then
     l_file="${l_out//# /}"
    else
     l_kpar="$(awk -F= '{print $1}' <<< "$l_out" | xargs)"
     [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_file")
    fi
   fi
  done < <(/usr/lib/systemd/systemd-sysctl --cat-config | grep -Po '^\h*([^#\n\r]+|#\h*\/[^#\n\r\h]+\.conf\b)')

  if [ -n "$l_ufwscf" ]; then
   l_kpar="$(grep -Po "^\h*$l_kpname\b" "$l_ufwscf" | xargs)"
   l_kpar="${l_kpar//\//.}"
   [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_ufwscf")
  fi

  if (( ${#A_out[@]} > 0 )); then
   while IFS="=" read -r l_fkpname l_fkpvalue; do
    l_fkpname="${l_fkpname// /}"; l_fkpvalue="${l_fkpvalue// /}"
    if [ "$l_fkpvalue" = "$l_kpvalue" ]; then
     l_output="$l_output \"$l_kpname\" is correctly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\""
    else
     l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\" and should have a value of: \"$l_kpvalue\""
    fi
   done < <(grep -Po -- "^\h*$l_kpname\h*=\h*\H+" "${A_out[@]}")
  else
   l_output2="$l_output2 \"$l_kpname\" is not set in an included file ** Note: \"$l_kpname\" May be set in a file that's ignored by load procedure **"
  fi
 }

 while IFS="=" read -r l_kpname l_kpvalue; do
  l_kpname="${l_kpname// /}"
  l_kpvalue="${l_kpvalue// /}"
  kernel_parameter_chk
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ -z "$l_output2" ]; then
  echo -e "\n- Audit Result:\n ** PASS **\n$l_output\n" >/dev/null
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.1.14" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv4.conf.all.accept_source_route is configured" c10
  write_col "Disables acceptance of IPv4 source routed packets on all interfaces." c11
  write_col "net.ipv4.conf.all.accept_source_route = 0" c12
  write_col "$l_output" c13
  write_col "OK" c14
  write_col "$severity" c15
  write_col "$scandate" c16
 else
  echo -e "\n- Audit Result:\n ** FAIL **\n - Reason(s) for audit failure:\n$l_output2\n" >/dev/null
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.1.14" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv4.conf.all.accept_source_route is configured" c10
  write_col "Disables acceptance of IPv4 source routed packets on all interfaces." c11
  write_col "net.ipv4.conf.all.accept_source_route = 0" c12
  write_col "$l_output2" c13
  write_col "KO" c14
  write_col "$severity" c15
  write_col "$scandate" c16
  [ -n "$l_output" ] && echo -e "\n- Correctly set:\n$l_output\n" >/dev/null
 fi
}

#3.3.1.15 Ensure net.ipv4.conf.default.accept_source_route is configured

{
 l_output=""; l_output2=""
 a_parlist=("net.ipv4.conf.default.accept_source_route=0")
 l_ufwscf="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"

 kernel_parameter_chk()
 {
  l_krp="$(sysctl "$l_kpname" | awk -F= '{print $2}' | xargs)"
  if [ "$l_krp" = "$l_kpvalue" ]; then
   l_output="$l_output \"$l_kpname\" is correctly set to \"$l_krp\" in the running configuration"
  else
   l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_krp\" in the running configuration and should have a value of: \"$l_kpvalue\""
  fi

  unset A_out; declare -A A_out
  while read -r l_out; do
   if [ -n "$l_out" ]; then
    if [[ $l_out =~ ^\s*# ]]; then
     l_file="${l_out//# /}"
    else
     l_kpar="$(awk -F= '{print $1}' <<< "$l_out" | xargs)"
     [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_file")
    fi
   fi
  done < <(/usr/lib/systemd/systemd-sysctl --cat-config | grep -Po '^\h*([^#\n\r]+|#\h*\/[^#\n\r\h]+\.conf\b)')

  if [ -n "$l_ufwscf" ]; then
   l_kpar="$(grep -Po "^\h*$l_kpname\b" "$l_ufwscf" | xargs)"
   l_kpar="${l_kpar//\//.}"
   [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_ufwscf")
  fi

  if (( ${#A_out[@]} > 0 )); then
   while IFS="=" read -r l_fkpname l_fkpvalue; do
    l_fkpname="${l_fkpname// /}"; l_fkpvalue="${l_fkpvalue// /}"
    if [ "$l_fkpvalue" = "$l_kpvalue" ]; then
     l_output="$l_output \"$l_kpname\" is correctly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\""
    else
     l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\" and should have a value of: \"$l_kpvalue\""
    fi
   done < <(grep -Po -- "^\h*$l_kpname\h*=\h*\H+" "${A_out[@]}")
  else
   l_output2="$l_output2 \"$l_kpname\" is not set in an included file ** Note: \"$l_kpname\" May be set in a file that's ignored by load procedure **"
  fi
 }

 while IFS="=" read -r l_kpname l_kpvalue; do
  l_kpname="${l_kpname// /}"
  l_kpvalue="${l_kpvalue// /}"
  kernel_parameter_chk
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ -z "$l_output2" ]; then
  echo -e "\n- Audit Result:\n ** PASS **\n$l_output\n" >/dev/null
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.1.15" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv4.conf.default.accept_source_route is configured" c10
  write_col "Disables acceptance of IPv4 source routed packets by default for new interfaces." c11
  write_col "net.ipv4.conf.default.accept_source_route = 0" c12
  write_col "$l_output" c13
  write_col "OK" c14
  write_col "$severity" c15
  write_col "$scandate" c16
 else
  echo -e "\n- Audit Result:\n ** FAIL **\n - Reason(s) for audit failure:\n$l_output2\n" >/dev/null
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.1.15" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv4.conf.default.accept_source_route is configured" c10
  write_col "Disables acceptance of IPv4 source routed packets by default for new interfaces." c11
  write_col "net.ipv4.conf.default.accept_source_route = 0" c12
  write_col "$l_output2" c13
  write_col "KO" c14
  write_col "$severity" c15
  write_col "$scandate" c16
  [ -n "$l_output" ] && echo -e "\n- Correctly set:\n$l_output\n" >/dev/null
 fi
}

#3.3.1.18 Ensure net.ipv4.tcp_syncookies is configured

{
 l_output=""; l_output2=""
 a_parlist=("net.ipv4.tcp_syncookies=1")
 l_ufwscf="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"

 kernel_parameter_chk()
 {
  l_krp="$(sysctl "$l_kpname" | awk -F= '{print $2}' | xargs)"
  if [ "$l_krp" = "$l_kpvalue" ]; then
   l_output="$l_output \"$l_kpname\" is correctly set to \"$l_krp\" in the running configuration"
  else
   l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_krp\" in the running configuration and should have a value of: \"$l_kpvalue\""
  fi

  unset A_out; declare -A A_out
  while read -r l_out; do
   if [ -n "$l_out" ]; then
    if [[ $l_out =~ ^\s*# ]]; then
     l_file="${l_out//# /}"
    else
     l_kpar="$(awk -F= '{print $1}' <<< "$l_out" | xargs)"
     [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_file")
    fi
   fi
  done < <(/usr/lib/systemd/systemd-sysctl --cat-config | grep -Po '^\h*([^#\n\r]+|#\h*\/[^#\n\r\h]+\.conf\b)')

  if [ -n "$l_ufwscf" ]; then
   l_kpar="$(grep -Po "^\h*$l_kpname\b" "$l_ufwscf" | xargs)"
   l_kpar="${l_kpar//\//.}"
   [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_ufwscf")
  fi

  if (( ${#A_out[@]} > 0 )); then
   while IFS="=" read -r l_fkpname l_fkpvalue; do
    l_fkpname="${l_fkpname// /}"; l_fkpvalue="${l_fkpvalue// /}"
    if [ "$l_fkpvalue" = "$l_kpvalue" ]; then
     l_output="$l_output \"$l_kpname\" is correctly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\""
    else
     l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\" and should have a value of: \"$l_kpvalue\""
    fi
   done < <(grep -Po -- "^\h*$l_kpname\h*=\h*\H+" "${A_out[@]}")
  else
   l_output2="$l_output2 \"$l_kpname\" is not set in an included file ** Note: \"$l_kpname\" May be set in a file that's ignored by load procedure **"
  fi
 }

 while IFS="=" read -r l_kpname l_kpvalue; do
  l_kpname="${l_kpname// /}"
  l_kpvalue="${l_kpvalue// /}"
  kernel_parameter_chk
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ -z "$l_output2" ]; then
  echo -e "\n- Audit Result:\n ** PASS **\n$l_output\n" >/dev/null
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.1.18" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv4.tcp_syncookies is configured" c10
  write_col "Enables TCP SYN cookies to protect the system against SYN flood attacks." c11
  write_col "net.ipv4.tcp_syncookies = 1" c12
  write_col "$l_output" c13
  write_col "OK" c14
  write_col "$severity" c15
  write_col "$scandate" c16
 else
  echo -e "\n- Audit Result:\n ** FAIL **\n - Reason(s) for audit failure:\n$l_output2\n" >/dev/null
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.1.18" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv4.tcp_syncookies is configured" c10
  write_col "Enables TCP SYN cookies to protect the system against SYN flood attacks." c11
  write_col "net.ipv4.tcp_syncookies = 1" c12
  write_col "$l_output2" c13
  write_col "KO" c14
  write_col "$severity" c15
  write_col "$scandate" c16
  [ -n "$l_output" ] && echo -e "\n- Correctly set:\n$l_output\n" >/dev/null
 fi
}

#3.3.2.1 Ensure  net.ipv6.conf.all.forwarding is configured

{
 l_output=""; l_output2=""
 a_parlist=("net.ipv6.conf.all.forwarding=0")
 l_ufwscf="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"

 kernel_parameter_chk()
 {
  l_krp="$(sysctl "$l_kpname" | awk -F= '{print $2}' | xargs)"
  if [ "$l_krp" = "$l_kpvalue" ]; then
   l_output="$l_output \"$l_kpname\" is correctly set to \"$l_krp\" in the running configuration"
  else
   l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_krp\" in the running configuration and should have a value of: \"$l_kpvalue\""
  fi

  unset A_out; declare -A A_out
  while read -r l_out; do
   if [ -n "$l_out" ]; then
    if [[ $l_out =~ ^\s*# ]]; then
     l_file="${l_out//# /}"
    else
     l_kpar="$(awk -F= '{print $1}' <<< "$l_out" | xargs)"
     [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_file")
    fi
   fi
  done < <(/usr/lib/systemd/systemd-sysctl --cat-config | grep -Po '^\h*([^#\n\r]+|#\h*\/[^#\n\r\h]+\.conf\b)')

  if [ -n "$l_ufwscf" ]; then
   l_kpar="$(grep -Po "^\h*$l_kpname\b" "$l_ufwscf" | xargs)"
   l_kpar="${l_kpar//\//.}"
   [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_ufwscf")
  fi

  if (( ${#A_out[@]} > 0 )); then
   while IFS="=" read -r l_fkpname l_fkpvalue; do
    l_fkpname="${l_fkpname// /}"; l_fkpvalue="${l_fkpvalue// /}"
    if [ "$l_fkpvalue" = "$l_kpvalue" ]; then
     l_output="$l_output \"$l_kpname\" is correctly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\""
    else
     l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\" and should have a value of: \"$l_kpvalue\""
    fi
   done < <(grep -Po -- "^\h*$l_kpname\h*=\h*\H+" "${A_out[@]}")
  else
   l_output2="$l_output2 \"$l_kpname\" is not set in an included file ** Note: \"$l_kpname\" May be set in a file that's ignored by load procedure **"
  fi
 }

 while IFS="=" read -r l_kpname l_kpvalue; do
  l_kpname="${l_kpname// /}"
  l_kpvalue="${l_kpvalue// /}"

  # IPv6 Not Applicable Check
  if grep -Pqs '^\h*1\b' /sys/module/ipv6/parameters/disable && grep -q '^net.ipv6.' <<< "$l_kpname"; then
   l_output="$l_output IPv6 is disabled on the system \"$l_kpname\" is not applicable"
  else
   kernel_parameter_chk
  fi

 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ -z "$l_output2" ]; then
  echo -e "\n- Audit Result:\n ** PASS **\n$l_output\n" >/dev/null
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.2.1" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv6.conf.all.forwarding is configured" c10
  write_col "Disables IPv6 forwarding on all interfaces to prevent unintended packet routing." c11
  write_col "net.ipv6.conf.all.forwarding = 0" c12
  write_col "$l_output" c13
  write_col "OK" c14
  write_col "$severity" c15
  write_col "$scandate" c16
 else
  echo -e "\n- Audit Result:\n ** FAIL **\n - Reason(s) for audit failure:\n$l_output2\n" >/dev/null
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.2.1" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv6.conf.all.forwarding is configured" c10
  write_col "Disables IPv6 forwarding on all interfaces to prevent unintended packet routing." c11
  write_col "net.ipv6.conf.all.forwarding = 0" c12
  write_col "$l_output2" c13
  write_col "KO" c14
  write_col "$severity" c15
  write_col "$scandate" c16
  [ -n "$l_output" ] && echo -e "\n- Correctly set:\n$l_output\n" >/dev/null
 fi
}

#3.3.2.2 Ensure  net.ipv6.conf.default.forwarding is configured

{
 l_output=""; l_output2=""
 a_parlist=("net.ipv6.conf.default.forwarding=0")
 l_ufwscf="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"

 kernel_parameter_chk()
 {
  l_krp="$(sysctl "$l_kpname" | awk -F= '{print $2}' | xargs)"
  if [ "$l_krp" = "$l_kpvalue" ]; then
   l_output="$l_output \"$l_kpname\" is correctly set to \"$l_krp\" in the running configuration"
  else
   l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_krp\" in the running configuration and should have a value of: \"$l_kpvalue\""
  fi

  unset A_out; declare -A A_out
  while read -r l_out; do
   if [ -n "$l_out" ]; then
    if [[ $l_out =~ ^\s*# ]]; then
     l_file="${l_out//# /}"
    else
     l_kpar="$(awk -F= '{print $1}' <<< "$l_out" | xargs)"
     [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_file")
    fi
   fi
  done < <(/usr/lib/systemd/systemd-sysctl --cat-config | grep -Po '^\h*([^#\n\r]+|#\h*\/[^#\n\r\h]+\.conf\b)')

  if [ -n "$l_ufwscf" ]; then
   l_kpar="$(grep -Po "^\h*$l_kpname\b" "$l_ufwscf" | xargs)"
   l_kpar="${l_kpar//\//.}"
   [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_ufwscf")
  fi

  if (( ${#A_out[@]} > 0 )); then
   while IFS="=" read -r l_fkpname l_fkpvalue; do
    l_fkpname="${l_fkpname// /}"; l_fkpvalue="${l_fkpvalue// /}"
    if [ "$l_fkpvalue" = "$l_kpvalue" ]; then
     l_output="$l_output \"$l_kpname\" is correctly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\""
    else
     l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\" and should have a value of: \"$l_kpvalue\""
    fi
   done < <(grep -Po -- "^\h*$l_kpname\h*=\h*\H+" "${A_out[@]}")
  else
   l_output2="$l_output2 \"$l_kpname\" is not set in an included file ** Note: \"$l_kpname\" May be set in a file that's ignored by load procedure **"
  fi
 }

 while IFS="=" read -r l_kpname l_kpvalue; do
  l_kpname="${l_kpname// /}"
  l_kpvalue="${l_kpvalue// /}"

  # IPv6 Not Applicable Check
  if grep -Pqs '^\h*1\b' /sys/module/ipv6/parameters/disable && grep -q '^net.ipv6.' <<< "$l_kpname"; then
   l_output="$l_output IPv6 is disabled on the system \"$l_kpname\" is not applicable"
  else
   kernel_parameter_chk
  fi

 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ -z "$l_output2" ]; then
  echo -e "\n- Audit Result:\n ** PASS **\n$l_output\n" >/dev/null
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.2.2" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv6.conf.default.forwarding is configured" c10
  write_col "Disables IPv6 forwarding by default for new interfaces to prevent unintended packet routing." c11
  write_col "net.ipv6.conf.default.forwarding = 0" c12
  write_col "$l_output" c13
  write_col "OK" c14
  write_col "$severity" c15
  write_col "$scandate" c16
 else
  echo -e "\n- Audit Result:\n ** FAIL **\n - Reason(s) for audit failure:\n$l_output2\n" >/dev/null
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.2.2" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv6.conf.default.forwarding is configured" c10
  write_col "Disables IPv6 forwarding by default for new interfaces to prevent unintended packet routing." c11
  write_col "net.ipv6.conf.default.forwarding = 0" c12
  write_col "$l_output2" c13
  write_col "KO" c14
  write_col "$severity" c15
  write_col "$scandate" c16
  [ -n "$l_output" ] && echo -e "\n- Correctly set:\n$l_output\n" >/dev/null
 fi
}

#3.3.2.3 Ensure net.ipv6.conf.all.accept_redirects is configured

{
 l_output=""; l_output2=""
 a_parlist=("net.ipv6.conf.all.accept_redirects=0")
 l_ufwscf="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"

 kernel_parameter_chk()
 {
  l_krp="$(sysctl "$l_kpname" | awk -F= '{print $2}' | xargs)"
  if [ "$l_krp" = "$l_kpvalue" ]; then
   l_output="$l_output \"$l_kpname\" is correctly set to \"$l_krp\" in the running configuration"
  else
   l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_krp\" in the running configuration and should have a value of: \"$l_kpvalue\""
  fi

  unset A_out; declare -A A_out
  while read -r l_out; do
   if [ -n "$l_out" ]; then
    if [[ $l_out =~ ^\s*# ]]; then
     l_file="${l_out//# /}"
    else
     l_kpar="$(awk -F= '{print $1}' <<< "$l_out" | xargs)"
     [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_file")
    fi
   fi
  done < <(/usr/lib/systemd/systemd-sysctl --cat-config | grep -Po '^\h*([^#\n\r]+|#\h*\/[^#\n\r\h]+\.conf\b)')

  if [ -n "$l_ufwscf" ]; then
   l_kpar="$(grep -Po "^\h*$l_kpname\b" "$l_ufwscf" | xargs)"
   l_kpar="${l_kpar//\//.}"
   [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_ufwscf")
  fi

  if (( ${#A_out[@]} > 0 )); then
   while IFS="=" read -r l_fkpname l_fkpvalue; do
    l_fkpname="${l_fkpname// /}"; l_fkpvalue="${l_fkpvalue// /}"
    if [ "$l_fkpvalue" = "$l_kpvalue" ]; then
     l_output="$l_output \"$l_kpname\" is correctly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\""
    else
     l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\" and should have a value of: \"$l_kpvalue\""
    fi
   done < <(grep -Po -- "^\h*$l_kpname\h*=\h*\H+" "${A_out[@]}")
  else
   l_output2="$l_output2 \"$l_kpname\" is not set in an included file ** Note: \"$l_kpname\" May be set in a file that's ignored by load procedure **"
  fi
 }

 while IFS="=" read -r l_kpname l_kpvalue; do
  l_kpname="${l_kpname// /}"
  l_kpvalue="${l_kpvalue// /}"

  # IPv6 Not Applicable Check
  if grep -Pqs '^\h*1\b' /sys/module/ipv6/parameters/disable && grep -q '^net.ipv6.' <<< "$l_kpname"; then
   l_output="$l_output IPv6 is disabled on the system \"$l_kpname\" is not applicable"
  else
   kernel_parameter_chk
  fi

 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ -z "$l_output2" ]; then
  echo -e "\n- Audit Result:\n ** PASS **\n$l_output\n" >/dev/null
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.2.3" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv6.conf.all.accept_redirects is configured" c10
  write_col "Disables acceptance of IPv6 ICMP redirects on all interfaces to prevent route manipulation." c11
  write_col "net.ipv6.conf.all.accept_redirects = 0" c12
  write_col "$l_output" c13
  write_col "OK" c14
  write_col "$severity" c15
  write_col "$scandate" c16
 else
  echo -e "\n- Audit Result:\n ** FAIL **\n - Reason(s) for audit failure:\n$l_output2\n" >/dev/null
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.2.3" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv6.conf.all.accept_redirects is configured" c10
  write_col "Disables acceptance of IPv6 ICMP redirects on all interfaces to prevent route manipulation." c11
  write_col "net.ipv6.conf.all.accept_redirects = 0" c12
  write_col "$l_output2" c13
  write_col "KO" c14
  write_col "$severity" c15
  write_col "$scandate" c16
  [ -n "$l_output" ] && echo -e "\n- Correctly set:\n$l_output\n" >/dev/null
 fi
}

#3.3.2.4 Ensure net.ipv6.conf.default.accept_redirects is configured

{
 l_output=""; l_output2=""
 a_parlist=("net.ipv6.conf.default.accept_redirects=0")
 l_ufwscf="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"

 kernel_parameter_chk()
 {
  l_krp="$(sysctl "$l_kpname" | awk -F= '{print $2}' | xargs)"
  if [ "$l_krp" = "$l_kpvalue" ]; then
   l_output="$l_output \"$l_kpname\" is correctly set to \"$l_krp\" in the running configuration"
  else
   l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_krp\" in the running configuration and should have a value of: \"$l_kpvalue\""
  fi

  unset A_out; declare -A A_out
  while read -r l_out; do
   if [ -n "$l_out" ]; then
    if [[ $l_out =~ ^\s*# ]]; then
     l_file="${l_out//# /}"
    else
     l_kpar="$(awk -F= '{print $1}' <<< "$l_out" | xargs)"
     [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_file")
    fi
   fi
  done < <(/usr/lib/systemd/systemd-sysctl --cat-config | grep -Po '^\h*([^#\n\r]+|#\h*\/[^#\n\r\h]+\.conf\b)')

  if [ -n "$l_ufwscf" ]; then
   l_kpar="$(grep -Po "^\h*$l_kpname\b" "$l_ufwscf" | xargs)"
   l_kpar="${l_kpar//\//.}"
   [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_ufwscf")
  fi

  if (( ${#A_out[@]} > 0 )); then
   while IFS="=" read -r l_fkpname l_fkpvalue; do
    l_fkpname="${l_fkpname// /}"; l_fkpvalue="${l_fkpvalue// /}"
    if [ "$l_fkpvalue" = "$l_kpvalue" ]; then
     l_output="$l_output \"$l_kpname\" is correctly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\""
    else
     l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\" and should have a value of: \"$l_kpvalue\""
    fi
   done < <(grep -Po -- "^\h*$l_kpname\h*=\h*\H+" "${A_out[@]}")
  else
   l_output2="$l_output2 \"$l_kpname\" is not set in an included file ** Note: \"$l_kpname\" May be set in a file that's ignored by load procedure **"
  fi
 }

 while IFS="=" read -r l_kpname l_kpvalue; do
  l_kpname="${l_kpname// /}"
  l_kpvalue="${l_kpvalue// /}"

  # IPv6 Not Applicable Check
  if grep -Pqs '^\h*1\b' /sys/module/ipv6/parameters/disable && grep -q '^net.ipv6.' <<< "$l_kpname"; then
   l_output="$l_output IPv6 is disabled on the system \"$l_kpname\" is not applicable"
  else
   kernel_parameter_chk
  fi
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ -z "$l_output2" ]; then
  echo -e "\n- Audit Result:\n ** PASS **\n$l_output\n" >/dev/null
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.2.4" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv6.conf.default.accept_redirects is configured" c10
  write_col "Disables acceptance of IPv6 ICMP redirects by default for new interfaces to prevent route manipulation." c11
  write_col "net.ipv6.conf.default.accept_redirects = 0" c12
  write_col "$l_output" c13
  write_col "OK" c14
  write_col "$severity" c15
  write_col "$scandate" c16
 else
  echo -e "\n- Audit Result:\n ** FAIL **\n - Reason(s) for audit failure:\n$l_output2\n" >/dev/null
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.2.4" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv6.conf.default.accept_redirects is configured" c10
  write_col "Disables acceptance of IPv6 ICMP redirects by default for new interfaces to prevent route manipulation." c11
  write_col "net.ipv6.conf.default.accept_redirects = 0" c12
  write_col "$l_output2" c13
  write_col "KO" c14
  write_col "$severity" c15
  write_col "$scandate" c16
  [ -n "$l_output" ] && echo -e "\n- Correctly set:\n$l_output\n" >/dev/null
 fi
}

#3.3.2.5 Ensure net.ipv6.conf.all.accept_source_route is configured

{
 l_output=""; l_output2=""
 a_parlist=("net.ipv6.conf.all.accept_source_route=0")
 l_ufwscf="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"

 kernel_parameter_chk()
 {
  l_krp="$(sysctl "$l_kpname" | awk -F= '{print $2}' | xargs)"
  if [ "$l_krp" = "$l_kpvalue" ]; then
   l_output="$l_output \"$l_kpname\" is correctly set to \"$l_krp\" in the running configuration"
  else
   l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_krp\" in the running configuration and should have a value of: \"$l_kpvalue\""
  fi

  unset A_out; declare -A A_out
  while read -r l_out; do
   if [ -n "$l_out" ]; then
    if [[ $l_out =~ ^\s*# ]]; then
     l_file="${l_out//# /}"
    else
     l_kpar="$(awk -F= '{print $1}' <<< "$l_out" | xargs)"
     [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_file")
    fi
   fi
  done < <(/usr/lib/systemd/systemd-sysctl --cat-config | grep -Po '^\h*([^#\n\r]+|#\h*\/[^#\n\r\h]+\.conf\b)')

  if [ -n "$l_ufwscf" ]; then
   l_kpar="$(grep -Po "^\h*$l_kpname\b" "$l_ufwscf" | xargs)"
   l_kpar="${l_kpar//\//.}"
   [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_ufwscf")
  fi

  if (( ${#A_out[@]} > 0 )); then
   while IFS="=" read -r l_fkpname l_fkpvalue; do
    l_fkpname="${l_fkpname// /}"; l_fkpvalue="${l_fkpvalue// /}"
    if [ "$l_fkpvalue" = "$l_kpvalue" ]; then
     l_output="$l_output \"$l_kpname\" is correctly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\""
    else
     l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\" and should have a value of: \"$l_kpvalue\""
    fi
   done < <(grep -Po -- "^\h*$l_kpname\h*=\h*\H+" "${A_out[@]}")
  else
   l_output2="$l_output2 \"$l_kpname\" is not set in an included file ** Note: \"$l_kpname\" May be set in a file that's ignored by load procedure **"
  fi
 }

 while IFS="=" read -r l_kpname l_kpvalue; do
  l_kpname="${l_kpname// /}"
  l_kpvalue="${l_kpvalue// /}"

  # IPv6 Not Applicable Check
  if grep -Pqs '^\h*1\b' /sys/module/ipv6/parameters/disable && grep -q '^net.ipv6.' <<< "$l_kpname"; then
   l_output="$l_output IPv6 is disabled on the system \"$l_kpname\" is not applicable"
  else
   kernel_parameter_chk
  fi
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ -z "$l_output2" ]; then
  echo -e "\n- Audit Result:\n ** PASS **\n$l_output\n" >/dev/null
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.2.5" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv6.conf.all.accept_source_route is configured" c10
  write_col "Disables acceptance of IPv6 source routed packets on all interfaces." c11
  write_col "net.ipv6.conf.all.accept_source_route = 0" c12
  write_col "$l_output" c13
  write_col "OK" c14
  write_col "$severity" c15
  write_col "$scandate" c16
 else
  echo -e "\n- Audit Result:\n ** FAIL **\n - Reason(s) for audit failure:\n$l_output2\n" >/dev/null
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.2.5" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv6.conf.all.accept_source_route is configured" c10
  write_col "Disables acceptance of IPv6 source routed packets on all interfaces." c11
  write_col "net.ipv6.conf.all.accept_source_route = 0" c12
  write_col "$l_output2" c13
  write_col "KO" c14
  write_col "$severity" c15
  write_col "$scandate" c16
  [ -n "$l_output" ] && echo -e "\n- Correctly set:\n$l_output\n" >/dev/null
 fi
}

#3.3.2.6 Ensure net.ipv6.conf.default.accept_source_route is configured

{
 l_output=""; l_output2=""
 a_parlist=("net.ipv6.conf.default.accept_source_route=0")
 l_ufwscf="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"

 kernel_parameter_chk()
 {
  l_krp="$(sysctl "$l_kpname" | awk -F= '{print $2}' | xargs)"
  if [ "$l_krp" = "$l_kpvalue" ]; then
   l_output="$l_output \"$l_kpname\" is correctly set to \"$l_krp\" in the running configuration"
  else
   l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_krp\" in the running configuration and should have a value of: \"$l_kpvalue\""
  fi

  unset A_out; declare -A A_out
  while read -r l_out; do
   if [ -n "$l_out" ]; then
    if [[ $l_out =~ ^\s*# ]]; then
     l_file="${l_out//# /}"
    else
     l_kpar="$(awk -F= '{print $1}' <<< "$l_out" | xargs)"
     [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_file")
    fi
   fi
  done < <(/usr/lib/systemd/systemd-sysctl --cat-config | grep -Po '^\h*([^#\n\r]+|#\h*\/[^#\n\r\h]+\.conf\b)')

  if [ -n "$l_ufwscf" ]; then
   l_kpar="$(grep -Po "^\h*$l_kpname\b" "$l_ufwscf" | xargs)"
   l_kpar="${l_kpar//\//.}"
   [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_ufwscf")
  fi

  if (( ${#A_out[@]} > 0 )); then
   while IFS="=" read -r l_fkpname l_fkpvalue; do
    l_fkpname="${l_fkpname// /}"; l_fkpvalue="${l_fkpvalue// /}"
    if [ "$l_fkpvalue" = "$l_kpvalue" ]; then
     l_output="$l_output \"$l_kpname\" is correctly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\""
    else
     l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\" and should have a value of: \"$l_kpvalue\""
    fi
   done < <(grep -Po -- "^\h*$l_kpname\h*=\h*\H+" "${A_out[@]}")
  else
   l_output2="$l_output2 \"$l_kpname\" is not set in an included file ** Note: \"$l_kpname\" May be set in a file that's ignored by load procedure **"
  fi
 }

 while IFS="=" read -r l_kpname l_kpvalue; do
  l_kpname="${l_kpname// /}"
  l_kpvalue="${l_kpvalue// /}"

  # IPv6 Not Applicable Check
  if grep -Pqs '^\h*1\b' /sys/module/ipv6/parameters/disable && grep -q '^net.ipv6.' <<< "$l_kpname"; then
   l_output="$l_output IPv6 is disabled on the system \"$l_kpname\" is not applicable"
  else
   kernel_parameter_chk
  fi
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ -z "$l_output2" ]; then
  echo -e "\n- Audit Result:\n ** PASS **\n$l_output\n" >/dev/null
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.2.6" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv6.conf.default.accept_source_route is configured" c10
  write_col "Disables acceptance of IPv6 source routed packets by default for new interfaces." c11
  write_col "net.ipv6.conf.default.accept_source_route = 0" c12
  write_col "$l_output" c13
  write_col "OK" c14
  write_col "$severity" c15
  write_col "$scandate" c16
 else
  echo -e "\n- Audit Result:\n ** FAIL **\n - Reason(s) for audit failure:\n$l_output2\n" >/dev/null
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.2.6" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv6.conf.default.accept_source_route is configured" c10
  write_col "Disables acceptance of IPv6 source routed packets by default for new interfaces." c11
  write_col "net.ipv6.conf.default.accept_source_route = 0" c12
  write_col "$l_output2" c13
  write_col "KO" c14
  write_col "$severity" c15
  write_col "$scandate" c16
  [ -n "$l_output" ] && echo -e "\n- Correctly set:\n$l_output\n" >/dev/null
 fi
}

#3.3.2.7 Ensure net.ipv6.conf.all.accept_ra is configured

{
 l_output=""; l_output2=""
 a_parlist=("net.ipv6.conf.all.accept_ra=0")
 l_ufwscf="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"

 kernel_parameter_chk()
 {
  l_krp="$(sysctl "$l_kpname" | awk -F= '{print $2}' | xargs)"
  if [ "$l_krp" = "$l_kpvalue" ]; then
   l_output="$l_output \"$l_kpname\" is correctly set to \"$l_krp\" in the running configuration"
  else
   l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_krp\" in the running configuration and should have a value of: \"$l_kpvalue\""
  fi

  unset A_out; declare -A A_out
  while read -r l_out; do
   if [ -n "$l_out" ]; then
    if [[ $l_out =~ ^\s*# ]]; then
     l_file="${l_out//# /}"
    else
     l_kpar="$(awk -F= '{print $1}' <<< "$l_out" | xargs)"
     [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_file")
    fi
   fi
  done < <(/usr/lib/systemd/systemd-sysctl --cat-config | grep -Po '^\h*([^#\n\r]+|#\h*\/[^#\n\r\h]+\.conf\b)')

  if [ -n "$l_ufwscf" ]; then
   l_kpar="$(grep -Po "^\h*$l_kpname\b" "$l_ufwscf" | xargs)"
   l_kpar="${l_kpar//\//.}"
   [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_ufwscf")
  fi

  if (( ${#A_out[@]} > 0 )); then
   while IFS="=" read -r l_fkpname l_fkpvalue; do
    l_fkpname="${l_fkpname// /}"; l_fkpvalue="${l_fkpvalue// /}"
    if [ "$l_fkpvalue" = "$l_kpvalue" ]; then
     l_output="$l_output \"$l_kpname\" is correctly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\""
    else
     l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\" and should have a value of: \"$l_kpvalue\""
    fi
   done < <(grep -Po -- "^\h*$l_kpname\h*=\h*\H+" "${A_out[@]}")
  else
   l_output2="$l_output2 \"$l_kpname\" is not set in an included file ** Note: \"$l_kpname\" May be set in a file that's ignored by load procedure **"
  fi
 }

 while IFS="=" read -r l_kpname l_kpvalue; do
  l_kpname="${l_kpname// /}"
  l_kpvalue="${l_kpvalue// /}"

  # IPv6 Not Applicable Check
  if grep -Pqs '^\h*1\b' /sys/module/ipv6/parameters/disable && grep -q '^net.ipv6.' <<< "$l_kpname"; then
   l_output="$l_output IPv6 is disabled on the system \"$l_kpname\" is not applicable"
  else
   kernel_parameter_chk
  fi
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ -z "$l_output2" ]; then
  echo -e "\n- Audit Result:\n ** PASS **\n$l_output\n" >/dev/null
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.2.7" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv6.conf.all.accept_ra is configured" c10
  write_col "Disables acceptance of IPv6 Router Advertisements on all interfaces (recommended unless acting as IPv6 host on trusted network)." c11
  write_col "net.ipv6.conf.all.accept_ra = 0" c12
  write_col "$l_output" c13
  write_col "OK" c14
  write_col "$severity" c15
  write_col "$scandate" c16
 else
  echo -e "\n- Audit Result:\n ** FAIL **\n - Reason(s) for audit failure:\n$l_output2\n" >/dev/null
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.2.7" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv6.conf.all.accept_ra is configured" c10
  write_col "Disables acceptance of IPv6 Router Advertisements on all interfaces (recommended unless acting as IPv6 host on trusted network)." c11
  write_col "net.ipv6.conf.all.accept_ra = 0" c12
  write_col "$l_output2" c13
  write_col "KO" c14
  write_col "$severity" c15
  write_col "$scandate" c16
  [ -n "$l_output" ] && echo -e "\n- Correctly set:\n$l_output\n" >/dev/null
 fi
}

#3.3.2.8 Ensure net.ipv6.conf.default.accept_ra is configured

{
 l_output=""; l_output2=""
 a_parlist=("net.ipv6.conf.default.accept_ra=0")
 l_ufwscf="$([ -f /etc/default/ufw ] && awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"

 kernel_parameter_chk()
 {
  l_krp="$(sysctl "$l_kpname" | awk -F= '{print $2}' | xargs)"
  if [ "$l_krp" = "$l_kpvalue" ]; then
   l_output="$l_output \"$l_kpname\" is correctly set to \"$l_krp\" in the running configuration"
  else
   l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_krp\" in the running configuration and should have a value of: \"$l_kpvalue\""
  fi

  unset A_out; declare -A A_out
  while read -r l_out; do
   if [ -n "$l_out" ]; then
    if [[ $l_out =~ ^\s*# ]]; then
     l_file="${l_out//# /}"
    else
     l_kpar="$(awk -F= '{print $1}' <<< "$l_out" | xargs)"
     [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_file")
    fi
   fi
  done < <(/usr/lib/systemd/systemd-sysctl --cat-config | grep -Po '^\h*([^#\n\r]+|#\h*\/[^#\n\r\h]+\.conf\b)')

  if [ -n "$l_ufwscf" ]; then
   l_kpar="$(grep -Po "^\h*$l_kpname\b" "$l_ufwscf" | xargs)"
   l_kpar="${l_kpar//\//.}"
   [ "$l_kpar" = "$l_kpname" ] && A_out+=(["$l_kpar"]="$l_ufwscf")
  fi

  if (( ${#A_out[@]} > 0 )); then
   while IFS="=" read -r l_fkpname l_fkpvalue; do
    l_fkpname="${l_fkpname// /}"; l_fkpvalue="${l_fkpvalue// /}"
    if [ "$l_fkpvalue" = "$l_kpvalue" ]; then
     l_output="$l_output \"$l_kpname\" is correctly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\""
    else
     l_output2="$l_output2 \"$l_kpname\" is incorrectly set to \"$l_fkpvalue\" in \"$(printf '%s' "${A_out[@]}")\" and should have a value of: \"$l_kpvalue\""
    fi
   done < <(grep -Po -- "^\h*$l_kpname\h*=\h*\H+" "${A_out[@]}")
  else
   l_output2="$l_output2 \"$l_kpname\" is not set in an included file ** Note: \"$l_kpname\" May be set in a file that's ignored by load procedure **"
  fi
 }

 while IFS="=" read -r l_kpname l_kpvalue; do
  l_kpname="${l_kpname// /}"
  l_kpvalue="${l_kpvalue// /}"

  # IPv6 Not Applicable Check
  if grep -Pqs '^\h*1\b' /sys/module/ipv6/parameters/disable && grep -q '^net.ipv6.' <<< "$l_kpname"; then
   l_output="$l_output IPv6 is disabled on the system \"$l_kpname\" is not applicable"
  else
   kernel_parameter_chk
  fi
 done < <(printf '%s\n' "${a_parlist[@]}")

 if [ -z "$l_output2" ]; then
  echo -e "\n- Audit Result:\n ** PASS **\n$l_output\n" >/dev/null
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.2.8" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv6.conf.default.accept_ra is configured" c10
  write_col "Disables acceptance of IPv6 Router Advertisements by default for new interfaces (recommended unless acting as IPv6 host on trusted network)." c11
  write_col "net.ipv6.conf.default.accept_ra = 0" c12
  write_col "$l_output" c13
  write_col "OK" c14
  write_col "$severity" c15
  write_col "$scandate" c16
 else
  echo -e "\n- Audit Result:\n ** FAIL **\n - Reason(s) for audit failure:\n$l_output2\n" >/dev/null
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "3.3.2.8" c8
  write_col "Configure Network Kernel Parameters" c9
  write_col "Ensure net.ipv6.conf.default.accept_ra is configured" c10
  write_col "Disables acceptance of IPv6 Router Advertisements by default for new interfaces (recommended unless acting as IPv6 host on trusted network)." c11
  write_col "net.ipv6.conf.default.accept_ra = 0" c12
  write_col "$l_output2" c13
  write_col "KO" c14
  write_col "$severity" c15
  write_col "$scandate" c16
  [ -n "$l_output" ] && echo -e "\n- Correctly set:\n$l_output\n" >/dev/null
 fi
}

########################END#########################

#7.2.1 Ensure accounts in /etc/passwd use shadowed passwords

non_shadowed=$(awk -F: '($2 != "x") {print $1}' /etc/passwd 2>/dev/null)

count=$(echo "$non_shadowed" | sed '/^$/d' | wc -l)

if [[ "$count" -eq 0 ]]; then
  status="OK"
  details="All accounts use shadowed passwords"
else
  status="KO"
  details="Accounts not using shadowed passwords: $(echo $non_shadowed | tr '\n' ' ')"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.2.1" c8
write_col "Ensure accounts in /etc/passwd use shadowed passwords" c9
write_col "Ensure accounts in /etc/passwd use shadowed passwords" c10
write_col "Password hashes must be stored in /etc/shadow instead of /etc/passwd" c11
write_col "All password fields in /etc/passwd should contain 'x'" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

#7.2.2 Ensure /etc/shadow password fields are not empty

empty_pass=$(awk -F: '($2 == "") {print $1}' /etc/shadow 2>/dev/null)

count=$(echo "$empty_pass" | sed '/^$/d' | wc -l)

if [[ "$count" -eq 0 ]]; then
  status="OK"
  details="No accounts have empty password fields"
else
  status="KO"
  details="Accounts with empty password fields: $(echo $empty_pass | tr '\n' ' ')"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.2.2" c8
write_col "Ensure /etc/shadow password fields are not empty" c9
write_col "Ensure /etc/shadow password fields are not empty" c10
write_col "Accounts must have a valid password or be locked to prevent unauthorized access" c11
write_col "Password field in /etc/shadow must not be empty" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

#7.2.3 Ensure all groups in /etc/passwd exist in /etc/group

missing_groups=""

while IFS=: read -r user _ _ gid _; do
  if ! getent group "$gid" > /dev/null; then
    missing_groups="$missing_groups$user(GID:$gid) "
  fi
done < /etc/passwd

if [[ -z "$missing_groups" ]]; then
  status="OK"
  details="All groups referenced in /etc/passwd exist in /etc/group"
else
  status="KO"
  details="Users with non-existent primary groups: $missing_groups"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.2.3" c8
write_col "Ensure all groups in /etc/passwd exist in /etc/group" c9
write_col "Ensure all groups in /etc/passwd exist in /etc/group" c10
write_col "Each user must have a valid primary group defined in /etc/group" c11
write_col "All GIDs in /etc/passwd must exist in /etc/group" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

#7.2.4 Ensure no duplicate UIDs exist

dup_uids=$(cut -d: -f3 /etc/passwd | sort | uniq -d)

if [[ -z "$dup_uids" ]]; then
  status="OK"
  details="No duplicate UIDs found"
else
  users=""
  for uid in $dup_uids; do
    ulist=$(awk -F: -v id="$uid" '($3 == id) {print $1}' /etc/passwd | tr '\n' ' ')
    users="$users UID:$uid($ulist)"
  done
  status="KO"
  details="Duplicate UIDs detected:$users"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.2.4" c8
write_col "Ensure no duplicate UIDs exist" c9
write_col "Ensure no duplicate UIDs exist" c10
write_col "Each user account must have a unique UID to maintain proper access control" c11
write_col "Duplicate UIDs can lead to privilege escalation and ownership issues" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

#7.2.5 Ensure no duplicate GIDs exist

dup_gids=$(cut -d: -f3 /etc/group | sort | uniq -d)

if [[ -z "$dup_gids" ]]; then
  status="OK"
  details="No duplicate GIDs found"
else
  groups=""
  for gid in $dup_gids; do
    glist=$(awk -F: -v id="$gid" '($3 == id) {print $1}' /etc/group | tr '\n' ' ')
    groups="$groups GID:$gid($glist)"
  done
  status="KO"
  details="Duplicate GIDs detected:$groups"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.2.5" c8
write_col "Ensure no duplicate GIDs exist" c9
write_col "Ensure no duplicate GIDs exist" c10
write_col "Each group must have a unique GID to maintain proper access control" c11
write_col "Duplicate GIDs can lead to permission conflicts and privilege escalation" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

# ---------- Function to capture current value ----------
get_current_value() {
    local file="$1"
    if [[ -f "$file" ]]; then
        head -5 "$file" | tr '\n' ' '
    else
        echo "File not present"
    fi
}

# 7.2.6 Ensure no duplicate user names exist

dup=$(cut -d: -f1 /etc/passwd | sort | uniq -d | tr '\n' ' ')

if [[ -z "$dup" ]]; then
  current_value="No duplicates"
  status="OK"
else
  current_value="Duplicates: $dup"
  status="KO"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.2.6" c8
write_col "Account Integrity" c9
write_col "Ensure no duplicate user names exist" c10
write_col "Usernames must be unique" c11
write_col "No duplicate usernames in /etc/passwd" c12
write_col "$current_value" c13 
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

#7.2.7 Ensure no duplicate group names exist

dup_groups=$(cut -d: -f1 /etc/group | sort | uniq -d)

if [[ -z "$dup_groups" ]]; then
  status="OK"
  details="No duplicate group names found"
else
  groups=""
  for grp in $dup_groups; do
    groups="$groups $grp"
  done
  status="KO"
  details="Duplicate group names detected:$groups"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.2.7" c8
write_col "Ensure no duplicate group names exist" c9
write_col "Ensure no duplicate group names exist" c10
write_col "Each group must have a unique name to maintain proper access control" c11
write_col "Duplicate group names can cause permission conflicts and security risks" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

# 7.2.8 Ensure local interactive user home directories are configured

status="OK"
details="All local interactive user home directories are properly configured"

# Get local interactive users (UID >= 1000 with valid login shell)
users=$(awk -F: '($3>=1000 && $7 !~ /(nologin|false)/) {print $1 ":" $6}' /etc/passwd)

for u in $users; do
    user=$(echo "$u" | cut -d: -f1)
    home=$(echo "$u" | cut -d: -f2)

    if [[ ! -d "$home" ]]; then
        status="KO"
        details="Home directory missing for user: $user ($home)"
        break
    fi

    owner=$(stat -L -c "%U" "$home")
    perm=$(stat -L -c "%A" "$home")

    # Check ownership
    if [[ "$owner" != "$user" ]]; then
        status="KO"
        details="Home directory $home not owned by $user"
        break
    fi

    # Check group/other write permissions
    if [[ $(echo "$perm" | cut -c6) == "w" || \
          $(echo "$perm" | cut -c9) == "w" ]]; then
        status="KO"
        details="Home directory $home is writable by group or others"
        break
    fi
done


# ---- Output Section (same format as your script) ----

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.2.8" c8
write_col "Configure user home directories" c9
write_col "Ensure local interactive user home directories are configured" c10
write_col "Home directories store user data and configuration files" c11
write_col "Home directories should exist, be owned by the user, and not writable by others" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

# 7.2.9 Ensure local interactive user dot files are secure

non_compliant=""

# Get valid shells (CIS logic)
valid_shells="^($(awk -F/ '$NF != "nologin" {print}' /etc/shells | sed -rn '/^\//{s,/,\\/,g;p}' | paste -s -d '|' -))$"

# Get interactive users
while IFS=: read -r user _ uid gid home shell; do

  [[ "$user" == "root" ]] && continue
  [[ ! "$shell" =~ $valid_shells ]] && continue
  [[ ! -d "$home" ]] && continue

  primary_group=$(id -gn "$user")

  # Scan dot files
  while IFS= read -r -d '' file; do

    filename=$(basename "$file")
    read mode owner group <<< $(stat -Lc '%a %U %G' "$file")

    # -------- Forbidden files --------
    if [[ "$filename" == ".forward" || "$filename" == ".rhost" ]]; then
      non_compliant+=" $user:$file(forbidden)"
      continue
    fi

    # -------- .netrc --------
    if [[ "$filename" == ".netrc" ]]; then
      if [[ "$mode" -gt 600 || "$owner" != "$user" || "$group" != "$primary_group" ]]; then
        non_compliant+=" $user:$file(invalid_netrc)"
      fi
      continue
    fi

    # -------- .bash_history --------
    if [[ "$filename" == ".bash_history" ]]; then
      if [[ "$mode" -gt 600 || "$owner" != "$user" || "$group" != "$primary_group" ]]; then
        non_compliant+=" $user:$file(invalid_bash_history)"
      fi
      continue
    fi

    # -------- Other dot files --------
    if [[ "$mode" -gt 644 || "$owner" != "$user" || "$group" != "$primary_group" ]]; then
      non_compliant+=" $user:$file(invalid_permissions)"
    fi

  done < <(find "$home" -xdev -type f -name ".*" -print0)

done < /etc/passwd

# -------- Decision --------
if [[ -z "$non_compliant" ]]; then
  status="OK"
  details="All local interactive user dot files are secure"
else
  status="KO"
  details="Non-compliant:$non_compliant"
fi

# -------- Sanitize Output --------
details=$(echo "$details" | tr '\r\n,' '   ' | sed 's/[[:space:]]\+/ /g' | cut -c1-200)

# -------- Output --------
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "7.2.9" c8
write_col "Local User and Group Settings" c9
write_col "Ensure local interactive user dot files are secure" c10
write_col "Dot files must not expose security risks" c11
write_col ".forward/.rhost forbidden; permissions must be correct" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

########################Configure authselect########################

#5.3.2.2 Ensure pam_faillock module is enabled

expected_output=(
"/etc/pam.d/password-auth:auth required pam_faillock.so preauth silent"
"/etc/pam.d/password-auth:auth required pam_faillock.so authfail"
"/etc/pam.d/password-auth:account required pam_faillock.so"
"/etc/pam.d/system-auth:auth required pam_faillock.so preauth silent"
"/etc/pam.d/system-auth:auth required pam_faillock.so authfail"
"/etc/pam.d/system-auth:account required pam_faillock.so"
)

grep_output=$(grep -P -- '\bpam_faillock.so\b' /etc/pam.d/{password,system}-auth)

grep_output=`echo $grep_output | tr -s '[:space:]'`

# Check if each expected entry is found in the grep output
for entry in "${expected_output[@]}"; do
    if echo "$grep_output" | grep -q "$entry"; then
		write_col "$customer" c1
		write_col "$custinvid" c2
		write_col "$policy" c3
		write_col "$doc" c4
		write_col "$server" c5
		write_col "$ip" c6
		write_col "$os" c7
		write_col "5.3.2.2" c8
		write_col "Configure authselect" c9
		write_col "Ensure pam_faillock module is enabled" c10
		write_col "The pam_faillock.so module maintains a list of failed authentication attempts per user during a specified interval and locks the account in case there were more than the configure number of consecutive failed authentications" c11
		write_col "Pam_faillock module is enabled" c12
		write_col "Pam_faillock module is enabled Output : Entry found - $entry" c13
		write_col "OK" c14
		write_col "$severity" c15
		write_col "$scandate" c16
    else
		write_col "$customer" c1
		write_col "$custinvid" c2
		write_col "$policy" c3
		write_col "$doc" c4
		write_col "$server" c5
		write_col "$ip" c6
		write_col "$os" c7
		write_col "5.3.2.2" c8
		write_col "Configure authselect" c9
		write_col "Ensure pam_faillock module is enabled" c10
		write_col "The pam_faillock.so module maintains a list of failed authentication attempts per user during a specified interval and locks the account in case there were more than the configure number of consecutive failed authentications" c11
		write_col "Pam_faillock module is enabled" c12
		write_col "Pam_faillock module is not enabled Output : Entry not found - $entry" c13
		write_col "KO" c14
		write_col "$severity" c15
		write_col "$scandate" c16
    fi
done

#5.3.2.3 Ensure pam_pwquality module is enabled

expected_output=(
    "/etc/pam.d/password-auth:password requisite pam_pwquality.so local_users_only"
    "/etc/pam.d/system-auth:password requisite pam_pwquality.so local_users_only"
)

result=$(grep -P -- '\bpam_pwquality\.so\b' /etc/pam.d/{password,system}-auth)

result=`echo $result | tr -s '[:space:]'`

for entry in "${expected_output[@]}"; do
    if echo "$result" | grep -q "$entry"; then
		write_col "$customer" c1
		write_col "$custinvid" c2
		write_col "$policy" c3
		write_col "$doc" c4
		write_col "$server" c5
		write_col "$ip" c6
		write_col "$os" c7
		write_col "5.3.2.3" c8
		write_col "Configure authselect" c9
		write_col "Ensure pam_pwquality module is enabled" c10
		write_col "The pam_pwquality.so module performs password quality checking" c11
		write_col "Pam_pwquality module is enabled" c12
		write_col "Pam_pwquality module is enabled Output : Entry found - $entry" c13
		write_col "OK" c14
		write_col "$severity" c15
		write_col "$scandate" c16
    else
		write_col "$customer" c1
		write_col "$custinvid" c2
		write_col "$policy" c3
		write_col "$doc" c4
		write_col "$server" c5
		write_col "$ip" c6
		write_col "$os" c7
		write_col "5.3.2.3" c8
		write_col "Configure authselect" c9
		write_col "Ensure pam_pwquality module is enabled" c10
		write_col "The pam_pwquality.so module performs password quality checking" c11
		write_col "Pam_pwquality module is enabled" c12
		write_col "Pam_pwquality module is not enabled Output : Entry not found - $entry" c13
		write_col "KO" c14
		write_col "$severity" c15
		write_col "$scandate" c16
    fi
done

# 5.3.2.4 Ensure pam_pwhistory is enabled

{
 l_output=""
 l_output2=""

 files="/etc/pam.d/system-auth /etc/pam.d/password-auth"

 for file in $files; do
   if [[ ! -f "$file" ]]; then
     l_output2="$l_output2 File missing: $file"
   fi
 done

 missing=""

 for file in $files; do
   if [[ -f "$file" ]]; then
     if grep -Pq '\bpam_pwhistory\.so\b' "$file"; then
       l_output="$l_output pam_pwhistory found in $file |"
     else
       missing="$missing $file"
     fi
   fi
 done

 if [[ -n "$missing" ]]; then
   l_output2="$l_output2 pam_pwhistory missing in:$missing"
 fi

 if [[ -z "$l_output2" ]]; then
   status="OK"
   details="$l_output"
 else
   status="KO"
   details="$l_output2"
 fi

 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "5.3.2.4" c8
 write_col "PAM Configuration" c9
 write_col "Ensure pam_pwhistory is enabled" c10
 write_col "Prevent reuse of previous passwords by enforcing password history" c11
 write_col "pam_pwhistory.so must be configured in system-auth and password-auth" c12
 write_col "$details" c13
 write_col "$status" c14
 write_col "$severity" c15
 write_col "$scandate" c16

}

# 5.3.2.5 Ensure pam_unix is enabled

non_compliant=""

files="/etc/pam.d/password-auth /etc/pam.d/system-auth"

# -------- Check pam_unix presence in required sections --------
for file in $files; do

  [[ ! -f "$file" ]] && non_compliant+=" $file(missing)" && continue

  auth_chk=$(grep -P '^\h*auth.*\bpam_unix\.so\b' "$file")
  account_chk=$(grep -P '^\h*account.*\bpam_unix\.so\b' "$file")
  password_chk=$(grep -P '^\h*password.*\bpam_unix\.so\b' "$file")
  session_chk=$(grep -P '^\h*session.*\bpam_unix\.so\b' "$file")

  [[ -z "$auth_chk" ]] && non_compliant+=" $file(auth_missing)"
  [[ -z "$account_chk" ]] && non_compliant+=" $file(account_missing)"
  [[ -z "$password_chk" ]] && non_compliant+=" $file(password_missing)"
  [[ -z "$session_chk" ]] && non_compliant+=" $file(session_missing)"

done

# -------- Decision --------
if [[ -z "$non_compliant" ]]; then
  status="OK"
  details="pam_unix.so is properly configured in all required sections"
else
  status="KO"
  details="Non-compliant:$non_compliant"
fi

# -------- Sanitize Output --------
details=$(echo "$details" | tr '\r\n,' '   ' | sed 's/[[:space:]]\+/ /g' | cut -c1-200)

# -------- Output --------
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.3.2.5" c8
write_col "PAM Configuration" c9
write_col "Ensure pam_unix is enabled" c10
write_col "pam_unix provides standard UNIX authentication" c11
write_col "Must exist in auth, account, password, session sections" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

# 5.3.2.1 Ensure authselect includes required PAM modules

{
 l_output=""
 l_output2=""

 if ! command -v authselect >/dev/null 2>&1; then
   l_output2="authselect is not installed"
 else

 profile=$(head -1 /etc/authselect/authselect.conf 2>/dev/null)

 if [[ -z "$profile" ]]; then
   l_output2="Unable to determine active authselect profile"
 else

   profile_path="/etc/authselect/${profile}"

   if [[ -f "$profile_path/system-auth" && -f "$profile_path/password-auth" ]]; then

     modules_found=$(grep -P -- '\b(pam_pwquality\.so|pam_pwhistory\.so|pam_faillock\.so|pam_unix\.so)\b' \
       "$profile_path"/{system,password}-auth 2>/dev/null)

     missing_modules=""

     for module in pam_pwquality.so pam_pwhistory.so pam_faillock.so pam_unix.so; do
       echo "$modules_found" | grep -q "$module" || missing_modules="$missing_modules $module"
     done

     if [[ -z "$missing_modules" ]]; then
       l_output="All required PAM modules are present in authselect profile ($profile)"
     else
       l_output2="Missing PAM modules:$missing_modules"
     fi

   else
     l_output2="system-auth or password-auth file missing in profile ($profile)"
   fi

 fi
 fi

 if [[ -z "$l_output2" ]]; then
   status="OK"
   details="$l_output"
 else
   status="KO"
   details="$l_output2"
 fi

 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "5.3.2.1" c8
 write_col "PAM Configuration" c9
 write_col "Ensure authselect includes required PAM modules" c10
 write_col "Ensure strong password, history, lockout, and authentication controls are enforced via PAM" c11
 write_col "pam_pwquality, pam_pwhistory, pam_faillock, pam_unix must be present" c12
 write_col "$details" c13
 write_col "$status" c14
 write_col "$severity" c15
 write_col "$scandate" c16

}

############################End######################################

#5.4.2.1 Ensure root is the only UID 0 account

uid0_users=$(awk -F: '($3 == 0) {print $1}' /etc/passwd 2>/dev/null)

count=$(echo "$uid0_users" | wc -l)

if [[ "$count" -eq 1 && "$uid0_users" == "root" ]]; then
  status="OK"
  details="Only root account has UID 0"
else
  status="KO"
  details="Users with UID 0: $(echo $uid0_users | tr '\n' ' ')"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.4.2.1" c8
write_col "Ensure root is the only UID 0 account" c9
write_col "Ensure root is the only UID 0 account" c10
write_col "Only the root user should have UID 0 to prevent unauthorized privilege escalation" c11
write_col "Only root account must have UID 0 in /etc/passwd" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

#5.4.2.2 Ensure root is the only GID 0 account

gid0_users=$(awk -F: '($4 == 0) {print $1}' /etc/passwd 2>/dev/null)

count=$(echo "$gid0_users" | wc -l)

if [[ "$count" -eq 1 && "$gid0_users" == "root" ]]; then
  status="OK"
  details="Only root account has GID 0"
else
  status="KO"
  details="Users with GID 0: $(echo $gid0_users | tr '\n' ' ')"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.4.2.2" c8
write_col "Ensure root is the only GID 0 account" c9
write_col "Ensure root is the only GID 0 account" c10
write_col "Only the root user should belong to the GID 0 group to prevent unauthorized privilege escalation" c11
write_col "Only root account must have GID 0 in /etc/passwd" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

# 5.4.2.3 Ensure only root group has GID 0

{
 l_output=""
 l_output2=""

 file="/etc/group"

 if [[ ! -f "$file" ]]; then
   l_output2="File not found: $file"
 else

   gid0_groups=$(awk -F: '$3=="0"{print $1}' "$file")

   count=$(echo "$gid0_groups" | wc -l)

   if [[ "$count" -eq 1 && "$gid0_groups" == "root" ]]; then
     l_output="Only root group has GID 0"
   else
     l_output2="Non-compliant groups with GID 0: $gid0_groups"
   fi

 fi

 if [[ -z "$l_output2" ]]; then
   status="OK"
   details="$l_output"
 else
   status="KO"
   details="$l_output2"
 fi

 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "5.4.2.3" c8
 write_col "User & Group Management" c9
 write_col "Ensure only root group has GID 0" c10
 write_col "Restrict GID 0 to root to prevent unauthorized privileged access" c11
 write_col "Only root group must have GID 0" c12
 write_col "$details" c13
 write_col "$status" c14
 write_col "$severity" c15
 write_col "$scandate" c16

}

# 5.4.2.4 Ensure root account access is controlled

# Get root password status
passwd_status=$(passwd -S root 2>/dev/null | awk '{print $2}')

# Determine status
if [[ "$passwd_status" == "P" || "$passwd_status" == "L" ]]; then
  status="OK"
  details="Root account password status is valid: $passwd_status"
else
  status="KO"
  details="Root account password status is invalid or not set (Current: $passwd_status)"
fi

# Sanitize output
details=$(echo "$details" | tr '\r\n' ' ' | sed 's/[[:space:]]\+/ /g' | xargs)

# Output to CSV
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.4.2.4" c8
write_col "Ensure root account access is controlled" c9
write_col "Ensure root account access is controlled" c10
write_col "Root account must have a password set or be locked" c11
write_col "Password status must be P (set) or L (locked)" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

#5.4.2.5 Ensure root PATH integrity

root_path=$(sudo -Hiu root env | grep '^PATH=' | cut -d= -f2)

status="OK"
details="Root PATH integrity verified"

IFS=':' read -ra dirs <<< "$root_path"

for dir in "${dirs[@]}"; do

  if [[ -z "$dir" ]]; then
    status="KO"
    details="Empty directory (::) found in root PATH"
    break
  fi

  if [[ "$dir" == "." ]]; then
    status="KO"
    details="Current directory (.) found in root PATH"
    break
  fi

  if [[ ! -d "$dir" ]]; then
    status="KO"
    details="Directory $dir in root PATH does not exist"
    break
  fi

  perms=$(stat -c %A "$dir")
  owner=$(stat -c %U "$dir")

  if [[ "$owner" != "root" ]]; then
    status="KO"
    details="Directory $dir is not owned by root"
    break
  fi

  if [[ "$perms" =~ w ]]; then
    status="KO"
    details="Directory $dir is writable ($perms)"
    break
  fi

done

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.4.2.5" c8
write_col "Ensure root PATH integrity" c9
write_col "Ensure root PATH integrity" c10
write_col "Root PATH must not contain insecure directories to prevent privilege escalation" c11
write_col "All directories in root PATH must be secure and owned by root" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

########################End########################

########################Modules Validation################################

#1.1.1.1 Ensure cramfs kernel module is not available

module="cramfs"
modprobe_conf="/etc/modprobe.d"

blacklist=$(grep -R "^\s*blacklist\s\+$module" $modprobe_conf 2>/dev/null)
install_rule=$(grep -R "^\s*install\s\+$module\s\+/bin/true" $modprobe_conf 2>/dev/null)
loaded=$(lsmod | awk '{print $1}' | grep -x "$module")
available=$(modprobe -n -v $module 2>/dev/null)

if [[ -n "$blacklist" || -n "$install_rule" ]]; then
  status="OK"
  details="cramfs module is blacklisted or disabled via install rule"
elif [[ -z "$available" ]]; then
  status="OK"
  details="cramfs module not present on system"
elif [[ -n "$loaded" ]]; then
  status="KO"
  details="cramfs module is currently loaded"
else
  status="KO"
  details="cramfs module is available and can be loaded"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.1.1" c8
write_col "Ensure cramfs kernel module is not available" c9
write_col "Ensure cramfs kernel module is not available" c10
write_col "cramfs filesystem module should be disabled to reduce the system attack surface" c11
write_col "Disable filesystem type" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

# 1.1.1.2 Ensure freevxfs kernel module is not available

module="freevxfs"
modprobe_conf="/etc/modprobe.d"

# Check if module exists in system paths
exists=$(find /lib/modules/$(uname -r)/kernel/fs -type d -name "$module" 2>/dev/null)

# Check if module is currently loaded
loaded=$(lsmod | awk '{print $1}' | grep -x "$module")

# Check modprobe configuration (blacklist or install rule)
modprobe_check=$(modprobe --showconfig 2>/dev/null | grep -P -- "\b(install|blacklist)\s+$module\b")

# Determine status
if [[ -z "$exists" ]]; then
  status="OK"
  details="freevxfs module not present on system (built-in or absent)"
elif [[ -n "$loaded" ]]; then
  status="KO"
  details="freevxfs module is currently loaded"
elif echo "$modprobe_check" | grep -q "blacklist" && \
     echo "$modprobe_check" | grep -Eq "install\s+$module\s+/(bin/true|bin/false)"; then
  status="OK"
  details="freevxfs module is disabled (blacklisted and install rule set)"
else
  status="KO"
  details="freevxfs module is available and not properly disabled"
fi

# Output to CSV (existing function assumed)
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.1.2" c8
write_col "Ensure freevxfs kernel module is not available" c9
write_col "Ensure freevxfs kernel module is not available" c10
write_col "freevxfs filesystem module should be disabled to reduce the system attack surface" c11
write_col "Disable filesystem type" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

# 1.1.1.3 Ensure hfs kernel module is not available

module="hfs"

# Check if module exists in system paths (CIS method)
exists=$(find /lib/modules/$(uname -r)/kernel/fs -type d -name "$module" 2>/dev/null)

# Check if module is currently loaded
loaded=$(lsmod | awk '{print $1}' | grep -x "$module")

# Check modprobe configuration (blacklist + install rule)
modprobe_check=$(modprobe --showconfig 2>/dev/null | grep -P -- "\b(install|blacklist)\s+$module\b")

# Determine status
if [[ -z "$exists" ]]; then
  status="OK"
  details="hfs module not present on system (built-in or absent)"
elif [[ -n "$loaded" ]]; then
  status="KO"
  details="hfs module is currently loaded"
elif echo "$modprobe_check" | grep -q "blacklist" && \
     echo "$modprobe_check" | grep -Eq "install\s+$module\s+/(bin/true|bin/false)"; then
  status="OK"
  details="hfs module is disabled (blacklisted and install rule set)"
else
  status="KO"
  details="hfs module is available and not properly disabled"
fi

# Output to CSV (existing function assumed)
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.1.3" c8
write_col "Ensure hfs kernel module is not available" c9
write_col "Ensure hfs kernel module is not available" c10
write_col "hfs filesystem module should be disabled to reduce the system attack surface" c11
write_col "Disable filesystem type" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

# 1.1.1.4 Ensure hfsplus kernel module is not available

module="hfsplus"

# Check if module exists (CIS method)
exists=$(find /lib/modules/$(uname -r)/kernel/fs -type d -name "$module" 2>/dev/null)

# Check if module is currently loaded
loaded=$(lsmod | awk '{print $1}' | grep -x "$module")

# Check modprobe configuration (blacklist + install rule)
modprobe_check=$(modprobe --showconfig 2>/dev/null | grep -P -- "\b(install|blacklist)\s+$module\b")

# Determine status
if [[ -z "$exists" ]]; then
  status="OK"
  details="hfsplus module not present on system (built-in or absent)"
elif [[ -n "$loaded" ]]; then
  status="KO"
  details="hfsplus module is currently loaded"
elif echo "$modprobe_check" | grep -q "blacklist" && \
     echo "$modprobe_check" | grep -Eq "install\s+$module\s+/(bin/true|bin/false)"; then
  status="OK"
  details="hfsplus module is disabled (blacklisted and install rule set)"
else
  status="KO"
  details="hfsplus module is available and not properly disabled"
fi

# Output to CSV
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.1.4" c8
write_col "Ensure hfsplus kernel module is not available" c9
write_col "Ensure hfsplus kernel module is not available" c10
write_col "hfsplus filesystem module should be disabled to reduce the system attack surface" c11
write_col "Disable filesystem type" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

# 1.1.1.5 Ensure jffs2 kernel module is not available

module="jffs2"

# Check if module exists (CIS method)
exists=$(find /lib/modules/$(uname -r)/kernel/fs -type d -name "$module" 2>/dev/null)

# Check if module is currently loaded
loaded=$(lsmod | awk '{print $1}' | grep -x "$module")

# Check modprobe configuration (blacklist + install rule)
modprobe_check=$(modprobe --showconfig 2>/dev/null | grep -P -- "\b(install|blacklist)\s+$module\b")

# Determine status
if [[ -z "$exists" ]]; then
  status="OK"
  details="jffs2 module not present on system (built-in or absent)"
elif [[ -n "$loaded" ]]; then
  status="KO"
  details="jffs2 module is currently loaded"
elif echo "$modprobe_check" | grep -q "blacklist" && \
     echo "$modprobe_check" | grep -Eq "install\s+$module\s+/(bin/true|bin/false)"; then
  status="OK"
  details="jffs2 module is disabled (blacklisted and install rule set)"
else
  status="KO"
  details="jffs2 module is available and not properly disabled"
fi

# Output to CSV
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.1.5" c8
write_col "Ensure jffs2 kernel module is not available" c9
write_col "Ensure jffs2 kernel module is not available" c10
write_col "jffs2 filesystem module should be disabled to reduce the system attack surface" c11
write_col "Disable filesystem type" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

# 1.1.1.9 Ensure firewire-core kernel module is not available

{
 l_output=""
 l_output2=""
 module_pattern="firewire(_|-)core"

 mod_exists="no"

 for path in /usr/lib/modules/*/kernel/drivers /lib/modules/*/kernel/drivers; do
   if [ -d "$path/firewire" ] && [ -n "$(ls -A "$path/firewire" 2>/dev/null)" ]; then
     mod_exists="yes"
     l_output="$l_output firewire module exists in $path"
   fi
 done

 # If module not present → PASS
 if [[ "$mod_exists" == "no" ]]; then
   status="OK"
   details="firewire-core module not present on system"

 else

   loaded=$(lsmod | grep -P "$module_pattern")

   if [[ -n "$loaded" ]]; then
     l_output2="$l_output2 firewire-core module is currently loaded"
   else
     l_output="$l_output Module is not loaded"
   fi

   mod_conf=$(modprobe --showconfig 2>/dev/null)

   blacklist=$(echo "$mod_conf" | grep -P "^\s*blacklist\s+firewire(_|-)?core")
   install_rule=$(echo "$mod_conf" | grep -P "^\s*install\s+firewire(_|-)?core\s+/bin/(true|false)")

   if [[ -n "$blacklist" && -n "$install_rule" ]]; then
     l_output="$l_output | Module is properly disabled (blacklist + install rule)"
   else
     l_output2="$l_output2 firewire-core is not properly disabled (missing blacklist or install rule)"
   fi

   if [[ -z "$l_output2" ]]; then
     status="OK"
     details="$l_output"
   else
     status="KO"
     details="$l_output2"
   fi

 fi

 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "1.1.1.9" c8
 write_col "Kernel Module Hardening" c9
 write_col "Ensure firewire-core kernel module is not available" c10
 write_col "Disable firewire to prevent DMA-based attacks" c11
 write_col "Disable filesystem type" c12
 write_col "$details" c13
 write_col "$status" c14
 write_col "$severity" c15
 write_col "$scandate" c16

}

########################END#####################################

########################Configure shadow password suite parameters########################

#5.4.1.1 Ensure password expiration is configured

max_days=$(grep -Ei '^\s*PASS_MAX_DAYS' /etc/login.defs | awk '{print $2}')

non_compliant_users=""

while IFS=: read -r user _ _ _ max _ _; do
  uid=$(id -u "$user" 2>/dev/null)

  # Skip system users
  [[ "$uid" -lt 1000 ]] && continue

  if [[ -z "$max" || "$max" -gt 365 ]]; then
    non_compliant_users+="$user(max_days=$max) "
  fi
done < /etc/shadow

if [[ -n "$max_days" && "$max_days" -le 365 && -z "$non_compliant_users" ]]; then
  status="OK"
  details="PASS_MAX_DAYS=$max_days and all users compliant"
else
  status="KO"
  details="PASS_MAX_DAYS=$max_days Non-compliant users: ${non_compliant_users:-None}"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.4.1.1" c8
write_col "Ensure password expiration is configured" c9
write_col "Ensure password expiration is configured" c10
write_col "Password expiration reduces risk of long-term compromise" c11
write_col "PASS_MAX_DAYS <= 365 and applied to all users" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

#5.4.1.3 Ensure password expiration warning days is configured

warn_days=$(grep -Ei '^\s*PASS_WARN_AGE' /etc/login.defs | awk '{print $2}')

non_compliant_users=""

while IFS=: read -r user _ _ _ _ _ warn _; do
  uid=$(id -u "$user" 2>/dev/null)

  # Skip system users
  [[ "$uid" -lt 1000 ]] && continue

  if [[ -z "$warn" || "$warn" -lt 7 ]]; then
    non_compliant_users+="$user(warn_days=$warn) "
  fi
done < /etc/shadow

if [[ -n "$warn_days" && "$warn_days" -ge 7 && -z "$non_compliant_users" ]]; then
  status="OK"
  details="PASS_WARN_AGE=$warn_days and all users compliant"
else
  status="KO"
  details="PASS_WARN_AGE=$warn_days Non-compliant users: ${non_compliant_users:-None}"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.4.1.3" c8
write_col "Ensure password expiration warning days is configured" c9
write_col "Ensure password expiration warning days is configured" c10
write_col "Users should get warning before password expiry" c11
write_col "PASS_WARN_AGE >= 7 and applied to all users" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

# 5.4.1.4 Ensure strong password hashing algorithm is configured

{
 l_output=""
 l_output2=""

 file="/etc/login.defs"

 if [[ ! -f "$file" ]]; then
   l_output2="File not found: $file"
 else

   encrypt_method=$(grep -Pi '^\h*ENCRYPT_METHOD\h+(SHA512|YESCRYPT)\b' "$file")

   if [[ -n "$encrypt_method" ]]; then
     l_output="Valid ENCRYPT_METHOD found: $encrypt_method"
   else

     current=$(grep -Pi '^\h*ENCRYPT_METHOD' "$file")

     if [[ -n "$current" ]]; then
       l_output2="Invalid ENCRYPT_METHOD configured: $current"
     else
       l_output2="ENCRYPT_METHOD not set in $file"
     fi

   fi

 fi

 if [[ -z "$l_output2" ]]; then
   status="OK"
   details="$l_output"
 else
   status="KO"
   details="$l_output2"
 fi

 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "5.4.1.4" c8
 write_col "Password Policy" c9
 write_col "Ensure strong password hashing algorithm is configured" c10
 write_col "Use strong hashing algorithms to protect stored passwords from cracking attacks" c11
 write_col "ENCRYPT_METHOD must be SHA512 or YESCRYPT" c12
 write_col "$details" c13
 write_col "$status" c14
 write_col "$severity" c15
 write_col "$scandate" c16

}

# 5.4.1.5 Ensure INACTIVE password lock is configured

{
 l_output=""
 l_output2=""

 default_inactive=$(useradd -D 2>/dev/null | grep INACTIVE | cut -d= -f2)

 if [[ -z "$default_inactive" ]]; then
   l_output2="Unable to determine default INACTIVE value"
 elif [[ "$default_inactive" -le 45 && "$default_inactive" -ge 0 ]]; then
   l_output="$l_output Default INACTIVE is compliant ($default_inactive days) |"
 else
   l_output2="$l_output2 Default INACTIVE is non-compliant ($default_inactive days)"
 fi

 invalid_users=$(awk -F: '($2~/^\$.+\$/) {if($7 > 45 || $7 < 0) print $1 ":" $7}' /etc/shadow)

 if [[ -n "$invalid_users" ]]; then
   l_output2="$l_output2 Users with invalid INACTIVE values: $invalid_users"
 else
   l_output="$l_output All users INACTIVE values are compliant"
 fi

 if [[ -z "$l_output2" ]]; then
   status="OK"
   details="$l_output"
 else
   status="KO"
   details="$l_output2"
 fi

 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "5.4.1.5" c8
 write_col "Password Policy" c9
 write_col "Ensure inactive password lock is configured" c10
 write_col "Accounts must be disabled after password expiration to reduce risk of unused active accounts" c11
 write_col "INACTIVE must be set to 45 days or less for all users" c12
 write_col "$details" c13
 write_col "$status" c14
 write_col "$severity" c15
 write_col "$scandate" c16

}

#############Append Script-1###########Configure Cron########################

#2.4.1.1 Ensure cron daemon is enabled and active

if [[ $(rpm -q cronie) != "package cronie is not installed" ]]; then
if [[ $(systemctl is-enabled crond) == "enabled" ]] && [[ $(systemctl is-active crond) == "active" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.4.1.1" c8
write_col "Configure cron" c9
write_col "Ensure cron daemon is enabled and active" c10
write_col "The cron daemon is used to execute batch jobs on the system" c11
write_col "Crond service is enabled" c12
write_col "Crond service is enabled and active Output : Service_enabled ? = $(systemctl is-enabled crond) Service_active ? = $(systemctl is-active crond)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
elif [[ $(systemctl is-enabled crond) == "enabled" ]] && [[ $(systemctl is-active crond) != "active" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.4.1.1" c8
write_col "Configure cron" c9
write_col "Ensure cron daemon is enabled and active" c10
write_col "The cron daemon is used to execute batch jobs on the system" c11
write_col "Crond service is enabled" c12
write_col "Crond service is enabled however not active Output : Service_enabled ? = $(systemctl is-enabled crond) Service_active ? = $(systemctl is-active crond)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
elif [[ $(systemctl is-enabled crond) != "enabled" ]] && [[ $(systemctl is-active crond) == "active" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.4.1.1" c8
write_col "Configure cron" c9
write_col "Ensure cron daemon is enabled and active" c10
write_col "The cron daemon is used to execute batch jobs on the system" c11
write_col "Crond service is enabled" c12
write_col "Crond service is active however not enabled Output : Service_enabled ? = $(systemctl is-enabled crond) Service_active ? = $(systemctl is-active crond)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.4.1.1" c8
write_col "Configure cron" c9
write_col "Ensure cron daemon is enabled and active" c10
write_col "The cron daemon is used to execute batch jobs on the system" c11
write_col "Crond service is enabled" c12
write_col "Crond service is not active and not enabled Output : Service_enabled ? = $(systemctl is-enabled crond) Service_active ? = $(systemctl is-active crond)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.4.1.1" c8
write_col "Configure cron" c9
write_col "Ensure cron daemon is enabled and active" c10
write_col "The cron daemon is used to execute batch jobs on the system" c11
write_col "Crond service is enabled" c12
write_col "Package cronie is not installed Output : $(rpm -q cronie)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#2.4.1.2 Ensure access to /etc/crontab is configured

File="/etc/crontab"

if [ -e $File ]; then

file_permission=`stat -c %a $File`
owner=`stat -c %u $File`
group=`stat -c %g $File`

if [[ "$file_permission" == "600" || "$file_permission" == "400" || "$file_permission" == "0" ]] && [[ "$owner" == "0" ]] && [[ "$group" == "0" ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.4.1.2" c8
write_col "Configure cron" c9
write_col "Ensure access to /etc/crontab is configured" c10
write_col "The /etc/crontab file is used by cron to control its own jobs" c11
write_col "Permissions of 0600 and ownership of 0:0" c12
write_col "File : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.4.1.2" c8
write_col "Configure cron" c9
write_col "Ensure access to /etc/crontab is configured" c10
write_col "The /etc/crontab file is used by cron to control its own jobs" c11
write_col "Permissions of 0600 and ownership of 0:0" c12
write_col "File : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.4.1.2" c8
write_col "Configure cron" c9
write_col "Ensure access to /etc/crontab is configured" c10
write_col "The /etc/crontab file is used by cron to control its own jobs" c11
write_col "Permissions of 0600 and ownership of 0:0" c12
write_col "File $File does not exist on the server $server" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#2.4.1.3 Ensure permissions on /etc/cron.hourly are configured

File="/etc/cron.hourly/"

if [ -e $File ]; then

file_permission=`stat -c %a $File`
owner=`stat -c %u $File`
group=`stat -c %g $File`

if [[ "$file_permission" == "700" || "$file_permission" == "600" || "$file_permission" == "400" || "$file_permission" == "0" ]] && [[ "$owner" == "0" ]] && [[ "$group" == "0" ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.4.1.3" c8
write_col "Configure cron" c9
write_col "Ensure access to /etc/cron.hourly is configured" c10
write_col "This directory contains system cron jobs that need to run on an hourly basis" c11
write_col "Permissions of 0700 and ownership of 0:0" c12
write_col "Directory : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.4.1.3" c8
write_col "Configure cron" c9
write_col "Ensure access to /etc/cron.hourly is configured" c10
write_col "This directory contains system cron jobs that need to run on an hourly basis" c11
write_col "Permissions of 0700 and ownership of 0:0" c12
write_col "Directory : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.4.1.3" c8
write_col "Configure cron" c9
write_col "Ensure access to /etc/cron.hourly is configured" c10
write_col "This directory contains system cron jobs that need to run on an hourly basis" c11
write_col "Permissions of 0700 and ownership of 0:0" c12
write_col "Directory $File does not exist on the server $server" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#2.4.1.4 Ensure access to /etc/cron.daily is configured

File="/etc/cron.daily/"

if [ -e $File ]; then

file_permission=`stat -c %a $File`
owner=`stat -c %u $File`
group=`stat -c %g $File`

if [[ "$file_permission" == "700" || "$file_permission" == "600" || "$file_permission" == "400" || "$file_permission" == "0" ]] && [[ "$owner" == "0" ]] && [[ "$group" == "0" ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.4.1.4" c8
write_col "Configure cron" c9
write_col "Ensure access to /etc/cron.daily is configured" c10
write_col "The /etc/cron.daily directory contains system cron jobs that need to run on an daily basis" c11
write_col "Permissions of 0700 and ownership of 0:0" c12
write_col "Directory : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.4.1.4" c8
write_col "Configure cron" c9
write_col "Ensure access to /etc/cron.daily is configured" c10
write_col "The /etc/cron.daily directory contains system cron jobs that need to run on an daily basis" c11
write_col "Permissions of 0700 and ownership of 0:0" c12
write_col "Directory : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.4.1.4" c8
write_col "Configure cron" c9
write_col "Ensure access to /etc/cron.daily is configured" c10
write_col "The /etc/cron.daily directory contains system cron jobs that need to run on an daily basis" c11
write_col "Permissions of 0700 and ownership of 0:0" c12
write_col "Directory $File does not exist on the server $server" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#2.4.1.5 Ensure access to /etc/cron.weekly is configured

File="/etc/cron.weekly/"

if [ -e $File ]; then

file_permission=`stat -c %a $File`
owner=`stat -c %u $File`
group=`stat -c %g $File`

if [[ "$file_permission" == "700" || "$file_permission" == "600" || "$file_permission" == "400" || "$file_permission" == "0" ]] && [[ "$owner" == "0" ]] && [[ "$group" == "0" ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.4.1.5" c8
write_col "Configure cron" c9
write_col "Ensure access to /etc/cron.weekly is configured" c10
write_col "The /etc/cron.weekly directory contains system cron jobs that need to run on a weekly basis" c11
write_col "Permissions of 0700 and ownership of 0:0" c12
write_col "Directory : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.4.1.5" c8
write_col "Configure cron" c9
write_col "Ensure access to /etc/cron.weekly is configured" c10
write_col "The /etc/cron.weekly directory contains system cron jobs that need to run on a weekly basis" c11
write_col "Permissions of 0700 and ownership of 0:0" c12
write_col "Directory : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.4.1.5" c8
write_col "Configure cron" c9
write_col "Ensure access to /etc/cron.weekly is configured" c10
write_col "The /etc/cron.weekly directory contains system cron jobs that need to run on a weekly basis" c11
write_col "Permissions of 0700 and ownership of 0:0" c12
write_col "Directory $File does not exist on the server $server" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#2.4.1.6 Ensure access to /etc/cron.monthly is configured

File="/etc/cron.monthly/"

if [ -e $File ]; then

file_permission=`stat -c %a $File`
owner=`stat -c %u $File`
group=`stat -c %g $File`

if [[ "$file_permission" == "700" || "$file_permission" == "600" || "$file_permission" == "400" || "$file_permission" == "0" ]] && [[ "$owner" == "0" ]] && [[ "$group" == "0" ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.4.1.6" c8
write_col "Configure cron" c9
write_col "Ensure access to /etc/cron.monthly is configured" c10
write_col "The /etc/cron.monthly directory contains system cron jobs that need to run on a monthly basis" c11
write_col "Permissions of 0700 and ownership of 0:0" c12
write_col "Directory : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.4.1.6" c8
write_col "Configure cron" c9
write_col "Ensure access to /etc/cron.monthly is configured" c10
write_col "The /etc/cron.monthly directory contains system cron jobs that need to run on a monthly basis" c11
write_col "Permissions of 0700 and ownership of 0:0" c12
write_col "Directory : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.4.1.6" c8
write_col "Configure cron" c9
write_col "Ensure access to /etc/cron.monthly is configured" c10
write_col "The /etc/cron.monthly directory contains system cron jobs that need to run on a monthly basis" c11
write_col "Permissions of 0700 and ownership of 0:0" c12
write_col "Directory $File does not exist on the server $server" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#2.4.1.8 Ensure access to /etc/cron.d is configured

File="/etc/cron.d/"

if [ -e $File ]; then

file_permission=`stat -c %a $File`
owner=`stat -c %u $File`
group=`stat -c %g $File`

if [[ "$file_permission" == "700" || "$file_permission" == "600" || "$file_permission" == "400" || "$file_permission" == "0" ]] && [[ "$owner" == "0" ]] && [[ "$group" == "0" ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.4.1.8" c8
write_col "Configure cron" c9
write_col "Ensure access to /etc/cron.d is configured" c10
write_col "The /etc/cron.d directory contains system cron jobs that need to run in a similar manner to the hourly daily weekly and monthly jobs from /etc/crontab but require more granular control as to when they run" c11
write_col "Permissions of 0700 and ownership of 0:0" c12
write_col "Directory : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.4.1.8" c8
write_col "Configure cron" c9
write_col "Ensure access to /etc/cron.d is configured" c10
write_col "The /etc/cron.d directory contains system cron jobs that need to run in a similar manner to the hourly daily weekly and monthly jobs from /etc/crontab but require more granular control as to when they run" c11
write_col "Permissions of 0700 and ownership of 0:0" c12
write_col "Directory : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.4.1.8" c8
write_col "Configure cron" c9
write_col "Ensure access to /etc/cron.d is configured" c10
write_col "The /etc/cron.d directory contains system cron jobs that need to run in a similar manner to the hourly daily weekly and monthly jobs from /etc/crontab but require more granular control as to when they run" c11
write_col "Permissions of 0700 and ownership of 0:0" c12
write_col "Directory $File does not exist on the server $server" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#2.4.1.7 Ensure access to /etc/cron.yearly is configured

dir="/etc/cron.yearly"

if [[ ! -d "$dir" ]]; then
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "2.4.1.7" c8
  write_col "Ensure access to /etc/cron.yearly is configured" c9
  write_col "Ensure access to /etc/cron.yearly is configured" c10
  write_col "/etc/cron.yearly must be protected from unauthorized access to prevent execution of malicious scheduled jobs" c11
  write_col "/etc/cron.yearly should be owned by root:root and have permissions 700 or more restrictive" c12
  write_col "Directory not found Output : /etc/cron.yearly does not exist" c13
  write_col "KO" c14
  write_col "$severity" c15
  write_col "$scandate" c16
else
  perm=$(stat -Lc "%a" "$dir")
  owner=$(stat -Lc "%U" "$dir")
  group=$(stat -Lc "%G" "$dir")

  u=$((perm / 100))
  g=$(((perm / 10) % 10))
  o=$((perm % 10))

  if [[ "$owner" == "root" && "$group" == "root" && "$perm" -le 700 && "$g" -eq 0 && "$o" -eq 0 ]]; then
    write_col "$customer" c1
    write_col "$custinvid" c2
    write_col "$policy" c3
    write_col "$doc" c4
    write_col "$server" c5
    write_col "$ip" c6
    write_col "$os" c7
    write_col "2.4.1.7" c8
    write_col "Ensure access to /etc/cron.yearly is configured" c9
    write_col "Ensure access to /etc/cron.yearly is configured" c10
    write_col "/etc/cron.yearly must be protected from unauthorized access to prevent execution of malicious scheduled jobs" c11
    write_col "/etc/cron.yearly should be owned by root:root and have permissions 700 or more restrictive" c12
    write_col "Permissions correctly set Output : owner=$owner group=$group mode=$perm" c13
    write_col "OK" c14
    write_col "$severity" c15
    write_col "$scandate" c16
  else
    write_col "$customer" c1
    write_col "$custinvid" c2
    write_col "$policy" c3
    write_col "$doc" c4
    write_col "$server" c5
    write_col "$ip" c6
    write_col "$os" c7
    write_col "2.4.1.7" c8
    write_col "Ensure access to /etc/cron.yearly is configured" c9
    write_col "Ensure access to /etc/cron.yearly is configured" c10
    write_col "/etc/cron.yearly must be protected from unauthorized access to prevent execution of malicious scheduled jobs" c11
    write_col "/etc/cron.yearly should be owned by root:root and have permissions 700 or more restrictive" c12
    write_col "Permissions NOT correctly set Output : owner=$owner group=$group mode=$perm" c13
    write_col "KO" c14
    write_col "$severity" c15
    write_col "$scandate" c16
  fi
fi

# 2.4.1.9 Ensure access to crontab is configured

{
 l_output=""
 l_output2=""

 if rpm -q cronie &>/dev/null; then

   if [[ -f /etc/cron.allow ]]; then
     perm=$(stat -Lc "%a" /etc/cron.allow)
     owner=$(stat -Lc "%U" /etc/cron.allow)
     group=$(stat -Lc "%G" /etc/cron.allow)

     if [[ "$perm" -le 640 && "$owner" == "root" && ( "$group" == "root" || "$group" == "crontab" ) ]]; then
       l_output="$l_output cron.allow properly configured (perm=$perm owner=$owner group=$group)"
     else
       l_output2="$l_output2 cron.allow incorrect (perm=$perm owner=$owner group=$group)"
     fi
   else
     l_output2="$l_output2 cron.allow file missing"
   fi

   if [[ -f /etc/cron.deny ]]; then
     perm=$(stat -Lc "%a" /etc/cron.deny)
     owner=$(stat -Lc "%U" /etc/cron.deny)
     group=$(stat -Lc "%G" /etc/cron.deny)

     if [[ "$perm" -le 640 && "$owner" == "root" && ( "$group" == "root" || "$group" == "crontab" ) ]]; then
       l_output="$l_output | cron.deny properly configured"
     else
       l_output2="$l_output2 cron.deny incorrect (perm=$perm owner=$owner group=$group)"
     fi
   else
     l_output="$l_output | cron.deny not present (acceptable)"
   fi

   if [[ -z "$l_output2" ]]; then
     status="OK"
   else
     status="KO"
   fi

 else
   status="OK"
   l_output="cron not installed - Not Applicable"
 fi

 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "2.4.1.9" c8
 write_col "Cron Configuration" c9
 write_col "Ensure access to crontab is configured" c10
 write_col "Restrict cron usage to authorized users only" c11
 write_col "/etc/cron.allow must exist and be secure; cron.deny must be absent or secure" c12

 if [[ "$status" == "OK" ]]; then
   write_col "$l_output" c13
   write_col "OK" c14
 else
   write_col "$l_output2" c13
   write_col "KO" c14
 fi

 write_col "$severity" c15
 write_col "$scandate" c16

}

#2.4.2.1 Ensure access to at is configured

allow_file="/etc/at.allow"
deny_file="/etc/at.deny"

if [[ -f "$allow_file" && ! -f "$deny_file" ]]; then
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "2.4.2.1" c8
  write_col "Ensure access to at is configured" c9
  write_col "Ensure access to at is configured" c10
  write_col "Access to the at command must be restricted to authorized users to prevent unauthorized scheduled job execution" c11
  write_col "/etc/at.allow must exist and /etc/at.deny must not exist" c12
  write_col "Access correctly restricted Output : at.allow present and at.deny absent" c13
  write_col "OK" c14
  write_col "$severity" c15
  write_col "$scandate" c16
else
  status_detail=""

  if [[ ! -f "$allow_file" ]]; then
    status_detail="at.allow missing"
  fi

  if [[ -f "$deny_file" ]]; then
    status_detail="$status_detail at.deny present"
  fi

  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "2.4.2.1" c8
  write_col "Ensure access to at is configured" c9
  write_col "Ensure access to at is configured" c10
  write_col "Access to the at command must be restricted to authorized users to prevent unauthorized scheduled job execution" c11
  write_col "/etc/at.allow must exist and /etc/at.deny must not exist" c12
  write_col "Access NOT correctly restricted Output : $status_detail" c13
  write_col "KO" c14
  write_col "$severity" c15
  write_col "$scandate" c16
fi

########################End########################

########################Configure SSH Server########################

#5.1.22 Ensure sshd PermitRootLogin is disabled

if [[ $(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep permitrootlogin) == "permitrootlogin no" ]] && [[ $(grep -Pis '^\h*PermitRootLogin\h+"?(yes|prohibit-password|forced-commands-only)"?\b' /etc/ssh/sshd_config /etc/ssh/sshd_config.d/*.conf | wc -l) -eq "0" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.1.22" c8
write_col "Configure SSH Server" c9
write_col "Ensure sshd PermitRootLogin is disabled" c10
write_col "The PermitRootLogin parameter specifies if the root user can log in using SSH the default is prohibit-password" c11
write_col "File /etc/ssh/sshd_config contains PermitRootLogin no" c12
write_col "$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep permitrootlogin)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.1.22" c8
write_col "Configure SSH Server" c9
write_col "Ensure sshd PermitRootLogin is disabled" c10
write_col "The PermitRootLogin parameter specifies if the root user can log in using SSH the default is prohibit-password" c11
write_col "File /etc/ssh/sshd_config contains PermitRootLogin no" c12
write_col "$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep permitrootlogin)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#5.1.12 Ensure sshd HostbasedAuthentication is disabled

if [[ $(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep hostbasedauthentication) == "hostbasedauthentication no" ]] && [[ $(grep -Pis '^\h*HostbasedAuthentication\h+"?yes"?\b' /etc/ssh/sshd_config /etc/ssh/sshd_config.d/*.conf | wc -l) -eq "0" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.1.12" c8
write_col "Configure SSH Server" c9
write_col "Ensure sshd HostbasedAuthentication is disabled" c10
write_col "The HostbasedAuthentication parameter specifies if authentication is allowed through hosts via the user of .rhosts or /etc/hosts.equiv along with successful public key client host authentication" c11
write_col "File /etc/ssh/sshd_config contains HostbasedAuthentication no" c12
write_col "$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep hostbasedauthentication)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.1.12" c8
write_col "Configure SSH Server" c9
write_col "Ensure sshd HostbasedAuthentication is disabled" c10
write_col "The HostbasedAuthentication parameter specifies if authentication is allowed through hosts via the user of .rhosts or /etc/hosts.equiv along with successful public key client host authentication" c11
write_col "File /etc/ssh/sshd_config contains HostbasedAuthentication no" c12
write_col "$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep hostbasedauthentication)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#5.1.21 Ensure sshd PermitEmptyPasswords is disabled

if [[ $(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep permitemptypasswords) == "permitemptypasswords no" ]] && [[ $(grep -Pis '^\h*PermitEmptyPasswords\h+"?yes\b' /etc/ssh/sshd_config /etc/ssh/sshd_config.d/*.conf | wc -l) -eq "0" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.1.21" c8
write_col "Configure SSH Server" c9
write_col "Ensure sshd PermitEmptyPasswords is disabled" c10
write_col "The PermitEmptyPasswords parameter specifies if the SSH server allows login to accounts with empty password strings" c11
write_col "File /etc/ssh/sshd_config contains PermitEmptyPasswords no" c12
write_col "$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep permitemptypasswords)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.1.21" c8
write_col "Configure SSH Server" c9
write_col "Ensure sshd PermitEmptyPasswords is disabled" c10
write_col "The PermitEmptyPasswords parameter specifies if the SSH server allows login to accounts with empty password strings" c11
write_col "File /etc/ssh/sshd_config contains PermitEmptyPasswords no" c12
write_col "$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep permitemptypasswords)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#5.1.23 Ensure sshd PermitUserEnvironment is disabled

if [[ $(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep permituserenvironment) == "permituserenvironment no" ]] && [[ $(grep -Pis '^\h*PermitUserEnvironment\h+"?yes"?\b' /etc/ssh/sshd_config /etc/ssh/sshd_config.d/*.conf | wc -l) -eq "0" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.1.23" c8
write_col "Configure SSH Server" c9
write_col "Ensure sshd PermitUserEnvironment is disabled" c10
write_col "The PermitUserEnvironment option allows users to present environment options to the SSH daemon" c11
write_col "File /etc/ssh/sshd_config contains PermitUserEnvironment no" c12
write_col "$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep permituserenvironment)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.1.23" c8
write_col "Configure SSH Server" c9
write_col "Ensure sshd PermitUserEnvironment is disabled" c10
write_col "The PermitUserEnvironment option allows users to present environment options to the SSH daemon" c11
write_col "File /etc/ssh/sshd_config contains PermitUserEnvironment no" c12
write_col "$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep permituserenvironment)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#5.1.13 Ensure sshd IgnoreRhosts is enabled

if [[ $(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep ignorerhosts) == "ignorerhosts yes" ]] && [[ $(grep -Pis '^\h*ignorerhosts\h+"?no"?\b' /etc/ssh/sshd_config /etc/ssh/sshd_config.d/*.conf | wc -l) -eq "0" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.1.13" c8
write_col "Configure SSH Server" c9
write_col "Ensure sshd IgnoreRhosts is enabled" c10
write_col "The IgnoreRhosts parameter specifies that .rhosts and .shosts files will not be used in RhostsRSAAuthentication or HostbasedAuthentication" c11
write_col "File /etc/ssh/sshd_config contains IgnoreHosts yes" c12
write_col "$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep ignorerhosts)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.1.13" c8
write_col "Configure SSH Server" c9
write_col "Ensure sshd IgnoreRhosts is enabled" c10
write_col "The IgnoreRhosts parameter specifies that .rhosts and .shosts files will not be used in RhostsRSAAuthentication or HostbasedAuthentication" c11
write_col "File /etc/ssh/sshd_config contains IgnoreHosts yes" c12
write_col "$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep ignorerhosts)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

# 5.1.7 Ensure SSH Banner is configured

{
 l_output=""
 l_output2=""

 source /etc/crypto-policies/back-ends/opensshserver.config 2>/dev/null
 source /etc/sysconfig/sshd 2>/dev/null

 banner_file=$(sshd -T $OPTIONS $CRYPTO_POLICY 2>/dev/null | awk '$1=="banner" {print $2}')

 if [[ -n "$banner_file" && "$banner_file" != "none" ]]; then
   l_output="$l_output Banner is configured: $banner_file"
 else
   l_output2="$l_output2 Banner is not configured"
 fi

 if [[ -n "$banner_file" && -f "$banner_file" ]]; then
   l_output="$l_output | Banner file exists"
 else
   l_output2="$l_output2 Banner file does not exist"
 fi

 if [[ -f "$banner_file" ]]; then

   os_name=$(grep '^ID=' /etc/os-release | cut -d= -f2 | tr -d '"')

   leak_check=$(grep -Psi -- "(\\\v|\\\r|\\\m|\\\s|\b${os_name}\b)" "$banner_file")

   if [[ -z "$leak_check" ]]; then
     l_output="$l_output | Banner content is valid (no information leakage)"
   else
     l_output2="$l_output2 Banner contains prohibited or sensitive information"
   fi

 fi

 if [[ -z "$l_output2" ]]; then
   status="OK"
   details="$l_output"
 else
   status="KO"
   details="$l_output2"
 fi

 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "5.1.7" c8
 write_col "SSH Configuration" c9
 write_col "Ensure SSH Banner is configured" c10
 write_col "Display legal warning message before authentication to deter unauthorized access" c11
 write_col "Banner must be configured, file must exist, and must not expose system information" c12
 write_col "$details" c13
 write_col "$status" c14
 write_col "$severity" c15
 write_col "$scandate" c16

}

# 5.1.8 Ensure SSH weak ciphers are not used

output=$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(hostname -I | awk '{print $1}')" 2>/dev/null | grep -i ciphers)

weak_pattern="3des-cbc|aes128-cbc|aes192-cbc|aes256-cbc|arcfour|blowfish|cast128"

result="OK"
details=""

if [[ -z "$output" ]]; then
    result="KO"
    details="Unable to fetch SSH ciphers"
else
    weak_found=$(echo "$output" | grep -Pi "$weak_pattern")

    if [[ -n "$weak_found" ]]; then
        result="KO"
        details="Weak ciphers detected: $(echo $weak_found | tr ',' ' ')"
    else
        details="No weak ciphers found"
    fi

    # Safe append (NO special chars like | or ,)
    chacha=$(echo "$output" | grep -Pi "chacha20-poly1305@openssh\.com")
    if [[ -n "$chacha" ]]; then
        details="$details - chacha20 present"
    fi
fi

details=$(echo "$details" | tr ',' ' ' | tr '|' ' ' | tr '\n' ' ')

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.1.8" c8
write_col "Configure SSH Server" c9
write_col "Ensure SSH weak ciphers are not used" c10
write_col "Weak ciphers must be disabled to prevent cryptographic attacks" c11
write_col "Disallow CBC 3DES ARCFOUR Blowfish weak algorithms" c12
write_col "$details" c13
write_col "$result" c14
write_col "$severity" c15
write_col "$scandate" c16

#5.1.14 Ensure sshd KexAlgorithms is configured

# Run the sshd command and capture the output
output=$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep kexalgorithms)

# List of weak Key Exchange algorithms
weak_algorithms=(
    "diffie-hellman-group1-sha1"
    "diffie-hellman-group14-sha1"
    "diffie-hellman-group-exchange-sha1"
)

# Check if the output contains any weak algorithms
for alg in "${weak_algorithms[@]}"; do
    if echo "$output" | grep -q "$alg"; then
		write_col "$customer" c1
		write_col "$custinvid" c2
		write_col "$policy" c3
		write_col "$doc" c4
		write_col "$server" c5
		write_col "$ip" c6
		write_col "$os" c7
		write_col "5.1.14" c8
		write_col "Configure SSH Server" c9
		write_col "Ensure sshd KexAlgorithms is configured" c10
		write_col "Key exchange is any method in cryptography by which cryptographic keys are exchanged between two parties allowing use of cryptographic algorithm" c11
		write_col "Sshd KexAlgorithms is configured" c12
        write_col "Weak Key Exchange Algorithm found Output : $alg" c13
		write_col "KO" c14
		write_col "$severity" c15
		write_col "$scandate" c16
	else
		write_col "$customer" c1
		write_col "$custinvid" c2
		write_col "$policy" c3
		write_col "$doc" c4
		write_col "$server" c5
		write_col "$ip" c6
		write_col "$os" c7
		write_col "5.1.14" c8
		write_col "Configure SSH Server" c9
		write_col "Ensure sshd KexAlgorithms is configured" c10
		write_col "Key exchange is any method in cryptography by which cryptographic keys are exchanged between two parties allowing use of cryptographic algorithm" c11
		write_col "Sshd KexAlgorithms is configured" c12
		write_col "Weak key exchange algorithm $alg is not found" c13
		write_col "OK" c14
		write_col "$severity" c15
		write_col "$scandate" c16
    fi
done

#5.1.15 Ensure sshd LoginGraceTime is configured

logingracetime=`sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep logingracetime | awk -F " " '{print $2}'`

if [[ "$logingracetime" -ge "1" && "$logingracetime" -le "60" ]] && [[ $(grep -Pis '^\h*LoginGraceTime\h+"?(0|6[1-9]|[7-9][0-9]|[1-9][0-9][0-9]+|[^1]m)\b' /etc/ssh/sshd_config /etc/ssh/sshd_config.d/*.conf | wc -l) -eq "0" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.1.15" c8
write_col "Configure SSH Server" c9
write_col "Ensure sshd LoginGraceTime is configured" c10
write_col "The LoginGraceTime parameter specifies the time allowed for successful authentication to the SSH server" c11
write_col "Sshd LoginGraceTime is configured" c12
write_col "$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep logingracetime)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.1.15" c8
write_col "Configure SSH Server" c9
write_col "Ensure sshd LoginGraceTime is configured" c10
write_col "The LoginGraceTime parameter specifies the time allowed for successful authentication to the SSH server" c11
write_col "Sshd LoginGraceTime is configured" c12
write_col "$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep logingracetime)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#5.1.16 Ensure sshd LogLevel is configured

log_level=`sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep loglevel | awk -F " " '{print $2}'`

if [[ "$log_level" == "VERBOSE" || "$log_level" == "INFO" ]] && [[ $(grep -Pis '^\h*loglevel\h+' /etc/ssh/sshd_config /etc/ssh/sshd_config.d/*.conf | grep -Pvi '(VERBOSE|INFO)' | wc -l) -eq "0" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.1.16" c8
write_col "Configure SSH Server" c9
write_col "Ensure sshd LogLevel is configured" c10
write_col "LogLevel gives the verbosity level that is used when logging messages from sshd" c11
write_col "Sshd LogLevel is configured" c12
write_col "$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep loglevel)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.1.16" c8
write_col "Configure SSH Server" c9
write_col "Ensure sshd LogLevel is configured" c10
write_col "LogLevel gives the verbosity level that is used when logging messages from sshd" c11
write_col "Sshd LogLevel is configured" c12
write_col "$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep loglevel)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

# 5.1.17 Ensure sshd MACs are configured

# Load crypto policy and sshd options (CIS requirement)
source /etc/crypto-policies/back-ends/opensshserver.config 2>/dev/null
source /etc/sysconfig/sshd 2>/dev/null

# Run sshd effective config check
output=$(sshd -T $OPTIONS $CRYPTO_POLICY 2>/dev/null | grep -Pi -- 'macs\h+([^#\n\r]+,)?(hmac-md5|hmac-md5-96|hmac-ripemd160|hmac-sha1-96|umac-64@openssh\.com|hmac-md5-etm@openssh\.com|hmac-md5-96-etm@openssh\.com|hmac-ripemd160-etm@openssh\.com|hmac-sha1-96-etm@openssh\.com|umac-64-etm@openssh\.com|umac-128-etm@openssh\.com)\b')

# Determine result
if [[ -z "$output" ]]; then
    status="OK"
    details="No weak MAC algorithms found in sshd configuration"
else
    status="KO"
    details="Weak MAC algorithms detected: $output"
fi

# Output
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.1.17" c8
write_col "Configure SSH Server" c9
write_col "Ensure sshd MACs are configured" c10
write_col "Weak MAC algorithms should not be used in SSH configuration" c11
write_col "Ensure no weak MACs are present (CIS benchmark)" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

#5.1.18 Ensure sshd MazAuthTries is configured

max_auth=`sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep maxauthtries | awk -F " " '{print $2}'`

if [[ "$max_auth" -ge "1" && "$max_auth" -le "4" ]] && [[ $(grep -Pis '^\h*maxauthtries\h+"?([5-9]|[1-9][0-9]+)\b' /etc/ssh/sshd_config /etc/ssh/sshd_config.d/*.conf | wc -l) -eq "0" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.1.18" c8
write_col "Configure SSH Server" c9
write_col "Ensure sshd MaxAuthTries is configured" c10
write_col "The MaxAuthTries parameter specifies the maximum number of authentication attempts permitted per connection" c11
write_col "Sshd MaxAuthTries is configured" c12
write_col "$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep maxauthtries)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.1.18" c8
write_col "Configure SSH Server" c9
write_col "Ensure sshd MaxAuthTries is configured" c10
write_col "The MaxAuthTries parameter specifies the maximum number of authentication attempts permitted per connection" c11
write_col "Sshd MaxAuthTries is configured" c12
write_col "$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep maxauthtries)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#5.1.19 Ensure sshd MaxSessions is configured

max_sessions=`sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -i maxsessions | awk -F " " '{print $2}'`

if [[ "$max_sessions" -ge "1" && "$max_sessions" -le "10" ]] && [[ $(grep -Pis '^\h*MaxSessions\h+"?(1[1-9]|[2-9][0-9]|[1-9][0-9][0-9]+)\b' /etc/ssh/sshd_config /etc/ssh/sshd_config.d/*.conf | wc -l) -eq "0" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.1.19" c8
write_col "Configure SSH Server" c9
write_col "Ensure sshd MaxSessions is configured" c10
write_col "The MaxSessions parameter specifies the maximum number of open sessions permitted from a given connection" c11
write_col "Sshd MaxSessions is configured" c12
write_col "$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -i maxsessions)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.1.19" c8
write_col "Configure SSH Server" c9
write_col "Ensure sshd MaxSessions is configured" c10
write_col "The MaxSessions parameter specifies the maximum number of open sessions permitted from a given connection" c11
write_col "Sshd MaxSessions is configured" c12
write_col "$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -i maxsessions)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#5.1.24 Ensure sshd UsePAM is enabled

if [[ $(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -i usepam) == "usepam yes" ]] && [[ $(grep -Pis '^\h*UsePAM\h+"?no"?\b' /etc/ssh/sshd_config /etc/ssh/ssh_config.d/*.conf | wc -l) -eq "0" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.1.24" c8
write_col "Configure SSH Server" c9
write_col "Ensure sshd UsePAM is enabled" c10
write_col "The UsePAM directive enables the PAM interface" c11
write_col "Sshd UsePAM is enabled" c12
write_col "$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -i usepam)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.1.24" c8
write_col "Configure SSH Server" c9
write_col "Ensure sshd UsePAM is enabled" c10
write_col "The UsePAM directive enables the PAM interface" c11
write_col "Sshd UsePAM is enabled" c12
write_col "$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -i usepam)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#5.1.1 Ensure sshd crypto_policy is not set

if [[ $(grep -Pi '^\h*CRYPTO_POLICY\h*=' /etc/sysconfig/sshd | wc -l) -eq "0" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.1.1" c8
write_col "Configure SSH Server" c9
write_col "Ensure sshd crypto_policy is not set" c10
write_col "System-wide crypto policy can be over-ridden or opted out of for openSSH" c11
write_col "Sshd crypto_policy is not set" c12
write_col "Sshd crypto_policy is not set" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.1.1" c8
write_col "Configure SSH Server" c9
write_col "Ensure sshd crypto_policy is not set" c10
write_col "System-wide crypto policy can be over-ridden or opted out of for openSSH" c11
write_col "Sshd crypto_policy is not set" c12
write_col "Sshd crypto_policy is set Output : $(grep -Pi '^\h*CRYPTO_POLICY\h*=' /etc/sysconfig/sshd)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#5.1.2 Ensure permissions on /etc/ssh/sshd_config are configured

#!/usr/bin/env bash
{
 l_output=""
 l_output2=""
 unset a_sshdfiles && a_sshdfiles=()
 [ -e "/etc/ssh/sshd_config" ] && a_sshdfiles+=("$(stat -Lc '%n^%#a^%U^%G' "/etc/ssh/sshd_config")")
 while IFS= read -r -d $'\0' l_file; do
 [ -e "$l_file" ] && a_sshdfiles+=("$(stat -Lc '%n^%#a^%U^%G' "$l_file")")
 done < <(find /etc/ssh/sshd_config.d -type f \( -perm /077 -o ! -user root -o ! -group root \) -print0)
 if (( ${#a_sshdfiles[@]} != 0 )); then
 perm_mask='0177'
 maxperm="$( printf '%o' $(( 0777 & ~$perm_mask)) )"
 while IFS="^" read -r l_file l_mode l_user l_group; do
 l_out2=""
 [ $(( $l_mode & $perm_mask )) -gt 0 ] && l_out2="$l_out2\n - Is mode: \"$l_mode\" should be: \"$maxperm\" or more restrictive"
 [ "$l_user" != "root" ] && l_out2="$l_out2\n - Is owned by \"$l_user\" should be owned by \"root\""
 [ "$l_group" != "root" ] && l_out2="$l_out2\n - Is group owned by \"$l_user\" should be group owned by \"root\""
 if [ -n "$l_out2" ]; then
 l_output2="$l_output2\n - File: \"$l_file\":$l_out2"
 else
 l_output="$l_output\n - File: \"$l_file\":\n - Correct: mode ($l_mode) owner ($l_user) and group owner ($l_group) configured"
 fi
 done <<< "$(printf '%s\n' "${a_sshdfiles[@]}")"
 fi
 unset a_sshdfiles
 # If l_output2 is empty, we pass
 if [ -z "$l_output2" ]; then
 echo -e "\n- Audit Result:\n *** PASS ***\n- * Correctly set * :\n$l_output\n" >/dev/null
 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "5.1.2" c8
 write_col "Configure SSH Server" c9
 write_col "Ensure permissions on /etc/ssh/sshd_config are configured" c10
 write_col "The file /etc/ssh/sshd_config and files ending in .conf in the /etc/ssh/sshd_config.d directory contain configuration specifications for sshd" c11
 write_col "Permissions of 0600 and ownership of 0:0" c12
 #Replace occurrences of \n\n with 20 spaces except for the first occurrence.
 l_output=$(echo "$l_output" | sed '0,/\\n\\n/s//\\n\\n/; s/\\n\\n/                    /g')
 write_col "\n$l_output" c13
 write_col "OK" c14
 write_col "$severity" c15
 write_col "$scandate" c16
 else
 echo -e "\n- Audit Result:\n ** FAIL **\n - * Reasons for audit failure * :\n$l_output2\n" >/dev/null
 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "5.1.2" c8
 write_col "Configure SSH Server" c9
 write_col "Ensure permissions on /etc/ssh/sshd_config are configured" c10
 write_col "The file /etc/ssh/sshd_config and files ending in .conf in the /etc/ssh/sshd_config.d directory contain configuration specifications for sshd" c11
 write_col "Permissions of 0600 and ownership of 0:0" c12
 #Replace occurrences of \n\n with 20 spaces except for the first occurrence.
 l_output2=$(echo "$l_output2" | sed '0,/\\n\\n/s//\\n\\n/; s/\\n\\n/                    /g')
 write_col "\n$l_output2" c13
 write_col "KO" c14
 write_col "$severity" c15
 write_col "$scandate" c16
 [ -n "$l_output" ] && echo -e " - * Correctly set * :\n$l_output\n" >/dev/null
 fi
}

# 5.1.3 Ensure permissions on /etc/sysconfig/sshd are configured

file="/etc/sysconfig/sshd"

# Check file exists
if [[ ! -f "$file" ]]; then

    write_col "$customer" c1
    write_col "$custinvid" c2
    write_col "$policy" c3
    write_col "$doc" c4
    write_col "$server" c5
    write_col "$ip" c6
    write_col "$os" c7
    write_col "5.1.3" c8
    write_col "Configure SSH Server" c9
    write_col "Ensure permissions on /etc/sysconfig/sshd are configured" c10
    write_col "Restrict SSH configuration file access" c11
    write_col "/etc/sysconfig/sshd must be owned by root and mode 0640 or more restrictive" c12
    write_col "File not found: $file" c13
    write_col "KO" c14
    write_col "$severity" c15
    write_col "$scandate" c16

else

    # Get details
    perm=$(stat -Lc "%a" "$file")
    owner=$(stat -Lc "%u" "$file")
    group=$(stat -Lc "%g" "$file")

    # Initialize result
    result="OK"
    details=""

    # Check owner/group
    if [[ "$owner" -ne 0 || "$group" -ne 0 ]]; then
        result="KO"
        details="Incorrect owner/group (owner=$owner group=$group)"
    fi

    # Check permissions
    if [[ "$perm" -gt 640 ]]; then
        result="KO"
        details="$details | Permissions too permissive ($perm)"
    fi

    # If everything OK
    if [[ "$result" == "OK" ]]; then
        details="Owner=root, Group=root, Permissions=$perm (compliant)"
    fi

    # WRITE SINGLE OUTPUT
    write_col "$customer" c1
    write_col "$custinvid" c2
    write_col "$policy" c3
    write_col "$doc" c4
    write_col "$server" c5
    write_col "$ip" c6
    write_col "$os" c7
    write_col "5.1.3" c8
    write_col "Configure SSH Server" c9
    write_col "Ensure permissions on /etc/sysconfig/sshd are configured" c10
    write_col "Restrict SSH configuration file access" c11
    write_col "/etc/sysconfig/sshd must be owned by root and mode 0640 or more restrictive" c12
    write_col "$details" c13
    write_col "$result" c14
    write_col "$severity" c15
    write_col "$scandate" c16

fi

#5.1.4 Ensure access to SSH private host key files is configured

#!/usr/bin/env bash
{
 l_output=""
 l_output2=""
 l_skgn="$(grep -Po -- '^(ssh_keys|_?ssh)\b' /etc/group)" # Group designated to own openSSH keys
 l_skgid="$(awk -F: '($1 == "'"$l_skgn"'"){print $3}' /etc/group)" # Get gid of group
 [ -n "$l_skgid" ] && l_agroup="(root|$l_skgn)" || l_agroup="root"
 unset a_skarr && a_skarr=() # Clear and initialize array
 if [ -d /etc/ssh ]; then
 while IFS= read -r -d $'\0' l_file; do # Loop to populate array
 if grep -Pq ':\h+OpenSSH\h+private\h+key\b' <<< "$(file "$l_file")"; 
then
 a_skarr+=("$(stat -Lc '%n^%#a^%U^%G^%g' "$l_file")")
 fi
 done < <(find -L /etc/ssh -xdev -type f -print0)
 while IFS="^" read -r l_file l_mode l_owner l_group l_gid; do
 l_out2=""
 [ "$l_gid" = "$l_skgid" ] && l_pmask="0137" || l_pmask="0177"
 l_maxperm="$( printf '%o' $(( 0777 & ~$l_pmask )) )"
 if [ $(( $l_mode & $l_pmask )) -gt 0 ]; then
 l_out2="$l_out2\n - Mode: \"$l_mode\" should be mode: \"$l_maxperm\" or more restrictive"
 fi
 if [ "$l_owner" != "root" ]; then
 l_out2="$l_out2\n - Owned by: \"$l_owner\" should be owned by \"root\""
 fi
 if [[ ! "$l_group" =~ $l_agroup ]]; then
 l_out2="$l_out2\n - Owned by group \"$l_group\" should be group owned by: \"${l_agroup//|/ or }\""
 fi
 if [ -n "$l_out2" ]; then
 l_output2="$l_output2\n - File: \"$l_file\"$l_out2"
 else
 l_output="$l_output\n - File: \"$l_file\"\n - Correct: mode ($l_mode) owner ($l_owner) and group owner ($l_group) configured"
 fi
 done <<< "$(printf '%s\n' "${a_skarr[@]}")"
 else
 l_output=" - openSSH keys not found on the system"
 fi
 unset a_skarr
 if [ -z "$l_output2" ]; then
 echo -e "\n- Audit Result:\n *** PASS ***\n- * Correctly set * :\n$l_output\n" >/dev/null
 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "5.1.4" c8
 write_col "Configure SSH Server" c9
 write_col "Ensure access to SSH private host key files is configured" c10
 write_col "An SSH private key is one of two files used in SSH public key authentication" c11
 write_col "Permissions of 0640 and ownership of root:ssh_keys" c12
 #Replace occurrences of \n\n with 20 spaces except for the first occurrence.
 l_output=$(echo "$l_output" | sed '0,/\\n\\n/s//\\n\\n/; s/\\n\\n/                    /g')
 write_col "\n$l_output" c13
 write_col "OK" c14
 write_col "$severity" c15
 write_col "$scandate" c16
 else
 echo -e "\n- Audit Result:\n ** FAIL **\n - * Reasons for audit failure * :\n$l_output2\n" >/dev/null
 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "5.1.4" c8
 write_col "Configure SSH Server" c9
 write_col "Ensure access to SSH private host key files is configured" c10
 write_col "An SSH private key is one of two files used in SSH public key authentication" c11
 write_col "Permissions of 0640 and ownership of root:ssh_keys" c12
 #Replace occurrences of \n\n with 20 spaces except for the first occurrence.
 l_output2=$(echo "$l_output2" | sed '0,/\\n\\n/s//\\n\\n/; s/\\n\\n/                    /g')
 write_col "\n$l_output2" c13
 write_col "KO" c14
 write_col "$severity" c15
 write_col "$scandate" c16
 [ -n "$l_output" ] && echo -e " - * Correctly set * :\n$l_output\n" >/dev/null
 fi
}

#5.1.5 Ensure access on SSH public host key files are configured

#!/usr/bin/env bash
{
 l_output=""
 l_output2=""
 l_skgn="$(grep -Po -- '^(ssh_keys|_?ssh)\b' /etc/group)" # Group designated to own openSSH public keys
 l_skgid="$(awk -F: '($1 == "'"$l_skgn"'"){print $3}' /etc/group)" # Get gid of group
 [ -n "$l_skgid" ] && l_agroup="(root|$l_skgn)" || l_agroup="root"
 unset a_skarr && a_skarr=() # Clear and initialize array
 if [ -d /etc/ssh ]; then
 while IFS= read -r -d $'\0' l_file; do # Loop to populate array
 if grep -Pq ':\h+OpenSSH\h+(\H+\h+)public\h+key\b' <<< "$(file "$l_file")"; then
 a_skarr+=("$(stat -Lc '%n^%#a^%U^%G^%g' "$l_file")")
 fi
 done < <(find -L /etc/ssh -xdev -type f -print0)
 while IFS="^" read -r l_file l_mode l_owner l_group l_gid; do
 echo "File: \"$l_file\" Mode: \"$l_mode\" Owner: \"$l_owner\" Group: \"$l_group\" GID: \"$l_gid\""
 l_out2=""
 l_pmask="0133"
 l_maxperm="$( printf '%o' $(( 0777 & ~$l_pmask )) )"
 if [ $(( $l_mode & $l_pmask )) -gt 0 ]; then
 l_out2="$l_out2\n - Mode: \"$l_mode\" should be mode: \"$l_maxperm\" or more restrictive"
 fi
 if [ "$l_owner" != "root" ]; then
 l_out2="$l_out2\n - Owned by: \"$l_owner\" should be owned by \"root\""
 fi
 if [[ ! "$l_group" =~ $l_agroup ]]; then
 l_out2="$l_out2\n - Owned by group \"$l_group\" should be group owned by: \"${l_agroup//|/ or }\""
 fi
 if [ -n "$l_out2" ]; then
 l_output2="$l_output2\n - File: \"$l_file\"$l_out2"
 else
 l_output="$l_output\n - File: \"$l_file\"\n - Correct: mode ($l_mode) owner ($l_owner) and group owner ($l_group) configured"
 fi
 done <<< "$(printf '%s\n' "${a_skarr[@]}")"
 else
 l_output=" - openSSH keys not found on the system"
 fi
 unset a_skarr
 if [ -z "$l_output2" ]; then
 echo -e "\n- Audit Result:\n *** PASS ***\n- * Correctly set * :\n$l_output\n" >/dev/null
 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "5.1.5" c8
 write_col "Configure SSH Server" c9
 write_col "Ensure access to SSH public host key files are configured" c10
 write_col "An SSH public key is one of two files used in SSH public key authentication" c11
 write_col "Permissions of 0644 and ownership of 0:0" c12
 #Replace occurrences of \n\n with 20 spaces except for the first occurrence.
 l_output=$(echo "$l_output" | sed '0,/\\n\\n/s//\\n\\n/; s/\\n\\n/                    /g')
 write_col "\n$l_output" c13
 write_col "OK" c14
 write_col "$severity" c15
 write_col "$scandate" c16
 else
 echo -e "\n- Audit Result:\n ** FAIL **\n - * Reasons for audit failure * :\n$l_output2\n" >/dev/null
 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "5.1.5" c8
 write_col "Configure SSH Server" c9
 write_col "Ensure access to SSH public host key files are configured" c10
 write_col "An SSH public key is one of two files used in SSH public key authentication" c11
 write_col "Permissions of 0644 and ownership of 0:0" c12
 #Replace occurrences of \n\n with 20 spaces except for the first occurrence.
 l_output2=$(echo "$l_output2" | sed '0,/\\n\\n/s//\\n\\n/; s/\\n\\n/                    /g')
 write_col "\n$l_output2" c13
 write_col "KO" c14
 write_col "$severity" c15
 write_col "$scandate" c16
 [ -n "$l_output" ] && echo -e " - * Correctly set * :\n$l_output\n" >/dev/null
 fi
}

#5.1.20 Ensure sshd MaxStartups is configured

if [[ $(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -i maxstartups) == "maxstartups 10:30:60" ]] && [[ $(grep -Pis '^\h*maxstartups\h+"?(((1[1-9]|[1-9][0-9][0-9]+):([0-9]+):([0-9]+))|(([0-9]+):(3[1-9]|[4-9][0-9]|[1-9][0-9][0-9]+):([0-9]+))|(([0-9]+):([0-9]+):(6[1-9]|[7-9][0-9]|[1-9][0-9][0-9]+)))\b' /etc/ssh/sshd_config /etc/ssh/sshd_config.d/*.conf | wc -l) -eq "0" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.1.20" c8
write_col "Configure SSH Server" c9
write_col "Ensure sshd MaxStartups is configured" c10
write_col "The MaxStartups parameter specifies the maximum number of concurrent unauthenticated connections to the SSH daemon" c11
write_col "File /etc/ssh/sshd_config contains MaxStartups 10:30:60" c12
write_col "$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -i maxstartups)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.1.20" c8
write_col "Configure SSH Server" c9
write_col "Ensure sshd MaxStartups is configured" c10
write_col "The MaxStartups parameter specifies the maximum number of concurrent unauthenticated connections to the SSH daemon" c11
write_col "File /etc/ssh/sshd_config contains MaxStartups 10:30:60" c12
write_col "$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -i maxstartups)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#5.1.6 Ensure sshd access is configured

output1=$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -Pi '^\h*(allow|deny)(users|groups)\h+\H+(\h+.*)?$')

output2=$(grep -Pis '^\h*(allow|deny)(users|groups)\h+\H+(\h+.*)?$' /etc/ssh/sshd_config /etc/ssh/sshd_config.d/*.conf)

# Define the patterns to match
patterns=("allowusers" "allowgroups" "denyusers" "denygroups")

# Function to check if output matches any pattern
check_output() {
    local output="$1"
    for pattern in "${patterns[@]}"; do
        if echo "$output" | grep -q "$pattern"; then
            return 0
        fi
    done
    return 1
}

# Verify the output of both commands
if check_output "$output1" && check_output "$output2"; then
    write_col "$customer" c1
	write_col "$custinvid" c2
	write_col "$policy" c3
	write_col "$doc" c4
	write_col "$server" c5
	write_col "$ip" c6
	write_col "$os" c7
	write_col "5.1.6" c8
	write_col "Configure SSH Server" c9
	write_col "Ensure sshd access is configured" c10
	write_col "There are several options available to limit which users and group can access the system via SSH" c11
	write_col "Sshd access is configured" c12
	write_col "Sshd access is configured" c13
	write_col "OK" c14
	write_col "$severity" c15
	write_col "$scandate" c16
else
    write_col "$customer" c1
	write_col "$custinvid" c2
	write_col "$policy" c3
	write_col "$doc" c4
	write_col "$server" c5
	write_col "$ip" c6
	write_col "$os" c7
	write_col "5.1.6" c8
	write_col "Configure SSH Server" c9
	write_col "Ensure sshd access is configured" c10
	write_col "There are several options available to limit which users and group can access the system via SSH" c11
	write_col "Sshd access is configured" c12
	write_col "Sshd access is not configured" c13
	write_col "KO" c14
	write_col "$severity" c15
	write_col "$scandate" c16
fi

#5.1.9 Ensure sshd ClientAliveInterval and ClientAliveCountMax are configured

output=`sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep clientaliveinterval | awk -F " " '{print $2}' | xargs`

output1=`grep ^ClientAliveInterval /etc/ssh/sshd_config | awk -F " " '{print $2}' | xargs`

if [[ "$output" -ge "1" ]] && [[ "$output1" -ge "1" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.1.9" c8
write_col "Configure SSH Server" c9
write_col "Ensure sshd ClientAliveInterval and ClientAliveCountMax are configured" c10
write_col "The two options ClientAliveInterval and ClientAliveCountMax control the timeout of SSH sessions" c11
write_col "Sshd ClientAliveInterval and ClientAliveCountMax are configured" c12
write_col "$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep clientaliveinterval)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.1.9" c8
write_col "Configure SSH Server" c9
write_col "Ensure sshd ClientAliveInterval and ClientAliveCountMax are configured" c10
write_col "The two options ClientAliveInterval and ClientAliveCountMax control the timeout of SSH sessions" c11
write_col "Sshd ClientAliveInterval and ClientAliveCountMax are configured" c12
write_col "Sshd ClientAliveInterval is not configured" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

output2=`sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep clientalivecountmax | awk -F " " '{print $2}' | xargs`

if [[ "$output2" -ge "1" ]] && [[ $(grep -Pis '^\h*ClientAliveCountMax\h+"?0\b' /etc/ssh/sshd_config /etc/ssh/sshd_config.d/*.conf | wc -l) -eq "0" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.1.9" c8
write_col "Configure SSH Server" c9
write_col "Ensure sshd ClientAliveInterval and ClientAliveCountMax are configured" c10
write_col "The two options ClientAliveInterval and ClientAliveCountMax control the timeout of SSH sessions" c11
write_col "Sshd ClientAliveInterval and ClientAliveCountMax are configured" c12
write_col "$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep clientalivecountmax)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.1.9" c8
write_col "Configure SSH Server" c9
write_col "Ensure sshd ClientAliveInterval and ClientAliveCountMax are configured" c10
write_col "The two options ClientAliveInterval and ClientAliveCountMax control the timeout of SSH sessions" c11
write_col "Sshd ClientAliveInterval and ClientAliveCountMax are configured" c12
write_col "$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep clientalivecountmax)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

########################End########################

########################Configure privilege escalation########################

#5.2.1 Ensure sudo is installed

pack_sudo=`rpm -q sudo`

if [[ $pack_sudo != "package sudo is not installed" ]]; then
rpm -q sudo >package
for out in `cat package`
do
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.2.1" c8
write_col "Configure privilege escalation" c9
write_col "Ensure Sudo is installed" c10
write_col "Sudo allows a permitted user to execute a command as the superuser or another user as specified by the security policy" c11
write_col "Sudo is installed" c12
write_col "Package sudo is installed Output : $out" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
done
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.2.1" c8
write_col "Configure privilege escalation" c9
write_col "Ensure Sudo is installed" c10
write_col "Sudo allows a permitted user to execute a command as the superuser or another user as specified by the security policy" c11
write_col "Sudo is installed" c12
write_col "Package sudo is not installed Output : $(rpm -q sudo)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

rm -rf package

#5.2.2 Ensure sudo commands use pty

if [[ $(grep -rPi '^\h*Defaults\h+([^#\n\r]+,)?use_pty(,\h*\h+\h*)*\h*(#.*)?$' /etc/sudoers*) == "/etc/sudoers:Defaults use_pty" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.2.2" c8
write_col "Configure privilege escalation" c9
write_col "Ensure sudo commands use pty" c10
write_col "Sudo can be configured to run only from a pseudo terminal (pseudo-pty)" c11
write_col "Set use_pty on" c12
write_col "$(grep -rPi '^\h*Defaults\h+([^#\n\r]+,)?use_pty(,\h*\h+\h*)*\h*(#.*)?$' /etc/sudoers*)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.2.2" c8
write_col "Configure privilege escalation" c9
write_col "Ensure sudo commands use pty" c10
write_col "Sudo can be configured to run only from a pseudo terminal (pseudo-pty)" c11
write_col "Set use_pty on" c12
write_col "Use_pty on is not set" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#5.2.3 Ensure sudo log file exists

if [[ $(grep -rPsi "^\h*Defaults\h+([^#]+,\h*)?logfile\h*=\h*(\"|\')?\H+(\"|\')?(,\h*\H+\h*)*\h*(#.*)?$" /etc/sudoers* | awk -F ":" '{print $2}' ) == "Defaults logfile="/var/log/sudo.log"" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.2.3" c8
write_col "Configure privilege escalation" c9
write_col "Ensure sudo log file exists" c10
write_col "The default logfile entry sets the path to the sudo log file" c11
write_col "Sudo log file exists" c12
write_col "Sudo log file exists Output : $(grep -rPsi "^\h*Defaults\h+([^#]+,\h*)?logfile\h*=\h*(\"|\')?\H+(\"|\')?(,\h*\H+\h*)*\h*(#.*)?$" /etc/sudoers*)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.2.3" c8
write_col "Configure privilege escalation" c9
write_col "Ensure sudo log file exists" c10
write_col "The default logfile entry sets the path to the sudo log file" c11
write_col "Sudo log file exists" c12
write_col "Sudo log file does not exists" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#5.2.5 Ensure re-authentication for privilege escalation is not disabled globally

if [[ $(grep -r "^[^#].*\!authenticate" /etc/sudoers* | wc -l) -eq "0" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.2.5" c8
write_col "Configure privilege escalation" c9
write_col "Ensure re-authentication for privilege escalation is not disabled globally" c10
write_col "The operating system must be configured so that users must re-authenticate for privilege escalation" c11
write_col "!authenticate is not used in the sudoers configuration files" c12
write_col "!authenticate is not used in the sudoers configuration files" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.2.5" c8
write_col "Configure privilege escalation" c9
write_col "Ensure re-authentication for privilege escalation is not disabled globally" c10
write_col "The operating system must be configured so that users must re-authenticate for privilege escalation" c11
write_col "!authenticate is not used in the sudoers configuration files" c12
write_col "!authenticate is used in the sudoers configuration files" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#5.2.6 Ensure sudo timestamp_timeout is configured

timeout_val=$(grep -REh '^\s*Defaults\s+.*timestamp_timeout=' /etc/sudoers /etc/sudoers.d/* 2>/dev/null \
  | tail -n 1 | sed -E 's/.*timestamp_timeout=([0-9-]+).*/\1/')

if [[ -n "$timeout_val" && "$timeout_val" -le 15 && "$timeout_val" -ge 0 ]]; then
  status="OK"
  details="sudo timestamp_timeout is properly set (value=$timeout_val)"
else
  status="KO"
  details="sudo timestamp_timeout not set correctly (current=${timeout_val:-Not Set})"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.2.6" c8
write_col "Ensure sudo timestamp_timeout is configured" c9
write_col "Ensure sudo timestamp_timeout is configured" c10
write_col "Limiting sudo authentication caching time reduces risk of privilege misuse from unattended sessions" c11
write_col "timestamp_timeout should be set to 15 minutes or less" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16


#5.2.7 Ensure access to the su command is restricted

expected_output="auth required pam_wheel.so use_uid group=root"

command_output=`grep -Pi '^\h*auth\h+(?:required|requisite)\h+pam_wheel\.so\h+(?:[^#\n\r]+\h+)?((?!\2)(use_uid\b|group=\H+\b))\h+(?:[^#\n\r]+\h+)?((?!\1)(use_uid\b|group=\H+\b))(\h+.*)?$' /etc/pam.d/su`

command_output=`echo $command_output | tr -s '[:space:]'`

if [[ "$expected_output" == "$command_output" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.2.7" c8
write_col "Configure privilege escalation" c9
write_col "Ensure access to the su command is restricted" c10
write_col "The su command allows a user to run a command or shell as another user" c11
write_col "Access to the su command is restricted" c12
write_col "Access to the su command is restricted Output : $command_output" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.2.7" c8
write_col "Configure privilege escalation" c9
write_col "Ensure access to the su command is restricted" c10
write_col "The su command allows a user to run a command or shell as another user" c11
write_col "Access to the su command is restricted" c12
write_col "Access to the su command is not restricted" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

########################End########################

########################Configure pam_pwhistory module########################

#5.3.3.3.1 Ensure password history remember is configured

password_remember=`grep -Pi -- '^\h*remember\h*=\h*(2[4-9]|[3-9][0-9]|[1-9][0-9]{2,})\b' /etc/security/pwhistory.conf | awk -F "=" '{print $2}' | xargs`

if [[ "$password_remember" -ge "24" ]] && [[ $(grep -Pi -- '^\h*password\h+(requisite|required|sufficient)\h+pam_pwhistory\.so\h+([^#\n\r]+\h+)?remember=(2[0-3]|1[0-9]|[0-9])\b' /etc/pam.d/system-auth /etc/pam.d/password-auth | wc -l) -eq "0" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.3.3.3.1" c8
write_col "Configure pam_pwhistory moddule" c9
write_col "Ensure password history remember is configured" c10
write_col "The /etc/security/opasswd file stores the users old passwords and can be checked to ensure that users are not recycling recent passwords" c11
write_col "Password history remember is configured" c12
write_col "$(grep -Pi -- '^\h*remember\h*=\h*(2[4-9]|[3-9][0-9]|[1-9][0-9]{2,})\b' /etc/security/pwhistory.conf | xargs)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.3.3.3.1" c8
write_col "Configure pam_pwhistory moddule" c9
write_col "Ensure password history remember is configured" c10
write_col "The /etc/security/opasswd file stores the users old passwords and can be checked to ensure that users are not recycling recent passwords" c11
write_col "Password history remember is configured" c12
write_col "Password history remember is not configured" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#5.3.3.3.2 Ensure password history is enforced for the root user

if [[ $(grep -Pi -- '^\h*enforce_for_root\b' /etc/security/pwhistory.conf) == "enforce_for_root" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.3.3.3.2" c8
write_col "Configure pam_pwhistory module" c9
write_col "Ensure password history is enforced for the root user" c10
write_col "If the pwhistory enforce_for_root option is enabled the module will enforce password history for the root user as well" c11
write_col "Password history is enforced for the root user" c12
write_col "Password history is enforced for the root user Output : $(grep -Pi -- '^\h*enforce_for_root\b' /etc/security/pwhistory.conf)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.3.3.3.2" c8
write_col "Configure pam_pwhistory module" c9
write_col "Ensure password history is enforced for the root user" c10
write_col "If the pwhistory enforce_for_root option is enabled the module will enforce password history for the root user as well" c11
write_col "Password history is enforced for the root user" c12
write_col "Password history is not enforced for the root user" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#5.3.3.3.3 Ensure pam_pwhistory includes use_authtok

expected_output=(
    "/etc/pam.d/password-auth:password required pam_pwhistory.so use_authtok"
    "/etc/pam.d/system-auth:password required pam_pwhistory.so use_authtok"
)

result=$(grep -P -- '^\h*password\h+([^#\n\r]+)\h+pam_pwhistory\.so\h+([^#\n\r]+\h+)?use_authtok\b' /etc/pam.d/{password,system}-auth)

result=`echo $result | tr -s '[:space:]'`

for entry in "${expected_output[@]}"; do
    if echo "$result" | grep -q "$entry"; then
		write_col "$customer" c1
		write_col "$custinvid" c2
		write_col "$policy" c3
		write_col "$doc" c4
		write_col "$server" c5
		write_col "$ip" c6
		write_col "$os" c7
		write_col "5.3.3.3.3" c8
		write_col "Configure pam_pwhistory module" c9
		write_col "Ensure pam_pwhistory includes use_authtok" c10
		write_col "Use_authtok - When password changing enforce the module to set the new password to the one provided by a previously stacked password module" c11
		write_col "Pam_pwhistory includes use_authtok" c12
		write_col "Pam_pwhistory includes use_authtok Output : Entry found - $entry" c13
		write_col "OK" c14
		write_col "$severity" c15
		write_col "$scandate" c16
    else
		write_col "$customer" c1
		write_col "$custinvid" c2
		write_col "$policy" c3
		write_col "$doc" c4
		write_col "$server" c5
		write_col "$ip" c6
		write_col "$os" c7
		write_col "5.3.3.3.3" c8
		write_col "Configure pam_pwhistory module" c9
		write_col "Ensure pam_pwhistory includes use_authtok" c10
		write_col "Use_authtok - When password changing enforce the module to set the new password to the one provided by a previously stacked password module" c11
		write_col "Pam_pwhistory includes use_authtok" c12
		write_col "Pam_pwhistory does not includes use_authtok Output : Entry not found - $entry" c13
		write_col "KO" c14
		write_col "$severity" c15
		write_col "$scandate" c16
    fi
done

#5.3.3.4.1 Ensure pam_unix does not include nullok

expected_output=(
    "/etc/pam.d/password-auth:auth sufficient pam_unix.so"
    "/etc/pam.d/password-auth:account required pam_unix.so"
    "/etc/pam.d/password-auth:password sufficient pam_unix.so sha512 shadow use_authtok"
    "/etc/pam.d/password-auth:session required pam_unix.so"
    "/etc/pam.d/system-auth:auth sufficient pam_unix.so"
    "/etc/pam.d/system-auth:account required pam_unix.so"
    "/etc/pam.d/system-auth:password sufficient pam_unix.so sha512 shadow use_authtok"
    "/etc/pam.d/system-auth:session required pam_unix.so"
)

output=$(grep -P -- '^\h*(auth|account|password|session)\h+(requisite|required|sufficient)\h+pam_unix\.so\b' /etc/pam.d/{password,system}-auth | grep -Pv -- '\bnullok\b')

output=`echo $output | tr -s '[:space:]'`

for entry in "${expected_output[@]}"; do
    if echo "$output" | grep -q "$entry"; then
		write_col "$customer" c1
		write_col "$custinvid" c2
		write_col "$policy" c3
		write_col "$doc" c4
		write_col "$server" c5
		write_col "$ip" c6
		write_col "$os" c7
		write_col "5.3.3.4.1" c8
		write_col "Configure pam_unix module" c9
		write_col "Ensure pam_unix does not include nullok" c10
		write_col "The nullok argument overrides the default action of pam_unix.so to not permit the user access to a service if their official password is blank" c11
		write_col "Pam_unix does not include nullok" c12
		write_col "Pam_unix does not include nullok for line $entry" c13
		write_col "OK" c14
		write_col "$severity" c15
		write_col "$scandate" c16
    else
		write_col "$customer" c1
		write_col "$custinvid" c2
		write_col "$policy" c3
		write_col "$doc" c4
		write_col "$server" c5
		write_col "$ip" c6
		write_col "$os" c7
		write_col "5.3.3.4.1" c8
		write_col "Configure pam_unix module" c9
		write_col "Ensure pam_unix does not include nullok" c10
		write_col "The nullok argument overrides the default action of pam_unix.so to not permit the user access to a service if their official password is blank" c11
		write_col "Pam_unix does not include nullok" c12
		write_col "Output should be similar to = $entry" c13
		write_col "KO" c14
		write_col "$severity" c15
		write_col "$scandate" c16
    fi
done

#5.3.3.4.2 Ensure pam_unix does not include remember

expected_output=(
    "/etc/pam.d/password-auth:password sufficient pam_unix.so sha512 shadow use_authtok"
    "/etc/pam.d/system-auth:password sufficient pam_unix.so sha512 shadow use_authtok"
)

grep_output=$(grep -Pi '^\h*password\h+([^#\n\r]+\h+)?pam_unix\.so\b' /etc/pam.d/{password,system}-auth | grep -Pv '\bremember=\d\b')

grep_output=`echo $grep_output | tr -s '[:space:]'`

for entry in "${expected_output[@]}"; do
    if echo "$grep_output" | grep -q "$entry"; then
		write_col "$customer" c1
		write_col "$custinvid" c2
		write_col "$policy" c3
		write_col "$doc" c4
		write_col "$server" c5
		write_col "$ip" c6
		write_col "$os" c7
		write_col "5.3.3.4.2" c8
		write_col "Configure pam_unix module" c9
		write_col "Ensure pam_unix does not include remember" c10
		write_col "The remember=n argument saves the last n passwords for each user in /etc/security/opasswd in order to force password change history and keep the user from alternating between the same password too frequently" c11
		write_col "Pam_unix does not include remember" c12
		write_col "Pam_unix does not include remember for line $entry" c13
		write_col "OK" c14
		write_col "$severity" c15
		write_col "$scandate" c16
    else
		write_col "$customer" c1
		write_col "$custinvid" c2
		write_col "$policy" c3
		write_col "$doc" c4
		write_col "$server" c5
		write_col "$ip" c6
		write_col "$os" c7
		write_col "5.3.3.4.2" c8
		write_col "Configure pam_unix module" c9
		write_col "Ensure pam_unix does not include remember" c10
		write_col "The remember=n argument saves the last n passwords for each user in /etc/security/opasswd in order to force password change history and keep the user from alternating between the same password too frequently" c11
		write_col "Pam_unix does not include remember" c12
		write_col "Output should be similar to =  $entry" c13
		write_col "KO" c14
		write_col "$severity" c15
		write_col "$scandate" c16
    fi
done

#5.3.3.4.3 Ensure pam_unix includes a strong password hashing Algorithm

expected_output=(
    "/etc/pam.d/password-auth:password sufficient pam_unix.so sha512 shadow use_authtok"
    "/etc/pam.d/system-auth:password sufficient pam_unix.so sha512 shadow use_authtok"
)

grep_output=$(grep -P -- '^\h*password\h+([^#\n\r]+)\h+pam_unix\.so\h+([^#\n\r]+\h+)?(sha512|yescrypt)\b' /etc/pam.d/{password,system}-auth)

grep_output=`echo $grep_output | tr -s '[:space:]'`

for entry in "${expected_output[@]}"; do
    if echo "$grep_output" | grep -q "$entry"; then
		write_col "$customer" c1
		write_col "$custinvid" c2
		write_col "$policy" c3
		write_col "$doc" c4
		write_col "$server" c5
		write_col "$ip" c6
		write_col "$os" c7
		write_col "5.3.3.4.3" c8
		write_col "Configure pam_unix module" c9
		write_col "Ensure pam_unix includes a strong password hashing algorithm" c10
		write_col "A cryptographic hash function converts an arbitrary-length input into a fixed length output" c11
		write_col "Pam_unix includes a strong password hashing algorithm" c12
		write_col "Pam_unix includes a strong password hashing algorithm Output : Entry found - $entry" c13
		write_col "OK" c14
		write_col "$severity" c15
		write_col "$scandate" c16
    else
		write_col "$customer" c1
		write_col "$custinvid" c2
		write_col "$policy" c3
		write_col "$doc" c4
		write_col "$server" c5
		write_col "$ip" c6
		write_col "$os" c7
		write_col "5.3.3.4.3" c8
		write_col "Configure pam_unix module" c9
		write_col "Ensure pam_unix includes a strong password hashing algorithm" c10
		write_col "A cryptographic hash function converts an arbitrary-length input into a fixed length output" c11
		write_col "Pam_unix includes a strong password hashing algorithm" c12
		write_col "Output should be similar to =  $entry" c13
		write_col "KO" c14
		write_col "$severity" c15
		write_col "$scandate" c16
    fi
done

#5.3.3.4.4 Ensure pam_unix includes use_useauthtok

expected_output=(
    "/etc/pam.d/password-auth:password sufficient pam_unix.so sha512 shadow use_authtok"
    "/etc/pam.d/system-auth:password sufficient pam_unix.so sha512 shadow use_authtok"
)

grep_output=$(grep -P -- '^\h*password\h+([^#\n\r]+)\h+pam_unix\.so\h+([^#\n\r]+\h+)?use_authtok\b' /etc/pam.d/{password,system}-auth)

grep_output=`echo $grep_output | tr -s '[:space:]'`

for entry in "${expected_output[@]}"; do
    if echo "$grep_output" | grep -q "$entry"; then
		write_col "$customer" c1
		write_col "$custinvid" c2
		write_col "$policy" c3
		write_col "$doc" c4
		write_col "$server" c5
		write_col "$ip" c6
		write_col "$os" c7
		write_col "5.3.3.4.4" c8
		write_col "Configure pam_unix module" c9
		write_col "Ensure pam_unix includes use_authtok" c10
		write_col "Use authtok - When password changing enforce the module to set the new password to the one provided by a previously stacked password module" c11
		write_col "Pam_unix includes use_authtok" c12
		write_col "Pam_unix includes use_authtok Output : Entry found - $entry" c13
		write_col "OK" c14
		write_col "$severity" c15
		write_col "$scandate" c16
    else
		write_col "$customer" c1
		write_col "$custinvid" c2
		write_col "$policy" c3
		write_col "$doc" c4
		write_col "$server" c5
		write_col "$ip" c6
		write_col "$os" c7
		write_col "5.3.3.4.4" c8
		write_col "Configure pam_unix module" c9
		write_col "Ensure pam_unix includes use_authtok" c10
		write_col "Use authtok - When password changing enforce the module to set the new password to the one provided by a previously stacked password module" c11
		write_col "Pam_unix includes use_authtok" c12
		write_col "Output should be similar to = $entry" c13
		write_col "KO" c14
		write_col "$severity" c15
		write_col "$scandate" c16
    fi
done

########################End########################

########################Configure user default environment########################

#5.4.3.2 Ensure default user shell timeout is configured

#!/usr/bin/env bash
{
 output1=""
 output2=""
 [ -f /etc/bashrc ] && BRC="/etc/bashrc"
 for f in "$BRC" /etc/profile /etc/profile.d/*.sh ; do
 grep -Pq '^\s*([^#]+\s+)?TMOUT=(900|[1-8][0-9][0-9]|[1-9][0-9]|[1-9])\b' "$f" && grep -Pq '^\s*([^#]+;\s*)?export\s+TMOUT(\s+|\s*;|\s*$|=(900|[1-8][0-9][0-9]|[1-9][0-9]|[1-9]))\b' "$f" && output1="$f"
 done
 grep -Pq '^\s*([^#]+\s+)?TMOUT=(9[0-9][1-9]|9[1-9][0-9]|0+|[1-9]\d{3,})\b' /etc/profile /etc/profile.d/*.sh "$BRC" && output2=$(grep -Ps '^\s*([^#]+\s+)?TMOUT=(9[0-9][1-9]|9[1-9][0-9]|0+|[1-9]\d{3,})\b' /etc/profile /etc/profile.d/*.sh $BRC)
 if [ -n "$output1" ] && [ -z "$output2" ]; then
 echo -e "\nPASSED\n\nTMOUT is configured in: \"$output1\"\n" >/dev/null
 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "5.4.3.2" c8
 write_col "Configure user default environment" c9
 write_col "Ensure default user shell timeout is configured" c10
 write_col "TMOUT is an environmental setting that determines the timeout of a shell in seconds" c11
 write_col "Default user shell timeout is 900 seconds or less" c12
 write_col "TMOUT is configured in $output1" c13
 write_col "OK" c14
 write_col "$severity" c15
 write_col "$scandate" c16
 else
 [ -z "$output1" ] && echo -e "\nFAILED\n\nTMOUT is not configured\n" >/dev/null
 [ -n "$output2" ] && echo -e "\nFAILED\n\nTMOUT is incorrectly configured in: \"$output2\"\n" >/dev/null
 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "5.4.3.2" c8
 write_col "Configure user default environment" c9
 write_col "Ensure default user shell timeout is configured" c10
 write_col "TMOUT is an environmental setting that determines the timeout of a shell in seconds" c11
 write_col "Default user shell timeout is 900 seconds or less" c12
 write_col "TMOUT is not configured or TMOUT is not set to 900 seconds or less or TMOUT is set to 0 Note : Review /etc/bashrc /etc/profile and all files ending in *.sh in the /etc/profile.d/ directory and remove or edit all TMOUT=_n_ entries to follow local site policy. TMOUT should not exceed 900 or be equal to 0. Configure TMOUT in one of the following files: A file in the /etc/profile.d/ directory ending in .sh or in file /etc/profile or in file /etc/bashrc" c13
 write_col "KO" c14
 write_col "$severity" c15
 write_col "$scandate" c16
 fi
}

# 5.4.3.3 Ensure system-wide umask is configured

{
 l_output=""
 l_output2=""

 profile_files="/etc/profile.d/*.sh"
 profile_umask_found="false"
 profile_noncompliant=""

 for file in $profile_files; do
   if [[ -f "$file" ]]; then

     umask_val=$(grep -Psi '^\h*umask\b' "$file" | awk '{print $2}' | tail -1)

     if [[ -n "$umask_val" ]]; then
       profile_umask_found="true"

       # Check if umask <= 027 (more restrictive)
       if [[ "$umask_val" -le 027 ]]; then
         l_output="$l_output $file has compliant umask ($umask_val) |"
       else
         profile_noncompliant="$profile_noncompliant $file:$umask_val"
       fi
     fi

   fi
 done

 if [[ "$profile_umask_found" != "true" ]]; then
   l_output2="$l_output2 No umask found in /etc/profile.d/*.sh"
 fi

 if [[ -n "$profile_noncompliant" ]]; then
   l_output2="$l_output2 Non-compliant umask in profile files: $profile_noncompliant"
 fi

 login_file="/etc/login.defs"

 if [[ -f "$login_file" ]]; then

   login_umask=$(grep -Psi '^\h*UMASK\b' "$login_file" | awk '{print $2}' | tail -1)

   if [[ -n "$login_umask" ]]; then

     if [[ "$login_umask" -le 027 ]]; then
       l_output="$l_output login.defs UMASK is compliant ($login_umask)"
     else
       l_output2="$l_output2 login.defs UMASK is non-compliant ($login_umask)"
     fi

   else
     l_output2="$l_output2 UMASK not set in /etc/login.defs"
   fi

 else
   l_output2="$l_output2 File not found: /etc/login.defs"
 fi

 if [[ -z "$l_output2" ]]; then
   status="OK"
   details="$l_output"
 else
   status="KO"
   details="$l_output2"
 fi

 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "5.4.3.3" c8
 write_col "User Environment" c9
 write_col "Ensure system-wide umask is configured" c10
 write_col "Restrict default file permissions to prevent unauthorized access" c11
 write_col "umask must be 027 or more restrictive (e.g., 077)" c12
 write_col "$details" c13
 write_col "$status" c14
 write_col "$severity" c15
 write_col "$scandate" c16

}

########################End########################

########################Configure Software and Patch Management########################

#1.2.1.2 Ensure gpgcheck is globally activated

if [[ $(grep ^gpgcheck /etc/dnf/dnf.conf) == "gpgcheck=1" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.2.1.2" c8
write_col "Configure Software and Patch Management" c9
write_col "Ensure gpgcheck is globally activated" c10
write_col "The gpgcheck option found in the main section of the /etc/dnf/dnf.conf and individual /etc/yum.repos.d/* files determines if RPM packages signature is checked prior to its installation" c11
write_col "Ensure gpgcheck is globally activated how implemented set gpgcheck=1 in /etc/dnf/dnf.conf do not override in /etc/yum.repos.d" c12
write_col "$(grep ^gpgcheck /etc/dnf/dnf.conf)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.2.1.2" c8
write_col "Configure Software and Patch Management" c9
write_col "Ensure gpgcheck is globally activated" c10
write_col "The gpgcheck option found in the main section of the /etc/dnf/dnf.conf and individual /etc/yum.repos.d/* files determines if RPM packages signature is checked prior to its installation" c11
write_col "Ensure gpgcheck is globally activated how implemented set gpgcheck=1 in /etc/dnf/dnf.conf do not override in /etc/yum.repos.d" c12
write_col "Gpgcheck is not globally activated in /etc/dnf/dnf.conf" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

if [[ $(grep -Prs -- '^\h*gpgcheck\h*=\h*(0|[2-9]|[1-9][0-9]+|[a-zA-Z_]+)\b' /etc/yum.repos.d/ | wc -l) -eq "0" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.2.1.2" c8
write_col "Configure Software and Patch Management" c9
write_col "Ensure gpgcheck is globally activated" c10
write_col "The gpgcheck option found in the main section of the /etc/dnf/dnf.conf and individual /etc/yum.repos.d/* files determines if RPM packages signature is checked prior to its installation" c11
write_col "Ensure gpgcheck is globally activated how implemented set gpgcheck=1 in /etc/dnf/dnf.conf do not override in /etc/yum.repos.d" c12
write_col "Gpgcheck is globally activated no instances of entries starting with gpgcheck returned set to 0 nor there are any invalid (non-boolean) values" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.2.1.2" c8
write_col "Configure Software and Patch Management" c9
write_col "Ensure gpgcheck is globally activated" c10
write_col "The gpgcheck option found in the main section of the /etc/dnf/dnf.conf and individual /etc/yum.repos.d/* files determines if RPM packages signature is checked prior to its installation" c11
write_col "Ensure gpgcheck is globally activated how implemented set gpgcheck=1 in /etc/dnf/dnf.conf do not override in /etc/yum.repos.d" c12
write_col "Gpgcheck is not globally activated there are instances of entries starting with gpgcheck returned set to 0 or there are any invalid (non-boolean) values" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

########################Linux######################################################

########################Configure Integrity Checking########################

#6.1.1 Ensure AIDE is installed

pack=`rpm -q aide`

if [[ $pack != "package aide is not installed" ]]
then
rpm -q aide >package
for out in `cat package`
do
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "6.1.1" c8
write_col "Configure Integrity Checking" c9
write_col "Ensure AIDE is intalled" c10
write_col "AIDE is an intrusion detection tool that uses predefined rules to check the integrity of files and directories in the Linux operating system" c11
write_col "Install AIDE" c12
write_col "AIDE is installed Output : $out" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
done
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "6.1.1" c8
write_col "Configure Integrity Checking" c9
write_col "Ensure AIDE is installed" c10
write_col "AIDE is an intrusion detection tool that uses predefined rules to check the integrity of files and directories in the Linux operating system" c11
write_col "Install AIDE" c12
write_col "AIDE is not installed Output : $(rpm -q aide)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

rm -rf package

#6.1.2 Ensure filesystem integrity is regularly checked

cron=`grep -Ers '^([^#]+[[:space:]]+)?(\/usr\/s?bin\/|^[[:space:]]*)aide(\.wrapper)?[[:space:]](--?\S+[[:space:]])*(--(check|update)|\$AIDEARGS)' /etc/cron.* /etc/crontab /var/spool/cron/`

if [[ -n $cron ]]
then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "6.1.2" c8
write_col "Configure Integrity Checking" c9
write_col "Ensure filesystem integrity is regularly checked" c10
write_col "Periodic checking of the filesystem integrity is needed to detect changes to the filesystem" c11
write_col "Run AIDE daily" c12
write_col "Cron job is scheduled to run the aide check daily Output : $(grep -Ers '^([^#]+[[:space:]]+)?(\/usr\/s?bin\/|^[[:space:]]*)aide(\.wrapper)?[[:space:]](--?\S+[[:space:]])*(--(check|update)|\$AIDEARGS)' /etc/cron.* /etc/crontab /var/spool/cron/)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
service_enabled=`systemctl is-enabled aidecheck.service`
timer_enabled=`systemctl is-enabled aidecheck.timer`
timer_status=`systemctl is-active aidecheck.timer`
if [[ $service_enabled == "enabled" ]] && [[ $timer_enabled == "enabled" ]] && [[ $timer_status == "active" ]]
then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "6.1.2" c8
write_col "Configure Integrity Checking" c9
write_col "Ensure filesystem integrity is regularly checked" c10
write_col "Periodic checking of the filesystem integrity is needed to detect changes to the filesystem" c11
write_col "Run AIDE daily" c12
write_col "Aidecheck.service is set to $service_enabled aidecheck.timer is set to $timer_enabled aidecheck.timer is set to $timer_status to run the aide check daily" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "6.1.2" c8
write_col "Configure Integrity Checking" c9
write_col "Ensure filesystem integrity is regularly checked" c10
write_col "Periodic checking of the filesystem integrity is needed to detect changes to the filesystem" c11
write_col "Run AIDE daily" c12
write_col "Neither cron job is scheduled to run the aide check daily nor the aidecheck.service and aidecheck.timer is found enabled and active to run the aide check daily" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
fi

#6.1.3 Ensure cryptographic mechanisms are used to protect the integrity of audit tools

output=$(grep -Es -- '(\/sbin\/(audit|au)\H*)' /etc/aide.conf.d/*.conf /etc/aide.conf)

expected_lines=(
    "/sbin/auditctl p+i+n+u+g+s+b+acl+xattrs+sha512"
    "/sbin/auditd p+i+n+u+g+s+b+acl+xattrs+sha512"
    "/sbin/ausearch p+i+n+u+g+s+b+acl+xattrs+sha512"
    "/sbin/aureport p+i+n+u+g+s+b+acl+xattrs+sha512"
    "/sbin/autrace p+i+n+u+g+s+b+acl+xattrs+sha512"
    "/sbin/augenrules p+i+n+u+g+s+b+acl+xattrs+sha512"
)

# Check each expected line
for line in "${expected_lines[@]}"; do
    if echo "$output" | grep -q "$line"; then
		write_col "$customer" c1
		write_col "$custinvid" c2
		write_col "$policy" c3
		write_col "$doc" c4
		write_col "$server" c5
		write_col "$ip" c6
		write_col "$os" c7
		write_col "6.1.3" c8
		write_col "Configure Integrity Checking" c9
		write_col "Ensure cryptographic mechanisms are used to protect the integrity of audit tools" c10
		write_col "Audit tools include custom queries and report generators" c11
		write_col "Cryptographic mechanisms are used to protect the integrity of audit tools" c12
        write_col "Included: $line" c13
		write_col "OK" c14
		write_col "$severity" c15
		write_col "$scandate" c16
    else
		write_col "$customer" c1
		write_col "$custinvid" c2
		write_col "$policy" c3
		write_col "$doc" c4
		write_col "$server" c5
		write_col "$ip" c6
		write_col "$os" c7
		write_col "6.1.3" c8
		write_col "Configure Integrity Checking" c9
		write_col "Ensure cryptographic mechanisms are used to protect the integrity of audit tools" c10
		write_col "Audit tools include custom queries and report generators" c11
		write_col "Cryptographic mechanisms are used to protect the integrity of audit tools" c12
        write_col "Not included: $line" c13
		write_col "KO" c14
		write_col "$severity" c15
		write_col "$scandate" c16
    fi
done

########################End########################

########################Configure Secure Boot Settings########################

#1.4.1 Ensure bootloader password is Set

{
 l_grub_password_file="$(find /boot -type f -name 'user.cfg' ! -empty)"
 if [ -f "$l_grub_password_file" ]; then
 boot=`awk -F. '/^[[:space:]]*GRUB2_PASSWORD=\S+/ {print $1"."$2"."$3}' "$l_grub_password_file"`
 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "1.4.1" c8
 write_col "Configure Secure Boot Settings" c9
 write_col "Ensure bootloader password is set" c10
 write_col "Setting the boot loader password will require that anyone rebooting the system must enter a password before being able to set command line boot parameters" c11
 write_col "Bootloader password is set" c12
 write_col "Bootloader password is set Output : $boot" c13
 write_col "OK" c14
 write_col "$severity" c15
 write_col "$scandate" c16
 else
 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "1.4.1" c8
 write_col "Configure Secure Boot Settings" c9
 write_col "Ensure bootloader password is set" c10
 write_col "Setting the boot loader password will require that anyone rebooting the system must enter a password before being able to set command line boot parameters" c11
 write_col "Bootloader password is set" c12
 write_col "Bootloader password is not set" c13
 write_col "KO" c14
 write_col "$severity" c15
 write_col "$scandate" c16
 fi
}

#1.4.2 Ensure access to bootloader config is configured

{
 l_output=""
 l_output2="" 
 file_mug_chk()
 {
 l_out=""
 l_out2=""
 [[ "$(dirname "$l_file")" =~ ^\/boot\/efi\/EFI ]] && l_pmask="0077" || l_pmask="0177"
 l_maxperm="$( printf '%o' $(( 0777 & ~$l_pmask )) )"
 if [ $(( $l_mode & $l_pmask )) -gt 0 ]; then
 l_out2="$l_out2\n - Is mode \"$l_mode\" and should be mode: \"$l_maxperm\" or more restrictive"
 else
 l_out="$l_out\n - Is correctly mode: \"$l_mode\" which is mode: \"$l_maxperm\" or more restrictive"
 fi
 if [ "$l_user" = "root" ]; then
 l_out="$l_out\n - Is correctly owned by user: \"$l_user\""
 else
 l_out2="$l_out2\n - Is owned by user: \"$l_user\" and should be owned by user: \"root\""
 fi
 if [ "$l_group" = "root" ]; then
 l_out="$l_out\n - Is correctly group-owned by group: \"$l_user\""
 else
 l_out2="$l_out2\n - Is group-owned by group: \"$l_user\" and should be group-owned by group: \"root\""
 fi
 [ -n "$l_out" ] && l_output="$l_output\n - File: \"$l_file\"$l_out\n"
 [ -n "$l_out2" ] && l_output2="$l_output2\n - File: \"$l_file\"$l_out2\n"
 }
 while IFS= read -r -d $'\0' l_gfile; do
 while read -r l_file l_mode l_user l_group; do
 file_mug_chk
 done <<< "$(stat -Lc '%n %#a %U %G' "$l_gfile")"
 done < <(find /boot -type f \( -name 'grub*' -o -name 'user.cfg' \) -print0)
 if [ -z "$l_output2" ]; then
 echo -e "\n- Audit Result:\n *** PASS ***\n- * Correctly set * :\n$l_output\n" >/dev/null
 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "1.4.2" c8
 write_col "Configure Secure Boot Settings" c9
 write_col "Ensure permissions on bootloader config are configured" c10
 write_col "The grub files contain information on boot settings and passwords for unlocking boot options" c11
 write_col "Only root has read & write permissions to bootloader files" c12
 #Replace occurrences of \n\n with 20 spaces except for the first occurrence.
 l_output=$(echo "$l_output" | sed '0,/\\n\\n/s//\\n\\n/; s/\\n\\n/                    /g')
 write_col "$l_output" c13
 write_col "OK" c14
 write_col "$severity" c15
 write_col "$scandate" c16
 else
 echo -e "\n- Audit Result:\n ** FAIL **\n - * Reasons for audit failure * :\n$l_output2\n" >/dev/null
 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "1.4.2" c8
 write_col "Configure Secure Boot Settings" c9
 write_col "Ensure permissions on bootloader config are configured" c10
 write_col "The grub files contain information on boot settings and passwords for unlocking boot options" c11
 write_col "Only root has read & write permissions to bootloader files" c12
 ##Replace occurrences of \n\n with 20 spaces except for the first occurrence.
 l_output2=$(echo "$l_output2" | sed '0,/\\n\\n/s//\\n\\n/; s/\\n\\n/                    /g')
 write_col "$l_output2" c13
 write_col "KO" c14
 write_col "$severity" c15
 write_col "$scandate" c16
 [ -n "$l_output" ] && echo -e " - * Correctly set * :\n$l_output\n" >/dev/null
 fi
}

# 1.5.1 Ensure core file size is configured

limits_files="/etc/security/limits.conf /etc/security/limits.d/*.conf"
sysctl_files="/etc/sysctl.conf /etc/sysctl.d/*.conf"

core_limit=$(grep -REh '^[[:space:]]*\*[[:space:]]+hard[[:space:]]+core[[:space:]]+0' $limits_files 2>/dev/null)
suid_dump=$(grep -REh '^[[:space:]]*fs\.suid_dumpable[[:space:]]*=[[:space:]]*0' $sysctl_files 2>/dev/null)

if [[ -n "$core_limit" && -n "$suid_dump" ]]; then
  status="OK"
  details="Core dumps restricted via limits and fs.suid_dumpable=0"
else
  status="KO"
  details="Missing configuration: core dump restrictions not fully set"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.5.1" c8
write_col "Ensure core file size is configured" c9
write_col "Ensure core file size is configured" c10
write_col "Core dumps may contain sensitive data and should be restricted to prevent information disclosure" c11
write_col "Set '* hard core 0' and fs.suid_dumpable = 0" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

# 1.5.2 Ensure fs.protected_hardlinks is set to 1

{
l_output=""
l_output2=""
param="fs.protected_hardlinks"
expected="1"

runtime_val=$(sysctl -n $param 2>/dev/null)

if [[ "$runtime_val" == "$expected" ]]; then
  runtime_status="OK"
  l_output="Runtime correct ($param=$runtime_val)"
else
  runtime_status="KO"
  l_output2="Runtime incorrect ($param=$runtime_val)"
fi

files=(/etc/sysctl.conf /etc/sysctl.d/*.conf)
persist_found="no"
persist_correct="no"
last_val=""

for file in "${files[@]}"; do
  [[ -f "$file" ]] || continue

  val=$(grep -E "^\s*$param\s*=" "$file" | tail -1 | cut -d= -f2 | xargs)

  if [[ -n "$val" ]]; then
    persist_found="yes"
    last_val="$val"
    persist_file="$file"

    if [[ "$val" == "$expected" ]]; then
      persist_correct="yes"
    fi
  fi
done

if [[ "$persist_found" == "no" ]]; then
  l_output2="$l_output2 Persistent setting missing"
elif [[ "$last_val" != "$expected" ]]; then
  l_output2="$l_output2 Persistent incorrect (last value=$last_val in $persist_file)"
else
  l_output="$l_output | Persistent correct ($param=$expected in $persist_file)"
fi

if [[ "$runtime_status" == "OK" && "$last_val" == "$expected" ]]; then
  status="OK"
  final_output="$l_output"
else
  status="KO"
  final_output="$l_output2"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.5.2" c8
write_col "Kernel Hardening" c9
write_col "Ensure fs.protected_hardlinks is configured" c10
write_col "Protect against hardlink attacks" c11
write_col "fs.protected_hardlinks must be set to 1" c12
write_col "$final_output" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

}

# 1.5.4 Ensure fs.suid_dumpable is set to 0

{
l_output=""
l_output2=""
param="fs.suid_dumpable"
expected="0"

runtime_val=$(sysctl -n $param 2>/dev/null)

if [[ "$runtime_val" == "$expected" ]]; then
  runtime_status="OK"
  l_output="Runtime correct ($param=$runtime_val)"
else
  runtime_status="KO"
  l_output2="Runtime incorrect ($param=$runtime_val)"
fi

files=(/etc/sysctl.conf /etc/sysctl.d/*.conf)
persist_found="no"
last_val=""
persist_file=""

for file in "${files[@]}"; do
  [[ -f "$file" ]] || continue

  val=$(grep -E "^\s*$param\s*=" "$file" | tail -1 | cut -d= -f2 | xargs)

  if [[ -n "$val" ]]; then
    persist_found="yes"
    last_val="$val"
    persist_file="$file"
  fi
done

# -------- FIXED LOGIC --------
if [[ "$persist_found" == "no" ]]; then
  l_output2="$l_output2 Persistent setting missing"
elif [[ "$last_val" != "$expected" ]]; then
  l_output2="$l_output2 Persistent incorrect (last value=$last_val in $persist_file)"
else
  l_output="$l_output | Persistent correct ($param=$expected in $persist_file)"
fi

# -------- FINAL STATUS --------
if [[ "$runtime_status" == "OK" && "$last_val" == "$expected" ]]; then
  status="OK"
  final_output="$l_output"
else
  status="KO"
  final_output="$l_output2"
fi

# -------- CSV OUTPUT --------
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.5.4" c8
write_col "Kernel Hardening" c9
write_col "Ensure fs.suid_dumpable is configured" c10
write_col "Disable core dumps for setuid programs" c11
write_col "fs.suid_dumpable must be set to 0" c12
write_col "$final_output" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

}

# 1.5.5 Ensure kernel.dmesg_restrict is set to 1

{
 l_output=""
 l_output2=""
 param="kernel.dmesg_restrict"

 runtime_val=$(sysctl -n $param 2>/dev/null)

 if [[ "$runtime_val" == "1" ]]; then
   l_output="$l_output Runtime value is correct ($param=$runtime_val)"
 else
   l_output2="$l_output2 Runtime value incorrect ($param=$runtime_val)"
 fi

 l_grep="${param//./(\\.|\\/)}"
 declare -a files=()
 found_correct=""
 found_incorrect=""

 # Detect systemd-sysctl binary
 sysctl_bin=$(readlink -e /lib/systemd/systemd-sysctl || readlink -e /usr/lib/systemd/systemd-sysctl)

 # Collect config files from systemd
 while IFS= read -r file; do
   resolved=$(readlink -e "${file//# /}")
   [[ -n "$resolved" ]] && files+=("$resolved")
 done < <("$sysctl_bin" --cat-config 2>/dev/null | tac | grep -Pio '^\h*#\h*\/[^#\n\r\h]+\.conf\b')

 # Add default config
 files+=("/etc/sysctl.conf")

 for file in "${files[@]}"; do
   [[ -f "$file" ]] || continue

   val=$(grep -Poi "^\h*$l_grep\h*=\h*\H+" "$file" | tail -1 | cut -d= -f2 | xargs)

   if [[ -n "$val" ]]; then
     if [[ "$val" == "1" ]]; then
       found_correct="yes"
       l_output="$l_output | $param=1 set in $file"
     else
       found_incorrect="yes"
       l_output2="$l_output2 $param incorrectly set to $val in $file"
     fi
   fi
 done

 if [[ "$found_correct" != "yes" ]]; then
   l_output2="$l_output2 No persistent setting found for $param=1"
 fi

 if [[ -z "$l_output2" ]]; then
   status="OK"
 else
   status="KO"
 fi

 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "1.5.5" c8
 write_col "Kernel Hardening" c9
 write_col "Ensure kernel.dmesg_restrict is configured" c10
 write_col "Restrict access to kernel logs to prevent information leakage" c11
 write_col "kernel.dmesg_restrict must be set to 1 (runtime and persistent)" c12

 if [[ "$status" == "OK" ]]; then
   write_col "$l_output" c13
   write_col "OK" c14
 else
   write_col "$l_output2" c13
   write_col "KO" c14
 fi

 write_col "$severity" c15
 write_col "$scandate" c16

}

# 1.5.6 Ensure kernel.kptr_restrict is configured

{
l_output=""
l_output2=""
param="kernel.kptr_restrict"

runtime_val=$(sysctl -n $param 2>/dev/null)

if [[ "$runtime_val" == "1" || "$runtime_val" == "2" ]]; then
  runtime_status="OK"
  l_output="Runtime correct ($param=$runtime_val)"
else
  runtime_status="KO"
  l_output2="Runtime incorrect ($param=$runtime_val)"
fi

files=(/etc/sysctl.conf /etc/sysctl.d/*.conf)
persist_found="no"
last_val=""
persist_file=""

for file in "${files[@]}"; do
  [[ -f "$file" ]] || continue

  val=$(grep -E "^\s*$param\s*=" "$file" | tail -1 | cut -d= -f2 | xargs)

  if [[ -n "$val" ]]; then
    persist_found="yes"
    last_val="$val"
    persist_file="$file"
  fi
done

# -------- FIXED LOGIC --------
if [[ "$persist_found" == "no" ]]; then
  l_output2="$l_output2 Persistent setting missing"
elif [[ "$last_val" != "1" && "$last_val" != "2" ]]; then
  l_output2="$l_output2 Persistent incorrect (last value=$last_val in $persist_file)"
else
  l_output="$l_output | Persistent correct ($param=$last_val in $persist_file)"
fi

# -------- FINAL STATUS --------
if [[ "$runtime_status" == "OK" && ( "$last_val" == "1" || "$last_val" == "2" ) ]]; then
  status="OK"
  final_output="$l_output"
else
  status="KO"
  final_output="$l_output2"
fi

# -------- CSV OUTPUT --------
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.5.6" c8
write_col "Kernel Hardening" c9
write_col "Ensure kernel.kptr_restrict is configured" c10
write_col "Restrict kernel pointer exposure" c11
write_col "kernel.kptr_restrict must be set to 1 or 2" c12
write_col "$final_output" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

}

# 1.5.7 Ensure kernel.yama.ptrace_scope is configured

{
 l_output=""
 l_output2=""
 param="kernel.yama.ptrace_scope"

 runtime_val=$(sysctl -n $param 2>/dev/null)

 if [[ "$runtime_val" == "1" || "$runtime_val" == "2" || "$runtime_val" == "3" ]]; then
   l_output="$l_output Runtime value is correct ($param=$runtime_val)"
 else
   l_output2="$l_output2 Runtime value incorrect ($param=$runtime_val)"
 fi

 l_grep="${param//./(\\.|\\/)}"
 declare -a files=()
 found_correct=""
 found_incorrect=""

 # Detect systemd-sysctl binary
 sysctl_bin=$(readlink -e /lib/systemd/systemd-sysctl || readlink -e /usr/lib/systemd/systemd-sysctl)

 # Collect config files in precedence order
 while IFS= read -r file; do
   resolved=$(readlink -e "${file//# /}")
   [[ -n "$resolved" ]] && files+=("$resolved")
 done < <("$sysctl_bin" --cat-config 2>/dev/null | tac | grep -Pio '^\h*#\h*\/[^#\n\r\h]+\.conf\b')

 # Add fallback
 files+=("/etc/sysctl.conf")

 for file in "${files[@]}"; do
   [[ -f "$file" ]] || continue

   val=$(grep -Poi "^\h*$l_grep\h*=\h*\H+" "$file" | tail -1 | cut -d= -f2 | xargs)

   if [[ -n "$val" ]]; then
     if [[ "$val" == "1" || "$val" == "2" || "$val" == "3" ]]; then
       found_correct="yes"
       l_output="$l_output | $param=$val set in $file"
     else
       found_incorrect="yes"
       l_output2="$l_output2 $param incorrectly set to $val in $file"
     fi
   fi
 done

 if [[ "$found_correct" != "yes" ]]; then
   l_output2="$l_output2 No persistent setting found for $param"
 fi

 if [[ -z "$l_output2" ]]; then
   status="OK"
 else
   status="KO"
 fi

 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "1.5.7" c8
 write_col "Kernel Hardening" c9
 write_col "Ensure kernel.yama.ptrace_scope is configured" c10
 write_col "Restrict ptrace access to prevent process inspection attacks" c11
 write_col "kernel.yama.ptrace_scope must be set to 1, 2, or 3" c12

 if [[ "$status" == "OK" ]]; then
   write_col "$l_output" c13
   write_col "OK" c14
 else
   write_col "$l_output2" c13
   write_col "KO" c14
 fi

 write_col "$severity" c15
 write_col "$scandate" c16

}

# 1.5.8 Ensure kernel.randomize_va_space is configured

{
 l_output=""
 l_output2=""
 param="kernel.randomize_va_space"

 runtime_val=$(sysctl -n $param 2>/dev/null)

 if [[ "$runtime_val" == "2" ]]; then
   l_output="$l_output Runtime value is correct ($param=$runtime_val)"
 else
   l_output2="$l_output2 Runtime value incorrect ($param=$runtime_val)"
 fi

 l_grep="${param//./(\\.|\\/)}"
 declare -a files=()
 found_correct=""
 found_incorrect=""

 # Detect systemd-sysctl
 sysctl_bin=$(readlink -e /lib/systemd/systemd-sysctl || readlink -e /usr/lib/systemd/systemd-sysctl)

 # Collect config files in precedence order
 while IFS= read -r file; do
   resolved=$(readlink -e "${file//# /}")
   [[ -n "$resolved" ]] && files+=("$resolved")
 done < <("$sysctl_bin" --cat-config 2>/dev/null | tac | grep -Pio '^\h*#\h*\/[^#\n\r\h]+\.conf\b')

 # Add fallback file
 files+=("/etc/sysctl.conf")

 for file in "${files[@]}"; do
   [[ -f "$file" ]] || continue

   val=$(grep -Poi "^\h*$l_grep\h*=\h*\H+" "$file" | tail -1 | cut -d= -f2 | xargs)

   if [[ -n "$val" ]]; then
     if [[ "$val" == "2" ]]; then
       found_correct="yes"
       l_output="$l_output | $param=2 set in $file"
     else
       found_incorrect="yes"
       l_output2="$l_output2 $param incorrectly set to $val in $file"
     fi
   fi
 done

 if [[ "$found_correct" != "yes" ]]; then
   l_output2="$l_output2 No persistent setting found for $param=2"
 fi

 if [[ -z "$l_output2" ]]; then
   status="OK"
 else
   status="KO"
 fi

 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "1.5.8" c8
 write_col "Kernel Hardening" c9
 write_col "Ensure kernel.randomize_va_space is configured" c10
 write_col "Enable ASLR to randomize memory layout and prevent exploitation" c11
 write_col "kernel.randomize_va_space must be set to 2 (runtime and persistent)" c12

 if [[ "$status" == "OK" ]]; then
   write_col "$l_output" c13
   write_col "OK" c14
 else
   write_col "$l_output2" c13
   write_col "KO" c14
 fi

 write_col "$severity" c15
 write_col "$scandate" c16

}
 
#1.5.9 Ensure systemd-coredump ProcessSizeMax is configured

main_conf="/etc/systemd/coredump.conf"
dropin_dir="/etc/systemd/coredump.conf.d"

psm=$(
  {
    [[ -f "$main_conf" ]] && grep -Eih '^[[:space:]]*ProcessSizeMax[[:space:]]*=[[:space:]]*0' "$main_conf"
    [[ -d "$dropin_dir" ]] && grep -REih '^[[:space:]]*ProcessSizeMax[[:space:]]*=[[:space:]]*0' "$dropin_dir"/*.conf
  } 2>/dev/null | tail -n 1
)

if [[ -n "$psm" ]]; then
  status="OK"
  details="ProcessSizeMax is set to 0 in systemd-coredump configuration"
else
  status="KO"
  details="ProcessSizeMax is not configured or not set to 0"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.5.9" c8
write_col "Ensure systemd-coredump ProcessSizeMax is configured" c9
write_col "Ensure systemd-coredump ProcessSizeMax is configured" c10
write_col "Limiting ProcessSizeMax prevents large core dumps from exposing sensitive data" c11
write_col "ProcessSizeMax must be set to 0 in coredump configuration" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

# 1.5.10 Ensure systemd-coredump Storage is configured

main_conf="/etc/systemd/coredump.conf"
dropin_dir="/etc/systemd/coredump.conf.d"

storage_setting=$(
  {
    [[ -f "$main_conf" ]] && grep -Eih '^[[:space:]]*Storage[[:space:]]*=' "$main_conf"
    [[ -d "$dropin_dir" ]] && grep -REih '^[[:space:]]*Storage[[:space:]]*=' "$dropin_dir"/*.conf
  } 2>/dev/null | tail -n 1 | awk -F= '{print $2}' | tr -d ' "'
)

if [[ "$storage_setting" == "none" ]]; then
  status="OK"
  details="systemd-coredump Storage is set to none"
else
  status="KO"
  details="systemd-coredump Storage is not set to none (current=${storage_setting:-Not Set})"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.5.10" c8
write_col "Ensure systemd-coredump Storage is configured" c9
write_col "Ensure systemd-coredump Storage is configured" c10
write_col "Disabling core dump storage prevents sensitive memory contents from being written to disk" c11
write_col "Storage must be set to none in systemd-coredump configuration" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16



########################End########################

########################Configure SELinux########################

#1.3.1.2 Ensure SELinux is not disabled in bootloader configuration

selinux=`grubby --info=ALL | grep -Eo '(selinux|enforcing)=0' | wc -l`

if [[ $selinux -eq "0" ]]
then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.3.1.2" c8
write_col "Configure SELinux" c9
write_col "Ensure SELinux is not disabled in bootloader configuration" c10
write_col "Configure SELINUX to be enabled at boot time and verify that it has not been overwritten by the grub boot parameters" c11
write_col "Neither selinux=0 nor enforcing=0 is set in the bootloader configuration" c12
write_col "Neither selinux=0 nor enforcing=0 is set in the bootloader configuration" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
grubby --info=ALL | grep -Eo '(selinux|enforcing)=0' >output
for parameter in `cat output`
do
if [[ $parameter == "selinux=0" ]]
then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.3.1.2" c8
write_col "Configure SELinux" c9
write_col "Ensure SELinux is not disabled in bootloader configuration" c10
write_col "Configure SELINUX to be enabled at boot time and verify that it has not been overwritten by the grub boot parameters" c11
write_col "Neither selinux=0 nor enforcing=0 is set in the bootloader configuration" c12
write_col "Selinux is set to value 0 Output : $parameter" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.3.1.2" c8
write_col "Configure SELinux" c9
write_col "Ensure SELinux is not disabled in bootloader configuration" c10
write_col "Configure SELINUX to be enabled at boot time and verify that it has not been overwritten by the grub boot parameters" c11
write_col "Neither selinux=0 nor enforcing=0 is set in the bootloader configuration" c12
write_col "Enforcing is set to value 0 Output : $parameter" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
done
fi

rm -rf output

#1.3.1.4 Ensure the SELinux mode is not disabled

pack1=`rpm -q libselinux`

if [[ $pack1 != "package libselinux is not installed" ]]
then
mode=`getenforce | xargs`
if [[ $mode == "enforcing" ]] || [[ $mode == "Enforcing" ]] || [[ $mode == "permissive" ]] || [[ $mode == "Permissive" ]]
then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.3.1.4" c8
write_col "Configure SELinux" c9
write_col "Ensure the SELinux mode is not disabled" c10
write_col "SELinux can run in one of three modes disabled permissive or enforcing" c11
write_col "SELinux is set to enforcing or permissive in /etc/selinux/config" c12
write_col "SELinux mode is not set to disabled Output : SELinux current mode : $mode" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.3.1.4" c8
write_col "Configure SELinux" c9
write_col "Ensure the SELinux mode is not disabled" c10
write_col "SELinux can run in one of three modes disabled permissive or enforcing" c11
write_col "SELinux is set to enforcing or permissive in /etc/selinux/config" c12
write_col "SELinux mode is set to disabled Output : SELinux current mode : $mode" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.3.1.4" c8
write_col "Configure SELinux" c9
write_col "Ensure the SELinux mode is not disabled" c10
write_col "SELinux can run in one of three modes disabled permissive or enforcing" c11
write_col "SELinux is set to enforcing or permissive in /etc/selinux/config" c12
write_col "SELinux is not installed Output : $(rpm -q libselinux)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

pack2=`rpm -q libselinux`

if [[ $pack2 != "package libselinux is not installed" ]]
then
selinux_mode=$(grep -Ei '^[[:space:]]*SELINUX=(enforcing|permissive)' /etc/selinux/config)
if [[ $selinux_mode =~ SELINUX=enforcing ]]; then
    write_col "$customer" c1
	write_col "$custinvid" c2
	write_col "$policy" c3
	write_col "$doc" c4
	write_col "$server" c5
	write_col "$ip" c6
	write_col "$os" c7
	write_col "1.3.1.4" c8
	write_col "Configure SELinux" c9
	write_col "Ensure the SELinux mode is not disabled" c10
	write_col "SELinux can run in one of three modes disabled permissive or enforcing" c11
	write_col "SELinux is set to enforcing or permissive in /etc/selinux/config" c12
	write_col "SELinux mode is set to enforcing Output : SELinux configured mode : $selinux_mode" c13
	write_col "OK" c14
	write_col "$severity" c15
	write_col "$scandate" c16
elif [[ $selinux_mode =~ SELINUX=permissive ]]; then
    write_col "$customer" c1
	write_col "$custinvid" c2
	write_col "$policy" c3
	write_col "$doc" c4
	write_col "$server" c5
	write_col "$ip" c6
	write_col "$os" c7
	write_col "1.3.1.4" c8
	write_col "Configure SELinux" c9
	write_col "Ensure the SELinux mode is not disabled" c10
	write_col "SELinux can run in one of three modes disabled permissive or enforcing" c11
	write_col "SELinux is set to enforcing or permissive in /etc/selinux/config" c12
	write_col "SELinux mode is set to permissive Output : SELinux configured mode : $selinux_mode" c13
	write_col "OK" c14
	write_col "$severity" c15
	write_col "$scandate" c16
else
    write_col "$customer" c1
	write_col "$custinvid" c2
	write_col "$policy" c3
	write_col "$doc" c4
	write_col "$server" c5
	write_col "$ip" c6
	write_col "$os" c7
	write_col "1.3.1.4" c8
	write_col "Configure SELinux" c9
	write_col "Ensure the SELinux mode is not disabled" c10
	write_col "SELinux can run in one of three modes disabled permissive or enforcing" c11
	write_col "SELinux is set to enforcing or permissive in /etc/selinux/config" c12
	write_col "SELinux mode is not set to enforcing or permissive" c13
	write_col "KO" c14
	write_col "$severity" c15
	write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.3.1.4" c8
write_col "Configure SELinux" c9
write_col "Ensure the SELinux mode is not disabled" c10
write_col "SELinux can run in one of three modes disabled permissive or enforcing" c11
write_col "SELinux is set to enforcing or permissive in /etc/selinux/config" c12
write_col "SELinux is not installed Output : $(rpm -q libselinux)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#1.3.1.8 Ensure SETroubleshoot is not installed

pack3=`rpm -q setroubleshoot`

if [[ $pack3 != "package setroubleshoot is not installed" ]]
then
rpm -q setroubleshoot >package
for out in `cat package`
do
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.3.1.8" c8
write_col "Configure SELinux" c9
write_col "Ensure SETroubleshoot is not installed" c10
write_col "The SETroubleshoot service notifies desktop users of SELinux denials through a user-friendly interface" c11
write_col "Package setroubleshoot is not installed" c12
write_col "Package setroubleshoot is installed Output : $out" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
done
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.3.1.8" c8
write_col "Configure SELinux" c9
write_col "Ensure SETroubleshoot is not installed" c10
write_col "The SETroubleshoot service notifies desktop users of SELinux denials through a user-friendly interface" c11
write_col "Package setroubleshoot is not installed" c12
write_col "Package setroubleshoot is not installed Output : $(rpm -q setroubleshoot)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

rm -rf package

# 1.3.1.3 Ensure SELinux policy is configured

# ---------- Function to sanitize output ----------
sanitize() {
    echo "$1" | tr '\r\n,' '   ' | sed 's/[[:space:]]\+/ /g' | cut -c1-120
}

# ---------- Main Script ----------
status="OK"
details=""

# Check if libselinux installed
pkg=$(rpm -q libselinux 2>/dev/null)

if [[ "$pkg" == *"not installed"* ]]; then
    status="KO"
    details="libselinux not installed"

else
    # Get config value
    config_val=$(grep -Psi '^\h*SELINUXTYPE\h*=\h*(targeted|mls)\b' /etc/selinux/config)

    # Get runtime value
    runtime_val=$(sestatus 2>/dev/null | grep '^Loaded policy name' | awk -F: '{print $2}' | xargs)

    # -------- CIS Logic --------
    if [[ -n "$config_val" && ( "$runtime_val" == "targeted" || "$runtime_val" == "mls" ) ]]; then
        status="OK"
        details="Policy OK ($runtime_val)"
    else
        status="KO"
        details="Policy mismatch config/runtime"
    fi
fi

# -------- Sanitize Output --------
details=$(sanitize "$details")

# -------- Output --------
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.3.1.3" c8
write_col "Configure SELinux" c9
write_col "Ensure SELinux policy is configured" c10
write_col "SELinux should be set to targeted or mls policy" c11
write_col "Verify config and runtime policy match" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

#1.3.1.7 Ensure the MCS Translation Service (mcstrans) is not installed

pack4=`rpm -q mcstrans`

if [[ $pack4 != "package mcstrans is not installed" ]]
then
rpm -q mcstrans >package
for out in `cat package`
do
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.3.1.7" c8
write_col "Configure SELinux" c9
write_col "Ensure the MCS Translation Service (mcstrans) is not installed" c10
write_col "The mcstransd daemon provides category label information to client processes requesting information" c11
write_col "Package mcstrans is not installed" c12
write_col "Package mcstrans is installed Output : $out" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
done
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.3.1.7" c8
write_col "Configure SELinux" c9
write_col "Ensure the MCS Translation Service (mcstrans) is not installed" c10
write_col "The mcstransd daemon provides category label information to client processes requesting information" c11
write_col "Package mcstrans is not installed" c12
write_col "Package mcstrans is not installed Output : $(rpm -q mcstrans)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

rm -rf package

#1.3.1.1 Ensure SELinux is installed

pack5=`rpm -q libselinux`

if [[ $pack5 != "package libselinux is not installed" ]]
then
rpm -q libselinux >package
for out in `cat package`
do
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.3.1.1" c8
write_col "Configure SELinux" c9
write_col "Ensure SELinux is installed" c10
write_col "SELinux provides Mandatory Access Controls" c11
write_col "SELinux is installed" c12
write_col "SELinux is installed Output : $out" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
done
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.3.1.1" c8
write_col "Configure SELinux" c9
write_col "Ensure SELinux is installed" c10
write_col "SELinux provides Mandatory Access Controls" c11
write_col "SELinux is installed" c12
write_col "SELinux is not installed Output : $(rpm -q libselinux)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

rm -rf package

########################End########################

########################Configure Command Line Warning Banners########################

# ---------- Function to sanitize output ----------
sanitize() {
    echo "$1" | tr '\r\n,' '   ' | sed 's/[[:space:]]\+/ /g' | cut -c1-120
}

# ---------- Function to capture current value ----------
get_current_value() {
    local file="$1"
    if [[ -f "$file" ]]; then
        head -3 "$file" | tr '\n' ' ' | tr ',' ' ' | sed 's/[[:space:]]\+/ /g'
    else
        echo "File not present"
    fi
}

# ---------- Main Script ----------
file="/etc/motd"
motd_files=(/etc/motd /etc/motd.d/*)

status="OK"
details=""

# Check if file exists
if [[ ! -f "$file" ]]; then
  status="KO"
  details="motd missing"

# Check if empty
elif [[ ! -s "$file" ]]; then
  status="KO"
  details="motd empty"

else
  os_name=$(grep ^ID= /etc/os-release | cut -d= -f2 | tr -d '"')

  violations=""

  for f in "${motd_files[@]}"; do
    [[ -f "$f" ]] || continue

    if grep -Psqi -- "(\\v|\\r|\\m|\\s|\b${os_name}\b)" "$f"; then
      violations="$violations $(basename "$f")"
    fi
  done

  if [[ -n "$violations" ]]; then
    status="KO"
    details="System info found in:$violations"
  else
    status="OK"
    details="Banner compliant"
  fi
fi

# Get limited content (short)
current_value=$(get_current_value "$file")

# Combine short output
final_output="$details Content:$current_value"

# Sanitize output (IMPORTANT)
final_output=$(sanitize "$final_output")

# ---------- Output ----------
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.7.1" c8
write_col "Configure Command Line Warning Banners" c9
write_col "Ensure /etc/motd is configured" c10
write_col "MOTD should not contain system information" c11
write_col "Ensure banner exists and is sanitized" c12
write_col "$final_output" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

# 1.7.2 Ensure /etc/issue is configured and does not expose system info

# ---------- Function to sanitize output ----------
sanitize() {
    echo "$1" | tr '\r\n,' '   ' | sed 's/[[:space:]]\+/ /g' | cut -c1-120
}

# ---------- Function to capture limited content ----------
get_current_value() {
    local file="$1"
    if [[ -f "$file" ]]; then
        head -3 "$file" | tr '\n' ' ' | tr ',' ' ' | sed 's/[[:space:]]\+/ /g'
    else
        echo "File not present"
    fi
}

# ---------- Main Script ----------
file="/etc/issue"

status="OK"
details=""

# Check if file exists
if [[ ! -f "$file" ]]; then
  status="KO"
  details="issue missing"

# Check if empty
elif [[ ! -s "$file" ]]; then
  status="KO"
  details="issue empty"

else
  os_name=$(grep '^ID=' /etc/os-release | cut -d= -f2 | tr -d '"')

  violation=$(grep -E -i "(\\\v|\\\r|\\\m|\\\s|\b${os_name}\b)" "$file")

  if [[ -n "$violation" ]]; then
    status="KO"
    details="System info found"
  else
    status="OK"
    details="Banner compliant"
  fi
fi

# Get short content
current_value=$(get_current_value "$file")

# Combine short output
final_output="$details Content:$current_value"

# Sanitize (IMPORTANT)
final_output=$(sanitize "$final_output")

# ---------- Output ----------
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.7.2" c8
write_col "Configure Command Line Warning Banners" c9
write_col "Ensure /etc/issue is configured" c10
write_col "Pre-login banner should not disclose system information" c11
write_col "Ensure banner exists and is sanitized" c12
write_col "$final_output" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

# 1.7.3 Ensure /etc/issue.net is configured and does not expose system info

# ---------- Function to sanitize output ----------
sanitize() {
    echo "$1" | tr '\r\n,' '   ' | sed 's/[[:space:]]\+/ /g' | cut -c1-120
}

# ---------- Function to capture limited content ----------
get_current_value() {
    local file="$1"
    if [[ -f "$file" ]]; then
        head -3 "$file" | tr '\n' ' ' | tr ',' ' ' | sed 's/[[:space:]]\+/ /g'
    else
        echo "File not present"
    fi
}

# ---------- Main Script ----------
file="/etc/issue.net"

status="OK"
details=""

# Check if file exists
if [[ ! -f "$file" ]]; then
  status="KO"
  details="issue.net missing"

# Check if empty
elif [[ ! -s "$file" ]]; then
  status="KO"
  details="issue.net empty"

else
  os_name=$(grep '^ID=' /etc/os-release | cut -d= -f2 | tr -d '"')

  violation=$(grep -E -i "(\\\v|\\\r|\\\m|\\\s|\b${os_name}\b)" "$file")

  if [[ -n "$violation" ]]; then
    status="KO"
    details="System info found"
  else
    status="OK"
    details="Banner compliant"
  fi
fi

# Get short content
current_value=$(get_current_value "$file")

# Combine output (short)
final_output="$details Content:$current_value"

# Sanitize output (IMPORTANT)
final_output=$(sanitize "$final_output")

# ---------- Output ----------
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.7.3" c8
write_col "Configure Command Line Warning Banners" c9
write_col "Ensure /etc/issue.net is configured" c10
write_col "Remote login banner should not disclose system information" c11
write_col "Ensure banner exists and is sanitized" c12
write_col "$final_output" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

#1.7.4 Ensure access to /etc/motd is configured

File="/etc/motd"

if [ -e $File ]; then

file_permission=`stat -c %a $File`
owner=`stat -c %u $File`
group=`stat -c %g $File`

if [[ "$file_permission" == "644" || "$file_permission" == "640" || "$file_permission" == "600" || "$file_permission" == "400" || "$file_permission" == "0" ]] && [[ "$owner" == "0" ]] && [[ "$group" == "0" ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.7.4" c8
write_col "Configure Command Line Warning Banners" c9
write_col "Ensure access to /etc/motd is configured" c10
write_col "The contents of the /etc/motd file are displayed to users after login and function as a message of the day for authenticated users" c11
write_col "Uid and Gid on /etc/motd are both 0/root and access is 644 or more restrictive" c12
write_col "File : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.7.4" c8
write_col "Configure Command Line Warning Banners" c9
write_col "Ensure access to /etc/motd is configured" c10
write_col "The contents of the /etc/motd file are displayed to users after login and function as a message of the day for authenticated users" c11
write_col "Uid and Gid on /etc/motd are both 0/root and access is 644 or more restrictive" c12
write_col "File : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.7.4" c8
write_col "Configure Command Line Warning Banners" c9
write_col "Ensure access to /etc/motd is configured" c10
write_col "The contents of the /etc/motd file are displayed to users after login and function as a message of the day for authenticated users" c11
write_col "Uid and Gid on /etc/motd are both 0/root and access is 644 or more restrictive" c12
write_col "File $File does not exist on the server $server" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#1.7.5 Ensure access to /etc/issue is configured

File="/etc/issue"

if [ -e $File ]; then

file_permission=`stat -c %a $File`
owner=`stat -c %u $File`
group=`stat -c %g $File`

if [[ "$file_permission" == "644" || "$file_permission" == "640" || "$file_permission" == "600" || "$file_permission" == "400" || "$file_permission" == "0" ]] && [[ "$owner" == "0" ]] && [[ "$group" == "0" ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.7.5" c8
write_col "Configure Command Line Warning Banners" c9
write_col "Ensure access to /etc/issue is configured" c10
write_col "The contents of the /etc/issue file are displayed to users prior to login for local terminals" c11
write_col "Uid and Gid on /etc/issue are both 0/root and access is 644 or more restrictive" c12
write_col "File : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.7.5" c8
write_col "Configure Command Line Warning Banners" c9
write_col "Ensure access to /etc/issue is configured" c10
write_col "The contents of the /etc/issue file are displayed to users prior to login for local terminals" c11
write_col "Uid and Gid on /etc/issue are both 0/root and access is 644 or more restrictive" c12
write_col "File : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.7.5" c8
write_col "Configure Command Line Warning Banners" c9
write_col "Ensure access to /etc/issue is configured" c10
write_col "The contents of the /etc/issue file are displayed to users prior to login for local terminals" c11
write_col "Uid and Gid on /etc/issue are both 0/root and access is 644 or more restrictive" c12
write_col "File $File does not exist on the server $server" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#1.7.6 Ensure access to /etc/issue.net is configured

File="/etc/issue.net"

if [ -e $File ]; then

file_permission=`stat -c %a $File`
owner=`stat -c %u $File`
group=`stat -c %g $File`

if [[ "$file_permission" == "644" || "$file_permission" == "640" || "$file_permission" == "600" || "$file_permission" == "400" || "$file_permission" == "0" ]] && [[ "$owner" == "0" ]] && [[ "$group" == "0" ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.7.6" c8
write_col "Configure Command Line Warning Banners" c9
write_col "Ensure access to /etc/issue.net is configured" c10
write_col "The contents of the /etc/issue.net file are displayed to users prior to login for remote connections from configured services" c11
write_col "Uid and Gid on /etc/issue.net are both 0/root and access is 644 or more restrictive" c12
write_col "File : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.7.6" c8
write_col "Configure Command Line Warning Banners" c9
write_col "Ensure access to /etc/issue.net is configured" c10
write_col "The contents of the /etc/issue.net file are displayed to users prior to login for remote connections from configured services" c11
write_col "Uid and Gid on /etc/issue.net are both 0/root and access is 644 or more restrictive" c12
write_col "File : $File Access : $(stat -c %a/%A $File) Uid : $(stat -c %u/%U $File) Gid : $(stat -c %g/%G $File)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.7.6" c8
write_col "Configure Command Line Warning Banners" c9
write_col "Ensure access to /etc/issue.net is configured" c10
write_col "The contents of the /etc/issue.net file are displayed to users prior to login for remote connections from configured services" c11
write_col "Uid and Gid on /etc/issue.net are both 0/root and access is 644 or more restrictive" c12
write_col "File $File does not exist on the server $server" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

########################End########################

########################Configure GNOME Display Manager########################

# 1.8.2 Ensure GDM disable-user-list is configured

{
 l_output=""
 l_output2=""

 if rpm -q gdm &>/dev/null || rpm -q gdm3 &>/dev/null; then

   writable=$(gsettings writable org.gnome.login-screen disable-user-list 2>/dev/null)

   if [[ "$writable" == "false" ]]; then
     l_output="$l_output disable-user-list is locked"
   else
     l_output2="$l_output2 disable-user-list is NOT locked"
   fi

   value=$(gsettings get org.gnome.login-screen disable-user-list 2>/dev/null)

   if [[ "$value" == "true" ]]; then
     l_output="$l_output | disable-user-list is enabled"
   else
     l_output2="$l_output2 disable-user-list is NOT enabled"
   fi

   gdm_conf_dir="/etc/dconf/db"
   dconf_check=$(grep -REh '^\s*disable-user-list\s*=\s*true' $gdm_conf_dir 2>/dev/null)

   if [[ -n "$dconf_check" ]]; then
     l_output="$l_output | dconf configuration present"
   else
     l_output2="$l_output2 dconf configuration missing"
   fi

   if [ -z "$l_output2" ]; then
     status="OK"
   else
     status="KO"
   fi

 else
   status="OK"
   l_output="GDM not installed - Not Applicable"
 fi

 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "1.8.2" c8
 write_col "Configure GNOME Display Manager" c9
 write_col "Ensure GDM disable-user-list is configured" c10
 write_col "Disable user list prevents user enumeration at login screen" c11
 write_col "disable-user-list must be true and locked" c12

 if [[ "$status" == "OK" ]]; then
   write_col "$l_output" c13
   write_col "OK" c14
 else
   write_col "$l_output2" c13
   write_col "KO" c14
 fi

 write_col "$severity" c15
 write_col "$scandate" c16

}

# 1.8.3 Ensure GDM screen lock is configured

{
 l_output=""
 l_output2=""

 if rpm -q gdm &>/dev/null || rpm -q gdm3 &>/dev/null; then

   writable_idle=$(gsettings writable org.gnome.desktop.session idle-delay 2>/dev/null)
   writable_lock=$(gsettings writable org.gnome.desktop.screensaver lock-delay 2>/dev/null)

   if [[ "$writable_idle" == "false" && "$writable_lock" == "false" ]]; then
     l_output="$l_output Settings are locked"
   else
     l_output2="$l_output2 Settings are NOT locked"
   fi

   idle_val=$(gsettings get org.gnome.desktop.session idle-delay 2>/dev/null | awk '{print $2}')
   lock_val=$(gsettings get org.gnome.desktop.screensaver lock-delay 2>/dev/null | awk '{print $2}')

   # Validate idle-delay (1–900)
   if [[ "$idle_val" -gt 0 && "$idle_val" -le 900 ]]; then
     l_output="$l_output | idle-delay=$idle_val"
   else
     l_output2="$l_output2 idle-delay invalid ($idle_val)"
   fi

   # Validate lock-delay (≤5)
   if [[ "$lock_val" -le 5 ]]; then
     l_output="$l_output | lock-delay=$lock_val"
   else
     l_output2="$l_output2 lock-delay too high ($lock_val)"
   fi

   dconf_check=$(grep -REh 'idle-delay|lock-delay' /etc/dconf/db 2>/dev/null)

   if [[ -n "$dconf_check" ]]; then
     l_output="$l_output | dconf entries present"
   else
     l_output2="$l_output2 dconf configuration missing"
   fi

   if [ -z "$l_output2" ]; then
     status="OK"
   else
     status="KO"
   fi

 else
   status="OK"
   l_output="GDM not installed - Not Applicable"
 fi

 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "1.8.3" c8
 write_col "Configure GNOME Display Manager" c9
 write_col "Ensure GDM screen lock is configured" c10
 write_col "Automatic screen lock prevents unauthorized access" c11
 write_col "idle-delay ≤ 900 and >0, lock-delay ≤ 5, and must be locked" c12

 if [[ "$status" == "OK" ]]; then
   write_col "$l_output" c13
   write_col "OK" c14
 else
   write_col "$l_output2" c13
   write_col "KO" c14
 fi

 write_col "$severity" c15
 write_col "$scandate" c16

}

# 1.8.4 Ensure GDM automount is configured

{
 l_output=""
 l_output2=""

 if rpm -q gdm &>/dev/null || rpm -q gdm3 &>/dev/null; then

   writable_auto=$(gsettings writable org.gnome.desktop.media-handling automount 2>/dev/null)
   writable_open=$(gsettings writable org.gnome.desktop.media-handling automount-open 2>/dev/null)

   if [[ "$writable_auto" == "false" && "$writable_open" == "false" ]]; then
     l_output="$l_output Automount settings are locked"
   else
     l_output2="$l_output2 Automount settings are NOT locked"
   fi

   auto_val=$(gsettings get org.gnome.desktop.media-handling automount 2>/dev/null)
   open_val=$(gsettings get org.gnome.desktop.media-handling automount-open 2>/dev/null)

   if [[ "$auto_val" == "false" ]]; then
     l_output="$l_output | automount disabled"
   else
     l_output2="$l_output2 automount is enabled"
   fi

   if [[ "$open_val" == "false" ]]; then
     l_output="$l_output | automount-open disabled"
   else
     l_output2="$l_output2 automount-open is enabled"
   fi

   dconf_check=$(grep -REh 'automount|automount-open' /etc/dconf/db 2>/dev/null)

   if [[ -n "$dconf_check" ]]; then
     l_output="$l_output | dconf entries present"
   else
     l_output2="$l_output2 dconf configuration missing"
   fi

   if [ -z "$l_output2" ]; then
     status="OK"
   else
     status="KO"
   fi

 else
   status="OK"
   l_output="GDM not installed - Not Applicable"
 fi

 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "1.8.4" c8
 write_col "Configure GNOME Display Manager" c9
 write_col "Ensure GDM automount is configured" c10
 write_col "Disable automount to prevent unauthorized media access" c11
 write_col "automount=false and automount-open=false and must be locked" c12

 if [[ "$status" == "OK" ]]; then
   write_col "$l_output" c13
   write_col "OK" c14
 else
   write_col "$l_output2" c13
   write_col "KO" c14
 fi

 write_col "$severity" c15
 write_col "$scandate" c16

}

# 1.8.5 Ensure GDM autorun-never is configured

{
 l_output=""
 l_output2=""

 if rpm -q gdm &>/dev/null || rpm -q gdm3 &>/dev/null; then

   writable=$(gsettings writable org.gnome.desktop.media-handling autorun-never 2>/dev/null)

   if [[ "$writable" == "false" ]]; then
     l_output="$l_output autorun-never is locked"
   else
     l_output2="$l_output2 autorun-never is NOT locked"
   fi

   value=$(gsettings get org.gnome.desktop.media-handling autorun-never 2>/dev/null)

   if [[ "$value" == "true" ]]; then
     l_output="$l_output | autorun-never enabled"
   else
     l_output2="$l_output2 autorun-never is NOT enabled"
   fi

   dconf_check=$(grep -REh '^\s*autorun-never\s*=\s*true' /etc/dconf/db 2>/dev/null)

   if [[ -n "$dconf_check" ]]; then
     l_output="$l_output | dconf configuration present"
   else
     l_output2="$l_output2 dconf configuration missing"
   fi

   if [ -z "$l_output2" ]; then
     status="OK"
   else
     status="KO"
   fi

 else
   status="OK"
   l_output="GDM not installed - Not Applicable"
 fi

 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "1.8.5" c8
 write_col "Configure GNOME Display Manager" c9
 write_col "Ensure GDM autorun-never is configured" c10
 write_col "Disable autorun to prevent execution of malicious media content" c11
 write_col "autorun-never=true and must be locked" c12

 if [[ "$status" == "OK" ]]; then
   write_col "$l_output" c13
   write_col "OK" c14
 else
   write_col "$l_output2" c13
   write_col "KO" c14
 fi

 write_col "$severity" c15
 write_col "$scandate" c16

}


#1.8.6 Ensure XDMCP is not enabled

xdmcp=`grep -Eis '^[[:space:]]*Enable[[:space:]]*=[[:space:]]*true' /etc/gdm/custom.conf | wc -l`

if [ $xdmcp -eq "0" ]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.8.6" c8
write_col "Configure GNOME Display Manager" c9
write_col "Ensure XDMCP is not enabled" c10
write_col "XDMCP is designed to provide authenticated access to display management services for remote displays" c11
write_col "/etc/gdm/custom.conf does not contain Enable=true" c12
write_col "/etc/gdm/custom.conf does not contain Enable=true" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.8.6" c8
write_col "Configure GNOME Display Manager" c9
write_col "Ensure XDMCP is not enabled" c10
write_col "XDMCP is designed to provide authenticated access to display management services for remote displays" c11
write_col "/etc/gdm/custom.conf does not contain Enable=true" c12
write_col "/etc/gdm/custom.conf contain Enable=true Output : $(grep -Eis '^[[:space:]]*Enable[[:space:]]*=[[:space:]]*true' /etc/gdm/custom.conf)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

# 1.8.1 Ensure GDM login banner is configured

{
 l_output=""
 l_output2=""

 # Detect package manager
 if command -v dpkg-query > /dev/null 2>&1; then
   l_pq="dpkg-query -W"
 elif command -v rpm > /dev/null 2>&1; then
   l_pq="rpm -q"
 fi

 # Check if GDM installed
 l_pkgoutput=""
 for pkg in gdm gdm3; do
   $l_pq "$pkg" > /dev/null 2>&1 && l_pkgoutput="$pkg installed"
 done

 if [ -z "$l_pkgoutput" ]; then
   l_output="GDM not installed - Not Applicable"
   result="OK"

 else
  
   writable_enable=$(gsettings writable org.gnome.login-screen banner-message-enable 2>/dev/null)
   writable_text=$(gsettings writable org.gnome.login-screen banner-message-text 2>/dev/null)

   if [[ "$writable_enable" == "false" && "$writable_text" == "false" ]]; then
     l_output="$l_output Banner lock is properly configured"
   else
     l_output2="$l_output2 Banner settings are NOT locked (writable should be false)"
   fi

   banner_enable=$(gsettings get org.gnome.login-screen banner-message-enable 2>/dev/null)

   if [[ "$banner_enable" == "true" ]]; then
     l_output="$l_output | Banner enabled"
   else
     l_output2="$l_output2 Banner is NOT enabled"
   fi

   banner_text=$(gsettings get org.gnome.login-screen banner-message-text 2>/dev/null)

   if [[ -n "$banner_text" && "$banner_text" != "''" ]]; then
     l_output="$l_output | Banner text configured: $banner_text"
   else
     l_output2="$l_output2 Banner text NOT configured"
   fi

   if [ -z "$l_output2" ]; then
     result="OK"
   else
     result="KO"
   fi
 fi

 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "1.8.1" c8
 write_col "Configure GNOME Display Manager" c9
 write_col "Ensure GDM login banner is configured" c10
 write_col "GDM login banner must be enabled, locked and configured" c11
 write_col "banner-message-enable=true and must be locked; banner-message-text must be configured" c12

 if [ "$result" == "OK" ]; then
   write_col "$l_output" c13
   write_col "OK" c14
 else
   write_col "$l_output2" c13
   write_col "KO" c14
 fi

 write_col "$severity" c15
 write_col "$scandate" c16

}

########################End########################

########################Configure system wide crypto policy########################

#1.6.1 Ensure system wide crypto policy is not set to legacy

if [[ $(grep -Pi '^\h*LEGACY\b' /etc/crypto-policies/config | wc -l) -eq "0" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.6.1" c8
write_col "Configure system wide crypto policy" c9
write_col "Ensure system wide crypto policy is not set to legacy" c10
write_col "When system-wide policy is set up the default behavior of applications will be to follow the policy" c11
write_col "Update-crypto-policies --show indicates DEFAULT or stronger LEGACY is not permitted" c12
write_col "System wide crypto policy is not set to legacy" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.6.1" c8
write_col "Configure system wide crypto policy" c9
write_col "Ensure system wide crypto policy is not set to legacy" c10
write_col "When system-wide policy is set up the default behavior of applications will be to follow the policy" c11
write_col "Update-crypto-policies --show indicates DEFAULT or stronger LEGACY is not permitted" c12
write_col "System wide crypto policy is set to legacy Output : $(grep -Pi '^\h*LEGACY\b' /etc/crypto-policies/config)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

# 1.6.2 Ensure system wide crypto policy disables sha1 hash and signature support

file="/etc/crypto-policies/state/CURRENT.pol"

if [[ ! -f "$file" ]]; then
    status="KO"
    details="Crypto policy file not found: $file"

else
    # Check if SHA1 is used in hash or sign
    sha1_usage=$(grep -Pi -- '^\h*(hash|sign)\h*=\h*([^\n\r#]+)?-sha1\b' "$file")

    # Check sha1_in_certs value
    sha1_certs=$(grep -Pi -- '^\h*sha1_in_certs\h*=\h*' "$file")

    if [[ -z "$sha1_usage" && "$sha1_certs" == "sha1_in_certs = 0" ]]; then
        status="OK"
        details="System-wide crypto policy disables SHA1 hash and signature support"
    else
        status="KO"
        details="SHA1 support enabled. Output: $sha1_usage $sha1_certs"
    fi
fi


# ---- Output Section (same format as your script) ----

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.6.2" c8
write_col "Configure system wide crypto policy" c9
write_col "Ensure system wide crypto policy disables sha1 hash and signature support" c10
write_col "SHA-1 is a cryptographic hash function that produces a 160-bit hash value" c11
write_col "System wide crypto policy should disable SHA1 hash and signature support" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

#1.6.3 Ensure system wide crypto policy MACs are configured
 
policy_cmd=$(update-crypto-policies --show 2>/dev/null)
state_file=$(cat /etc/crypto-policies/state/current 2>/dev/null)

current_value="Policy=$policy_cmd State=$state_file"

if [[ "$policy_cmd" == "LEGACY" ]]; then
  status="KO"
else
  status="OK"
fi

# ---------- Output Section ----------

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.6.3" c8
write_col "Configure Crypto Policies" c9
write_col "Ensure system wide crypto policy MACs are configured" c10
write_col "System crypto policies must enforce secure MAC algorithms" c11
write_col "Crypto policy must not be LEGACY and must enforce MAC algorithms" c12
write_col "$current_value" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

#1.6.4 Ensure system wide crypto policy disables cbc for SSH

#!/usr/bin/env bash
{
 l_output=""
 l_output2=""
 if grep -Piq -- '^\h*cipher\h*=\h*([^#\n\r]+)?-CBC\b' /etc/crypto-policies/state/CURRENT.pol; then
 if grep -Piq -- '^\h*cipher@(lib|open)ssh(-server|-client)?\h*=\h*' /etc/crypto-policies/state/CURRENT.pol; then
 if ! grep -Piq -- '^\h*cipher@(lib|open)ssh(-server|-client)?\h*=\h*([^#\n\r]+)?-CBC\b' /etc/crypto-policies/state/CURRENT.pol; then
 l_output="$l_output Cipher Block Chaining (CBC) is disabled for SSH"
 else
 l_output2="$l_output2 Cipher Block Chaining (CBC) is enabled for SSH"
 fi
 else
 l_output2="$l_output2 Cipher Block Chaining (CBC) is enabled for SSH"
 fi
 else
 l_output="Cipher Block Chaining (CBC) is disabled"
 fi
 if [ -z "$l_output2" ]; then # Provide output from checks
 echo -e "\n- Audit Result:\n ** PASS **\n$l_output\n" >/dev/null
 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "1.6.4" c8
 write_col "Configure system wide crypto policy" c9
 write_col "Ensure system wide crypto policy disables cbc for ssh" c10
 write_col "CBC is an algorithm that uses a block cipher" c11
 write_col "System wide crypto policy disables cbc for ssh" c12
 write_col "$l_output" c13
 write_col "OK" c14
 write_col "$severity" c15
 write_col "$scandate" c16
 else
 echo -e "\n- Audit Result:\n ** FAIL **\n - Reason(s) for audit failure:\n$l_output2\n" >/dev/null
 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "1.6.4" c8
 write_col "Configure system wide crypto policy" c9
 write_col "Ensure system wide crypto policy disables cbc for ssh" c10
 write_col "CBC is an algorithm that uses a block cipher" c11
 write_col "System wide crypto policy disables cbc for ssh" c12
 write_col "$l_output2" c13
 write_col "KO" c14
 write_col "$severity" c15
 write_col "$scandate" c16
 [ -n "$l_output" ] && echo -e "\n- Correctly set:\n$l_output\n" >/dev/null
 fi
}

########################End########################

########################Configure Time Synchronization########################

#2.3.3 Ensure chrony is not run as the root user

if [[ $(grep -Psi -- '^\h*OPTIONS=\"?\h+-u\h+root\b' /etc/sysconfig/chronyd | wc -l) -eq "0" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.3.3" c8
write_col "Configure Time Synchronization" c9
write_col "Ensure chrony is not run as the root user" c10
write_col "The file /etc/sysconfig/chronyd allows configuration of options for chrony to include the user chrony is run as by default this is set to the user chrony" c11
write_col "Chrony is not run as the root user" c12
write_col "Chrony is not run as the root user" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.3.3" c8
write_col "Configure Time Synchronization" c9
write_col "Ensure chrony is not run as the root user" c10
write_col "The file /etc/sysconfig/chronyd allows configuration of options for chrony to include the user chrony is run as by default this is set to the user chrony" c11
write_col "Chrony is not run as the root user" c12
echo "Chrony is run as the root user Output : $(grep -Psi -- '^\h*OPTIONS=\"?\h+-u\h+root\b' /etc/sysconfig/chronyd)" >>c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#2.3.1 Ensure time synchronization is in use

pack_chrony=`rpm -q chrony`

if [[ $pack_chrony != "package chrony is not installed" ]]; then
rpm -q chrony >package
for out in `cat package`
do
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.3.1" c8
write_col "Configure Time Synchronization" c9
write_col "Ensure time synchronization is in use" c10
write_col "System time should be synchronized between all systems in an environment" c11
write_col "Chronyd must be running" c12
write_col "Package chrony is installed Output : $out" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
done
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.3.1" c8
write_col "Configure Time Synchronization" c9
write_col "Ensure time synchronization is in use" c10
write_col "System time should be synchronized between all systems in an environment" c11
write_col "Chronyd must be running" c12
write_col "Package chrony is not installed Output : $(rpm -q chrony)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

rm -rf package

#2.3.2 Ensure chrony is configured

if [[ $(grep -Prs -- '^\h*(server|pool)\h+[^#\n\r]+' /etc/chrony.conf /etc/chrony.d/ | wc -l) -ne "0" ]]; then

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.3.2" c8
write_col "Configure Time Synchronization" c9
write_col "Ensure chrony is configured" c10
write_col "Chrony is a daemon which implements the NTP and is designed to synchronize system clocks across a variety of systems and use a source that is highly accurate" c11
write_col "Ensure chronyd has minimum required configuration at least one pool or server is specified" c12
write_col "Chrony is configured" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16

else

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "2.3.2" c8
write_col "Configure Time Synchronization" c9
write_col "Ensure chrony is configured" c10
write_col "Chrony is a daemon which implements the NTP and is designed to synchronize system clocks across a variety of systems and use a source that is highly accurate" c11
write_col "Ensure chronyd has minimum required configuration at least one pool or server is specified" c12
write_col "Chrony is not configured" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

########################End########################

########################Configure PAM software packages########################

#5.3.1.1 Ensure latest version of pam is installed

if [[ $(rpm -q pam) != "package pam is not installed"  ]]; then
    
installed_version=$(rpm -q --queryformat '%{VERSION}-%{RELEASE}' pam)

latest_version=$(dnf list available pam --showduplicates | grep pam | awk '{print $2}' | sort -V | tail -n 1)

if [ "$installed_version" == "$latest_version" ]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.3.1.1" c8
write_col "Configure PAM software packages" c9
write_col "Ensure latest version of pam is installed" c10
write_col "Updated versions of PAM include additional functionality" c11
write_col "Latest version of pam is installed" c12
write_col "Latest version of pam is installed Output : Installed_Version = $installed_version Latest_Version = $latest_version" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.3.1.1" c8
write_col "Configure PAM software packages" c9
write_col "Ensure latest version of pam is installed" c10
write_col "Updated versions of PAM include additional functionality" c11
write_col "Latest version of pam is installed" c12
write_col "Latest version of pam is not installed Output : Installed_Version = $installed_version Latest_Version = $latest_version" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.3.1.1" c8
write_col "Configure PAM software packages" c9
write_col "Ensure latest version of pam is installed" c10
write_col "Updated versions of PAM include additional functionality" c11
write_col "Latest version of pam is installed" c12
write_col "Package pam is not installed Output : $(rpm -q pam)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#5.3.1.2 Ensure latest version of authselect is installed

if [[ $(rpm -q authselect) != "package authselect is not installed" ]]; then

installed_version=$(rpm -q --queryformat '%{VERSION}-%{RELEASE}' authselect)

latest_version=$(dnf list available authselect --showduplicates | grep authselect | awk '{print $2}' | sort -V | tail -n 1)

if [ "$installed_version" == "$latest_version" ]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.3.1.2" c8
write_col "Configure PAM software packages" c9
write_col "Ensure latest version of authselect is installed" c10
write_col "Authselect is a utility that simplifies the configuration of user authentication" c11
write_col "Latest version of authselect is installed" c12
write_col "Latest version of authselect is installed Output : Installed_Version = $installed_version Latest_Version = $latest_version" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.3.1.2" c8
write_col "Configure PAM software packages" c9
write_col "Ensure latest version of authselect is installed" c10
write_col "Authselect is a utility that simplifies the configuration of user authentication" c11
write_col "Latest version of authselect is installed" c12
write_col "Latest version of authselect is not installed Output : Installed_Version = $installed_version Latest_Version = $latest_version" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.3.1.2" c8
write_col "Configure PAM software packages" c9
write_col "Ensure latest version of authselect is installed" c10
write_col "Authselect is a utility that simplifies the configuration of user authentication" c11
write_col "Latest version of authselect is installed" c12
write_col "Package authselect is not installed Output : $(rpm -q authselect)" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

########################End########################

########################Configure root and system accounts and environment########################

#5.4.2.6 Ensure root user umask is configured

if [[ $(grep -Psi -- '^\h*umask\h+(([0-7][0-7][01][0-7]\b|[0-7][0-7][0-7][0-6]\b)|([0-7][01][0-7]\b|[0-7][0-7][0-6]\b)|(u=[rwx]{1,3},)?(((g=[rx]?[rx]?w[rx]?[rx]?\b)(,o=[rwx]{1,3})?)|((g=[wrx]{1,3},)?o=[wrx]{1,3}\b)))' /root/.bash_profile /root/.bashrc | wc -l) -eq "0" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.4.2.6" c8
write_col "Configure root and system accounts and environment" c9
write_col "Ensure root user umask is configured" c10
write_col "The user file-creation mode mask is used to determine the file permission for newly created directories and files" c11
write_col "Root user umask is configured" c12
write_col "Root user umask is configured" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.4.2.6" c8
write_col "Configure root and system accounts and environment" c9
write_col "Ensure root user umask is configured" c10
write_col "The user file-creation mode mask is used to determine the file permission for newly created directories and files" c11
write_col "Root user umask is configured" c12
write_col "Root user umask is not configured" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#5.4.2.7 Ensure system accounts do not have a valid login shell

bad_accounts=$(awk -F: '($3 < 1000 && $1 != "root" && $7 !~ /(nologin|false)$/) {print $1 ":" $7}' /etc/passwd)

if [[ -z "$bad_accounts" ]]; then
  status="OK"
  details="All system accounts have non-login shells"
else
  status="KO"
  details="System accounts with valid shells: $(echo $bad_accounts | tr '\n' ' ')"
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.4.2.7" c8
write_col "Ensure system accounts do not have a valid login shell" c9
write_col "Ensure system accounts do not have a valid login shell" c10
write_col "System accounts should not have interactive login shells to reduce the risk of unauthorized access" c11
write_col "Accounts with UID < 1000 (excluding root) must have nologin or false shell" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

# 5.4.2.8 Ensure accounts without a valid login shell are locked

bad_accounts=""

# Get valid shells (CIS logic)
valid_shells="^($(awk -F/ '$NF != "nologin" {print}' /etc/shells | sed -rn '/^\//{s,/,\\/,g;p}' | paste -s -d '|' -))$"

# Identify users without valid login shell (excluding root)
while IFS= read -r user; do
  passwd_status=$(passwd -S "$user" 2>/dev/null | awk '{print $2}')

  # If account is NOT locked (status != L)
  if [[ ! "$passwd_status" =~ ^L ]]; then
    bad_accounts="$bad_accounts $user"
  fi

done < <(awk -v pat="$valid_shells" -F: '($1 != "root" && $(NF) !~ pat) {print $1}' /etc/passwd)

# Decision
if [[ -z "$bad_accounts" ]]; then
  status="OK"
  details="All non-login accounts are locked"
else
  status="KO"
  details="Non-login accounts not locked:$bad_accounts"
fi

# Sanitize output
details=$(echo "$details" | tr '\r\n' ' ' | sed 's/[[:space:]]\+/ /g' | xargs)

# Output
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.4.2.8" c8
write_col "Ensure accounts without a valid login shell are locked" c9
write_col "Ensure accounts without a valid login shell are locked" c10
write_col "Accounts without valid login shells must be locked to prevent authentication access" c11
write_col "Accounts must have password status 'L' (locked)" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

########################End########################

########################Configure pam_faillock module########################

#5.3.3.1.2 Ensure password unlock time is configured

unlock=`grep -Pi -- '^\h*unlock_time\h*=\h*(0|9[0-9][0-9]|[1-9][0-9]{3,})\b' /etc/security/faillock.conf | awk -F "=" '{print $2}' | xargs`

if [[ "$unlock" -ge "900" ]] && [[ $(grep -Pi -- '^\h*auth\h+(requisite|required|sufficient)\h+pam_faillock\.so\h+([^#\n\r]+\h+)?unlock_time\h*=\h*([1-9]|[1-9][0-9]|[1-8][0-9][0-9])\b' /etc/pam.d/system-auth /etc/pam.d/password-auth | wc -l) -eq "0" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.3.3.1.2" c8
write_col "Configure pam_faillock module" c9
write_col "Ensure password unlock time is configured" c10
write_col "Unlock time = <n> - The access will be re-enabled after <n> seconds after the lock out" c11
write_col "Password unlock time is configured" c12
write_col "$(grep -Pi -- '^\h*unlock_time\h*=\h*(0|9[0-9][0-9]|[1-9][0-9]{3,})\b' /etc/security/faillock.conf | xargs)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.3.3.1.2" c8
write_col "Configure pam_faillock module" c9
write_col "Ensure password unlock time is configured" c10
write_col "Unlock time = <n> - The access will be re-enabled after <n> seconds after the lock out" c11
write_col "Password unlock time is configured" c12
write_col "Password unlock time is not configured or is not set to 900 or more" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#5.3.3.1.1 Ensure password failed attempts lockout is configured

deny_attempt=`grep -Pi -- '^\h*deny\h*=\h*[1-5]\b' /etc/security/faillock.conf | awk -F "=" '{print $2}' | xargs`

if [[ "$deny_attempt" -ge "1" && "$deny_attempt" -le "5" ]] && [[ $(grep -Pi -- '^\h*auth\h+(requisite|required|sufficient)\h+pam_faillock\.so\h+([^#\n\r]+\h+)?deny\h*=\h*(0|[6-9]|[1-9][0-9]+)\b' /etc/pam.d/system-auth /etc/pam.d/password-auth | wc -l) -eq "0" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.3.3.1.1" c8
write_col "Configure pam_faillock module" c9
write_col "Ensure password failed attempts lockout is configured" c10
write_col "The deny = <n> option will deny access if the number of consecutive authentication failures for this user during the recent interval exceeds <n>" c11
write_col "Lockout for failed password attempts is configured" c12
write_col "$(grep -Pi -- '^\h*deny\h*=\h*[1-5]\b' /etc/security/faillock.conf | xargs)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.3.3.1.1" c8
write_col "Configure pam_faillock module" c9
write_col "Ensure password failed attempts lockout is configured" c10
write_col "The deny = <n> option will deny access if the number of consecutive authentication failures for this user during the recent interval exceeds <n>" c11
write_col "Lockout for failed password attempts is configured" c12
write_col "Lockout for failed password attemtps is not configured or is not set to value no greater than 5 [1-5]" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#5.3.3.2.1 Ensure password number of changed changed characters is configured

output=`grep -Psi -- '^\h*difok\h*=\h*([2-9]|[1-9][0-9]+)\b' /etc/security/pwquality.conf /etc/security/pwquality.conf.d/*.conf | awk -F ":" '{print $2}' | xargs | sed 's/ //g'`

out=`echo $output | awk -F "=" '{print $2}' | xargs`

if [[ "$out" -ge "2" ]] && [[ $(grep -Psi -- '^\h*password\h+(requisite|required|sufficient)\h+pam_pwquality\.so\h+([^#\n\r]+\h+)?difok\h*=\h*([0-1])\b' /etc/pam.d/system-auth /etc/pam.d/password-auth | wc -l) -eq "0" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.3.3.2.1" c8
write_col "Configure pam_pwquality module" c9
write_col "Ensure password number of changed characters is configured" c10
write_col "The pwquality difok option sets the number of characters in a password that must not be present in the old password" c11
write_col "Password number of changed characters is configured" c12
write_col "$output" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.3.3.2.1" c8
write_col "Configure pam_pwquality module" c9
write_col "Ensure password number of changed characters is configured" c10
write_col "The pwquality difok option sets the number of characters in a password that must not be present in the old password" c11
write_col "Password number of changed characters is configured" c12
write_col "Password number of changed characters is not configured or is not set to 2 or more" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#5.3.3.2.2 Ensure password length is configured

minlen=`grep -Psi -- '^\h*minlen\h*=\h*(1[4-9]|[2-9][0-9]|[1-9][0-9]{2,})\b' /etc/security/pwquality.conf /etc/security/pwquality.conf.d/*.conf | awk -F ":" '{print $2}' | xargs | sed 's/ //g'`

length=`echo $minlen | awk -F "=" '{print $2}' | xargs`

if [[ "$length" -ge "14" ]] && [[ $(grep -Psi -- '^\h*password\h+(requisite|required|sufficient)\h+pam_pwquality\.so\h+([^#\n\r]+\h+)?minlen\h*=\h*([0-9]|1[0-3])\b' /etc/pam.d/system-auth /etc/pam.d/password-auth | wc -l) -eq "0" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.3.3.2.2" c8
write_col "Configure pam_pwquality module" c9
write_col "Ensure password length is configured" c10
write_col "Minlen - Minimum acceptable size for the new password" c11
write_col "Password length is configured" c12
write_col "$minlen" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.3.3.2.2" c8
write_col "Configure pam_pwquality module" c9
write_col "Ensure password length is configured" c10
write_col "Minlen - Minimum acceptable size for the new password" c11
write_col "Password length is configured" c12
write_col "Password length is not configured or is not set to 14 or more" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#5.3.3.2.4 Ensure password same consecutive characters is configured

maxrepeat=`grep -Psi -- '^\h*maxrepeat\h*=\h*[1-3]\b' /etc/security/pwquality.conf /etc/security/pwquality.conf.d/*.conf | awk -F ":" '{print $2}' | xargs | sed 's/ //g'`

repeat=`echo $maxrepeat | awk -F "=" '{print $2}' | xargs`

if [[ "$repeat" -ge "1" && "$repeat" -le "3" ]] && [[ $(grep -Psi -- '^\h*password\h+(requisite|required|sufficient)\h+pam_pwquality\.so\h+([^#\n\r]+\h+)?maxrepeat\h*=\h*(0|[4-9]|[1-9][0-9]+)\b' /etc/pam.d/system-auth /etc/pam.d/password-auth | wc -l) -eq "0" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.3.3.2.4" c8
write_col "Configure pam_pwquality module" c9
write_col "Ensure password same consecutive characters is configured" c10
write_col "The pwquality maxrepeat option sets the maximum number of allowed same consecutive characters in a new password" c11
write_col "Password same consecutive characters is configured" c12
write_col "$maxrepeat" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.3.3.2.4" c8
write_col "Configure pam_pwquality module" c9
write_col "Ensure password same consecutive characters is configured" c10
write_col "The pwquality maxrepeat option sets the maximum number of allowed same consecutive characters in a new password" c11
write_col "Password same consecutive characters is configured" c12
write_col "Password same consecutive characters is not configured or is not set to 3 or less [1-3]" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#5.3.3.2.5 Ensure password maximum sequential characters is configured

sequence=`grep -Psi -- '^\h*maxsequence\h*=\h*[1-3]\b' /etc/security/pwquality.conf /etc/security/pwquality.conf.d/*.conf | awk -F ":" '{print $2}' | xargs | sed 's/ //g'`

max_sequence=`echo $sequence | awk -F "=" '{print $2}' | xargs`

if [[ "$max_sequence" -ge "1" && "$max_sequence" -le "3" ]] && [[ $(grep -Psi -- '^\h*password\h+(requisite|required|sufficient)\h+pam_pwquality\.so\h+([^#\n\r]+\h+)?maxsequence\h*=\h*(0|[4-9]|[1-9][0-9]+)\b' /etc/pam.d/system-auth /etc/pam.d/password-auth | wc -l) -eq "0" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.3.3.2.5" c8
write_col "Configure pam_pwquality module" c9
write_col "Ensure password maximum sequential characters is configured" c10
write_col "The pwquality maxsequence option sets the maximum length of monotonic character sequences in the new password" c11
write_col "Password maximum sequential characters is configured" c12
write_col "$sequence" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.3.3.2.5" c8
write_col "Configure pam_pwquality module" c9
write_col "Ensure password maximum sequential characters is configured" c10
write_col "The pwquality maxsequence option sets the maximum length of monotonic character sequences in the new password" c11
write_col "Password maximum sequential characters is configured" c12
write_col "Password maximum sequential characters are not configured or is not set to 3 or less [1-3]" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#5.3.3.2.6 Ensure password dictionary check is enabled

dictcheck=`grep -Psi -- '^\h*dictcheck\h*=\h*0\b' /etc/security/pwquality.conf /etc/security/pwquality.conf.d/*.conf | wc -l`

dictcheck1=`grep -Psi -- '^\h*password\h+(requisite|required|sufficient)\h+pam_pwquality\.so\h+([^#\n\r]+\h+)?dictcheck\h*=\h*0\b' /etc/pam.d/system-auth /etc/pam.d/password-auth | wc -l`

if [[ "$dictcheck" -eq "0" && "$dictcheck1" -eq "0" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.3.3.2.6" c8
write_col "Configure pam_pwquality module" c9
write_col "Ensure password dictionary check is enabled" c10
write_col "The pwquality dictcheck option sets whether to check for the words from the cracklib dictionary" c11
write_col "Password dictionary check is enabled" c12
write_col "Password dictionary check is enabled" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.3.3.2.6" c8
write_col "Configure pam_pwquality module" c9
write_col "Ensure password dictionary check is enabled" c10
write_col "The pwquality dictcheck option sets whether to check for the words from the cracklib dictionary" c11
write_col "Password dictionary check is enabled" c12
write_col "Password dictionary check is not enabled" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#5.3.3.2.7 Ensure password quality is enforced for the root user

if [[ $(grep -Psi -- '^\h*enforce_for_root\b' /etc/security/pwquality.conf /etc/security/pwquality.conf.d/*.conf | awk -F ":" '{print $2}' | xargs) == "enforce_for_root" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.3.3.2.7" c8
write_col "Configure pam_pwquality module" c9
write_col "Ensure password quality is enforced for the root user" c10
write_col "If the pwquality enforce_for_root option is enabled the module will return error on failed check even if the uesr changing the password is root" c11
write_col "Password quality is enforced for the root user" c12
write_col "$(grep -Psi -- '^\h*enforce_for_root\b' /etc/security/pwquality.conf /etc/security/pwquality.conf.d/*.conf | xargs)" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "5.3.3.2.7" c8
write_col "Configure pam_pwquality module" c9
write_col "Ensure password quality is enforced for the root user" c10
write_col "If the pwquality enforce_for_root option is enabled the module will return error on failed check even if the uesr changing the password is root" c11
write_col "Password quality is enforced for the root user" c12
write_col "Password quality is not enforced for the root user" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

########################End########################

########################Configure /tmp########################

#1.1.2.1.1 Ensure /tmp is a separate partition

part=`findmnt -nk /tmp | wc -l`

if [[ $part -ne 0 ]]
then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.1.1" c8
write_col "Configure /tmp" c9
write_col "Ensure /tmp is a separate partition" c10
write_col "The /tmp directory is a world writable directory used for temporary storage by all users and some applications" c11
write_col "Mount tmpfs to /tmp or create a separate partition for /tmp" c12
write_col "/tmp is a separate partition Output : $(findmnt -nk /tmp | sed 's/,/ /g')" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.1.1" c8
write_col "Configure /tmp" c9
write_col "Ensure /tmp is a separate partition" c10
write_col "The /tmp directory is a world writable directory used for temporary storage by all users and some applications" c11
write_col "Mount tmpfs to /tmp or create a separate partition for /tmp" c12
write_col "/tmp is not a separate partition" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

boot=`systemctl is-enabled tmp.mount`

if [[ $boot == "generated" ]]
then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.1.1" c8
write_col "Configure /tmp" c9
write_col "Ensure /tmp is a separate partition" c10
write_col "The /tmp directory is a world writable directory used for temporary storage by all users and some applications" c11
write_col "Mount tmpfs to /tmp or create a separate partition for /tmp" c12
write_col "Systemd will mount the /tmp partition at boot time Output : $boot" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.1.1" c8
write_col "Configure /tmp" c9
write_col "Ensure /tmp is a separate partition" c10
write_col "The /tmp directory is a world writable directory used for temporary storage by all users and some applications" c11
write_col "Mount tmpfs to /tmp or create a separate partition for /tmp" c12
write_col "Systemd will not mount the /tmp partition at boot time Output : $boot" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#1.1.2.1.2 Ensure nodev option set on /tmp partition

part1=`findmnt -nk /tmp | wc -l`

if [[ $part1 -ne 0 ]]
then
option=`findmnt -nk /tmp | grep -v nodev | wc -l`
if [[ $option -eq 0 ]]
then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.1.2" c8
write_col "Configure /tmp" c9
write_col "Ensure nodev option set on /tmp partition" c10
write_col "The nodev mount option specifies that the filesystem cannot contain special devices" c11
write_col "If a /tmp partition does not exist this control does not apply otherwise ensure nodev option set on /tmp partition" c12
write_col "Nodev mount option is set on /tmp partition Output : $(findmnt -nk /tmp | sed 's/,/ /g')" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.1.2" c8
write_col "Configure /tmp" c9
write_col "Ensure nodev option set on /tmp partition" c10
write_col "The nodev mount option specifies that the filesystem cannot contain special devices" c11
write_col "If a /tmp partition does not exist this control does not apply otherwise ensure nodev option set on /tmp partition" c12
write_col "Nodev mount option is not set on /tmp partition Output : $(findmnt -nk /tmp | sed 's/,/ /g')" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.1.2" c8
write_col "Configure /tmp" c9
write_col "Ensure nodev option set on /tmp partition" c10
write_col "The nodev mount option specifies that the filesystem cannot contain special devices" c11
write_col "If a /tmp partition does not exist this control does not apply otherwise ensure nodev option set on /tmp partition" c12
write_col "/tmp is not a separate partition" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#1.1.2.1.3 Ensure nosuid option set on /tmp partition

part2=`findmnt -nk /tmp | wc -l`

if [[ $part2 -ne 0 ]]
then
option1=`findmnt -nk /tmp | grep -v nosuid | wc -l`
if [[ $option1 -eq 0 ]]
then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.1.3" c8
write_col "Configure /tmp" c9
write_col "Ensure nosuid option set on /tmp partition" c10
write_col "The nosuid mount option specifies that the filesystem cannot contain setuid files" c11
write_col "If a /tmp partition does not exist this control does not apply otherwise ensure nosuid option set on /tmp partition" c12
write_col "Nosuid mount option is set on /tmp partition Output : $(findmnt -nk /tmp | sed 's/,/ /g')" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.1.3" c8
write_col "Configure /tmp" c9
write_col "Ensure nosuid option set on /tmp partition" c10
write_col "The nosuid mount option specifies that the filesystem cannot contain setuid files" c11
write_col "If a /tmp partition does not exist this control does not apply otherwise ensure nosuid option set on /tmp partition" c12
write_col "Nosuid mount option is not set on /tmp partition Output : $(findmnt -nk /tmp | sed 's/,/ /g')" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.1.3" c8
write_col "Configure /tmp" c9
write_col "Ensure nosuid option set on /tmp partition" c10
write_col "The nosuid mount option specifies that the filesystem cannot contain setuid files" c11
write_col "If a /tmp partition does not exist this control does not apply otherwise ensure nosuid option set on /tmp partition" c12
write_col "/tmp is not a separate partition" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#1.1.2.1.4 Ensure noexec option set on /tmp partition

part3=`findmnt -nk /tmp | wc -l`

if [[ $part3 -ne 0 ]]
then
option2=`findmnt -nk /tmp | grep -v noexec | wc -l`
if [[ $option2 -eq 0 ]]
then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.1.4" c8
write_col "Configure /tmp" c9
write_col "Ensure noexec option set on /tmp partition" c10
write_col "The noexec mount option specifies that the filesystem cannot contain executable binaries" c11
write_col "If a /tmp partition does not exist this control does not apply otherwise ensure noexec option set on /tmp partition" c12
write_col "Noexec mount option is set on /tmp partition Output : $(findmnt -nk /tmp | sed 's/,/ /g')" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.1.4" c8
write_col "Configure /tmp" c9
write_col "Ensure noexec option set on /tmp partition" c10
write_col "The noexec mount option specifies that the filesystem cannot contain executable binaries" c11
write_col "If a /tmp partition does not exist this control does not apply otherwise ensure noexec option set on /tmp partition" c12
write_col "Noexec mount option is not set on /tmp partition Output : $(findmnt -nk /tmp | sed 's/,/ /g')" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.1.4" c8
write_col "Configure /tmp" c9
write_col "Ensure noexec option set on /tmp partition" c10
write_col "The noexec mount option specifies that the filesystem cannot contain executable binaries" c11
write_col "If a /tmp partition does not exist this control does not apply otherwise ensure noexec option set on /tmp partition" c12
write_col "/tmp is not a separate partition" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

########################End########################

########################Configure /var/tmp########################

#1.1.2.5.2 Ensure nodev option set on /var/tmp partition

part4=`findmnt -nk /var/tmp | wc -l`

if [[ $part4 -ne 0 ]]
then
option3=`findmnt -nk /var/tmp | grep -v nodev | wc -l`
if [[ $option3 -eq 0 ]]
then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.5.2" c8
write_col "Configure /var/tmp" c9
write_col "Ensure nodev option set on /var/tmp partition" c10
write_col "The nodev mount option specifies that the filesystem cannot contain special devices" c11
write_col "If a /var/tmp partition does not exist this control does not apply otherwise ensure nodev option set on /var/tmp partition" c12
write_col "Nodev mount option is set on /var/tmp partition Output : $(findmnt -nk /var/tmp | sed 's/,/ /g')" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.5.2" c8
write_col "Configure /var/tmp" c9
write_col "Ensure nodev option set on /var/tmp partition" c10
write_col "The nodev mount option specifies that the filesystem cannot contain special devices" c11
write_col "If a /var/tmp partition does not exist this control does not apply otherwise ensure nodev option set on /var/tmp partition" c12
write_col "Nodev mount option is not set on /var/tmp partition Output : $(findmnt -nk /var/tmp | sed 's/,/ /g')" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.5.2" c8
write_col "Configure /var/tmp" c9
write_col "Ensure nodev option set on /var/tmp partition" c10
write_col "The nodev mount option specifies that the filesystem cannot contain special devices" c11
write_col "If a /var/tmp partition does not exist this control does not apply otherwise ensure nodev option set on /var/tmp partition" c12
write_col "/var/tmp partition does not exist" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

# 1.1.2.5.3 Ensure nosuid option set on /var/tmp partition

# Check if /var/tmp is a separate mount point
mount_check=$(findmnt -kn /var/tmp 2>/dev/null)

if [[ -n "$mount_check" ]]; then

  # CIS verification: should return nothing
  nosuid_check=$(findmnt -kn /var/tmp | grep -v nosuid)

  if [[ -z "$nosuid_check" ]]; then
    status="OK"
    details="nosuid option is set on /var/tmp partition Output: $(findmnt -kn /var/tmp | sed 's/,/ /g')"
  else
    status="KO"
    details="nosuid option is NOT set on /var/tmp partition Output: $(findmnt -kn /var/tmp | sed 's/,/ /g')"
  fi

else
  status="OK"
  details="/var/tmp is not a separate partition (control not applicable)"
fi

# Output to CSV
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.5.3" c8
write_col "Configure /var/tmp" c9
write_col "Ensure nosuid option set on /var/tmp partition" c10
write_col "The nosuid mount option specifies that the filesystem cannot contain setuid files" c11
write_col "If a /var/tmp partition exists ensure nosuid option is set, otherwise not applicable" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

#1.1.2.5.4 Ensure noexec option set on /var/tmp partition

part6=`findmnt -nk /var/tmp | wc -l`

if [[ $part6 -ne 0 ]]
then
option5=`findmnt -nk /var/tmp | grep -v noexec | wc -l`
if [[ $option5 -eq 0 ]]
then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.5.4" c8
write_col "Configure /var/tmp" c9
write_col "Ensure noexec option set on /var/tmp partition" c10
write_col "The noexec mount option specifies that the filesystem cannot contain executable binaries" c11
write_col "If a /var/tmp partition does not exist this control does not apply otherwise ensure noexec option set on /var/tmp partition" c12
write_col "Noexec mount option is set on /var/tmp partition Output : $(findmnt -nk /var/tmp | sed 's/,/ /g')" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.5.4" c8
write_col "Configure /var/tmp" c9
write_col "Ensure noexec option set on /var/tmp partition" c10
write_col "The noexec mount option specifies that the filesystem cannot contain executable binaries" c11
write_col "If a /var/tmp partition does not exist this control does not apply otherwise ensure noexec option set on /var/tmp partition" c12
write_col "Noexec mount option is not set on /var/tmp partition Output : $(findmnt -nk /var/tmp | sed 's/,/ /g')" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.5.4" c8
write_col "Configure /var/tmp" c9
write_col "Ensure noexec option set on /var/tmp partition" c10
write_col "The noexec mount option specifies that the filesystem cannot contain executable binaries" c11
write_col "If a /var/tmp partition does not exist this control does not apply otherwise ensure noexec option set on /var/tmp partition" c12
write_col "/var/tmp partition does not exist" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

########################End########################

########################Configure /dev/shm ########################

# 1.1.2.2.1 Ensure /dev/shm is tmpfs

mount_info=$(findmnt -n /dev/shm)

if [[ -z "$mount_info" ]]; then
    status="KO"
    details="/dev/shm is not mounted"

else
    fs_type=$(findmnt -n -o FSTYPE /dev/shm)

    if [[ "$fs_type" == "tmpfs" ]]; then
        status="OK"
        details="/dev/shm is mounted as tmpfs"
    else
        status="KO"
        details="/dev/shm is mounted but not as tmpfs (Found: $fs_type)"
    fi
fi


# ---- Output Section (same format as your script) ----

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.2.1" c8
write_col "Configure /dev/shm" c9
write_col "Ensure /dev/shm is tmpfs" c10
write_col "/dev/shm is a world-writable directory used for shared memory" c11
write_col "/dev/shm should be mounted as tmpfs to prevent disk-backed storage risks" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

#1.1.2.2.2 Ensure nodev option set on /dev/shm partition

part7=`findmnt -nk /dev/shm | wc -l`

if [[ $part7 -ne 0 ]]
then
option6=`findmnt -nk /dev/shm | grep -v nodev | wc -l`
if [[ $option6 -eq 0 ]]
then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.2.2" c8
write_col "Configure /dev/shm" c9
write_col "Ensure nodev option set on /dev/shm partition" c10
write_col "The nodev mount option specifies that the filesystem cannot contain special devices" c11
write_col "If a /dev/shm partition does not exist this control does not apply otherwise ensure nodev option set on /dev/shm partition" c12
write_col "Nodev mount option is set on /dev/shm partition Output : $(findmnt -nk /dev/shm | sed 's/,/ /g')" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.2.2" c8
write_col "Configure /dev/shm" c9
write_col "Ensure nodev option set on /dev/shm partition" c10
write_col "The nodev mount option specifies that the filesystem cannot contain special devices" c11
write_col "If a /dev/shm partition does not exist this control does not apply otherwise ensure nodev option set on /dev/shm partition" c12
write_col "Nodev mount option is not set on /dev/shm partition Output : $(findmnt -nk /dev/shm | sed 's/,/ /g')" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.2.2" c8
write_col "Configure /dev/shm" c9
write_col "Ensure nodev option set on /dev/shm partition" c10
write_col "The nodev mount option specifies that the filesystem cannot contain special devices" c11
write_col "If a /dev/shm partition does not exist this control does not apply otherwise ensure nodev option set on /dev/shm partition" c12
write_col "/dev/shm is not a separate partition" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#1.1.2.2.3 Ensure nosuid option set on /dev/shm partition

part8=`findmnt -nk /dev/shm | wc -l`

if [[ $part8 -ne 0 ]]
then
option7=`findmnt -nk /dev/shm | grep -v nosuid | wc -l`
if [[ $option7 -eq 0 ]]
then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.2.3" c8
write_col "Configure /dev/shm" c9
write_col "Ensure nosuid option set on /dev/shm partition" c10
write_col "The nosuid mount option specifies that the filesystem cannot contain setuid files" c11
write_col "If a /dev/shm partition does not exist this control does not apply otherwise ensure nosuid option set on /dev/shm partition" c12
write_col "Nosuid mount option is set on /dev/shm partition Output : $(findmnt -nk /dev/shm | sed 's/,/ /g')" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.2.3" c8
write_col "Configure /dev/shm" c9
write_col "Ensure nosuid option set on /dev/shm partition" c10
write_col "The nosuid mount option specifies that the filesystem cannot contain setuid files" c11
write_col "If a /dev/shm partition does not exist this control does not apply otherwise ensure nosuid option set on /dev/shm partition" c12
write_col "Nosuid mount option is not set on /dev/shm partition Output : $(findmnt -nk /dev/shm | sed 's/,/ /g')" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.2.3" c8
write_col "Configure /dev/shm" c9
write_col "Ensure nosuid option set on /dev/shm partition" c10
write_col "The nosuid mount option specifies that the filesystem cannot contain setuid files" c11
write_col "If a /dev/shm partition does not exist this control does not apply otherwise ensure nosuid option set on /dev/shm partition" c12
write_col "/dev/shm is not a separate partition" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#1.1.2.2.4 Ensure noexec option set on /dev/shm partition

part9=`findmnt -nk /dev/shm | wc -l`

if [[ $part9 -ne 0 ]]
then
option8=`findmnt -nk /dev/shm | grep -v noexec | wc -l`
if [[ $option8 -eq 0 ]]
then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.2.4" c8
write_col "Configure /dev/shm" c9
write_col "Ensure noexec option set on /dev/shm partition" c10
write_col "The noexec mount option specifies that the filesystem cannot contain executable binaries" c11
write_col "If a /dev/shm partition does not exist this control does not apply otherwise ensure noexec option set on /dev/shm partition" c12
write_col "Noexec mount option is set on /dev/shm partition Output : $(findmnt -nk /dev/shm | sed 's/,/ /g')" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.2.4" c8
write_col "Configure /dev/shm" c9
write_col "Ensure noexec option set on /dev/shm partition" c10
write_col "The noexec mount option specifies that the filesystem cannot contain executable binaries" c11
write_col "If a /dev/shm partition does not exist this control does not apply otherwise ensure noexec option set on /dev/shm partition" c12
write_col "Noexec mount option is not set on /dev/shm partition Output : $(findmnt -nk /dev/shm | sed 's/,/ /g')" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.2.4" c8
write_col "Configure /dev/shm" c9
write_col "Ensure noexec option set on /dev/shm partition" c10
write_col "The noexec mount option specifies that the filesystem cannot contain executable binaries" c11
write_col "If a /dev/shm partition does not exist this control does not apply otherwise ensure noexec option set on /dev/shm partition" c12
write_col "/dev/shm is not a separate partition" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

########################End########################

########################Configure /var########################

#1.1.2.4.2 Ensure nodev option set on /var partition

part11=`findmnt -nk /var | wc -l`

if [[ $part11 -ne 0 ]]
then
option9=`findmnt -nk /var | grep -v nodev | wc -l`
if [[ $option9 -eq 0 ]]
then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.4.2" c8
write_col "Configure /var" c9
write_col "Ensure nodev option set on /var partition" c10
write_col "The nodev mount option specifies that the filesystem cannot contain special devices" c11
write_col "Set nodev option on /var partition" c12
write_col "Nodev mount option is set on /var partition Output : $(findmnt -nk /var | sed 's/,/ /g')" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.4.2" c8
write_col "Configure /var" c9
write_col "Ensure nodev option set on /var partition" c10
write_col "The nodev mount option specifies that the filesystem cannot contain special devices" c11
write_col "Set nodev option on /var partition" c12
write_col "Nodev mount option is not set on /var partition Output : $(findmnt -nk /var | sed 's/,/ /g')" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.4.2" c8
write_col "Configure /var" c9
write_col "Ensure nodev option set on /var partition" c10
write_col "The nodev mount option specifies that the filesystem cannot contain special devices" c11
write_col "Set nodev option on /var partition" c12
write_col "/var partition does not exist" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#1.1.2.4.3 Ensure nosuid option set on /var partition

part12=`findmnt -nk /var | wc -l`

if [[ $part12 -ne 0 ]]
then
option10=`findmnt -nk /var | grep -v nosuid | wc -l`
if [[ $option10 -eq 0 ]]
then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.4.3" c8
write_col "Configure /var" c9
write_col "Ensure nosuid option set on /var partition" c10
write_col "The nosuid mount option specifies that the filesystem cannot contain setuid files" c11
write_col "Set nosuid option on /var partition" c12
write_col "Nosuid mount option is set on /var partition Output : $(findmnt -nk /var | sed 's/,/ /g')" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.4.3" c8
write_col "Configure /var" c9
write_col "Ensure nosuid option set on /var partition" c10
write_col "The nosuid mount option specifies that the filesystem cannot contain setuid files" c11
write_col "Set nosuid option on /var partition" c12
write_col "Nosuid mount option is not set on /var partition Output : $(findmnt -nk /var | sed 's/,/ /g')" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.4.3" c8
write_col "Configure /var" c9
write_col "Ensure nosuid option set on /var partition" c10
write_col "The nosuid mount option specifies that the filesystem cannot contain setuid files" c11
write_col "Set nosuid option on /var partition" c12
write_col "/var partition does not exist" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

########################End########################

########################Configure /var/log########################

#1.1.2.6.2 Ensure nodev option set on /var/log partition

part13=`findmnt -nk /var/log | wc -l`

if [[ $part13 -ne 0 ]]
then
option11=`findmnt -nk /var/log | grep -v nodev | wc -l`
if [[ $option11 -eq 0 ]]
then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.6.2" c8
write_col "Configure /var/log" c9
write_col "Ensure nodev option set on /var/log partition" c10
write_col "The nodev mount option specifies that the filesystem cannot contain special devices" c11
write_col "Set nodev option on /var/log partition" c12
write_col "Nodev mount option is set on /var/log partition Output : $(findmnt -nk /var/log | sed 's/,/ /g')" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.6.2" c8
write_col "Configure /var/log" c9
write_col "Ensure nodev option set on /var/log partition" c10
write_col "The nodev mount option specifies that the filesystem cannot contain special devices" c11
write_col "Set nodev option on /var/log partition" c12
write_col "Nodev mount option is not set on /var/log partition Output : $(findmnt -nk /var/log | sed 's/,/ /g')" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.6.2" c8
write_col "Configure /var/log" c9
write_col "Ensure nodev option set on /var/log partition" c10
write_col "The nodev mount option specifies that the filesystem cannot contain special devices" c11
write_col "Set nodev option on /var/log partition" c12
write_col "/var/log partition does not exist" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#1.1.2.6.4 Ensure noexec option set on /var/log partition

part14=`findmnt -nk /var/log | wc -l`

if [[ $part14 -ne 0 ]]
then
option12=`findmnt -nk /var/log | grep -v noexec | wc -l`
if [[ $option12 -eq 0 ]]
then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.6.4" c8
write_col "Configure /var/log" c9
write_col "Ensure noexec option set on /var/log partition" c10
write_col "The noexec mount option specifies that the filesystem cannot contain executable binaries" c11
write_col "Set noexec option on /var/log partition" c12
write_col "Noexec mount option is set on /var/log partition Output : $(findmnt -nk /var/log | sed 's/,/ /g')" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.6.4" c8
write_col "Configure /var/log" c9
write_col "Ensure noexec option set on /var/log partition" c10
write_col "The noexec mount option specifies that the filesystem cannot contain executable binaries" c11
write_col "Set noexec option on /var/log partition" c12
write_col "Noexec mount option is not set on /var/log partition Output : $(findmnt -nk /var/log | sed 's/,/ /g')" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.6.4" c8
write_col "Configure /var/log" c9
write_col "Ensure noexec option set on /var/log partition" c10
write_col "The noexec mount option specifies that the filesystem cannot contain executable binaries" c11
write_col "Set noexec option on /var/log partition" c12
write_col "/var/log partition does not exist" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#1.1.2.6.3 Ensure nosuid option set on /var/log partition

part15=`findmnt -nk /var/log | wc -l`

if [[ $part15 -ne 0 ]]
then
option13=`findmnt -nk /var/log | grep -v nosuid | wc -l`
if [[ $option13 -eq 0 ]]
then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.6.3" c8
write_col "Configure /var/log" c9
write_col "Ensure nosuid option set on /var/log partition" c10
write_col "The nosuid mount option specifies that the filesystem cannot contain setuid files" c11
write_col "Set nosuid option on /var/log partition" c12
write_col "Nosuid mount option is set on /var/log partition Output : $(findmnt -nk /var/log | sed 's/,/ /g')" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.6.3" c8
write_col "Configure /var/log" c9
write_col "Ensure nosuid option set on /var/log partition" c10
write_col "The nosuid mount option specifies that the filesystem cannot contain setuid files" c11
write_col "Set nosuid option on /var/log partition" c12
write_col "Nosuid mount option is not set on /var/log partition Output : $(findmnt -nk /var/log | sed 's/,/ /g')" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.6.3" c8
write_col "Configure /var/log" c9
write_col "Ensure nosuid option set on /var/log partition" c10
write_col "The nosuid mount option specifies that the filesystem cannot contain setuid files" c11
write_col "Set nosuid option on /var/log partition" c12
write_col "/var/log partition does not exist" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

########################End########################

########################Configure /var/log/audit########################

#1.1.2.7.4 Ensure noexec option set on /var/log/audit partition

part16=`findmnt -nk /var/log/audit | wc -l`

if [[ $part16 -ne 0 ]]
then
option14=`findmnt -nk /var/log/audit | grep -v noexec | wc -l`
if [[ $option14 -eq 0 ]]
then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.7.4" c8
write_col "Configure /var/log/audit" c9
write_col "Ensure noexec option set on /var/log/audit partition" c10
write_col "The noexec mount option specifies that the filesystem cannot contain executable binaries" c11
write_col "Set noexec option on /var/log/audit partition" c12
write_col "Noexec mount option is set on /var/log/audit partition Output : $(findmnt -nk /var/log/audit | sed 's/,/ /g')" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.7.4" c8
write_col "Configure /var/log/audit" c9
write_col "Ensure noexec option set on /var/log/audit partition" c10
write_col "The noexec mount option specifies that the filesystem cannot contain executable binaries" c11
write_col "Set noexec option on /var/log/audit partition" c12
write_col "Noexec mount option is not set on /var/log/audit partition Output : $(findmnt -nk /var/log/audit | sed 's/,/ /g')" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.7.4" c8
write_col "Configure /var/log/audit" c9
write_col "Ensure noexec option set on /var/log/audit partition" c10
write_col "The noexec mount option specifies that the filesystem cannot contain executable binaries" c11
write_col "Set noexec option on /var/log/audit partition" c12
write_col "/var/log/audit partition does not exist" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#1.1.2.7.2 Ensure nodev option set on /var/log/audit partition

part17=`findmnt -nk /var/log/audit | wc -l`

if [[ $part17 -ne 0 ]]
then
option15=`findmnt -nk /var/log/audit | grep -v nodev | wc -l`
if [[ $option15 -eq 0 ]]
then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.7.2" c8
write_col "Configure /var/log/audit" c9
write_col "Ensure nodev option set on /var/log/audit partition" c10
write_col "The nodev mount option specifies that the filesystem cannot contain special devices" c11
write_col "Set nodev option on /var/log/audit partition" c12
write_col "Nodev mount option is set on /var/log/audit partition Output : $(findmnt -nk /var/log/audit | sed 's/,/ /g')" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.7.2" c8
write_col "Configure /var/log/audit" c9
write_col "Ensure nodev option set on /var/log/audit partition" c10
write_col "The nodev mount option specifies that the filesystem cannot contain special devices" c11
write_col "Set nodev option on /var/log/audit partition" c12
write_col "Nodev mount option is not set on /var/log/audit partition Output : $(findmnt -nk /var/log/audit | sed 's/,/ /g')" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.7.2" c8
write_col "Configure /var/log/audit" c9
write_col "Ensure nodev option set on /var/log/audit partition" c10
write_col "The nodev mount option specifies that the filesystem cannot contain special devices" c11
write_col "Set nodev option on /var/log/audit partition" c12
write_col "/var/log/audit partition does not exist" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#1.1.2.7.3 Ensure nosuid option set on /var/log/audit partition

part18=`findmnt -nk /var/log/audit | wc -l`

if [[ $part18 -ne 0 ]]
then
option16=`findmnt -nk /var/log/audit | grep -v nosuid | wc -l`
if [[ $option16 -eq 0 ]]
then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.7.3" c8
write_col "Configure /var/log/audit" c9
write_col "Ensure nosuid option set on /var/log/audit partition" c10
write_col "The nosuid mount option specifies that the filesystem cannot contain setuid files" c11
write_col "Set nosuid option on /var/log/audit partition" c12
write_col "Nosuid mount option is set on /var/log/audit partition Output : $(findmnt -nk /var/log/audit | sed 's/,/ /g')" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.7.3" c8
write_col "Configure /var/log/audit" c9
write_col "Ensure nosuid option set on /var/log/audit partition" c10
write_col "The nosuid mount option specifies that the filesystem cannot contain setuid files" c11
write_col "Set nosuid option on /var/log/audit partition" c12
write_col "Nosuid mount option is not set on /var/log/audit partition Output : $(findmnt -nk /var/log/audit | sed 's/,/ /g')" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.7.3" c8
write_col "Configure /var/log/audit" c9
write_col "Ensure nosuid option set on /var/log/audit partition" c10
write_col "The nosuid mount option specifies that the filesystem cannot contain setuid files" c11
write_col "Set nosuid option on /var/log/audit partition" c12
write_col "/var/log/audit partition does not exist" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

########################End########################

########################Configure /home########################

#1.1.2.3.3 Ensure nosuid option set on /home partition

part19=`findmnt -nk /home | wc -l`

if [[ $part19 -ne 0 ]]
then
option16=`findmnt -nk /home | grep -v nosuid | wc -l`
if [[ $option16 -eq 0 ]]
then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.3.3" c8
write_col "Configure /home" c9
write_col "Ensure nosuid option set on /home partition" c10
write_col "The nosuid mount option specifies that the filesystem cannot contain setuid files" c11
write_col "Set nosuid option on /home partition" c12
write_col "Nosuid mount option is set on /home partition Output : $(findmnt -nk /home | sed 's/,/ /g')" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.3.3" c8
write_col "Configure /home" c9
write_col "Ensure nosuid option set on /home partition" c10
write_col "The nosuid mount option specifies that the filesystem cannot contain setuid files" c11
write_col "Set nosuid option on /home partition" c12
write_col "Nosuid mount option is not set on /home partition Output : $(findmnt -nk /home | sed 's/,/ /g')" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.3.3" c8
write_col "Configure /home" c9
write_col "Ensure nosuid option set on /home partition" c10
write_col "The nosuid mount option specifies that the filesystem cannot contain setuid files" c11
write_col "Set nosuid option on /home partition" c12
write_col "/home partition does not exist" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#1.1.2.3.2 Ensure nodev option set on /home partition

part20=`findmnt -nk /home | wc -l`

if [[ $part20 -ne 0 ]]
then
option17=`findmnt -nk /home | grep -v nodev | wc -l`
if [[ $option17 -eq 0 ]]
then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.3.2" c8
write_col "Configure /home" c9
write_col "Ensure nodev option set on /home partition" c10
write_col "The nodev mount option specifies that the filesystem cannot contain special devices" c11
write_col "If a /home partition does not exist this control does not apply otherwise ensure nodev option set on /home partition" c12
write_col "Nodev mount option is set on /home partition Output : $(findmnt -nk /home | sed 's/,/ /g')" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.3.2" c8
write_col "Configure /home" c9
write_col "Ensure nodev option set on /home partition" c10
write_col "The nodev mount option specifies that the filesystem cannot contain special devices" c11
write_col "If a /home partition does not exist this control does not apply otherwise ensure nodev option set on /home partition" c12
write_col "Nodev mount option is not set on /home partition Output : $(findmnt -nk /home | sed 's/,/ /g')" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "1.1.2.3.2" c8
write_col "Configure /home" c9
write_col "Ensure nodev option set on /home partition" c10
write_col "The nodev mount option specifies that the filesystem cannot contain special devices" c11
write_col "If a /home partition does not exist this control does not apply otherwise ensure nodev option set on /home partition" c12
write_col "/home partition does not exist" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

########################End########################

########################Configure Journald########################

# 6.2.1.1.1 Ensure systemd-journald service is active

{
 l_output=""
 l_output2=""

 if ! systemctl list-unit-files | grep -q '^systemd-journald.service'; then
   l_output2="systemd-journald service not found"
 else

   service_status=$(systemctl is-active systemd-journald.service 2>/dev/null)

   if [[ "$service_status" == "active" ]]; then
     l_output="systemd-journald service is active"
   else
     l_output2="systemd-journald service is not active (status: $service_status)"
   fi

 fi

 if [[ -z "$l_output2" ]]; then
   status="OK"
   details="$l_output"
 else
   status="KO"
   details="$l_output2"
 fi

 write_col "$customer" c1
 write_col "$custinvid" c2
 write_col "$policy" c3
 write_col "$doc" c4
 write_col "$server" c5
 write_col "$ip" c6
 write_col "$os" c7
 write_col "6.2.1.1.1" c8
 write_col "Logging and Auditing" c9
 write_col "Ensure systemd-journald service is active" c10
 write_col "systemd-journald must be running to collect and store system logs" c11
 write_col "systemd-journald.service should be active" c12
 write_col "$details" c13
 write_col "$status" c14
 write_col "$severity" c15
 write_col "$scandate" c16

}

# 6.2.1.1.4 Ensure journald ForwardToSyslog is disabled

config_file="/etc/systemd/journald.conf"

if [[ ! -f "$config_file" ]]; then
    status="KO"
    details="journald configuration file not found: $config_file"

else
    value=$(grep -Ei '^\s*ForwardToSyslog\s*=' "$config_file" | tail -1 | awk -F= '{print $2}' | tr -d ' ')

    # If not set, default is "no" on RHEL 8
    if [[ -z "$value" || "$value" == "no" ]]; then
        status="OK"
        details="ForwardToSyslog is disabled"
    else
        status="KO"
        details="ForwardToSyslog is enabled (value: $value)"
    fi
fi


# ---- Output Section (same format as your script) ----

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "6.2.1.1.4" c8
write_col "Configure systemd-journald" c9
write_col "Ensure journald ForwardToSyslog is disabled" c10
write_col "Forwarding journal logs to syslog may cause duplicate logging and performance issues" c11
write_col "ForwardToSyslog should be disabled unless explicitly required" c12
write_col "$details" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16

# ---------- Function to capture current value ----------
get_current_value() {
    local file="$1"
    if [[ -f "$file" ]]; then
        head -5 "$file" | tr '\n' ' '
    else
        echo "File not present"
    fi
}

# 6.2.1.2.3 Ensure systemd-journal-upload is enabled and active

svc="systemd-journal-upload.service"

if ! systemctl list-unit-files | grep -q "^$svc"; then
  current_value="Service not installed"
  status="KO"
else
  enabled=$(systemctl is-enabled "$svc")
  active=$(systemctl is-active "$svc")
  current_value="Enabled=$enabled Active=$active"

  if [[ "$enabled" == "enabled" && "$active" == "active" ]]; then
    status="OK"
  else
    status="KO"
  fi
fi

write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "6.2.1.2.3" c8
write_col "Configure Logging" c9
write_col "Ensure systemd-journal-upload is enabled and active" c10
write_col "systemd-journal-upload forwards logs to remote server" c11
write_col "Service must exist, enabled and active" c12
write_col "$current_value" c13
write_col "$status" c14
write_col "$severity" c15
write_col "$scandate" c16
 
#6.2.1.2.4 Ensure systemd-journal-remote service is not in use

svc="systemd-journal-remote.service"

# Check service availability
svc_exists=$(systemctl list-unit-files 2>/dev/null | awk '{print $1}' | grep -x "$svc")

# If service unit does not exist -> OK (Not in use / Not installed)
if [[ -z "$svc_exists" ]]; then
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "6.2.1.2.4" c8
  write_col "Ensure systemd-journal-remote service is not in use" c9
  write_col "Ensure systemd-journal-remote service is not in use" c10
  write_col "systemd-journal-remote should not be running unless the host is intentionally configured as a journal log receiver" c11
  write_col "systemd-journal-remote.service should be disabled and inactive (or not installed)" c12
  write_col "Service not found Output : $svc unit file not present (not installed / not in use)" c13
  write_col "OK" c14
  write_col "$severity" c15
  write_col "$scandate" c16

else
  # Service exists: check enabled + active status
  svc_enabled=$(systemctl is-enabled "$svc" 2>/dev/null)
  svc_active=$(systemctl is-active "$svc" 2>/dev/null)

  # PASS condition: disabled (or masked) and inactive (or failed)
  if [[ ("$svc_enabled" == "disabled" || "$svc_enabled" == "masked") && ("$svc_active" == "inactive" || "$svc_active" == "failed") ]]; then
    write_col "$customer" c1
    write_col "$custinvid" c2
    write_col "$policy" c3
    write_col "$doc" c4
    write_col "$server" c5
    write_col "$ip" c6
    write_col "$os" c7
    write_col "6.2.1.2.4" c8
    write_col "Ensure systemd-journal-remote service is not in use" c9
    write_col "Ensure systemd-journal-remote service is not in use" c10
    write_col "systemd-journal-remote should not be running unless the host is intentionally configured as a journal log receiver" c11
    write_col "systemd-journal-remote.service should be disabled and inactive" c12
    write_col "systemd-journal-remote is not in use Output : Enabled=$svc_enabled, Active=$svc_active" c13
    write_col "OK" c14
    write_col "$severity" c15
    write_col "$scandate" c16

  else
    # FAIL condition: enabled or running
    write_col "$customer" c1
    write_col "$custinvid" c2
    write_col "$policy" c3
    write_col "$doc" c4
    write_col "$server" c5
    write_col "$ip" c6
    write_col "$os" c7
    write_col "6.2.1.2.4" c8
    write_col "Ensure systemd-journal-remote service is not in use" c9
    write_col "Ensure systemd-journal-remote service is not in use" c10
    write_col "systemd-journal-remote should not be running unless the host is intentionally configured as a journal log receiver" c11
    write_col "systemd-journal-remote.service should be disabled and inactive" c12
    write_col "systemd-journal-remote is in use Output : Enabled=$svc_enabled, Active=$svc_active" c13
    write_col "KO" c14
    write_col "$severity" c15
    write_col "$scandate" c16
  fi
fi

#6.2.2.3 Ensure journald is configured to send logs to rsyslog

main_conf="/etc/systemd/journald.conf"
dropin_dir="/etc/systemd/journald.conf.d"

# Collect configured value from drop-ins and main file (drop-ins override main)
# We consider the LAST match as effective configuration in scan context.
jval=$(
  {
    [[ -d "$dropin_dir" ]] && grep -REih '^\s*ForwardToSyslog\s*=' "$dropin_dir"/*.conf 2>/dev/null
    [[ -f "$main_conf" ]] && grep -Eih '^\s*ForwardToSyslog\s*=' "$main_conf" 2>/dev/null
  } | tail -n 1 | awk -F= '{print $2}' | tr -d ' "'
)

if [[ "$jval" == "yes" ]]; then
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "6.2.2.3" c8
  write_col "Ensure journald is configured to send logs to rsyslog" c9
  write_col "Ensure journald is configured to send logs to rsyslog" c10
  write_col "journald should forward logs to rsyslog to support centralized logging and compatibility with syslog-based tooling" c11
  write_col "ForwardToSyslog should be set to yes in journald configuration" c12
  write_col "journald is configured to forward logs Output : ForwardToSyslog=$jval" c13
  write_col "OK" c14
  write_col "$severity" c15
  write_col "$scandate" c16
else
  write_col "$customer" c1
  write_col "$custinvid" c2
  write_col "$policy" c3
  write_col "$doc" c4
  write_col "$server" c5
  write_col "$ip" c6
  write_col "$os" c7
  write_col "6.2.2.3" c8
  write_col "Ensure journald is configured to send logs to rsyslog" c9
  write_col "Ensure journald is configured to send logs to rsyslog" c10
  write_col "journald should forward logs to rsyslog to support centralized logging and compatibility with syslog-based tooling" c11
  write_col "ForwardToSyslog should be set to yes in journald configuration" c12
  write_col "journald is NOT configured to forward logs Output : ForwardToSyslog=${jval:-Not Set}" c13
  write_col "KO" c14
  write_col "$severity" c15
  write_col "$scandate" c16
fi

#6.2.1.1.5 Ensure journald Storage is configured

storage_val=$(grep -Ei '^\s*Storage\s*=' /etc/systemd/journald.conf 2>/dev/null | tail -n 1 | awk -F= '{print $2}' | tr -d ' "')

if [[ "$storage_val" == "persistent" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "6.2.1.1.5" c8
write_col "Ensure journald Storage is configured" c9
write_col "Ensure journald Storage is configured" c10
write_col "Systemd-journald storage should be configured to persistent to ensure logs are retained across reboots" c11
write_col "Storage should be configured as persistent in /etc/systemd/journald.conf" c12
write_col "Storage is configured Output : Storage=$storage_val" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "6.2.1.1.5" c8
write_col "Ensure journald Storage is configured" c9
write_col "Ensure journald Storage is configured" c10
write_col "Systemd-journald storage should be configured to persistent to ensure logs are retained across reboots" c11
write_col "Storage should be configured as persistent in /etc/systemd/journald.conf" c12
write_col "Storage is not compliant Output : Storage=${storage_val:-Not Set}" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#6.2.1.1.6 Ensure journald Compress is configured

compress_val=$(grep -Ei '^\s*Compress\s*=' /etc/systemd/journald.conf 2>/dev/null | tail -n 1 | awk -F= '{print $2}' | tr -d ' "')

if [[ "$compress_val" == "yes" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "6.2.1.1.6" c8
write_col "Ensure journald Compress is configured" c9
write_col "Ensure journald Compress is configured" c10
write_col "Systemd-journald should compress rotated logs to reduce disk usage and improve log retention" c11
write_col "Compress should be configured as yes in /etc/systemd/journald.conf" c12
write_col "Compress is configured Output : Compress=$compress_val" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "6.2.1.1.6" c8
write_col "Ensure journald Compress is configured" c9
write_col "Ensure journald Compress is configured" c10
write_col "Systemd-journald should compress rotated logs to reduce disk usage and improve log retention" c11
write_col "Compress should be configured as yes in /etc/systemd/journald.conf" c12
write_col "Compress is not compliant Output : Compress=${compress_val:-Not Set}" c13
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi

#6.2.1.2.1 Ensure systemd-journal-remote is installed

pkg_status="Not Installed"

if command -v rpm >/dev/null 2>&1; then
    rpm -q systemd-journal-remote >/dev/null 2>&1
    if [[ $? -eq 0 ]]; then
        pkg_status="Installed"
    fi
elif command -v dpkg >/dev/null 2>&1; then
    dpkg -s systemd-journal-remote >/dev/null 2>&1
    if [[ $? -eq 0 ]]; then
        pkg_status="Installed"
    fi
else
    pkg_status="Package manager not found"
fi

if [[ "$pkg_status" == "Installed" ]]; then
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "6.2.1.2.1" c8
write_col "Ensure systemd-journal-remote is installed" c9
write_col "Ensure systemd-journal-remote is installed" c10
write_col "systemd-journal-remote package provides capability for journald to send/receive logs to remote systems when needed" c11
write_col "systemd-journal-remote package should be installed" c12
write_col "systemd-journal-remote package status : $pkg_status" c13
write_col "OK" c14
write_col "$severity" c15
write_col "$scandate" c16
else
write_col "$customer" c1
write_col "$custinvid" c2
write_col "$policy" c3
write_col "$doc" c4
write_col "$server" c5
write_col "$ip" c6
write_col "$os" c7
write_col "6.2.1.2.1" c8
write_col "Ensure systemd-journal-remote is installed" c9
write_col "Ensure systemd-journal-remote is installed" c10
write_col "systemd-journal-remote package provides capability for journald to send/receive logs to remote systems when needed" c11
write_col "systemd-journal-remote package should be installed" c12
if command -v rpm >/dev/null 2>&1; then
write_col "systemd-journal-remote package is not installed Output : $(rpm -q systemd-journal-remote 2>/dev/null)" c13
elif command -v dpkg >/dev/null 2>&1; then
write_col "systemd-journal-remote package is not installed Output : $(dpkg -s systemd-journal-remote 2>/dev/null | grep -i '^Status' || echo Not Installed)" c13
else
write_col "systemd-journal-remote package is not installed Output : Package manager not found" c13
fi
write_col "KO" c14
write_col "$severity" c15
write_col "$scandate" c16
fi


#######################################end#########################################################

########################The Original three scripts are merged to one Master Script by Sailen Roy########################

#######################################end#########################################################

paste -d "|" c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 >>`hostname`.csv

rm -rf c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16

