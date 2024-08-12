#!/bin/bash

fail() {
  git checkout main
  echo "$1"
  exit 1
}

# Define the branch and commit hash to revert
BRANCH="daring"
COMMIT_HASH="c8e5661"

# Check out the branch
echo "Checking out the $BRANCH branch..."
git checkout $BRANCH

if [ $? -ne 0 ]; then
  fail "Failed to checkout branch $BRANCH. Exiting."
fi

# Check if the commit has been reverted
echo "Checking if commit $COMMIT_HASH has been reverted..."

# Check the git log to see if the commit is no longer present
if git log --grep="^Revert" | grep -q "$COMMIT_HASH"; then
  echo "The commit $COMMIT_HASH has been successfully reverted."
else
  fail "The commit $COMMIT_HASH is still present. Exiting."
fi

echo "Task 6 validation completed successfully."

exit 0
