#!/bin/bash
# set log level for kernel messages
dmesg -n 8

modprobe configfs
modprobe netconsole
mount none -t configfs /sys/kernel/config

# 'netconsole' dir is auto created if the module is loaded 
mkdir /sys/kernel/config/netconsole/target1
cd /sys/kernel/config/netconsole/target1

# set local IP address
echo 192.168.1.103 > local_ip
# set destination IP address
echo 192.168.1.101 > remote_ip
# set local network device name (find it trough ifconfig, examples: eth0, eno1, wlan0)
echo eth0 > dev_name
# find destination MAC address
arping $(cat remote_ip) -f | grep -o ..:..:..:..:..:.. > remote_mac

echo 1 > enabled
