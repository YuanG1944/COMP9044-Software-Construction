#!/bin/dash
file=`ls | grep -v ".sh" | grep -v ".pl"`

num=`ls -a | egrep ".snapshot.[0-9]+" | awk 'BEGIN{FS="."}{print $3}'| sort -n | tail -n1`
num=$(($num+1))
mkdir .snapshot.$num
for name in $file
do
    mv $name .snapshot.$num/$name
done
echo Creating snapshot $num

for name in `ls .snapshot.$1`
do
    cp .snapshot.$1/$name .
done
echo Restoring snapshot $1
