#!/bin/bash

##
## EPITECH PROJECT, 2026
## linux-system-monitor
## File description:
## server-stats
##

echo -e "---------------------------SERVER INFO-----------------------------\n"

# CPU usage
echo "----CPU USAGE----"
CPU_USAGE=$(top -bn1 | grep Cpu | cut -d',' -f4 | awk '{print $1}')
RES_1=$(echo "100 - ${CPU_USAGE}" | bc)
echo -e "${RES_1} %\n"

# RAM usage
echo "-----RAM USAGE--------"

# Total RAM
echo -n "Total : "
RAM_TOTAL=$(top -b -n 1 | grep "MiB Mem" | cut -d ',' -f1 | awk '{print $4}')
echo "${RAM_TOTAL} MiB"

# Used RAM
echo -n "Used : "
RAM_USED=$(top -b -n 1 | grep "MiB Mem" | cut -d ',' -f3 | awk '{print $1}')
echo "${RAM_USED} MiB"

# Free RAM
echo -n "Free : "
RAM_FREE=$(top -b -n 1 | grep "MiB Mem" | cut -d ',' -f2 | awk '{print $1}')
echo -e "${RAM_FREE} MiB\n"

# Disk usage
echo "-----DISK USAGE------"

# Total disk
echo -n "Total : "
DISK_TOTAL=$(df -h | awk '$6 == "/"' | awk '{print $2}')
echo "${DISK_TOTAL}"

# Used disk
echo -n "Used : "
DISK_USED=$(df -h | awk '$6 == "/"' | awk '{print $3}')
echo "${DISK_USED}"

# Free disk
echo -n "Free : "
DISK_FREE=$(df -h | awk '$6 == "/"' | awk '{print $4}')
echo -e "${DISK_FREE}\n"
