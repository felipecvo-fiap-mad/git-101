#!/bin/bash

fail() {
  git checkout main
  echo "$1"
  exit 1
}

# Define the branch, file name, and expected contents
BRANCH="who-else"
FILE_NAME="sherlock.txt"
EXPECTED_CONTENTS="11 slovakia.md Jude Bellingham"

# Check out the who-else branch
echo "Checking out the $BRANCH branch..."
git checkout $BRANCH

if [ $? -ne 0 ]; then
  fail "Failed to checkout branch $BRANCH. Exiting."
fi

# Check if the sherlock.txt file exists
echo "Checking if $FILE_NAME exists..."
if [ -f "$FILE_NAME" ]; then
  echo "$FILE_NAME exists."
else
  fail "$FILE_NAME does not exist. Exiting."
fi

# Check the contents of the file
echo "Checking the contents of $FILE_NAME..."
ACTUAL_CONTENTS=$(cat "$FILE_NAME" | xargs)

if [ "$ACTUAL_CONTENTS" = "$EXPECTED_CONTENTS" ]; then
  echo "$FILE_NAME contains the correct contents."
else
  echo "$FILE_NAME does not contain the correct contents."
  echo "Expected contents:"
  echo -e "$EXPECTED_CONTENTS"
  echo "Actual contents:"
  echo -e "$ACTUAL_CONTENTS"
  fail
fi

echo "Task 3 validation completed successfully."

exit 0
