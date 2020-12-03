#!/bin/sh
IFS=$'\n';
filename=$(ls * | egrep -v ".sh")
h=".htm"
hl=".html"
for file in $filename
do
    tmp=$(echo $file | awk 'BEGIN{FS="."}{print $1}')
    if [[ $(echo $file | egrep ".htm$") ]]
    then
        touch $tmp$h $tmp$hl
        rm $tmp$h
        # convert $tmp$pn $tmp$jp
        # rm $tmp$pn
    elif [[ $(echo $file | grep ".html$") ]]
    then
        echo $file exists
    fi
done