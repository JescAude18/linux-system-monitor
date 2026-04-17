#!/bin/bash

##
## EPITECH PROJECT, 2026
## linux-system-monitor
## File description:
## server-stats
##

RESET="\033[0m"
RED_B="\033[41m"
GREEN_B="\033[42m"
YELLOW_B="\033[43m"
BLUE_B="\033[44m"
BLUE="\033[34m"
PINK_B="\033[35m"
CYAN_B="\033[46m"

echo -e "${PINK_B}=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=${RESET}"
echo -e "${PINK_B}=                               SYSTEM INFO                               =${RESET}"
echo -e "${PINK_B}=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=${RESET}\n"

echo "Welcome to this system monitor ! It displays statistics on the CPU, RAM, disk, the" 
echo " top five (05) processes by RAM and CPU, the os version, kernel, logged in users, "
echo -e "architecture, uptime and load average. Thanks for trying it ♥️ .\n"

# CPU usage
echo -e "${GREEN_B}------------------------- CPU USAGE -------------------------${RESET}\n"
CPU_USAGE=$(top -bn1 | grep Cpu | cut -d',' -f4 | awk '{print $1}')
RES_1=$(echo "100 - ${CPU_USAGE}" | bc)
echo -e "CPU usage : ${RES_1} %\n"

# RAM usage
echo -e "${BLUE_B}------------------------- RAM USAGE -------------------------${RESET}\n"

# Total RAM
echo -n "Total: "
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
echo -e "${YELLOW_B}------------------------- DISK USAGE ------------------------${RESET}\n"

# Total disk
echo -n "Total: "
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
echo -e "${RED_B}---------------- Top 5 processes by CPU usage ---------------${RESET}\n"
TOP5_CPU=$(ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6)
echo -e "${TOP5_CPU}\n"

# Top 5 processes by memory usage
# Another commands combination for the same result is : 
# ps -eo pid,comm,%mem | tail -n +2 | sort -k3 -nr | head -n 5)
echo -e "${RED_B}---------------- Top 5 processes by MEM usage ---------------${RESET}\n"
TOP5_MEM=$(ps -eo pid,comm,%mem --sort=-%mem | head -n 6)
echo -e "${TOP5_MEM}\n"

# Bonus
echo -e "${CYAN_B}------------------------ Extra infos ------------------------${RESET}\n"
# OS Version
OS_VERSION=$(hostnamectl | grep "Operating System" | cut -d ':' -f2)
echo -e "${BLUE}Operating System :${RESET}${OS_VERSION}\n"
# Kernel
KERNEL=$(hostnamectl | grep "Kernel" | cut -d ':' -f2)
echo -e "${BLUE}Kernel           :${RESET}${KERNEL}\n"
# Architecture
ARCHITECTURE=$(hostnamectl | grep "Architecture" | cut -d ':' -f2)
echo -e "${BLUE}Architecture     :${RESET}${ARCHITECTURE}\n"
# Uptime
UPTIME=$(uptime -p | awk '{ for (i=2;i<=NF;i++) printf "%s%s", $i, (i<NF ? OFS : ORS);}')
SINCE=$(uptime -s)
echo -e "${BLUE}Uptime           :${RESET} ${UPTIME} since ${SINCE}\n"
# Load average
LOAD=$(uptime | awk '{for(i=8;i<=NF;i++) printf "%s%s", $i, (i<NF ? OFS : ORS);}')
echo -e "${BLUE}Load average     : ${RESET}${LOAD}\n"
# Logged in users
LOGGED=$(who)
echo -e "${BLUE}Logged in users  :${RESET}"
echo -e "${LOGGED}\n"
