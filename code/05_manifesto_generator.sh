#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: Ekjot Singh
# Description: Generates a personalized open source manifesto via user input.
# Concepts used: read, string concatenation, redirection (>, >>), date, aliases comment.

echo "Answer three questions to generate your manifesto."
echo "--------------------------------------------------"

# Interactively read user input
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

# Command substitution for current date
DATE=$(date '+%d %B %Y')
OUTPUT="manifesto_$(whoami).txt"

echo "--------------------------------------------------"
echo "Composing manifesto..."

# Write the header to the file (overwrites if exists using >)
echo "=== My Open Source Manifesto ===" > "$OUTPUT"
echo "Author: $(whoami)" >> "$OUTPUT"
echo "Date: $DATE" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# Append the composed paragraph to the file using >>
#
# Concept Demonstration - Aliases:
# In Linux, an alias maps a long command to a short custom string (e.g., alias ll='ls -la').
# Similarly, the open-source philosophy serves as an "alias" for collective human progress.
#
echo "I believe that software should empower rather than restrict. The tool I rely on daily, $TOOL, represents this philosophy perfectly. To me, open source is synonymous with $FREEDOM. It ensures that code remains a public good, not a locked box. Standing on the shoulders of the community, I pledge to take these principles and build a $BUILD, sharing it freely with the world so others may learn from my code just as I have learned from theirs." >> "$OUTPUT"

echo "Manifesto saved to $OUTPUT"
echo "--------------------------------------------------"
# Display the final output
cat "$OUTPUT"