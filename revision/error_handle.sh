#!/bin/bash


# if there is any error in code stop the script -e

set -e 



# basic revison for the error handling

mkdir -p test 

echo "Important line"

mkdir test111


rm -rf test test111
