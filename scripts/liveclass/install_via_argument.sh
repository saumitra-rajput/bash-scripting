#!/bin/bash

# This script except the argument from the user to install the service.
# This script also require sudo permisson to install
set -e

if [ $# -eq 0 ]
then 
	echo "Usage: Please RUN with SUDO permission and enter the package name as well";
       	echo "Example : ./install_via_argument nginx"
elif [ $# -ne 0 ]
then

	echo "Checking if already installed..."
	if dpkg -s "$1" > /dev/null 2>&1;
	then
		echo "Already installed"
		echo "Exiting the script"
		exit 1
	else
		echo "Package not found"
		echo "##################################################"
		echo "Checking the requirement for... $1"	
	fi
else
	echo ".....SOMETHING WENT WRONG......."
fi
if [ "$EUID" -ne 0  ]
then
	echo "NOT A ROOT user. Please use SUDO"
	exit 1
else

apt-get update
apt install "$1"
echo "Successfully Installed $1 !!"
fi
