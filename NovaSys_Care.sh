#!/bin/bash
clear

CYAN='\033[0;36m'
GRAY='\033[0;37m'
DGRAY='\033[1;30m'
NC='\033[0m'

while true; do
    clear
    echo -e "${CYAN}+---------------------------------------+"
    echo " |           NOVASYS_CARE UTILITY        |"
    echo -e "+---------------------------------------+${NC}"
    echo "  1) Deep Junk Cleaner"
    echo "  2) Flush Network Cache"
    echo "  3) System Diagnostic Audit"
    echo "  4) Exit Utility"
    echo "---------------------------------------"
    echo -e "${GRAY}  +---------------------------------------+${NC}"
    echo -e "${DGRAY}   Made with ❤️ by Nova Studios.${NC}"
    echo -e "${GRAY}  +---------------------------------------+${NC}"
    echo
    read -p " Select Option [1-4]: " choice
    
    case $choice in
        1)
            clear
            echo "+---------------------------------------+"
            echo " |          DEEP JUNK CLEANER            |"
            echo "+---------------------------------------+"
            echo "  [!] Clearing user local application caches..."
            rm -rf ~/.cache/* >/dev/null 2>&1
            echo "  [^+] Cache footprints wiped."
            echo "  [!] Sweeping temporary system log dumps..."
            rm -rf /tmp/* >/dev/null 2>&1
            echo "  [^+] System temporary files swept."
            echo "---------------------------------------"
            echo "  Optimization Complete!"
            echo "---------------------------------------"
            read -p " Press Enter to continue..."
            ;;
        2)
            clear
            echo "+---------------------------------------+"
            echo " |         FLUSH NETWORK CACHE           |"
            echo "+---------------------------------------+"
            echo "  [!] Flushing system systemd-resolved DNS cache..."
            if command -v systemd-resolve &>/dev/null; then
                sudo systemd-resolve --flush-caches >/dev/null 2>&1
            elif command -v resolvectl &>/dev/null; then
                sudo resolvectl flush-caches >/dev/null 2>&1
            fi
            echo "  [^+] Local DNS resolve frames cleared safely."
            echo "---------------------------------------"
            read -p " Press Enter to continue..."
            ;;
        3)
            clear
            echo "+---------------------------------------+"
            echo " |       SYSTEM DIAGNOSTIC AUDIT         |"
            echo "+---------------------------------------+"
            echo "  Current Host Profile: $USER"
            echo "  Kernel Architecture:  $(uname -r)"
            echo "  Machine Hostname:     $(hostname)"
            echo "---------------------------------------"
            echo "  Active Network Interfaces IP Configuration:"
            echo
            ip -4 addr show | grep -E "inet|valid_lft"
            echo "---------------------------------------"
            read -p " Press Enter to continue..."
            ;;
        4)
            clear
            exit 0
            ;;
    esac
done
