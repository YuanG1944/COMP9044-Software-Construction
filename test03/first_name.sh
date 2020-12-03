#!/bin/sh
file_name=$@
cat $@ | egrep "^COMP[29]041" | awk 'BEGIN{FS="|"}{print $3}' | awk 'BEGIN{FS=","}{print $2}' | awk '{print $1}' | sort | uniq -c | sort | tail -n 1 | awk '{print $2}'