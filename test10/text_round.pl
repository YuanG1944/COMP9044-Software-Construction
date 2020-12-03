#!/usr/bin/perl -w

while ($line = <>) {
    while ($line =~ /(\d+\.\d+)/){
        $rounded = sprintf("%.0f", $1);
        $line =~ s/(\d+\.\d+)/$rounded/
    }
    print "$line";
}
