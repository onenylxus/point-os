#!/bin/bash
# Setup environment with .bash_profile and .bashrc

pushd ~ > /dev/null

if [ "$LFS" != "/mnt/lfs" ]; then
  echo "Incorrect \$LFS variable"
  return
fi

sudo su lfs -c "cat > ~/.bash_profile << \"EOF\"
exec env -i HOME=\$HOME TERM=\$TERM PS1='\u:\w\\$ ' /bin/bash
EOF"
sudo su lfs -c "cat > ~/.bashrc << \"EOF\"
source ~/.bash_profile
set +h
umask 022
LFS=/mnt/lfs
LC_ALL=POSIX
LFS_TGT=\$(uname -m)-lfs-linux-gnu
PATH=/usr/bin
if [ ! -L /bin ]; then PATH=/bin:\$PATH; fi
PATH=\$LFS/tools/bin:\$PATH
CONFIG_SITE=\$LFS/usr/share/config.site
export LFS LC_ALL LFS_TGT PATH CONFIG_SITE
export MAKEFLAGS='-j4'
EOF"

[ ! -e /etc/bash.bashrc ] || mv -v /etc/bash.bashrc /etc/bash.bashrc.NOUSE

popd > /dev/null
