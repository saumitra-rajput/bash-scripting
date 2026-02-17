#!/bin/bash

# Check the number if postive or negative



read -p "Enter number: " num

if  [ "$num" -eq 0 ];
then
	echo "$num is Zero"

elif [ "$num" -gt 0 ];
then
	echo " $num is Positive"

else 
	echo "$num is Negative"
fi
