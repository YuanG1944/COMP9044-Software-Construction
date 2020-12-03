#!/bin/dash

#Print the integers 1..n if 1 argument given.

if test $# -eq 1
then
    start=1
    finish=$1
elif test $# -eq 2
then
    start=$1
    finish=$2
else
    echo "Usage: $0 <start> <finish>" 1>&2
    exit 1
fi

number=$start
while test $number -le $finish 
do
    echo $number
    number=$((number + 1))
done