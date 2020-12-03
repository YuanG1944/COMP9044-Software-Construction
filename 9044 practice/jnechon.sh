#!/bin/sh
if [ ! "$1" ] || [ ! "$2" ]
then
    echo "Usage: ./echon.sh <number of lines> <string>"
    exit;
elif [ "$3" ]
then
    echo "Usage: ./echon.sh <number of lines> <string>"
    exit;
else      
    if [[ ! $(echo $1 | grep "^[[0-9]]*$") ]]
    then  
        echo "Usage: ./echon.sh <number of lines> <string>"
    else
        for ((i = 0; i < $1; i+=1))
        do           
            echo $2
        done
    fi
fi
