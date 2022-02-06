#!/bin/bash
# Mount new partition

if [ "$LFS" != "/mnt/lfs" ]; then
  echo "Incorrect \$LFS variable"
  return
fi

cwd=$PWD
echo "$cwd"
cd
read -p "Enter the name of the new partition:" answer
if [ -z "$answer" ]; then
  echo "Action cancelled"
else
  sudo mkdir -pv $LFS
  sudo mount -v -t ext4 $answer $LFS
fi
cd $cwd
