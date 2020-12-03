#!/usr/bin/perl -w
$dir = "./lyrics/*.txt";
$aimWord = lc $ARGV[0];
@files = glob($dir);
foreach (@files ){
    $word_count = 0;
    $aim_count = 0;
    open(FILE, "<$_");
    while($readline = <FILE>){
        chomp $readline;
        @words = split(/[^A-Za-z]+/, $readline);
        foreach $value (@words){
            if($value =~ m/[A-Za-z]/){
                $word_count++;
            }
            $word = lc $value;
            if($word =~ /^$aimWord$/){
            $aim_count++;
            }
        }
    }
    close(FILE);
    $logNum = log(($aim_count + 1) / $word_count);
    $logNum = sprintf "%.4f",$logNum;
    $artist = $_;
    $artist =~ s/.\/lyrics\///g;
    $artist =~ s/.txt//g;
    $artist =~ s/_/ /g;
    print("log(($aim_count+1)/ $word_count) = $logNum $artist\n");
}