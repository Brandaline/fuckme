#!/bin/bash

# Ensure a log file is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <firewall_log_file>"
    exit 1
fi
log_file=$1
########################################################################
# Here you want to check if the log file exists
if [ ! -f "$log_file" ]; then
    echo "Error: No log file was found."
    exit 1
fi

########################################################################

# Task 2: Identify Denied Access Attempts
# by searching for the key word DENY. Make sure you look at the log file provided
# to create a pipline that will display. Use filters to count the DENY attempts
# and sort them by numerical value and list them in a descending order
echo "Denied Access Attempts:"
awk '$2 == "DENY" {print $3}' "$log_file" | sort | uniq -c | sort -rn | cat -n

#########################################################################
# Task 3: Flag Frequent Access Attempts 
# by searching for the key word DENY then sort the attempts, find the unique attempts and 
# count them. Finally sort the attempts by numerical value and list them in discending order
# if they are above 5
echo "Frequent Access Attempts (more than 5 attempts):"
awk '$2 == "DENY" {print $3}' "$log_file" | sort | uniq -c | awk '$1 > 5 {print $2}' | cat -n

#########################################################################
# Task 4: Detect Known Malicious Signatures
# Assuming known malicious IPs are 10.10.10.10 and 10.10.10.20 for demonstration
echo "Detected Known Malicious Signatures:"
grep -E '10\.10\.10\.(10|20)' "$log_file"

#########################################################################
# Task 5: Summary Report
# create a variable called total_attempts that stores the  number of the attempts 
# create a variable called unique_denied_ips that stores the number of denied attempts
total_attempts=$(wc -l < "$log_file")
unique_denied_ips=$(sed -n '/DENY/ s/.* \([0-9]*\).*/\1/p' "$log_file" | sort -u | wc -l)

#########################################################################
# Print the summary report of the total and the denied attemps
echo "Summary Report:"
echo "Total Attempts: $total_attempts"
echo "Denied Attempts: $unique_denied_ips"