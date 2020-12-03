#!/bin/sh
filename=$@

for file in $@
do
    head=`cat $file | egrep "#include \".+\"" | awk '{print substr($2, 2)}' | tr -d "\""`
    for name in $head
    do
        if [[ ! -f $name ]]
        then
            echo $name included into $file does not exist
        fi
    done
done