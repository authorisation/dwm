#!/bin/bash

cpu() {
  cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)

  printf "  "
  printf "$cpu_val "
  printf "load avg | "
}

mem() {
  printf "  "
  printf "$(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g) "
  printf "used |"
}

clock() {
  printf "󱑆  "
  printf "$(date '+%H:%M:%S') .. $(date '+%b %d %Y')"
}

while true; do
  sleep 1 && xsetroot -name " $updates $(cpu) $(mem) $(clock)"
done

