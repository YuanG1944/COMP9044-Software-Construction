#!/usr/bin/perl -w
@array = ();
while($line  = <>){
    push(@array, $line);
}
foreach $value (@array){
    if($value =~ /\#/){
        $value =~ /(\d+)/;
        $num = $1;
        print($array[$num - 1]);
    }else{
        print($value);
    }
}