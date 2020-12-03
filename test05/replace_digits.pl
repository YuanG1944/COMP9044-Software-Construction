#!/usr/bin/perl -w
open($file, '<', $ARGV[0]);
@line_arr = <$file>;
close($file);


open($output, '>', $ARGV[0]);

foreach $word (@line_arr){
    $word =~ s/[0-9]/#/g;
    print $output $word; 
}
close($output);