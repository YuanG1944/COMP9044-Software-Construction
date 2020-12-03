#!/usr/bin/perl -w
@lines = <STDIN>;

$size = @lines;
while($size > 0){
    $rd = int(rand($size));
    print("$lines[$rd]");
    splice (@lines, $rd, 1);
    $size = @lines;
}