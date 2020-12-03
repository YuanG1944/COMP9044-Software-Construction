#!/usr/bin/perl -w
$name = shift @ARGV;
$file_name = shift @ARGV;

open(my $files, "<$file_name") or die "Can't open $!";
@file_content = (<$files>);
close $files;

$count = 0;
@content = ();

while(@file_content){
    my $readline = shift @file_content;
    if($readline =~ /{/ ){
        $count++;
    }
    if($readline =~ /}/){
        $count--;
    }
    if($count > 0){
        push @content, $readline;
    }
}

$len = scalar(@content);
$res = 0;
for($i = 0; $i < $len; $i++){
    if($content[$i] =~ /$name/){
        $a = $content[$i - 1];
        $a =~ /\"how_many\"\: (.*),/;
        $num = $1;
        $res += $num;
    }
}

print("$res\n");