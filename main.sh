#!/bin/bash
# Interface to run shell scripts

versionCheck() {
  clear
  echo -e "Run version-check.sh (LFS 2.2 - Host System Requirements)\n"
  bash src/version-check.sh
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
  echo -e "[q] Exit menu\n"
  read -n 1 answer

  case "$answer" in
    1) versionCheck;;
    q) quit;;
  esac
done
