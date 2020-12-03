#!/usr/bin/perl -w
%word_map = ();
foreach $element (@ARGV){
    if(exists($word_map{"$element"})){
        next;
    }else{
        $word_map{"$element"} = 1;
    }
}

foreach $key (sort keys %word_map){
    print("$key ");
}
print("\n");
