#!/bin/bash

# Define variables
BRANCH="main"
NEW_FILE="new_file.txt"
EDITED_FILE="existing_file.txt"
LOG_FILE="validation.log"

# Start logging
echo "Starting validation for Task 1..." > $LOG_FILE

# Check out to the main branch
echo "Checking out to branch $BRANCH..." >> $LOG_FILE
git checkout $BRANCH >> $LOG_FILE 2>&1

# Verify if the new file exists
if [ -f "$NEW_FILE" ]; then
    echo "The file $NEW_FILE has been created successfully." >> $LOG_FILE
else
    echo "Error: The file $NEW_FILE was not found." >> $LOG_FILE
    exit 1
fi

# Verify if the edited file exists
if [ -f "$EDITED_FILE" ]; then
    echo "The file $EDITED_FILE exists." >> $LOG_FILE
else
    echo "Error: The file $EDITED_FILE was not found." >> $LOG_FILE
    exit 1
fi

# Check for the latest commit message
LATEST_COMMIT_MESSAGE=$(git log -1 --pretty=%B)
echo "Latest commit message: $LATEST_COMMIT_MESSAGE" >> $LOG_FILE

# Check if the latest commit includes both new file creation and file editing
if git log -1 --pretty=%B | grep -q "Created $NEW_FILE"; then
    echo "The commit includes the creation of $NEW_FILE." >> $LOG_FILE
else
    echo "Error: The commit does not include the creation of $NEW_FILE." >> $LOG_FILE
    exit 1
fi

if git log -1 --pretty=%B | grep -q "Edited $EDITED_FILE"; then
    echo "The commit includes the editing of $EDITED_FILE." >> $LOG_FILE
else
    echo "Error: The commit does not include the editing of $EDITED_FILE." >> $LOG_FILE
    exit 1
fi

echo "Validation for Task 1 completed successfully." >> $LOG_FILE
