### 9044复习笔记

#### 1.perl的写文件

>```perl
> #打开文件:
> open(my $file, ">", $ARGV[2]) or die "error $!";
> print($file "$i\n"); #向文件中写入 $file 与 $word 之间没有逗号
>```

#### 2.perl的读文件

>```perl
> #打开文件:
> open($file, '<', $ARGV[1]) or die "error $!";
> @arr = (<$file>); #将所有内容读入一个数组
>```

#### 3.perl读标准输入

>```perl
> #打开文件:
> while($readline = <STDIN>){
> }
>```

#### 4.perl的数组

>```perl
>push @ARRAY, LIST #将列表的值放到数组的末尾
>pop @ARRAY #删除数组的最后一个值
>shift @ARRAY #弹出数组第一个值，并返回它。数组的索引值也依次减一
>unshift @ARRAY, LIST #将列表放在数组前面，并返回新数组的元素个数
>
># 字符串转为数组
>@test = split('', $var_test);
># 数组转为字符串
>$string1 = join( '-', @string );
>
>#合并数组
>@odd = (1,3,5);
>@even = (2, 4, 6);
>@numbers = (@odd, @even);
>
>#在字符串尾部添加字符串
>$value."+";
>#在字符串头部添加字符串
>"+".$value;
>```

####  5.perl的哈希

>```perl
># 迭代哈希
>%data = ('google'=>'google.com', 'runoob'=>'runoob.com', 'taobao'=>'taobao.com');
>foreach $key (keys %data){
>    print "$data{$key}\n";
>}
>
># 获取哈希大小
>@keys = keys %data; #keys->数组
>$size = @keys; #@_->$_
>
>#二维hash
>foreach my $key1 (sort keys %hash_map){
>		my $hash2 = $hash_map{$key1};
>		foreach my $key2 (sort keys %$hash2){
>				print("$hash2{key2}");
>		}
>}
>
>#判断key是否存在
>foreach $value (@name){
>    if(exists($name_hash{"$value"})){
>        next;
>    }else{
>        $name_hash{"$value"}++;
>        push @res, $value;
>    }
>}
>```

#### 6.perl的排序

>```perl
>#基于ASCII码排序
>@words = sort { $a cmp $b } @words;
>
>#按字母顺序排列
>my @sorted_words = sort { lc($a) cmp lc($b) } @words;
>
>#Perl对数值排序
>my @sorted_numbers = sort { $a <=> $b } @numbers;
>
>#以字符串的长度长度排序
>sub compare{
>    return length $a <=> length $b || $a cmp $b;
>}
>@content = sort compare @content;
>
>foreach $value (@content){
>    print("$value");
>}
>```

#### 7.perl的文本处理

>```perl
>#四舍五入文本中的数字
>while ($line = <>) {
>    while ($line =~ /(\d+\.\d+)/){
>        $rounded = sprintf("%.0f", $1); #只保留整数
>        $line =~ s/(\d+\.\d+)/$rounded/
>    }
>    print "$line";
>}
>```

#### 8.shell test命令

>```shell
># 数值测试
>-eq	等于则为真
>-ne	不等于则为真
>-gt	大于则为真
>-ge	大于等于则为真
>-lt	小于则为真
>-le	小于等于则为真
>
>#字符串测试
>=	等于则为真
>!=	不相等则为真
>-z 字符串	字符串的长度为零则为真
>-n 字符串	字符串的长度不为零则为真
>
>#文件测试
>-e 文件名	如果文件存在则为真
>-r 文件名	如果文件存在且可读则为真
>-w 文件名	如果文件存在且可写则为真
>-x 文件名	如果文件存在且可执行则为真
>-s 文件名	如果文件存在且至少有一个字符则为真
>-d 文件名	如果文件存在且为目录则为真
>-f 文件名	如果文件存在且为普通文件则为真
>-c 文件名	如果文件存在且为字符型特殊文件则为真
>-b 文件名	如果文件存在且为块特殊文件则为真
>```

#### 9.shell 计算

>```shell
>sum=‘expr $sum + $n‘
>```

#### 10.shell 去空行,前空格,后空格,while中读文件内容

>```shell
>#去空行
>grep -v '^$'
>sed '/^$/d'
>
>#去前后空格
>echo ' A BC ' | sed -e 's/^[ ]*//g' | sed -e 's/[ ]*$//g'
>
>#更换默认分隔符
>IFS=$" "
>IFS=$IFSBAK
>
>while read line
>do
>	#操作
>done < .shrug/__tmp/__delete_tmp.txt
>
>
>#例子:
>#!/bin/sh
>now=`cat test.txt`
>IFS="
>"
>for line in $now
>do
>    echo $line
>done
>IFS=$IFSBAK
>
>while read line
>do
>    echo $line
>done < test.txt
>```

#### 11.shell grep

>```shell
># 模糊匹配
>grep "abc"   # 结果为abcd, abcde, abc等
>
>#全匹配
>grep -w "abc" # 结果为abc 
>
>-i 或 --ignore-case : 忽略字符大小写的差别。
>-v 或 --revert-match : 显示不包含匹配文本的所有行。
>```

#### 沉默slience

```
/dev/null
```

