#!/bin/sh
filename=$(ls *)
small=
mid=
large=
tmp=
for file in $filename
do
    # echo $file
    if [ $file == "file_sizes.sh" ]
    then
        continue
    else
        tmp=`cat $file | wc -l | tr -d " "`
        if (($tmp < 10)) 
        then
            small=`echo $small $file`
        elif (($tmp >= 10 && $tmp < 100))
        then
            mid=`echo $mid $file`
        else
            large=`echo $large $file`
        fi
    fi
done
echo "Small files: "`echo $small | tsort`
echo "Medium-sized files: "`echo $mid | tsort`
echo "Large files: "`echo $large | tsort`