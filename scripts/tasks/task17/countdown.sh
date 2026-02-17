#!/bin/bash

# print the reverse count based on user's input

read -p "Enter a non zero number: " num


while [ "$num" -ge 0 ];
do 
	echo "$num"
	num=$((num - 1))
done

echo "done!!"

