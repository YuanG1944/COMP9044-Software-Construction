#!/usr/bin/perl -w
@arr = @ARGV;
$size = @arr;
$mid = $size / 2 + 0.5;
@arr_sort = sort { $a <=> $b } (@arr);

foreach $value (@arr_sort){
    $mid--;
    if($mid == 0){
        print("$value\n");
    }
}