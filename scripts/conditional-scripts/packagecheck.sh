#!/bin/bash
#
#
#This script can check the whether the specific package is avaiable or not.
#
#

read -p "Enter the package name: " pack


if dpkg -s $pack >/dev/null 2>&1;
then
	echo "$pack exists."

else
	echo "$pack does not exists"

fi

