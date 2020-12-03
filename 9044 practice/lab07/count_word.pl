#!/usr/bin/perl -w
$aimWord = $ARGV[0];
# $fileName = $ARGV[1];
# print("$aimWord\n");
# print("$fileName\n");
$count = 0;
while($readline = <STDIN>){
    chomp $readline;
    # print($readline);
    @words = split(/[^A-Za-z]+/, $readline);
    foreach $value (@words){
        $word = lc $value;
        if($word =~ /^$aimWord$/){
            $count++;
        }
    }
}
print("$aimWord occurred $count times\n");