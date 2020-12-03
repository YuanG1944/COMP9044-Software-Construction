#!/bin/dash

#test case function

echo 'Please enter the number from 1 to 4:'
echo 'Your number is:'
read aNum
case $aNum in
    1)  echo 'You choose 1'
    ;;
    2)  echo 'You choose 2'
    ;;
    3)  echo 'You choose 3'
    ;;
    4)  echo 'You choose 4'
    ;;
    *)  echo 'Your number is not include [1, 4]'
    ;;
esac