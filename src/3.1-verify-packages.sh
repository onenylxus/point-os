#!/bin/bash
# Verify packages and patches in source folder

pushd ~ > /dev/null

if [ "$LFS" != "/mnt/lfs" ]; then
  echo "Incorrect \$LFS variable"
  return
fi

pushd $LFS/sources > /dev/null
  sudo rm -f md5sums
  sudo wget https://www.linuxfromscratch.org/lfs/view/stable/md5sums
  sudo md5sum -c md5sums
popd > /dev/null

popd > /dev/null
