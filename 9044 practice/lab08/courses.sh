#!/bin/dash
netpage="http://www.timetable.unsw.edu.au/current/"

ele=$1
if test -z $ele
then
    exit 1;
else
    pageName="$1""KENS.html"
    curl --location --silent $netpage$pageName | egrep $1  | awk 'NR%2==0' | awk 'BEGIN{FS=">"}{print $2, $3}' | awk 'BEGIN{FS="="}{print $2}' | tr -d "\"" | sed 's/.html//g' | sed 's/<\/a//g' | sort -n
fi
