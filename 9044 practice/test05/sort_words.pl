#!/usr/bin/perl -w

while($readline = <STDIN>){
    chomp $readline;
    @unsorted = split(/ /, $readline);
    @sorted = sort { $a cmp $b } @unsorted;
    $output = join " ", @sorted;
    print("$output\n");
}
