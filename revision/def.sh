#!/bin/bash


# defining the basic function
# noticed we are not using def here like python case def greet () return 1
greet() {
	echo "Hello world!"
}

# calling the greet function
greet

# Main argument passed to the script
echo "Main arg pass in script: ${1}"

# install package via arg

install_package() {
	echo " This is local arg pass in function ${1}"
	echo "installing ${1}"
	echo "${1} installed successfully ......"
}

# Local Argument example
# calling install_package and giving a argument as local arg
install_package docker




