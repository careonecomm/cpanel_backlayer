#!/bin/bash
#Fix for AutoSSL
#Enable Dummy module and load on boot
echo "dummy" > /etc/modules-load.d/dummy.conf
modprobe dummy

#Create dummy ethernet interface
sudo ip link add eth10 type dummy

#Config
PUBLICIP=`dig +short myip.opendns.com @resolver1.opendns.com`
echo "TYPE="Ethernet"
PROXY_METHOD="none"
BROWSER_ONLY="no"
BOOTPROTO="none"
NAME="eth10"
DEVICE="eth10"
ONBOOT="yes"
IPADDR="$PUBLICIP"
PREFIX="32"" >> /etc/sysconfig/network-scripts/ifcfg-eth10

#Restart network
systemctl restart network
ifconfig -a

echo "Fix applied (no validations were made)"