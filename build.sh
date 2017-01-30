#!/bin/bash -e

# LESS compiler
LESSC=lessc

# Source and destination files
SOURCE=src/slack-solarized-dark.less
OUTPUT=dist/slack-solarized-dark-userstyle.css

# Check for lessc
type -P $LESSC &>/dev/null || { echo "$LESSC not found. Install lessc before running $0."; exit 1; }

# Add @-moz-document prefix
echo '@-moz-document domain("slack.com") {' > $OUTPUT

# Compile less source file
$LESSC $SOURCE >> $OUTPUT

# Close @-moz-document rule
echo '}' >> $OUTPUT

echo -e "User style export file \"$OUTPUT\" created succesfully."
