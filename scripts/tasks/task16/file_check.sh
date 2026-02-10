#!/bin/bash
#

read -p "Filename pleaes: " name


if [ -f "$name" ];
then
	echo " File exists $name"

else 
	echo "file doesn't exists $name"

fi

