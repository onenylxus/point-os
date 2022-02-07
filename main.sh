#!/bin/bash
# Interface to run shell scripts

page=0

options[0]="Run 2.2-version-check.sh (LFS 2.2 - Host System Requirements)"
options[1]="Run 2.6-lfs-variable.sh (LFS 2.6 - Setting The \$LFS Variable)"
options[2]="Run 2.7-mount-partition.sh (LFS 2.7 - Mounting the New Partition)"
options[3]="Run 3.1-download-packages.sh (LFS 3.1 - Introduction)"
options[4]="Run 3.1-verify-packages.sh (LFS 3.1 - Introduction)"
options[5]="Run 4.2-directory-layout.sh (LFS 4.2 - Creating a Limited Directory Layout in LFS Filesystem)"
options[6]="Run 4.3-add-user.sh (LFS 4.3 - Adding the LFS User)"

actions[0]="src/2.2-version-check.sh"
actions[1]="src/2.6-lfs-variable.sh"
actions[2]="src/2.7-mount-partition.sh"
actions[3]="src/3.1-download-packages.sh"
actions[4]="src/3.1-verify-packages.sh"
actions[5]="src/4.2-directory-layout.sh"
actions[6]="src/4.3-add-user.sh"

proceed() {
  read -n 1 -s -r -p $'\n[v] Press any key to continue'
}

runScript() {
  clear
  echo -e "${options[$1]}\n"
  bash ${actions[$1]}
  proceed
}

previousPage() {
  if [ $page -gt 0 ]; then
    page=$(expr $page \- 1)
  fi
}

nextPage() {
  if [ $(expr $page \* 5 \+ 5) -lt ${#options[@]} ]; then
    page=$(expr $page \+ 1)
  fi
}

quit() {
  clear
  exit
}

showPage() {
  clear
  echo -e "Point Operating System (point-os) - Development Scripts Interface\n"
  echo "Select action:"
  for ((i = 1; i < 6; i++)); do
    k=$(expr $page \* 5 \+ $i \- 1)
    if [ $k -lt ${#options[@]} ]; then
      echo -e "[$i] ${options[$k]}"
    fi
  done
  echo ""

  if [ $page -gt 0 ]; then
    echo -e "[p] Previous page"
  fi
  if [ $(expr $page \* 5 \+ 5) -lt ${#options[@]} ]; then
    echo -e "[n] Next page"
  fi
  echo -e "[q] Exit menu\n"
  read -n 1 answer

  case "$answer" in
    1) runScript $(expr $page \* 5);;
    2) runScript $(expr $page \* 5 \+ 1);;
    3) runScript $(expr $page \* 5 \+ 2);;
    4) runScript $(expr $page \* 5 \+ 3);;
    5) runScript $(expr $page \* 5 \+ 4);;
    p) previousPage;;
    n) nextPage;;
    q) quit;;
  esac
}

while true; do
  showPage
done
