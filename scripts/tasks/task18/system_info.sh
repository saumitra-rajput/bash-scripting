#!/bin/bash
set -euo pipefail

#################################
# Function: Hostname & OS Info
#################################
host_os_info() {
  echo "Hostname : $(hostname)"
  echo "OS Info  : $(uname -a)"
}

#################################
# Function: Uptime
#################################
system_uptime() {
  uptime
}

#################################
# Function: Disk Usage (Top 5)
#################################
disk_usage() {
  df -h | sort -hr -k5 | head -n 6
}

#################################
# Function: Memory Usage
#################################
memory_usage() {
  free -h
}

#################################
# Function: Top 5 CPU Processes
#################################
top_cpu_processes() {
  ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
}

#################################
# Main Function
#################################
main() {
  echo "=============================="
  echo " SYSTEM INFORMATION REPORT"
  echo "=============================="

  echo
  echo "---- Hostname & OS Info ----"
  host_os_info

  echo
  echo "---- System Uptime ----"
  system_uptime

  echo
  echo "---- Disk Usage (Top 5) ----"
  disk_usage

  echo
  echo "---- Memory Usage ----"
  memory_usage

  echo
  echo "---- Top 5 CPU Processes ----"
  top_cpu_processes
}

# Call main
main

