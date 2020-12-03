myName="Yuan"
echo $myName
myName2="Gao"
echo $myName2

myUrl="https://www.google.com"
readonly myUrl
echo $myUrl
# myUrl="https://www.yuanGao.com"
# unset $myname
# echo $myName

# ''
# 单引号里的任何字符都会原样输出，单引号字符串中的变量是无效的；
# 单引号字串中不能出现单独一个的单引号（对单引号使用转义符后也不行），但可成对出现，作为字符串拼接使用。

# ""双引号
# 双引号的优点：
# 双引号里可以有变量
# 双引号里可以出现转义字符

# your_name='runoob'
# str="Hello, I know you are \"$your_name\"! \n"
# echo -e $str

str="Hello I know you are ${myName} ! \c"
str2="Hello I know you are \"$myName2\" !"
echo $str
echo $str2
echo "last line\n"

# 获取字符串长度
echo "获取字符串长度"
string="abcd"
echo ${#string} #输出 4
echo

# 提取子字符串
echo 提取子字符串
string="runoob is a great site"
echo ${string:7:2} # 输出 is 从第七个字符开始截取两个字符
echo
# expr命令是一个手工命令行计数器，用于在UNIX/LINUX下求表达式变量的值，一般用于整数值，也可用于字符串。
echo `expr 14 % 9`

# 查找子字符串 mac上没有这个命令
# 查找字符 i 或 o 的位置(哪个字母先出现就计算哪个)：
# echo 查找子字符串
# string="runoob is a great site"
# # echo `expr index "$string" io` #输出4
# expr index "$string" io
# # echo `expr index "$string" io`  # 输出 4

# shell 数组
array_name=(
value0
value1
value2
value3
)
value0=${array_name[0]}
echo $value0
echo ${array_name[3]}

echo 获取数组个数
length=${#array_name[@]}
echo $length
echo 获取数组的长度
length=${#array_name}
echo $length

# echo echo多行注释
# :<<EOF
# 这是行注释
# EOF
# :<<EOF
# 注释内容...
# 注释内容...
# 注释内容...
# EOF

echo "Shell 传递参数实例！";
echo "执行的文件名：$0";
echo "第一个参数为：$1";
echo "第二个参数为：$2";
echo "第三个参数为：$3";
echo "参数个数为：$#";
echo "传递的参数作为一个字符串显示：$*";
echo "脚本运行的当前进程ID号：$$";
echo "显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误。: $?"

# 相同点：都是引用所有参数。
# 不同点：只有在双引号中体现出来。
#        假设在脚本运行时写了三个参数 1、2、3，，则 " * " 等价于 "1 2 3"（传递了一个参数），
#        而 "@" 等价于 "1" "2" "3"（传递了三个参数）。
echo "-- \$* 演示 ---"
for i in "$*"; do
    echo $i
done

echo "-- \$@ 演示 ---"
for i in "$@"; do
    echo $i
done

echo
my_array=(A B "C" D)
echo "第一个元素为: ${my_array[0]}"
echo "第二个元素为: ${my_array[1]}"
echo "第三个元素为: ${my_array[2]}"
echo "第四个元素为: ${my_array[3]}"

echo "数组的元素为: ${my_array[*]}"
echo "数组的元素为: ${my_array[@]}"

echo "数组元素个数为: ${#my_array[*]}"
echo "数组元素个数为: ${#my_array[@]}"

echo expr 字符运算
a=10
b=20

val=`expr $a + $b`
echo "a + b : $val"

val=`expr $a - $b`
echo "a - b : $val"

val=`expr $a \* $b`
echo "a * b : $val"

val=`expr $b / $a`
echo "b / a : $val"

val=`expr $b % $a`
echo "b % a : $val"

if [ $a == $b ]
then
   echo "a 等于 b"
fi

if [ $a != $b ]
then
   echo "a 不等于 b"
fi
echo

echo 关系运算符

if [ $a -eq $b ]
then
   echo "$a -eq $b : a 等于 b"
else
   echo "$a -eq $b: a 不等于 b"
fi
if [ $a -ne $b ]
then
   echo "$a -ne $b: a 不等于 b"
else
   echo "$a -ne $b : a 等于 b"
fi
if [ $a -gt $b ]
then
   echo "$a -gt $b: a 大于 b"
else
   echo "$a -gt $b: a 不大于 b"
fi
if [ $a -lt $b ]
then
   echo "$a -lt $b: a 小于 b"
else
   echo "$a -lt $b: a 不小于 b"
fi
if [ $a -ge $b ]
then
   echo "$a -ge $b: a 大于或等于 b"
else
   echo "$a -ge $b: a 小于 b"
fi
if [ $a -le $b ]
then
   echo "$a -le $b: a 小于或等于 b"
else
   echo "$a -le $b: a 大于 b"
fi

echo bool运算符
echo !非
echo -o或
echo -a与

if [ $a != $b ]
then
   echo "$a != $b : a 不等于 b"
else
   echo "$a == $b: a 等于 b"
fi

if [ $a -lt 100 -a $b -gt 15 ]
then
   echo "$a 小于 100 且 $b 大于 15 : 返回 true"
else
   echo "$a 小于 100 且 $b 大于 15 : 返回 false"
fi

if [ $a -lt 100 -o $b -gt 100 ]
then
   echo "$a 小于 100 或 $b 大于 100 : 返回 true"
else
   echo "$a 小于 100 或 $b 大于 100 : 返回 false"
fi

if [ $a -lt 5 -o $b -gt 100 ]
then
   echo "$a 小于 5 或 $b 大于 100 : 返回 true"
else
   echo "$a 小于 5 或 $b 大于 100 : 返回 false"
fi

echo 逻辑运算符
echo "&& 逻辑的 AND"
echo "|| 逻辑的 OR"
if [[ $a -lt 100 && $b -gt 100 ]]
then
   echo "返回 true"
else
   echo "返回 false"
fi

if [[ $a -lt 100 || $b -gt 100 ]]
then
   echo "返回 true"
else
   echo "返回 false"
fi

echo 字符串运算符
a="abc"
b="efg"

if [ $a = $b ]
then
   echo "$a = $b : a 等于 b"
else
   echo "$a = $b: a 不等于 b"
fi
if [ $a != $b ]
then
   echo "$a != $b : a 不等于 b"
else
   echo "$a != $b: a 等于 b"
fi
if [ -z $a ]
then
   echo "-z $a : 字符串长度为 0"
else
   echo "-z $a : 字符串长度不为 0"
fi
if [ -n "$a" ]
then
   echo "-n $a : 字符串长度不为 0"
else
   echo "-n $a : 字符串长度为 0"
fi
if [ $a ]
then
   echo "$a : 字符串不为空"
else
   echo "$a : 字符串为空"
fi


echo 文件测试运算符
file="/Users/yuan/Desktop/9044/test.sh"
if [ -r $file ]
then
   echo "文件可读"
else
   echo "文件不可读"
fi
if [ -w $file ]
then
   echo "文件可写"
else
   echo "文件不可写"
fi
if [ -x $file ]
then
   echo "文件可执行"
else
   echo "文件不可执行"
fi
if [ -f $file ]
then
   echo "文件为普通文件"
else
   echo "文件为特殊文件"
fi
if [ -d $file ]
then
   echo "文件是个目录"
else
   echo "文件不是个目录"
fi
if [ -s $file ]
then
   echo "文件不为空"
else
   echo "文件为空"
fi
if [ -e $file ]
then
   echo "文件存在"
else
   echo "文件不存在"
fi

num1="老子最牛逼"
num2="傻逼"
echo $num1 $num2 >> myfile

echo "原样输出字符串，不进行转义或取变量(用单引号)"
echo '$name\"'

echo `date`