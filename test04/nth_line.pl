#!/usr/bin/perl -w
open($file, '<', $ARGV[1]) or die "file '$ARGV[2]' Can not be opened $!";
$num = $ARGV[0];
@line=();
foreach $line (<$file>){
    push @arr, $line;
}
$size = @arr;
if($num <= $size){
    print($arr[$num - 1]);
}
close($ARGV[1]);
