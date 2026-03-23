#!/bin/bash
# Script 4: Log File Analyzer
# Author: Ekjot Singh
# Usage: ./04_log_analyzer.sh /var/log/syslog error
# Description: Reads a log file, counts keyword occurrences, and prints a summary.
# Concepts used: while-read loop, if-then, command-line args, do-while retry, tail+grep.

# Command-line arguments with defaults
LOGFILE=${1:-"/var/log/syslog"}
KEYWORD=${2:-"error"}
COUNT=0

# Do-while style retry if the file is missing or empty (-s checks if size > 0)
while [ ! -s "$LOGFILE" ]; do
    echo "Error: File $LOGFILE is missing or empty."
    read -p "Please enter a valid log file path to analyze: " LOGFILE
done

echo "Scanning $LOGFILE for the keyword: '$KEYWORD'..."

# Read the file line by line safely handling whitespace
while IFS= read -r LINE; do
    # Check if the line contains the keyword (case-insensitive)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo "--------------------------------------------------"
echo "Keyword '$KEYWORD' found $COUNT times in $LOGFILE"
echo "--------------------------------------------------"

# Print the last 5 matching lines using tail + grep if matches were found
if [ "$COUNT" -gt 0 ]; then
    echo "Displaying the last 5 occurrences:"
    grep -i "$KEYWORD" "$LOGFILE" | tail -n 5
fi