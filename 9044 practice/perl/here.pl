#!/usr/bin/perl

$a = 10;
$var = <<"ABC";  #开头结尾一致就可以
这是一个 Here 文档实例，使用双引号。\n
可以在这输如字符串和变量。
例如：a = $a
ABC
#此处必须单独一行且不加;
print "$var\n";
 
$var = <<'EOF';
这是一个 Here 文档实例，使用单引号。\n
例如：a = $a
EOF
print "$var\n";

$result = "菜鸟教程 \"runoob\"";
print "$result\n";
print "\$result\n";

# 换行 \n 位于双引号内，有效
$str = "菜鸟教程  \nwww.runoob.com";
print "$str\n";
 
# 换行 \n 位于单引号内，无效
$str = '菜鸟教程  \nwww.runoob.com';
print "$str\n";
 
# 只有 R 会转换为大写
$str = "\urunoob";
print "$str\n";
 
# 所有的字母都会转换为大写
$str = "\Urunoob";
print "$str\n";
 
# 指定部分会转换为大写
$str = "Welcome to \Urunoob\E.com!"; 
print "$str\n";
 
# 将到\E为止的非单词（non-word）字符加上反斜线
$str = "\QWelcome to runoob's family";
print "$str\n";