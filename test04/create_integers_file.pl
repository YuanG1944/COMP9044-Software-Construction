#!/usr/bin/perl -w
open(my $file, '>', $ARGV[2]) or die "file '$ARGV[2]' Can not be opened $!";

for($i = $ARGV[0]; $i <= $ARGV[1]; $i = $i + 1){
    print($file "$i\n");
}
close($file);