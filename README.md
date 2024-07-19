Name : Harsh Kanojia

Company Name : CODTECH IT SOLUTIONS

ID : CT4CSEH3610

Domain : Cyber Security and Ethical Hacking

Duration : JULY 1st,2024 to AUGUST 1st, 2024

Mentor : SANTHOSH

IP Vulnerability Scanner
ip_vulnerability_scanner.sh is a Bash script that scans IP addresses for vulnerabilities using nmap, retrieves WHOIS data, and performs NSLOOKUP. It identifies open ports and common vulnerabilities, providing detailed results for each IP address.

Features
Scans IP addresses for open ports and service versions using nmap
Analyzes scan results to identify potential vulnerabilities
Retrieves WHOIS information for each IP address
Performs NSLOOKUP to get DNS information
Outputs detailed results for each IP address
Prerequisites
Make sure you have the following tools installed on your system:

nmap
whois
nslookup (part of dnsutils package on Debian-based systems)
You can install them using:

sudo apt-get install nmap whois dnsutils

Installation
Clone the repository or download the script directly:

git clone https://github.com/yourusername/ip_vulnerability_scanner.git
cd ip_vulnerability_scanner

Make the script executable:
chmod +x ip_vulnerability_scanner.sh

Usage
Run the script with IP addresses as arguments:

./ip_vulnerability_scanner.sh <IP1> <IP2> ...

Example

./ip_vulnerability_scanner.sh 192.168.1.1 192.168.1.2

