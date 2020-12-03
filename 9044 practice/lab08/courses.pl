#!/usr/bin/perl -w
use LWP::Simple;

%res = ();

if($ARGV[0]){
    $name = $ARGV[0];
    $pageName = "$ARGV[0]KENS.html";
    $url = "http://www.timetable.unsw.edu.au/current/$pageName";
    # print("$url\n");
    $web_page = get("$url") or die "Unable to get $url";
    @sp_line = split("\n", $web_page);
    for $line (@sp_line){
        chomp $line;
        if($line =~ m/$name/){
            $line =~ s/<td class="data"><a href="//g;
            $line =~ s/<\/a><\/td>//g;
            $line =~ s/.html">/ /g;
            @code_name = split(" ", $line);
            if($code_name[0] ne $code_name[1]){
                $line =~ s/^\s+//;
                $res{$line}++;
            }
        }
    }
    foreach $key (sort keys %res){
        print("$key\n");
    }
}else{
    exit 1;
}
