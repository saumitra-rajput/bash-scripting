#!/bin/bash


# Diferent use case of for loop

# This will print the values store in script range
for i in apple oranage brianjal potato banana

do
	echo "$i"

done

# This will print the values stores via user's input via variable (separated by space)

read -p "Enter the Iteration(space separated): " input
for i in $input;
do 
	echo "$i"
done

# this will print the reverse order numbers to 0

read -p "Enter the starting range: " num
for (( i=$num; i>=0; i-- ))
do
	echo "$i"
done

# This will print the active .sh files in this directory.

for i in ./*
do
	echo "$i"
done

# This will print only .txt files

echo "Listing .txt files only"
for i in ./*.txt
do 
	echo "$i"
done

