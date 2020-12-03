#!/bin/sh
num=$1
while(($num <= $2))
do
    echo $num >> $3
    let num++
done
