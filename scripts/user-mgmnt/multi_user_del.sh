#!/bin/bash

#This bash script can help you to delete multiple user at the once space separated.
#we also have use the concepts of variable in this when we take input from user: $0,$1,$2...so on

read -p "Enter the username you wants to delete(space separated): " names

for name in $names
do
	echo "Checking user in the system..."
	if id "$name" &> /dev/null;
		then
			echo "User found $name"
			cat /etc/passwd | grep $name
			echo "Deleteing user with their home dir and mail spool..."
			sudo userdel -r $name
	else
		echo "user does not exists."
	fi

done




