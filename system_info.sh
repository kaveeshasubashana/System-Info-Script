#!/bin/bash
# System Information Script

echo "=============================="
echo "   Ì∂•Ô∏è  System Information"
echo "=============================="

# Hostname and OS
echo "Hostname: $(hostname)"
echo "OS: $(uname -s) $(uname -r)"

# Uptime
echo "Uptime: $(uptime -p)"

# CPU Info
echo "CPU: $(lscpu | grep 'Model name' | awk -F ':' '{print $2}' | xargs)"
echo "CPU Cores: $(nproc)"

# Memory Usage
echo "Memory Usage:"
free -h | grep Mem | awk '{print "  Used: " $3 " / " $2 "  (" $3/$2*100 "%)"}'

# Disk Usage
echo "Disk Usage:"
df -h --total | grep total | awk '{print "  Used: " $3 " / " $2 "  (" $5 ")"}'

# Network Info
echo "Network Info:"
ip -o -4 addr show | awk '{print "  " $2 ": " $4}'

echo "=============================="
