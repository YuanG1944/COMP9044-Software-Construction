#!/usr/bin/perl -w

#test sub3

$start = 0;
$finish = 10;
$val = 5;

$number = $start;
while ($number <= $finish) {
    if ($number + 1 <= $val) {    
        print "small $number\n";
    } elsif ($number + 1 == $val) {    
        print "equal $number\n";
    } else {
        print "big $number\n";
    }
    $number = $number + 1;
  # increment number
}