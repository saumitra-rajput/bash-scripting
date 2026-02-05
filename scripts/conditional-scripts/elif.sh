#!/bin/bash
#
#This file will have a example of elif condition.
#

read -p "Marvel avengers antagonist name: " name
read -p "What is power score out of 100 " power 

if [[ $name == "Thanos"  ]];
then
	echo	"you got it right!, $name"
elif [[ $power -ge 90  ]];
then
	echo" Yes $name is powerfull!"

else
	echo "wrong answer!"
fi
