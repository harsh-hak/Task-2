#!/bin/bash

# Function to perform nmap scan
scan_ip() {
    local ip_address=$1
    nmap -sV $ip_address
}

# Function to analyze nmap results
analyze_results() {
    local scan_data=$1
    vulnerabilities=()
    while IFS= read -r line; do
        if echo "$line" | grep -q "open"; then
            service=$(echo "$line" | awk '{print $3}')
            version=$(echo "$line" | awk '{print $4}')
            if [[ $service == "Apache" && $version == 2.4* ]]; then
                vulnerabilities+=("Apache 2.4.x on port $(echo "$line" | awk '{print $1}') may be vulnerable to certain attacks.")
            fi
        fi
    done <<< "$(echo "$scan_data" | grep '/tcp')"
    echo "${vulnerabilities[@]}"
}

# Function to perform WHOIS lookup
get_whois_info() {
    local ip_address=$1
    whois $ip_address
}

# Function to perform NSLOOKUP
get_nslookup_info() {
    local ip_address=$1
    nslookup $ip_address | awk '/name =/ {print $4}'
}

# Main function to scan a list of IP addresses
main() {
    local ip_list=("$@")
    for ip in "${ip_list[@]}"; do
        echo "Scanning IP: $ip"
        scan_data=$(scan_ip $ip)
        vulnerabilities=$(analyze_results "$scan_data")
        whois_info=$(get_whois_info $ip)
        nslookup_info=$(get_nslookup_info $ip)

        echo "Results for IP: $ip"
        echo "Status: $(if [ -z "$vulnerabilities" ]; then echo "No vulnerabilities found"; else echo "Vulnerabilities found"; fi)"
        echo "Vulnerabilities: $vulnerabilities"
        echo "WHOIS Info:"
        echo "$whois_info"
        echo "NSLOOKUP Info: $nslookup_info"
        echo "------------------------"
    done
}

# Entry point
if [ $# -eq 0 ]; then
    echo "Usage: $0 <IP1> <IP2> ..."
    exit 1
fi

main "$@"
