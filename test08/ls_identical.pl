#!/usr/bin/perl -w
use File::Compare;

$dir1=$ARGV[0];
$dir2=$ARGV[1];
%map = ();
@arr = ();

@files1 = glob( "$dir1/*" );

foreach (@files1 ){
    $_ =~ s/$dir1\///g;
    $map{$_}++;
}

@files2 = glob( "$dir2/*" );

foreach (@files2 ){
    $_ =~ s/$dir2\///g;
    $map{$_}++;
}

foreach (keys %map){
    $value = $map{$_};
    if($value  == 2 ){
        if (compare("$dir1/$_", "$dir2/$_") == 0){
            push @arr, $_;
        }
    }
}

foreach (sort @arr){
    print("$_\n");
}