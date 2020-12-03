#!/bin/sh
netpage="http://legacy.handbook.unsw.edu.au/vbook2018/brCoursesByAtoZ.jsp?StudyLevel=Undergraduate&descr="
netpagep="http://legacy.handbook.unsw.edu.au/vbook2018/brCoursesByAtoZ.jsp?StudyLevel=Postgraduate&descr="
key=`echo $1 | awk '{print substr($1,1,1)}'`
totalNet=$netpage$key
totalNetp=$netpagep$key
curl --silent "$totalNet", "$totalNetp" | egrep "($1)[0-9]" | cut -f2,3 -d">" | cut -f7- -d"/" | cut -f1 -d"<" | sed 's/.html">/ /g' | egrep $1 | sort | sed -n '/./p' | sed 's/[ \t]*$//g' | uniq
# curl --silent "$totalNet", "$totalNetp" | egrep "($1)[0-9]" | cut -f2,3 -d">" | cut -f7- -d"/" | cut -f1 -d"<"
# curl --silent "$totalNet" | grep "$1" 