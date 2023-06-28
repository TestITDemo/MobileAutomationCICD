#!/bin/sh

echo "validate_result.sh started."

cd results

# Check if the result.txt file exists
if [ ! -f "result.txt" ]; then
  echo "result.txt not found."
  exit 1
fi

# Check for the presence of FAIL in the result.txt file
if grep -q "FAIL" result.txt; then
  echo "FAIL found, app not ready for release."
  exit 1
else
  echo "No FAIL found, app ready for release."
fi

exit 0
