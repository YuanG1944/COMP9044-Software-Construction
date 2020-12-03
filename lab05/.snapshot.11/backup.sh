#!/bin/sh
name=$1
if test -e $name
then
    if test ! -e "."$name".0"
    then
        cp $name "."$name".0"
        echo Backup of \'$name\' saved as \'"."$name".0"\'
    else
        num=`ls -a | egrep "$name.[0-9]+" | awk 'BEGIN{FS="."}{print $4}'| sort -n | tail -n1`
        let num++
        cp $name "."$name"."$num
        echo Backup of \'$name\' saved as \'"."$name"."$num\'
    fi
    
else
    echo \'"$name"\' dose not exist
    exit 1;
fi
