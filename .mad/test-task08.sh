#!/bin/bash

# Define the branch names
BRANCH_FEATURE="feature"
BRANCH_MAIN="main"

# Check out the feature branch
echo "Checking out the $BRANCH_FEATURE branch..."
git checkout $BRANCH_FEATURE

if [ $? -ne 0 ]; then
  echo "Failed to checkout branch $BRANCH_FEATURE. Exiting."
  exit 1
fi

# Check if feature branch matches main branch
echo "Checking if $BRANCH_FEATURE branch matches $BRANCH_MAIN branch..."

# Compare the branches
if git diff --quiet $BRANCH_FEATURE origin/$BRANCH_MAIN; then
  echo "$BRANCH_FEATURE branch matches $BRANCH_MAIN branch."
else
  echo "$BRANCH_FEATURE branch does not match $BRANCH_MAIN branch."
  exit 1
fi

git checkout main

echo "Task 8 validation completed successfully."

exit 0
