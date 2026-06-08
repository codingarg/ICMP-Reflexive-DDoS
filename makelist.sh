#!/bin/sh -e
awk '/Nmap scan report for/ {print $NF}' antel.log > ips.txt
