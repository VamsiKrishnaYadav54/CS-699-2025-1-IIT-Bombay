# README

This folder has 4 shell scripts I wrote for solving some daily life(system related) problems. 
Below I explain the story/problem statement, input/output, how to run each script, and a brief explanation of what the script actually does internally.

---

## Script 1: Website Availability Checker 

Story / Problem Statement: 
Many times I wanted to check if a website is down or it’s just my network acting up. Instead of opening the browser and refreshing mant times, I decided to make a simple script that directly asks the site and tells me if it’s UP or DOWN using the HTTP status code. 

Input: 
- Website URL (like https://google.com) 

Output: 
- A neat message saying if the website is UP or DOWN along with the status code. 

Execution: 
>> ./script1.sh https://example.com

Explanation: 
This script uses `curl` with the `-s` and `-w` options to send a silent request and extract only the HTTP status code. Then it checks if the status code is between 200–399 (success or redirection). If yes -> it prints UP, else -> it prints DOWN.

---



## Script 2: Disk Usage Analyzer 

Story / Problem Statement: 
One day my laptop started showing “low disk space” warning. I didn’t know which files were consuming so much storage. Instead of manually opening folders, I wrote this script to analyze any directory, show me big files, top 5 largest files, and give a summary (total files, dirs, avg file size). 

Input: 
- A directory path (like ~/Downloads) 

Output: 
- A file named disk_report.txt with details about: 
  - Files larger than 5 MB 
  - Top 5 largest files 
  - Summary stats (total files, directories, avg file size) 

Execution: 
>> ./script2.sh ~/Downloads

Explanation: 
This script uses the `find` command to locate large files and `ls -lh` to print their sizes. It also uses `du -h` to find the biggest files. Then it calculates the total number of files, directories, and the average size using `stat` and `awk`. All results are saved neatly into a `disk_report.txt` file.

---



## Script 3: Process Monitor

Story / Problem Statement: 
Sometimes my laptop fan goes crazy and I don’t know which app is eating up all the RAM. So I made this script that shows the top 5 memory-hungry processes (like Chrome, VS Code, etc.) in a clean table format. Now instead of guessing, I just run it and kill the heavy ones if needed. 

Input: 
- No input needed. 

Output: 
- A table showing PID, user, %MEM, and command of top 5 processes. 

Execution: 
>> ./script3.sh

Explanation: 
This script runs `ps -eo` to get a list of all processes with their PID, user, memory usage, and command. It sorts them by memory consumption (`--sort=-%mem`), takes the top 5 using `head` and `tail`, and prints them as a formatted table.

---



## Script 4: User & Login Summary

Story / Problem Statement: 
Back in lab computers, sometimes multiple people were logged in, and I wanted to see who’s on the system and also check the last few logins. This script shows me how many users are logged in right now, their session counts, and last 5 login attempts. Helpful for system admins. 

Input: 
- No input needed. 

Output: 
- Number of logged-in users 
- Session count for each user 
- Last 5 login attempts 

Execution: 
>> ./script4.sh

Explanation: 
This script uses `who` to find currently logged-in users and `awk` + `sort` + `uniq` to count their sessions. It also runs `last` to print the 5 most recent login attempts. The result is a quick snapshot of user activity on the system.

---

# Notes
- None of these scripts require any input files. 
- Just make them executable using: 
  chmod +x scriptname.sh 
  and then run as shown above. 

---



