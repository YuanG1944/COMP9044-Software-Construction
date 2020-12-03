#!/bin/dash

#test sub3

start=0
finish=10
val=5

number=$start
while [ $number -le $finish ]
do
    if [ $(($number + 1)) -le $val ]
    then
        echo small $number
    elif [ $(($number + 1)) -eq $val ]
    then
        echo equal $number
    else
        echo big $number
    fi
    number=`expr $number + 1`  # increment number
done