#!/bin/bash

set -e

if [ $# -eq 0 ]
then 
	echo "Please Enter the path for the file to create the backup."
	echo "E.g: /home/ubuntu/folder/"
	exit 1
else
	echo "Checking requirements.."

fi
src="$1"
echo "This is our source location: $1"
echo "__________Backup will store at ~/my-backup_______________"

dest="/home/ubuntu/my-backup/"

DT="$(date '+%Y-%m-%d-%H-%M')"

create_backup() {

	tar -cvzf "${dest}/backup-${DT}".tar.gz "$src" > /dev/null 
	if [ $? -eq 0  ]
	then
		echo "__________Backup created successfully at $dest._____________"
	fi
}

log_rotate() {
	#using flag l list, s blocksize, h humanreadable, t timewise sort
	echo "_________Latestt 5 Backups listed below_______________"
	ls -lsht /home/ubuntu/my-backup/ | awk ' NR>=2 && NR<=6 {print $1,$7,$8,$9,$10}'
	#we can also use grep and head to get latest five
	#ls -lsht /home/ubuntu/my-backup/ | awk '{print $1,$7,$8,$9,$10}' | grep .gz | head -n 5
	
	# checking count of backup more than 5: bckup5
	bckup5=($(ls -t "${dest}"/*.gz 2>/dev/null)) 

	if [ "${#bckup5[@]}" -gt 5 ]
	then
		echo "_____________Performing LOG Rotation_________________"
		
		# files to be deleted: tbd
		tbd=("${bckup5[@]:5}")
	
		for i in "${tbd[@]}"
		do 
			rm -rf "$i"
			echo "Deleting file: $i"
		done
	fi
	echo "_______________Log Rotation Completed_________________"
}


# calling functions

create_backup
#log_rotate


# creating function


#  All types of One day old file : odof

#odof="$(find ${src} -type f -name "*" -mtime +1 | wc -l)"
#echo "${odof}"

#if [ "$odof" -gt 0 ]
#then
#	ARF="($(find "$src" -type f -name "*" -mtime +1))"
#	
#	for i in 
#	tar -cvzf "${dest}/backup-${DT}".tar.gz "$ARF"
#	echo "Created Archiceve for files older than 1 day"
#fi

# Arrary of backups leaving first five from the index.
#odof=($( ls -t "${dest}" ))
#echo "(${odof[@]:5})"

#ls -lsth "$dest" | find -type f -mtime +1


