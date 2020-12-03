# !#/bin/sh
# echo $num $str $i
reg_int='^[1-9][0-9]*$|^0$'
if test -z $1
then 
    echo "Usage: ./echon.sh <number of lines> <string>"
    exit;
fi

if test $3
then
    echo "Usage: ./echon.sh <number of lines> <string>"
    exit;
fi

if [[ "$1" =~ $reg_int ]]
then
    num=$1
else
    echo "argument 1 must be a non-negative integer"
    exit;
fi

while test $num -gt 0
do
    if test $num -eq 0
    then
        break
    fi
    echo $2
    let num--
done