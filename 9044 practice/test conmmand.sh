num1=100
num2=200

if test $num1 -eq $num2
then
    echo 二者相等
else
    echo 二者不等
fi

if [$num1 -gt $num2]
then
    echo "$num1 大于 $num2"
else
    echo "$num1 不大于 $num2"
fi

if [$num1 -lt $num2]
then
    echo "$num1 小于 $num2"
else
    echo "$num1 不小于 $num2"
fi