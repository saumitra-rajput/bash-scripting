#!/bin/bash

################################################################################################
# About
# This script can takes source and destionation path as an argument.
# Create archive file for provided path.
# It will back at dest location and it will delete the files which are older than 14 days
################################################################################################

set -euo pipefail

if [ $# -eq 0  ]
then 
	echo "Please enter the source and destination path: "
	echo "Example: /var/log/myapp /var/log/mybackups"
	exit 1
else
	echo "Checking the requirements...."
	echo " " 
fi

# storing provided log directory path: src (source path entered by user)

src="$1"

# storing destination path where backup will be stored: dest (destination path)

dest="$2"

# defining date format: format

format="$(date '+%Y-%m-%d-%H-%M')"



# defining functions

create_backup() {

# archieving files provided in path 


cfo="$(find "${src}"/* | wc -l)"
echo "The numbers of file which will be archieve: ${cfo}"
echo "---------------------------------------------------------------------------------"

# files to be archieved: fta (files to be archieved)

fta="$(find "${src}"/* )"
echo "Below listed files will be archieved."
echo "$fta"
echo " "

if [ "$cfo" -gt 0  ]
then
	echo " "
	echo "-----------------------------Creating Backup-------------------------------------"
	tar -cvzf "$dest"/backup-"$format".tar.gz "$src" > /dev/null
	echo "Backup created successfully."
	echo "---------------------------------------------------------------------------------"
else
	echo"Files are upto date"
	echo "---------------------------------------------------------------------------------"
fi

# printing archive name and size
echo "Archieved files and size:"
ls -lsh ${dest}*.gz | awk '{print$10,$1}'

}

################################################################################################
################################################################################################


# defining function


delete_backup() {

# log-rotation to delete the files which are older than 14 days
# count of backup files which are older than 14 days: count_backup

count_backup="$(find "$dest"/*.gz -type f -mtime +14 | wc -l)"

echo "The count of backups older than 14 days is: ${count_backup}"

echo "---------------------------------------------------------------------------------"

# check the backup files which are older than 14 days: tbdel (to be deleted)
# for testing purpose converted the last modified to 1 minute ago: original was -mtime +14
# getting the backup files which are older than 14 days: tmp
# converting tmp output into arrary to loop and delete.


tmp=($(find "$dest"/*.gz -type f -mtime +14))

# we have to use {array} to print 
echo "${tmp[@]}"

if [ "${#tmp[@]}" -gt 0 ]
then
	echo ""
	echo "Deleting older backups"
	for i in "${tmp[@]}"
	do
		rm -r "$i"
		echo "Deleted ${i}"
	done
else
	echo "---------------------------------------------------------------------------------"
	echo "NOTHING TO DELETE"
fi

echo "---------------------------------------------------------------------------------"

}


# calling functions

create_backup

delete_backup
