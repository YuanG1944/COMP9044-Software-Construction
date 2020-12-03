#!/bin/bash
dir1=$1
dir2=$2
IFS=$" "
# echo $dir2
arr=$(echo `ls  $dir1 $dir2`)
# arr=$(echo `ls -l $dir1 $dir2` | grep -v '^$' | sort -n | uniq -d)
IFS=$IFSBAK

echo $arr

# IFS=$"
# "

# for value in $arr
# do
#     a=$dir1/$value
#     b=$dir2/$value
#     diff_i_s=`diff -q $a $b | awk '{print $1}'`
#     if test -z diff_i_s
#     then
#         continue
#     else
#         echo $value
#     fi
# done
