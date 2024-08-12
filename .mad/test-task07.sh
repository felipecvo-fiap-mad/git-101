#!/bin/bash

# Define the branch names and file name
BRANCH_SOURCE="chapter3"
BRANCH_TARGET="chapter4"
FILE_NAME="chapter3.md"

# Check out the target branch
echo "Checking out the $BRANCH_TARGET branch..."
git checkout $BRANCH_TARGET

if [ $? -ne 0 ]; then
  echo "Failed to checkout branch $BRANCH_TARGET. Exiting."
  exit 1
fi

# Check if the file exists in the current branch
echo "Checking if the file $FILE_NAME exists in the $BRANCH_TARGET branch..."
if [ -f "$FILE_NAME" ]; then
  echo "File $FILE_NAME exists in the $BRANCH_TARGET branch."
else
  echo "File $FILE_NAME does not exist in the $BRANCH_TARGET branch."
  exit 1
fi

# Check if the file matches the file from the source branch
echo "Comparing $FILE_NAME with the file from $BRANCH_SOURCE branch..."

# Checkout the source branch temporarily
git checkout $BRANCH_SOURCE

if [ $? -ne 0 ]; then
  echo "Failed to checkout branch $BRANCH_SOURCE. Exiting."
  exit 1
fi

# Fetch the file from the source branch
cp "$FILE_NAME" "/tmp/$FILE_NAME"

# Return to the target branch
git checkout $BRANCH_TARGET

# Compare the files
if cmp -s "$FILE_NAME" "/tmp/$FILE_NAME"; then
  echo "The file $FILE_NAME in the $BRANCH_TARGET branch matches the file from $BRANCH_SOURCE branch."
else
  echo "The file $FILE_NAME in the $BRANCH_TARGET branch does not match the file from $BRANCH_SOURCE branch."
  exit 1
fi

# Clean up temporary file
rm "/tmp/$FILE_NAME"

git checkout main

echo "Task 7 validation completed successfully."

exit 0
