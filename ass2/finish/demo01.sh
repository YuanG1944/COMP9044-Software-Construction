#!/bin/dash

# refereance from my friend Jenny

start=13
if test $# -gt 0
then
    start=$1
fi
i=0
number=$start
file=./tmp.numbers
rm -f $file
while test $start -gt 0
do
    if test -r $file
    then
        echo Terminating because series is repeating
        exit 0
    fi
    echo $i $number
    number=`expr $number % 2`
    if test $number -lt 1
    then
        number=`expr 7 '*' $number + 3`
    else
        number=`expr $number / 2`
    fi
    i=`expr $i + 1`
    if test $number -gt 100
    then
        echo Terminating because series has become too large
        exit 0
    fi
    start=`expr $start - 1`
done
rm -f $file