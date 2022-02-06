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
  echo -e "[q] Exit menu\n"
  read -n 1 answer

  case "$answer" in
    1) versionCheck;;
    2) lfsVariable;;
    3) mountPartition;;
    q) quit;;
  esac
done
