#!/bin/bash

# Define file names and branch
BATCH_FILE="get_system_info.bat"
SYSTEMINFO_FILE="systeminfo.txt"
EXECUTION_LOG="execution.log"
BRANCH="systeminfo"

# Fetch the latest changes from the remote repository
echo "Fetching the latest changes from the remote repository..."
git fetch origin

# Check out the systeminfo branch
echo "Checking out the $BRANCH branch..."
git checkout $BRANCH

if [ $? -ne 0 ]; then
  echo "Failed to checkout branch $BRANCH. Exiting."
  exit 1
fi

# Check if the systeminfo.txt file exists
echo "Checking if $SYSTEMINFO_FILE exists..."
if [ -f "$SYSTEMINFO_FILE" ]; then
  echo "$SYSTEMINFO_FILE exists."
else
  echo "$SYSTEMINFO_FILE does not exist. Exiting."
  exit 1
fi

# Verify that systeminfo.txt is added to the repository
echo "Checking if $SYSTEMINFO_FILE is added to the repository..."
if git ls-files --error-unmatch "$SYSTEMINFO_FILE" > /dev/null; then
  echo "$SYSTEMINFO_FILE is added to the repository."
else
  echo "$SYSTEMINFO_FILE is not added to the repository. Exiting."
  exit 1
fi

# Check if execution.log is ignored and not committed
echo "Checking if $EXECUTION_LOG is ignored and not committed..."
if git ls-files --error-unmatch "$EXECUTION_LOG" > /dev/null 2>&1; then
  echo "$EXECUTION_LOG is tracked by Git. Exiting."
  exit 1
else
  echo "$EXECUTION_LOG is not tracked by Git."
fi

# Check if execution.log is in .gitignore
echo "Checking if $EXECUTION_LOG is listed in .gitignore..."
if grep -q "$EXECUTION_LOG" .gitignore; then
  echo "$EXECUTION_LOG is listed in .gitignore."
else
  echo "$EXECUTION_LOG is not listed in .gitignore."
  exit 1
fi

git checkout main

echo "Task 2 validation completed successfully."

exit 0
