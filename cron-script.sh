#!/bin/bash

# URL to ping
URL="https://mpl-be-p5xf.onrender.com/ping"
URL1="https://mpl-treasurehunt-be.onrender.com/ping"
# Get current date and time
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Ping the URL and capture the response
RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" $URL)
RESPONSE1=$(curl -s -o /dev/null -w "%{http_code}" $URL1)

# Log the result
if [ $RESPONSE -eq 200 ]; then
    echo "$TIMESTAMP - Successfully pinged $URL (HTTP $RESPONSE)"
else
    echo "$TIMESTAMP - Failed to ping $URL (HTTP $RESPONSE)"
fi

# Log the result
if [ $RESPONSE1 -eq 200 ]; then
    echo "$TIMESTAMP - Successfully pinged $URL1 (HTTP $RESPONSE1)"
else
    echo "$TIMESTAMP - Failed to ping $URL1 (HTTP $RESPONSE1)"
fi