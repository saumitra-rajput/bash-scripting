#!bin/bash

# Given two integers,  and , find their sum, difference, product, and quotient.

read -p "" num1

read -p "" num2

sum=$(($num1 + $num2))

echo "${sum}"

sub=$(($num1 - $num2))
echo "${sub}"

mult=$(($num1 * $num2))
echo "${mult}"

quo=$(($num1 / $num2))
echo "${quo}"
