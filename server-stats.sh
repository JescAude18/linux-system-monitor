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

# Top 5 processes by CPU usage
# echo "    PID PROCESS         %CPU"
# ps -eo pid,comm,%cpu | tail -n +2 | sort -k3 -nr | head -n 5)
echo "--------------- Top 5 processes by CPU usage ---------------"
TOP5_CPU=$(ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6)
echo -e "${TOP5_CPU}\n"

# Top 5 processes by memory usage
# Another commands combination for the same result is : 
# ps -eo pid,comm,%mem | tail -n +2 | sort -k3 -nr | head -n 5)
echo "---------------- Top 5 processes by MEM usage ---------------"
TOP5_MEM=$(ps -eo pid,comm,%mem --sort=-%mem | head -n 6)
echo -e "${TOP5_MEM}\n"

# Bonus
echo -e "-------------------------- Extra infos -----------------------------\n"
# OS Version
OS_VERSION=$(hostnamectl | grep "Operating System")
echo -e "${OS_VERSION}\n"
# Kernel
KERNEL=$(hostnamectl | grep "Kernel" | cut -d ':' -f2)
echo -e "Kernel: ${KERNEL}\n"
# Architecture
ARCHITECTURE=$(hostnamectl | grep "Architecture" | cut -d ':' -f2)
echo -e "Architecture: ${ARCHITECTURE}\n"
# Uptime
UPTIME=$(uptime -p | awk '{ for (i=2; i<=NF;i++) printf "%s%s", $i, (i<NF ? OFS : ORS);}')
SINCE=$(uptime -s)
echo -e "Uptime: ${UPTIME} since ${SINCE}\n"
