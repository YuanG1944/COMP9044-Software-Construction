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
    $num = $aim_count / $word_count;
    $num=sprintf "%.9f",$num;
    $artist = $_;
    $artist =~ s/.\/lyrics\///g;
    $artist =~ s/.txt//g;
    $artist =~ s/_/ /g;
    print("$aim_count / $word_count = $num $artist\n");
}