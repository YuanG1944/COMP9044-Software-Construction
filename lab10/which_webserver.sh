#!/bin/bash

for ele in $@
do
    tmp=`curl -Is $ele | egrep -i "Server: " | sed "s/server: //g" | sed "s/Server: //g"` 
    echo $ele $tmp
done