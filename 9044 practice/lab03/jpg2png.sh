#!/bin/sh
IFS=$'\n';
filename=$(ls * | egrep -v ".sh")
jp=".jpg"
pn=".png"
for file in $filename
do
    tmp=$(echo $file | awk 'BEGIN{FS="."}{print $1}')
    if [[ $(echo $file | grep $jp) ]]
    then
        convert $tmp$jp $tmp$pn
        rm $tmp$jp
        # convert $tmp$pn $tmp$jp
        # rm $tmp$pn
    elif [[ $(echo $file | grep $pn) ]]
    then
        echo $file already exists
    fi
done