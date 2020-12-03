#!/bin/dash

for n in one two three
do
    good=123
    bad=$good
    read line
    echo Line $n $line
done
