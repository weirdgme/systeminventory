#!/bin/bash

#Label: This is a script to run system inventory

#Lable:Author:"jimiumar1@gmail.com"

OS=`cat /etc/*release | sed -n '1p' | awk '{print $1}'`

VRSN=`cat /etc/*release | sed -n '1p' | awk '{print $4}'`

MMRY=`free -m | sed -n '2p' |awk '{print ($2)}'`

HDS=`lsblk | sed -n '2p' | awk '{print $4}'`

CPS=`lscpu | sed -n '15p' | awk '{print $3}'`

KV=`uname -r`

SYSB=`getconf LONG_BIT`

HN=`hostnamectl | sed -n '1p' | awk '{print $3}'`

IPADD=`hostname -I | awk '{print $1}'`

OPP=`netstat -tulpn | grep LISTEN | awk '{print $7}' | awk -F/ '{print $1}'`

DNS=`grep "nameserver" /etc/resolv.conf`

MANU=`dmidecode -s system-manufacturer`

SYST=`dmidecode -t system | sed -n '14p' | awk -F: '{print $2}'`

MACAD=`ip link | grep ether`

echo -e "Currently running system inventory.\n"

sleep 3

echo -e "This is a ${SYSB}bit system with ${MMRY}mb of memory, ${CPS}MHZ cpu speed and ${HDS}B harddrive.\n"

sleep 3

if [[ ${SYST} == ' Virtual Machine' ]];

then

echo -e "This system is a Virtual Machine.\n"

else

echo -e "This system is a physical machine made by ${MANU}.\n"

fi

sleep 3

echo -e "This server runs on ${OS}, version ${VRSN} and kernel ${KV}.\n"

sleep 3

echo -e "The mac address for this server is:\n ${MACAD}.\n"

sleep 3

echo -e "The hostname is: ${HN}.\n"

sleep 3

echo -e "The ip-address for this server is ${IPADD}.\n\nThe dns for this server are: \n${DNS}\n"

sleep 3

echo -e "These are the current open ports on this server:"

sleep 1

echo "${OPP}"
