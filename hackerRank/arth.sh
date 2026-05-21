#!bin/bash

# Given two integers,  and , identify whether x<y orx>y  or x=y .
read -p "" num1
read -p "" num2


# solution required output in X and Y

# same code using different syntax using [ x -gt y ]
if [ $num1 -lt $num2 ];then
    echo "X is less than Y"

elif [ $num1 -gt $num2 ];then
    echo "X is greater than Y"
else
    echo "X is equal to Y"
fi




# more mathematical oritented (( x > y ))
if (( $num1 < $num2 ));then
    echo "$num1 is less than $num2"

elif (( $num1 > $num2 )) ;then
    echo "$num1 is greater than $num2"
else
    echo "$num1 is equal to $num2"
fi


# same code using different syntax using [ x -gt y ]

if [ $num1 -lt $num2 ];then
    echo "$num1 is less than $num2"

elif [ $num1 -gt $num2 ];then
    echo "$num1 is greater than $num2"
else
    echo "$num1 is equal to $num2"
fi
