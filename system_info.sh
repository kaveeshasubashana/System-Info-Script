#!/bin/bash
# System Information Script with Menu & Colors

# Colors
GREEN="\033[0;32m"
BLUE="\033[0;34m"
RED="\033[0;31m"
YELLOW="\033[1;33m"
NC="\033[0m"  # No Color

# Function to display system info
show_system_info() {
    echo -e "${BLUE}==============================${NC}"
    echo -e "${GREEN}   🖥️  System Information${NC}"
    echo -e "${BLUE}==============================${NC}"

    # Hostname and OS
    echo -e "${YELLOW}Hostname:${NC} $(hostname)"
    echo -e "${YELLOW}OS:${NC} $(uname -s) $(uname -r)"

    # Uptime
    echo -e "${YELLOW}Uptime:${NC} $(uptime -p)"

    # CPU Info
    echo -e "${YELLOW}CPU:${NC} $(lscpu | grep 'Model name' | awk -F ':' '{print $2}' | xargs)"
    echo -e "${YELLOW}CPU Cores:${NC} $(nproc)"

    # Memory Usage
    echo -e "${YELLOW}Memory Usage:${NC}"
    free -h | grep Mem | awk '{print "  Used: " $3 " / " $2 "  (" $3/$2*100 "%)"}'

    # Disk Usage
    echo -e "${YELLOW}Disk Usage:${NC}"
    df -h --total | grep total | awk '{print "  Used: " $3 " / " $2 "  (" $5 ")"}'

    # Network Info
    echo -e "${YELLOW}Network Info:${NC}"
    ip -o -4 addr show | awk '{print "  " $2 ": " $4}'

    echo -e "${BLUE}==============================${NC}"
}

# Menu loop
while true; do
    clear
    echo -e "${BLUE}==============================${NC}"
    echo -e "${GREEN}   🖥️  System Info Menu${NC}"
    echo -e "${BLUE}==============================${NC}"
    echo "1. Hostname & OS"
    echo "2. Uptime"
    echo "3. CPU Info"
    echo "4. Memory Usage"
    echo "5. Disk Usage"
    echo "6. Network Info"
    echo "7. Show All"
    echo "0. Exit"
    echo -e "${BLUE}============================${NC}"

    read -p "Choose an option: " choice

    case $choice in
        1)
            echo -e "${YELLOW}Hostname & OS:${NC}"
            echo "Hostname: $(hostname)"
            echo "OS: $(uname -s) $(uname -r)"
            ;;
        2)
            echo -e "${YELLOW}Uptime:${NC} $(uptime -p)"
            ;;
        3)
            echo -e "${YELLOW}CPU Info:${NC}"
            echo "CPU: $(lscpu | grep 'Model name' | awk -F ':' '{print $2}' | xargs)"
            echo "CPU Cores: $(nproc)"
            ;;
        4)
            echo -e "${YELLOW}Memory Usage:${NC}"
            free -h | grep Mem | awk '{print "Used: " $3 " / " $2 "  (" $3/$2*100 "%)"}'
            ;;
        5)
            echo -e "${YELLOW}Disk Usage:${NC}"
            df -h --total | grep total | awk '{print "Used: " $3 " / " $2 "  (" $5 ")"}'
            ;;
        6)
            echo -e "${YELLOW}Network Info:${NC}"
            ip -o -4 addr show | awk '{print $2 ": " $4}'
            ;;
        7)
            show_system_info
            ;;
        0)
            echo -e "${RED}Exiting...${NC}"
            break
            ;;
        *)
            echo -e "${RED}Invalid option!${NC}"
            ;;
    esac

    echo -e "\nPress Enter to continue..."
    read
done
