#!/bin/bash

# Script metadata
TOOL_VERSION="3.0"
TOOL_NAME="Vaijan"
OWNER_NAME="Ab Talha"
OWNER_DESCRIPTION="My Name Is Ab Talha, I am a CTF Player And Bug bounty hunter, Script Writer"
OWNER_GITHUB="https://github.com/abtalha"

# Display script information
echo "###############################################"
echo "# Tool Name: $TOOL_NAME"
echo "# Version: $TOOL_VERSION"
echo "# Owner: $OWNER_NAME"
echo "# Description: $OWNER_DESCRIPTION"
echo "# GitHub: $OWNER_GITHUB"
echo "# Happy Hunting My Wolf 🐺"
echo "###############################################"

# Function to show a spinner
show_spinner() {
    local PID=$1
    local delay=0.1
    local spinstr='|/-\'
    echo -n " "
    while [ "$(ps a | awk '{print $1}' | grep $PID)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

# Function to run a command with a spinner
run_with_spinner() {
    local CMD=$1
    echo "[*] $CMD"
    $CMD &
    local PID=$!
    show_spinner $PID
    wait $PID
    return $?
}

# Update and upgrade the system
run_with_spinner "sudo apt-get update -y && sudo apt-get upgrade -y"

# Install common tools
run_with_spinner "sudo apt-get install -y git wget curl build-essential"

# Enumeration tools
run_with_spinner "sudo apt-get install -y nmap netcat nikto dnsenum gobuster dirb feroxbuster"

# Forensic tools
run_with_spinner "sudo apt-get install -y sleuthkit autopsy foremost binwalk"

# Reverse engineering tools
run_with_spinner "sudo apt-get install -y radare2 gdb objdump"

# Cryptography tools
run_with_spinner "sudo apt-get install -y john hashcat gpg"

# Steganography tools
run_with_spinner "sudo apt-get install -y steghide zsteg exiftool"

# Additional hacking tools
run_with_spinner "sudo apt-get install -y aircrack-ng hydra metasploit-framework sqlmap wfuzz"

# Install Python and related tools
run_with_spinner "sudo apt-get install -y python3 python3-pip"
run_with_spinner "pip3 install pwntools"

# Install dirsearch
run_with_spinner "sudo apt-get install -y dirsearch"

# Install SecLists
run_with_spinner "sudo apt-get install -y seclists"

# Install wordlists (separate from SecLists if needed)
run_with_spinner "sudo apt-get install -y wordlists"

# Install feroxbuster
run_with_spinner "sudo apt-get install -y feroxbuster"

echo "[*] Installation of all tools completed!"
echo "[*] Happy Hunting My Wolf 🐺"
