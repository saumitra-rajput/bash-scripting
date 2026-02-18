#!/bin/bash

################################################################################################
# About
# This script can take file path as input and will check the files if they are last modified
# seven days ago it will back at dest location and it will delete the files which are older than
# 30 days
#
# Intregation with the AWS s3
# Backup files will also get sync with the s3 bucket
################################################################################################

set -euo pipefail

if [ $# -eq 0  ]
then 
	echo "Please enter the log file path: "
	echo "Example: /var/log/myapp"
	exit 1
else
	echo "Checking the requirements...."
	echo " " 
fi

# storing provided log directory path: src (source path entered by user)

src="$1"

# default path where backup will be stored: dest (destination path)

dest="/home/ubuntu/project/log-backups"

# defining date format: format

format="$(date '+%Y-%m-%d-%H-%M')"



# defining functions

create_backup() {

# archieving files which are older than 7 days
# checking and count files older than 7 days: cfo (Count of files older than 7 days)

cfo="$(find "${src}"/*.log -type f -mtime +7 | wc -l)"
echo "The numbers of file which are older than 7 days are: ${cfo}"
echo "---------------------------------------------------------------------------------"

# files to be archieved: fta (files to be archieved)

fta="$(find "${src}"/*.log -type f -mtime +7 )"
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

        # storing backup at S3 bucket in aws using aws cli and sync command
        # Note: You must have aws cli installed for this script.
        # Configure user with the S3 bucket access permission.
        # Configure user on machine with the Access ID and Access key.
        # local path : dest
        # aws s3 sync local-path s3://bucket-name

        aws sync ${dest} s3://my-backups-for-friday
	echo "Backup sync with the aws s3 bucket  successfully."
        echo "---------------------------------------------------------------------------------"


else
	echo"Files are upto date"
	echo "---------------------------------------------------------------------------------"
fi
}

################################################################################################
################################################################################################


# defining function


delete_backup() {

# log-rotation to delete the files which are older than 30 days
# count of backup files which are older than 30 days: count_backup

count_backup="$(find "$dest"/*.gz -type f -mtime +30 | wc -l)"

echo "The count of backups older than 30 days is: ${count_backup}"

echo "---------------------------------------------------------------------------------"

# check the backup files which are older than 30 days: tbdel (to be deleted)
# for testing purpose converted the last modified to 1 minute ago: original was -mtime +30
# getting the backup files which are older than 30 days: tmp
# converting tmp output into arrary to loop and delete.


tmp=($(find "$dest"/*.gz -type f -mtime +30))

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
	echo "NOTHING TO DELETE"
fi

echo "---------------------------------------------------------------------------------"

}


# calling functions

create_backup

delete_backup
