#!/bin/bash
#defining the functions

greet (){
read -p "Enter the name: " name

echo "Hello $name !!!"

}

add () {
read -p "Enter the first number: " num1
read -p "Enter the second number: " num2
echo "The sum is:  $((num1 + num2))"
}
#calling the functions

greet
add
