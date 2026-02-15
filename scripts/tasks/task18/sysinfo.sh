#!/bin/bash

#1. A function to print **hostname and OS info**
#2. A function to print **uptime**
#3. A function to print **disk usage** (top 5 by size)
#4. A function to print **memory usage**
#5. A function to print **top 5 CPU-consuming processes**
#6. A `main` function that calls all of the above with section headers
#7. Use `set -euo pipefail` at the top

set -euo pipefail
# defining functions

hostnameos() {
	echo "=========== HOSTNAME ==============="
	hostname
	echo "============ OS INFO ==============="
	uname -a
}

sysuptime() {
	echo "=========== UPTIME ================="
	uptime
}
diskusage() {
	echo "=========== DISK USAGE ============="
	df -h | sort -rh -k5 | head -5
}
memory_usage() {
	echo "========= MEMORY USAGE ============="
	free -h
}
top_cpu() {
	echo "=== TOP 5 CPU Consuming Process ==="
	ps -eo pid,%cpu,%mem,stat,start,command --sort=-%cpu| head -6
}


# defining main function and calling function inside main

main() {
	hostnameos
	sysuptime
	diskusage
	memory_usage
	top_cpu  
}

#calling mail function


main
