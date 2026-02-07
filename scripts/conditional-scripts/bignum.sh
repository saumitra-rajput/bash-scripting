#!/bin/bash


# this script will take the input from the user and then tell the bigger number.
#

read -p "Enter the first number: " num1
read -p "Enter the second number: " num2


if [ $num1 -gt $num2  ];
then
	echo " $num1 is Greater number!"

else 
	echo "$num2 is Greater number!"

fi
