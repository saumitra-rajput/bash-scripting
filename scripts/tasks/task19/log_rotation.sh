#!/bin/bash

set -e

if [ $# -eq 0 ]
then 
	echo "Please Enter the path for the log file."
	echo "E.g: /home/ubuntu/folder/"
	exit 1
else
	echo "Checking requirements.."

fi
src="$1"
echo "This is our source location: $1"
echo "Backup will store at ~/my-backup"

dest="/home/ubuntu/my-backup/"

DT="$(date '+%Y-%m-%d-%H-%M')"

tar -cvzf "$dest/backup-$DT".tar.gz "$src"
