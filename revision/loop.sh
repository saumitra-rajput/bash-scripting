#!/bin/bash

#Your task is to use for loops to display only odd natural numbers from  1to 99.

for i in {1..99}
	do
		if (( i % 2  != 0)); then
			
			echo "Odd num is : ${i}"
		fi
	done
