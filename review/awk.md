# awk

## 模式扫描和处理

## 处理steam editor 文本流

###### 一个awk脚本通常由：BEGIN语句块、

###### 						 	  能够使用模式匹配的通用语句块、

###### 							   END语句块3部分组成，

###### 这三个部分是可选的。任意一个部分都可以不出现在脚本中，脚本通常是被**单引号**或**双引号**中

```shell
##     参数          模式动作
awk [options] 'pattern {action}' file
##               找谁     干嘛
awk 'BEGIN{ print "start" } pattern{ commands } END{ print "end" }' file
```

##### awk 是通过一行一行的处理文件, 包含模式(条件)和动作部分

###### -打印文件所有内容

```shell
awk '{print}' parliament.txt
```

###### -打印前三列

```shell
awk '{print $1, $2, $3}' parliament.txt
awk '{print $1 "\t" $2 "\t" $3}' parliament.txt #\代表tab键
```

###### -统计行数NR(number of record)

###### 	awk中: 一个横行表示一个record

###### 			   一个竖行表示一个file(NF 为统计竖行个数)

###### 	在awk中, 空格表示把两个字符串拼接,所以不会将两个字符中打印出空格

```shell
awk '{print NR, $0}' parliament.txt  #$0表示打印所有元素 
```

#### 查找

###### 	-查找'Mr'开头的所有人

```shell
awk '$1=="Mr"{print $0}' parliament.txt
```



#### awk内部变量

###### 只打印第一行

```shell
awk 'NR==7{print NR, $0}' parliament.txt 
```

###### 改变默认分隔符为","(BEGIN定义全局变量)

```shell
awk 'BEGIN{FS=","} {print $1, $2}' #FS是输入分隔符
awk 'BEGIN{OFS=","} {print $1, $2}' #OFS是输出分隔符 打印出来后用","号隔开
awk 'BEGIN{FS=","; OFS="-"} {print $1, $2}'
```

###### 更改输出

```shell
awk '$1="Mr"{print FILENAME, $0}' parliament.txt  #打印文件名
awk '$1="Mr"{$2="xxxx"; print $0}' parliament.txt  #将第二列替换成"xxxx"
awk '$1="Mr"{print $NF}' parliament.txt  #打印最后一列
```

###### 运算

```shell
#如果计算的是字符串且其中没有数字,这个字符串视为0
awk '{a=2; b="apple"; c=3; print b+c}' 
#数字出现在字符串前面,可以视为数字进行数学运算
awk '{a=2; b="2apple"; c=3; print b+c}'  #结果为5(注:出现在后面不算)
```

###### 正则表达式

```shell
awk '/[A]/{print $0}' parliament.txt  # 在//中写正则表达式查找
```

###### 统计行数

```shell
awk 'BEGIN{ i=0 } { i++ } END{ print i }' parliament.txt
```

##### 工作原理

- 第一步：执行`BEGIN{ commands }`语句块中的语句；
- 第二步：从文件或标准输入(stdin)读取一行，然后执行`pattern{ commands }`语句块，它逐行扫描文件，从第一行到最后一行重复这个过程，直到文件全部被读取完毕。
- 第三步：当读至输入流末尾时，执行`END{ commands }`语句块。

##### 练习

```shell
cat test1 | awk '{sub(/-[0-9].*-[0-9]/, "")}{print}'
#sub函数对指定的正则表达式进行替换，省略了第三个参数，即对每一行$0进行匹配。

#length函数的使用(字符长度)
awk 'length($1) == 4{print $1}' test2

#空格替换成","
awk 'BEGIN{ FS=":" } {print $1}' test2 | awk '{ print $2 "," $1 }'
awk 'BEGIN{FS=":"} {print $1}' test2 | awk 'BEGIN{OFS=","} {print $2, $1}'

#显示Savage的全名和电话号码,Chet的捐款,所有头一个月捐款$250的人名 
awk 'BEGIN{ 
    FS=":" 
}                                             
$1~/Savage/ { 
    print $1,$2 
}
$1~/Chet/ { 
    print $3 + $4 + $5
}
$3==250 { 
    print $1 
}
' dat
```



