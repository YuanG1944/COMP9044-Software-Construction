# if condition
# then
#     command1 
#     command2
#     ...
#     commandN 
# fi

# 写成一行（适用于终端命令提示符）：
# if [ $(ps -ef | grep -c "ssh") -gt 1 ]; then echo "true"; fi

a=10
b=20

if [ $a == $b ]
then
   echo "a 等于 b"
elif [ $a -gt $b ]
then
   echo "a 大于 b"
elif [ $a -lt $b ]
then
   echo "a 小于 b"
else
   echo "没有符合的条件"
fi

num1=$[2*3]
num2=$[1+5]
if test $[num1] -eq $[num2]
then
    echo '两个数字相等!'
else
    echo '两个数字不相等!'
fi

# for循环
# for var in item1 item2 ... itemN
# do
#     command1
#     command2
#     ...
#     commandN
# done

# for var in item1 item2 ... itemN; do command1; command2… done;
for loop in 1 2 3 4 5 6 7 8
do
    echo "The value is: $loop"
done

for str in "This is a string"
do
    echo $str
done

# while condition
# do
#     command
# done

num=1
while(($num<=5))
do
    echo $num
    let num++
done

# echo '按下 <CTRL-D> 退出'
# echo '输入你最喜欢的网站名: '
# while read FILM
# do
#     echo "是的！$FILM 是一个好网站"
# done

# case 值 in
# 模式1)
#     command1
#     command2
#     ...
#     commandN
#     ;;
# 模式2）
#     command1
#     command2
#     ...
#     commandN
#     ;;
# esac

# echo '输入 1 到 4 之间的数字:'
# echo '你输入的数字为:'
# read aNum
# case $aNum in
#     1)  echo '你选择了 1'
#     ;;
#     2)  echo '你选择了 2'
#     ;;
#     3)  echo '你选择了 3'
#     ;;
#     4)  echo '你选择了 4'
#     ;;
#     *)  echo '你没有输入 1 到 4 之间的数字'
#     ;;
# esac