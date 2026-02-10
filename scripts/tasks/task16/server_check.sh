#!/bin/bash
#

read -p "Enter the Service name: " sname

read -p "Do you want to check the status? (y/n): " check

if [ "$check" == "y" ];
then
	systemctl status is-active "$sname" 

elif [ "$check" == "n" ];
then
	echo "Skipped"
else
	exit 0
fi
