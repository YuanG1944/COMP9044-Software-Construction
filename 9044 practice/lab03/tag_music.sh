#!/bin/sh
IFS=$'\n';
filename=`find $@ | grep ".mp3"`
# echo $filename
for file in $filename
do
    title=`echo $file | awk 'BEGIN{FS=" - "}{print $2}'`
    artist=`echo $file | awk 'BEGIN{FS=" - "}{print $3}' | awk '{sub(/.{4}$/,""); print $0}'`
    album=`echo $file | awk 'BEGIN{FS=" - "}{print $1}' | cut -f2 -d"/"`
    year=`echo $file | awk 'BEGIN{FS=" - "}{print $1}' | cut -f2 -d"/" | cut -f2 -d"," | tr -d ' '`
    track=`echo $file | awk 'BEGIN{FS=" - "}{print $1}' | cut -f3 -d"/"`
    # echo $file
    # echo $title
    # echo $artist
    # echo $album
    # echo $year
    # echo $track
    # echo --------------------------
    id3 -t $title $file >/dev/null
    id3 -a $artist $file >/dev/null
    id3 -A $album $file >/dev/null
    id3 -y $year $file >/dev/null
    id3 -T $track $file >/dev/null
done