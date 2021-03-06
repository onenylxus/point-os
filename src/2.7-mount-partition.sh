#!/bin/bash
# Mount new partition

pushd ~ > /dev/null

if [ "$LFS" != "/mnt/lfs" ]; then
  echo "Incorrect \$LFS variable"
  return
fi

read -p "Enter the name of the new partition:" answer
if [ -z "$answer" ]; then
  echo "Action cancelled"
else
  sudo mkdir -pv $LFS
  sudo mount -v -t ext4 $answer $LFS
fi

popd > /dev/null
