#!/bin/bash


# revision for the For Loops


# list method can be write with spaces
for car in nano bmw benz audi tesla

do 
	echo $car
done

# range

for i in {1..5}
do
	echo $i
done

# more controlled way

for (( i=5 ; i>0 ; i-- ))
do
	echo $i
done

# file iterate of current dir

for file in ./*
do
	echo $file
done

# file iterate .txt only of current dir

for file in ./*.txt
do 
	echo $file
done


