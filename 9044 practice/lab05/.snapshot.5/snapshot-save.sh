#!/bin/dash
file=`ls | grep -v ".sh" | grep -v ".pl"`

if test ! -e .snapshot.0
then
    mkdir .snapshot.0
    for name in $file
    do
        cp $name .snapshot.0/$name
    done
    echo Creating snapshot 0
else
    num=`ls -a | egrep ".snapshot.[0-9]+" | awk 'BEGIN{FS="."}{print $3}'| sort -n | tail -n1`
    num=$(($num+1))
    mkdir .snapshot.$num
    for name in $file
    do
        cp $name .snapshot.$num/$name
    done
    echo Creating snapshot $num
fi