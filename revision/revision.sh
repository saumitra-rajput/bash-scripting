#!/bin/bash

echo "This is revision Day 28"

a=10

echo ${a}

read -p "Enter your name: "  name

echo "Hello, ${name}"

if [ -z "${1}" ];
then
	echo "You have not provided the argument value"

else
	echo "Hello, The argument value ${1}"

fi


# usage of while

# storing the $1 value in arg

arg="$1"

while [ -z "$arg" ];
do
	read -p "Please enter the Argument value index 1: " arg
done
echo "This is value From While loop: ${arg}"


# call function

greeting(){
echo "Hello to argument value displayed using call function: ${arg}"
}
# calling the greeting function
greeting
