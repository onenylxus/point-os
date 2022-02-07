#!/bin/bash
# Add LFS user

pushd ~ > /dev/null

if [ "$LFS" != "/mnt/lfs" ]; then
  echo "Incorrect \$LFS variable"
  return
fi

sudo groupadd lfs
sudo useradd -s /bin/bash -g lfs -m -k /dev/null lfs
sudo passwd lfs

sudo chown -v lfs $LFS/{usr{,/*},lib,var,etc,bin,sbin,tools}
case $(uname -m) in
  x86_64) sudo chown -v lfs $LFS/lib64;;
esac

sudo chown -v lfs $LFS/sources

popd > /dev/null
