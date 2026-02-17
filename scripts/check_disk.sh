#!/bin/bash

# basic function to display diskspace and current memory

#defining functions

check_disk () {
	df -h /
}
check_memory () {
	free -h
}

#calling functions
check_disk
check_memory
