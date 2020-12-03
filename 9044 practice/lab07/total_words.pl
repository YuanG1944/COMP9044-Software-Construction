#!/usr/bin/perl -w
$count = 0;
while($readline = <>){
    chomp $readline;
    @words = split(/[^A-Za-z]+/, $readline);
    foreach $value (@words){
        if($value =~ m/[A-Za-z]/){
            $count++;
        }
    }
}
print("$count words\n");