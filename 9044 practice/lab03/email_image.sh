#!/bin/sh
for i in "$@"
do
    read -p "Address to e-mail this image to?" emailAddr
    read -p "Message to accompany image?"  message
    echo $i sent to $emailAddr
    tmp=$(echo $i | awk 'BEGIN{FS="."}{print $1}')
    echo $message |mutt -s $tmp! -e 'set copy=no' -a $i -- $emailAddr
done