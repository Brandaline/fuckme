+ '[' 1 -ne 1 ']'
+ log_file=log_file_permissions.log
+ '[' '!' -f log_file_permissions.log ']'
+ echo 'Denied Access Attempts:'
Denied Access Attempts:
+ uniq -c
+ sort -rn
+ sort
+ cat -n
+ awk '$2 == "DENY" {print $3}' log_file_permissions.log
+ echo 'Frequent Access Attempts (more than 5 attempts):'
Frequent Access Attempts (more than 5 attempts):
+ cat -n
+ awk '$1 > 5 {print $2}'
+ uniq -c
+ sort
+ awk '$2 == "DENY" {print $3}' log_file_permissions.log
+ echo 'Detected Known Malicious Signatures:'
Detected Known Malicious Signatures:
+ grep -E '10\.10\.10\.(10|20)' log_file_permissions.log
[2023-02-15 14:12:47] DENY 10.10.10.10 -> 10.20.30.60 SSH
[2023-02-15 14:31:43] DENY 10.10.10.20 -> 10.20.30.210 SSH
++ wc -l
+ total_attempts=28
++ wc -l
++ sort -u
++ sed -n '/DENY/ s/.* \([0-9]*\).*/\1/p' log_file_permissions.log
+ unique_denied_ips=1
+ echo 'Summary Report:'
Summary Report:
+ echo 'Total Attempts: 28'
Total Attempts: 28
+ echo 'Denied Attempts: 1'
Denied Attempts: 1
