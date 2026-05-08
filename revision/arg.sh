#!/bin/bash

# argument  0      1    2      3    4
#          arg.sh ram hanuman sita laxman


echo "0th argument $0"
echo "1th argument $1"
echo "2th argument $2"
echo "3th argument $3"

echo "Total argument pass: $#"
echo "ALL argument pass: $@"



# use case

if [ $# -eq 0 ] ; then
	
	echo "Please pass the arguments."
	exit 1
fi

if [ -f $1 ] ; then

	echo "File exists"
else
	echo "File does not exists"
fi
