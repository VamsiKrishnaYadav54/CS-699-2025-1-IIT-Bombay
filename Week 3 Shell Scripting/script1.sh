#!/bin/bash

# If no argument is given, ask interactively
if [ -z "$1" ]; then
  echo "==========================================================================="
  echo -n "Please provide website link as input: "
  read URL
else
  URL=$1
fi

# Send a HEAD request and capture the HTTP status code
STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

# Check if the status code indicates success or redirection
if [[ "$STATUS_CODE" -ge 200 && "$STATUS_CODE" -lt 400 ]]; then
  echo "==========================================================================="
  echo " ✅ The website '$URL' is UP (Status Code: $STATUS_CODE) "
  echo "==========================================================================="
else
  echo "==========================================================================="
  echo "❌ The website '$URL' is DOWN or unreachable (Status Code: $STATUS_CODE)"
  echo "==========================================================================="
fi


