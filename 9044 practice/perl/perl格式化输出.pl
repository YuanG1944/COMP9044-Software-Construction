#!/usr/bin/perl -w
# $text = "google ruunboon tapbao";

# format STDOUT =
# first: ^<<<<<
#     $text
# ^<<<<<<<<
#     $text
# ^<<<<<
#     $text
# .
# write
format EMPLOYEE_TOP =
======================================
Name       Age             Page @<
                                $%
======================================
.

format EMPLOYEE =
======================================
@<<<<< @>>>>>
$name, $age
@####.##
$salary
======================================
.


select(STDOUT);
$~ = EMPLOYEE;
$^ = EMPLOYEE_TOP;
@n = ("Ali", "Runoob", "Jaffter");
@a = (20, 30, 40);
@s = (2000.00, 2500.00, 4000.000);

$i = 0;
$size = @n;
for($i = 0; $i < @n; $i++){
    $name = $n[$i];
    $age = $a[$i];
    $salary = $s[$i];
    write;
}

# foreach (@n){
#     $name = $_;
#     $age = $a[$i];
#     $salary = $s[$i];
#     $i++;
#     write;
# }