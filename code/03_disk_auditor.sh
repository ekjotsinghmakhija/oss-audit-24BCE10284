#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Ekjot Singh
# Description: Loops through system directories and reports space and permissions.
# Concepts used: for loop, df/du, ls -ld, awk/cut.

# Array containing a list of important system directories
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "Directory Audit Report"
echo "--------------------------------------------------"

# Loop through each directory in the array
for DIR in "${DIRS[@]}"; do
    # Check if the directory actually exists
    if [ -d "$DIR" ]; then
        # Extract permissions, user, and group using awk
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        # Get human-readable disk usage and extract just the size with cut
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        
        echo "$DIR => Permissions/Owner: $PERMS | Size: $SIZE"
    else
        echo "$DIR does not exist on this system"
    fi
done

echo "--------------------------------------------------"
echo "Checking specific $SOFTWARE_CHOICE footprint..."

# Check if Git's global configuration file or core directory exists
GIT_CONFIG="/etc/gitconfig"
if [ -f "$GIT_CONFIG" ]; then
    GIT_PERMS=$(ls -ld "$GIT_CONFIG" | awk '{print $1, $3, $4}')
    echo "$GIT_CONFIG => Permissions/Owner: $GIT_PERMS"
else
    echo "Global Git config ($GIT_CONFIG) not found."
fi