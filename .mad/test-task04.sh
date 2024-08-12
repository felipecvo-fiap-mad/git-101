#!/bin/bash

# Define branch names
BRANCH_TARGET="book"
BRANCH_MERGED="chapter1"

# Check out the target branch
echo "Checking out the $BRANCH_TARGET branch..."
git checkout $BRANCH_TARGET

if [ $? -ne 0 ]; then
  echo "Failed to checkout branch $BRANCH_TARGET. Exiting."
  exit 1
fi

# Check if the merge commit is present
echo "Checking if the merge from $BRANCH_MERGED is present..."
if git log --oneline | grep -q "Merge .*branch '.*$BRANCH_MERGED' into book"; then
  echo "Merge commit from $BRANCH_MERGED is present."
else
  echo "Merge commit from $BRANCH_MERGED is not present. Exiting."
  exit 1
fi

# Check if the changes from the merged branch are present
echo "Checking if changes from $BRANCH_MERGED are present in $BRANCH_TARGET..."
if [ -z "$(git diff --name-only origin/$BRANCH_MERGED..$BRANCH_TARGET)" ]; then
  echo "Changes from $BRANCH_MERGED are present in $BRANCH_TARGET."
else
  echo "No changes from $BRANCH_MERGED are present in $BRANCH_TARGET. Exiting."
  exit 1
fi

git checkout main

echo "Task 5 validation completed successfully."

exit 0

