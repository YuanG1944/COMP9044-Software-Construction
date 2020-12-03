#!/usr/bin/perl -w
@contents = @ARGV;
%word_map = ();
@res = ();

foreach $value (@contents){
    if(exists($word_map{$value})){
        next;
    }else{
        $word_map{$value}++;
        push @res, $value;
    }
}

$result = join(" ", @res);
print("$result\n");
