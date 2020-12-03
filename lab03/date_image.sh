#!/bin/sh
for i in "$@"
do
    imageName=$i
    tmp=$(echo `ls -l $i` | awk '{print $6, $7, $8}')
    convert -gravity south -pointsize 36 -draw "text 0,10 '$tmp'" $imageName $imageName 
done