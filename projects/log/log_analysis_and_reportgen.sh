#!/bin/bash
set -euo pipefail

if [ $# -lt 2 ]
then
	echo "file doesn't exist"
	echo "Please provide the path for .log file eg: /var/log/app.log"
	echo "Please provide the path to store the summary report: "
	exit 1
fi

src="$1"

dest="$2"

format="$(date '+%Y-%m-%d')"

echo "Error count"
awk '/ERROR/' ${src} | wc -l

echo "Critical Events"
grep -n "CRITICAL" ${src}


echo "TOP error Mesaages"
grep "ERROR" "${src}" | awk '{$1=$2=$3=""; print}' | sort | uniq  -c | sort -rn | head -5

echo "Creating log report"

mkdir -p "$dest"

txfile="${dest}/log_report_${format}.txt"
touch ${txfile}

echo "Summary Report" >> ${txfile}
echo "Date of analysis: $(date)" >> ${txfile} 
echo "Total Lines processed:$( wc -l < "${src}" ) " >> ${txfile}
echo "Total Error Count: $(awk '/ERROR/' ${src} | wc -l)" >> ${txfile}
echo "Top Error Messages: $( grep "ERROR" ${src} | awk '{$1=$2=$3=""; print}' | sort | uniq  -c | sort -rn | head -5 )" >> ${txfile}
echo "Critical events: " >> ${txfile}
echo "$(grep -n "CRITICAL" ${src})" >> ${txfile}


echo "Summary report created: "${dest}""
