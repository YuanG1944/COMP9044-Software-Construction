#!/bin/dash

# compare the size of two numbers
# from https://blog.csdn.net/jb19900111/article/details/13507815

echo "please enter two number"
read a
read b

if test $a -eq $b
then
    echo "NO.1 = NO.2"
elif
    test $a -gt $b
then
    echo "NO.1 > NO.2"
else
    echo "NO.1 < NO.2" 
fi