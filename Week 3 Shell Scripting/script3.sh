#!/bin/bash
# Show top 5 memory-consuming processes

echo "====================================="
echo " Top 5 Memory-Consuming Processes"
echo "====================================="
echo -e "PID\tUSER\t%MEM\tCOMMAND"
echo "-------------------------------------"

# ps output, sorted by memory, top 5
ps -eo pid,user,%mem,comm --sort=-%mem | head -n 6 | tail -n 5

