#!/bin/bash

# Define variables
BRANCH="main"
NEW_FILE="melhor-curso.md"
EDITED_FILE="melhor-disciplina.md"

# Check out the systeminfo branch
echo "Checking out the $BRANCH branch..."
git checkout $BRANCH

# Start logging
echo "Starting validation for Task 1..."

# Verify if the new file exists
if [ -f "$NEW_FILE" ]; then
    echo "The file $NEW_FILE has been created successfully."
else
    echo "Error: The file $NEW_FILE was not found."
    exit 1
fi

# Verify if the edited file exists
if [ -f "$EDITED_FILE" ]; then
    echo "The file $EDITED_FILE exists."
else
    echo "Error: The file $EDITED_FILE was not found."
    exit 1
fi

# Check for the latest commit message
LATEST_COMMIT_MESSAGE=$(git log -1 --pretty=%B)
echo "Latest commit message: $LATEST_COMMIT_MESSAGE"

# Check if the latest commit includes both new file creation and file editing
if git diff-tree --no-commit-id --name-only -r $(git rev-parse HEAD) | grep -q "$NEW_FILE"; then
    echo "The commit includes the creation of $NEW_FILE."
else
    echo "Error: The commit does not include the creation of $NEW_FILE."
    exit 1
fi

if git diff-tree --no-commit-id --name-only -r $(git rev-parse HEAD) | grep -q "$EDITED_FILE"; then
    echo "The commit includes the editing of $EDITED_FILE."
else
    echo "Error: The commit does not include the editing of $EDITED_FILE."
    exit 1
fi

echo "Validation for Task 1 completed successfully."
