#!/bin/bash
#
#
#This script will help to delete the user based on the user's input.
#

read -p "Please enter the user that you wants to delete: " username

echo " Deleting user $username"

sudo userdel $username

echo "$(cat /etc/passwd | tail -5)"

echo "User deleted $username"
