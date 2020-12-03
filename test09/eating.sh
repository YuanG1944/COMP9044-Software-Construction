#!/bin/bash

cat $1 | egrep "{.*}" | awk '{FS=","}{print $1}' | awk '{FS=":"}{print $2}' | sed 's/"//g'| sed 's/^ //g' | sort -n | uniq | grep -v '^$'
