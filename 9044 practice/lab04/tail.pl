#!/usr/bin/perl -w

if(defined $ARGV[0]){
    $p = 0;
    $n = 10;
    $acsize = @ARGV;

    if($acsize > 1 && $ARGV[0] =~ /^-[0-9]/){
        $n = $ARGV[0];
        chomp $n;
        $n = -$n;
        $p = 1;
    }

    if($acsize - $p < 2){
        open(DATA, '<', $ARGV[$p]) or die "./tail.pl: can't open $ARGV[$p]\n";
        @lines = <DATA>;
        $size = @lines;
        $loop = $n < $size ? $n : $size;
        for($i = $loop; $i > 0; $i--){
            print("$lines[$size - $i]")
        }
        close(DATA);
    }else{
        foreach $num ($p .. $#ARGV) {
            open(DATA, '<', $ARGV[$num]) or die "./tail.pl: can't open $ARGV[$num]\n";
            @lines = <DATA>;
            $size = @lines;
            # print("$size\n");
            $loop = $n < $size ? $n : $size;
            print("==> $ARGV[$num] <==\n");
            for($i = $loop; $i > 0; $i--){
                print("$lines[$size - $i]")
            }
            close(DATA);
        }
    }
}else{
    @lines = <STDIN>;
    $size = @lines;
    $loop = 10 < $size ? 10 : $size;
    for($i = $loop; $i > 0; $i--){
            print("$lines[$size - $i]")
    }
}
