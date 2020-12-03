#!/usr/bin/perl -w
$none = "/dev/null";
if($ARGV[0] ne $none){
    open(FILE, "<$ARGV[0]");
    @contents = <FILE>;
    close(FILE);
    $size = @contents;

    if($size % 2 == 0){
        $mid = $size / 2;
        print($contents[$mid - 0.5]);
        print($contents[$mid + 0.5]);
    }else{
        $mid = $size / 2;
        print($contents[$mid]);
    }
}
