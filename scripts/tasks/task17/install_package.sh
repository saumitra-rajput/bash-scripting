#!/bin/bash

if [ "$EUID" -ne 0 ]
then
	echo "Run as root"
	exit 1
else

for i in nginx curl wget
do
	if dpkg -s "$i" > /dev/null 2>&1
	then
		echo "Package is already installed"
	else
		echo "installing package.."

	fi
	apt-get update
	apt install "$i" -y
	systemctl status "$i" | tail -n 5
done
fi
