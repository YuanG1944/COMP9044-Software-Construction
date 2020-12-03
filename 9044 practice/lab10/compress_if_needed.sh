#!/bin/bash

for ele in $@
do
    xz -k $ele
    o_size=`ls -l $ele | awk '{print $5}'`
    xz_size=`ls -l $ele.xz | awk '{print $5}'`
    if (( $o_size < $xz_size ))
    then
        echo $ele $o_size bytes, compresses to $xz_size bytes, left uncompressed
        rm $ele.xz
    else
        echo $ele $o_size bytes, compresses to $xz_size bytes, compressed
        # echo $xz_size
        rm $ele
    fi
done