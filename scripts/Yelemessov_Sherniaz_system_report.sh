#!/bin/bash
# System report script - Student: Sherniaz Yelemessov
LOG="$(dirname "$0")/../logs/Yelemessov_Sherniaz_system_report.log"
{
echo "=============================================="
echo "Student: Sherniaz Yelemessov"
echo "Date/Time: $(date '+%Y-%m-%d %H:%M:%S')"
echo "User: $(whoami)"
echo "OS: $(grep PRETTY_NAME /etc/os-release | cut -d'"' -f2)"
echo "Kernel: $(uname -r)"
echo "--- CPU ---"
lscpu | grep -E 'Model name|^CPU\(s\)'
echo "--- Memory ---"
free -h
echo "--- Disk usage ---"
df -h
echo "--- Available disk space on / ---"
df -h / | awk 'NR==2{print "Available: "$4" of "$2" ("$5" used)"}'
echo
} | tee -a "$LOG"
