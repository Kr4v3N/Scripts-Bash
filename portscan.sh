#!/bin/bash
#
# A simple bash script to grab open ports with nmap, then scan only those open ports more aggressively
# Example : ./portscan 192.168.0.1 -oX nmap.xml
#
echo Grabbing ports...

ports=$(nmap -p- --min-rate 1000 -T4 $1 | grep ^[0-9] | cut -d '/' -f 1 | tr '\n' ',' | sed s/,$//)

echo Ports grabbed!

echo Scanning...

nmap -sC -sV -p $ports $1 $2 $3

