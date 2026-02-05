#!/bin/bash
#
#
#This script will help to create a user in home directory with their directory based on user input.
#

read -p "Please enter the user Name: " username

echo "Creating user $username with the with bash shell and their home directory."

sudo useradd -m $username -s /bin/bash

echo "$(cat /etc/passwd | tail -5)"
