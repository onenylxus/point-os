#!/bin/bash
# Check $LFS variable

if [ -z "$LFS" ]; then
  echo -e "\$LFS variable not set"
else
  echo -e "\$LFS variable = $LFS"
  if [ "$LFS" != "/mnt/lfs" ]; then
    echo "Incorrect \$LFS variable"
  fi
fi
