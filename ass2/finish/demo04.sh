#!/bin/dash

# from https://blog.csdn.net/jb19900111/article/details/13507815
echo "login:" 
read name
echo "password:"
read passwd
if [ $name = "cht" -a $passwd = "abc" ]
then
    echo "the host and password is right!"
else 
    echo "input is error!"
fi