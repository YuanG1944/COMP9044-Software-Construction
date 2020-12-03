#!/usr/bin/perl -w
# %word_map = ();
$arg = shift @ARGV;
# print("$arg\n");
# @nums = split(/[a-zA-Z]/, $arg);
# @word = split(/[0-9]/, $arg);
# print("$nums[0]\n");
# print("$word[1]\n");

while($line = <>){
    chomp $line;
    $word_map{"$line"}++;
    foreach $_ (keys %word_map){
        if($word_map{$line} == $arg){
            # print("\n");
            print("Snap: $line\n");
            exit 0;
        }
    }
}
