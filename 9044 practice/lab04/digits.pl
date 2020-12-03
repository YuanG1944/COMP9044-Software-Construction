#!/usr/bin/perl -w
while($readline = <STDIN>){
    $readline =~ tr/[0-4]/</;
    $readline =~ tr/[6-9]/>/;
    print($readline);
}

