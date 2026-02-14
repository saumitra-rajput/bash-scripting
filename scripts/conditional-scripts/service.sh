#!/bin/bash
#
#
#This script can be used to check the installed service in server
#If not installed then it will install the service and start it.
#After installation Enter the service name start it and check the status.
 
read -p "Enter the the service name: " service

if dpkg -s $service > /dev/null 2>&1;

then 
	echo "$service found"
	exit 0
else
	echo "Installing $service..."
	
fi
sudo apt-get update
sudo apt install $service -y

read -p "Please enter the service name to start it: " name

sudo systemctl start $name
systemctl status $name

