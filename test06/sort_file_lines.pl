#!/usr/bin/perl -w

@contents = ();

sub compare{
    return length $a <=> length $b || $a cmp $b;
}
# print("$ARGV[0]")
open(FILE, "<$ARGV[0]");
@contents = <FILE>;
close(FILE);


# print(@contents);
@res = sort compare @contents;

foreach $line (@res){
    print($line);
}

