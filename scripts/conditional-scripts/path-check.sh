#!/bin/bash

# This script will check if the file exists in the user home directory or not
# using flag -f represent file type
# for directory we use -d

read -p "Enter the file path you want to check:  " path

if [ -f $path ];
then
	echo " File path exists $path"
else
	echo "File doesnot exist"

fi


