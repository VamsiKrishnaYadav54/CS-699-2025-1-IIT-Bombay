#!/bin/bash
# User & login summary

echo "====================================="
echo " Active User & Login Summary"
echo "====================================="

# 1. Number of logged-in users
user_count=$(who | awk '{print $1}' | sort | uniq | wc -l)
echo "Currently logged in users: $user_count"

# 2. List users and session count
echo "-------------------------------------"
echo "User session counts:"
who | awk '{print $1}' | sort | uniq -c | awk '{print $2 " -> " $1 " sessions"}'

# 3. Last 5 login attempts
echo "-------------------------------------"
echo "Last 5 login attempts:"
last -n 5 | head -n 5

