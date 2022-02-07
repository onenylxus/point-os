#!/bin/bash
# Create limited directory layout

pushd ~ > /dev/null

if [ "$LFS" != "/mnt/lfs" ]; then
  echo "Incorrect \$LFS variable"
  return
fi

sudo mkdir -pv $LFS/{etc,var,tools} $LFS/usr/{bin,lib,sbin}

for i in bin lib sbin; do
  sudo ln -sv usr/$i $LFS/$i
done

case $(uname -m) in
  x86_64) sudo mkdir -pv $LFS/lib64;;
esac

popd > /dev/null
