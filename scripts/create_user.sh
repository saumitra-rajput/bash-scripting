#!/bin/bash

<< com

take input as username and password
check if the user exists
create user if not exists
convert the script into a function
com

create_user() {
read -p "Enter the username: " name
read -p "Enter the password: " password

if id "$name" &> /dev/null
then
	echo "User already exists"
#	cat /etc/passwd | grep "$name"
	exit 1
else
	echo "Creating user.."

	sudo useradd "$name" -m -p "$password" 
	cat /etc/passwd | grep "$name"
	echo "User created successfully"
fi
}


#calling function 2 times.

create_user
create_user


