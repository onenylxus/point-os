#!/bin/bash
# Interface to run shell scripts

versionCheck() {
  clear
  echo -e "Run version-check.sh (LFS 2.2 - Host System Requirements)\n"
  bash src/version-check.sh
  proceed
}

lfsVariable() {
  clear
  echo -e "Run lfs-variable.sh (LFS 2.6 - Setting The \$LFS Variable)\n"
  bash src/lfs-variable.sh
  proceed
}

mountPartition() {
  clear
  echo -e "Run mount-partition.sh (LFS 2.7 - Mounting the New Partition)\n"
  bash src/mount-partition.sh
  proceed
}

downloadPackages() {
  clear
  echo -e "Run download-packages.sh (LFS 3.1 - Introduction)\n"
  bash src/download-packages.sh
  proceed
}

verifyPackages() {
  clear
  echo -e "Run download-packages.sh (LFS 3.1 - Introduction)\n"
  bash src/verify-packages.sh
  proceed
}

proceed() {
  read -n 1 -s -r -p $'\n[v] Press any key to continue'
}

quit() {
  clear
  exit
}

while true
do
  clear
  echo "Point Operating System (point-os) - Development Scripts Interface"
  echo -e "LFS version 11.0, BLFS version 11.0\n"
  echo "Select action:"
  echo "[1] Run version-check.sh (LFS 2.2 - Host System Requirements)"
  echo "[2] Run lfs-variable.sh (LFS 2.6 - Setting The \$LFS Variable)"
  echo "[3] Run mount-partition.sh (LFS 2.7 - Mounting the New Partition)"
  echo "[4] Run download-packages.sh (LFS 3.1 - Introduction)"
  echo "[5] Run verify-packages.sh (LFS 3.1 - Introduction)"
  echo -e "[q] Exit menu\n"
  read -n 1 answer

  case "$answer" in
    1) versionCheck;;
    2) lfsVariable;;
    3) mountPartition;;
    4) downloadPackages;;
    5) verifyPackages;;
    q) quit;;
  esac
done
