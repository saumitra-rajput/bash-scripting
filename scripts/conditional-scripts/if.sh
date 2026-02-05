#!/bin/bash
#
#This file will have a example of conditional script if and else.
#

read -p "Marvel character shoot web? Answer: " character

if [[ $character == "Spiderman" ]];
then 
	echo "You got it right $character."
else
	echo "Wrong answer."
fi

