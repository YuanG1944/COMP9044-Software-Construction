#!/bin/dash

#test sub2

word=$1

for n in one two three
do
    #notation
    if test $word = $n
    then
        echo "is $word"
    else
        echo "no $n"
    fi
done