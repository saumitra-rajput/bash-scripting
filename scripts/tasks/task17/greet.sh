#!/bin/bash

#using flag -z to check the argument is empty or not =  -z means empty argument


if [ -z "$1" ]
then
	echo "Usage: ./greet.sh <name>"
else
	echo "Hello, $1!"
fi
