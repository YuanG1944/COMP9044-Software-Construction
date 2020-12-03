#!/usr/bin/perl -w
if(defined $ARGV[0]){
    $num = $ARGV[0];
}else{
    die "Usage: ./echon.pl <number of lines> <string>\n";
}
if(!defined $ARGV[1]){
    die "Usage: ./echon.pl <number of lines> <string>\n";
}

if($ARGV[2]){
    die "Usage: ./echon.pl <number of lines> <string>\n";
}

if($num =~ /^[0-9]/){
    chomp $num;
}else{
    die "./echon.pl: argument 1 must be a non-negative integer\n";
}

while($num){
    print("$ARGV[1]\n");
    $num--;
}