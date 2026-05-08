#!/bin/bash

# Input
# take username 
# take password
# take shell


# converting the below script into the function

create_user(){

read -p "Enter the username: " username
read -p "Enter the Password: " password
read -p "Enter the un: " shell_type


if id ${username} &> /dev/null; then
	echo "User exists, exiting the code"
else
	echo "Creating user..."
fi
sudo useradd -p ${password} -s ${shell_type} -m ${username}
echo "User created successfully"

}


# calling function

create_user
create_user

