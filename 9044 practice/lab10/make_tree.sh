#!/bin/bash

fileName=$1
com=$2

#无
file=`find $fileName | egrep "Makefile" | sed "s/\/Makefile//g"`
for val in $file
do
    echo Running make in $val
    cont=`make -C $val $com`
    echo $cont
done