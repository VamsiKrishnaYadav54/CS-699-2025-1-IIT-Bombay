#!/bin/bash

# Disk Usage Analyzer Script

# Check if directory is provided
#if [[ -z "$1" ]]; then
#  echo "Usage: $0 <directory>"
# exit 1
#fi

if [ -z "$1" ]; then
  echo "==========================================================================="
  echo -n "Please provide directory path as input: "
  read target_dir
  target_dir=$(eval echo "$target_dir")   # expand ~ into full path
else
  target_dir=$1
fi

#target_dir=$1

if [[ ! -d "$target_dir" ]]; then
    echo "Error: $target_dir is not a valid directory."
    exit 1
fi

report_file="disk_report.txt"

echo "Analyzing directory: $target_dir"
echo "Report will be saved to $report_file"
echo "======================================================"

# 1. List files larger than 5MB
echo "Files larger than 5 MB:" > "$report_file"
find "$target_dir" -type f -size +5M -exec ls -lh {} \; | awk '{print $9, $5}' >> "$report_file"
echo "" >> "$report_file"

# 2. Top 5 largest files
echo "Top 5 Largest Files:" >> "$report_file"
find "$target_dir" -type f -exec du -h {} + | sort -hr | head -n 5 >> "$report_file"
echo "" >> "$report_file"

# 3. Summary statistics
total_files=$(find "$target_dir" -type f | wc -l)
total_dirs=$(find "$target_dir" -type d | wc -l)
total_size=$(find "$target_dir" -type f -exec stat -c%s {} + | awk '{sum+=$1} END {print sum}')
avg_size=0
if [[ $total_files -gt 0 ]]; then
    avg_size=$((total_size / total_files))
fi

echo "Summary:" >> "$report_file"
echo "Total Files: $total_files" >> "$report_file"
echo "Total Directories: $total_dirs" >> "$report_file"
echo "Average File Size: $avg_size bytes" >> "$report_file"

echo "Done, Report saved in $report_file"

