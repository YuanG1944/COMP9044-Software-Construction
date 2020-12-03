#!/usr/bin/perl -w

@arr = ("yuan", "gao", "zhao", "qian");
$size = @arr;
print("@arr\n");
print("$arr[1]\n");
$arr[2] = "asd";
print("@arr\n");
print("$size\n");

push @arr, "zhao";
print("PUSH: @arr\n");
pop @arr;
print("POP: @arr\n");
shift @arr;
print("SHIFT: @arr\n");
unshift @arr, "Gao";
print("UNSHIFT: @arr\n");

@sites = qw/google taobao runoob/;
print "$sites[0]\n";
print "$sites[1]\n";
print "$sites[2]\n";
print "$sites[-1]\n";    # 负数，反向读取


#枚举
@var_10 = (1..10);
@var_20 = (10..20);
@var_abc = (a..z);
print "@var_10\n";   # 输出 1 到 10
print "@var_20\n";   # 输出 10 到 20
print "@var_abc\n";  # 输出 a 到 z


@array = (1,2,3);
$array[50] = 4;
$size = @array;
$max_index = $#array;
print "数组大小:  $size\n";
print "最大索引: $max_index\n";

print("数组切割: \n");
@sites = qw/google taobao runoob weibo qq facebook 网易/;
@sites2 = @sites[3..5];
print("@sites\n");
print "@sites2\n";


print("替换数组: \n");
@nums = (a..j);
print "替换前 - @nums\n";
 
splice(@nums, 5, 5, 0..5); 
print "替换后 - @nums\n";

# 定义字符串
$var_test = "runoob";
$var_string = "www-runoob-com";
$var_names = "google,taobao,runoob,weibo";
 
# 字符串转为数组
@test = split('', $var_test);
@string = split('-', $var_string);
@names  = split(',', $var_names);
 
print "$test[3]\n";  # 输出 o
print "$string[2]\n";  # 输出 com
print "$names[3]\n";   # 输出 weibo

$var_string = "www-runoob-com";
$var_names = "google,taobao,runoob,weibo";
 
# 字符串转为数组
@string = split('-', $var_string);
@names  = split(',', $var_names);
 
# 数组转为字符串
$string1 = join( '-', @string );
$string2 = join( ',', @names );
 
print "$string1\n";
print "$string2\n";

%data = (-taobao => 45, -google => 30, -runoob => 40);
@array = @data{-taobao, -runoob};
print "Array : @array\n";

@names = keys %data;
 
print "$names[0]\n";
print "$names[1]\n";
print "$names[2]\n";

@urls = values %data;
 
print "$urls[0]\n";
print "$urls[1]\n";
print "$urls[2]\n";

# 添加元素
$data{'facebook'} = 'facebook.com';
@keys = keys %data;
$size = @keys;
print "2 - 哈希大小: $size\n";
 
# 删除哈希中的元素
delete $data{'taobao'};
@keys = keys %data;
$size = @keys;
print "3 - 哈希大小: $size\n";