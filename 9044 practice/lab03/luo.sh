#!/bin/sh
IFS=$'\n';
file=$(ls *)
for name in $file
do
	pngName=`echo $name | egrep ".png" | sed 's/.png$//g'`
	jpgName=`echo $name | egrep ".jpg" | sed 's/.jpg$//g'`
	echo $jpgName
	echo $pngName
done


# for jpg in $jpgName
# do
# 	for png in $pngName
# 	do
# 		if [["$jpg =~ $png"]]
# 		then
# 			echo `$png/.png already exists`
# 			exit 1
# 		fi
# 	done
# 	# convert  "$jpg.jpg"  "$jpg.png" 
# 	convert "$jpg\.jpg" "${jpg%.jpg}.png"
# 	sed -regex "$jpg\.jpg" | rm $jpg.jpg
# done
# exit0
