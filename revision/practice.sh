#!/bin/bash


# basic variable define
# to define the variable do not leave the space like python
a="Test"

echo "The value of a is: ${a}"


# taking variable from the user

read -p "Enter the name: " name

echo "Hello, ${name}"


# basic of if else ops
# put the condition in [ abc ] 
# -gt is used not >< like python
# [ ] is used for test conditions like string or number comparisons, not for running commands.

read -p "Enter the first number: " num1
read -p "Enter the second number: " num2

if [ $num1 -gt $num2 ]; then
	echo "${num1} is bigger"
else
	echo "${num2} is bigger"
fi

# another if else example to find the file
#  -f for file
#  -d for directory

read -p "Enter the file path: " file

if [ -f ${file} ]; then
	echo "File exists: ${file}"
else
	echo "File does not exists."
fi


# package check
# using dpkg debian package manager

read -p "Enter the package name: " package

if  dpkg -s ${package} >/dev/null 2>&1 ; then
        echo "Package exists: ${package}"
else
        echo "Package does not exists."
fi
