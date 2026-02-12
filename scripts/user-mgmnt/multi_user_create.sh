#!/bin/bash
#
#
#This script can help to create multiple users with their home directory with the bash shell.
#And if the user is found in system you have to re-run the script

read -p "Enter the number of user you wants to create: " num

for (( i=1; $num>=i; i++ ))
do

read -p "Enter the user Name: " name

if   id "$name"  &> /dev/null ;
then
       	echo "User already exists $name"
	cat /etc/passwd | grep $name
	echo "Please re-run the Script."
	exit 1
else
	echo "Creating user"

sudo useradd -m $name -s /bin/bash
fi
echo "User created!"

cat /etc/passwd | tail -n 2

done

