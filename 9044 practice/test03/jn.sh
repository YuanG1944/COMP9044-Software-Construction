#!/bin/sh

l=`cat $1 | wc -l`
a=`cat $1 | while read line
do  
    let l--
    IFS="|"
    arr=($line)
    IFS=" "
    arr1=(${arr[2]})
    n=${#arr1[@]}
    str[${#str[@]}]="${arr1[$n-1]}"
    # echo $l
    if [ $l == 0 ]
    then 
        echo ${str[@]}
    fi
done`
echo $a
#echo ${str[@]} | sort | uniq -c | sort -r -k 1 | head -n 1 | awk '{print $2}'

