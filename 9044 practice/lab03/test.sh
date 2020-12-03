#!/bin/sh
#convert
for image in *.jpg
do
echo $image
if [[ $(echo $image | grep ".png") ]]
then
echo "$image".png already exists
else
convert "$image" "${image%.jpg}.png"
fi
done