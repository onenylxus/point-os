#!/bin/bash
# Download packages and patches to source folder

pushd ~ > /dev/null

if [ "$LFS" != "/mnt/lfs" ]; then
  echo "Incorrect \$LFS variable"
  return
fi

sudo mkdir -pv $LFS/sources
sudo chmod -v a+wt $LFS/sources

sudo rm -f wget-list
sudo wget https://www.linuxfromscratch.org/lfs/view/stable/wget-list
sudo wget --input-file=wget-list --continue --directory-prefix=$LFS/sources

popd > /dev/null
