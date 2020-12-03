#!/usr/bin/perl -w
#!/usr/bin/perl -w
$dir = "./lyrics/*.txt";
%word_hash = ();
%count_hash = ();
@files = glob($dir);
foreach(@files){
    $word_count = 0;
    open(FILE, "<$_");
    while($readline = <FILE>){
        chomp $readline;
        @words = split(/[^A-Za-z]+/, $readline);
        foreach $value (@words){
            if($value =~ m/[A-Za-z]/){
                $value = lc $value;
                $word_count++;
                if(exists($word_hash{"$_"}{"$value"})){
                    my $num = $word_hash{"$_"}{"$value"};
                    $num += 1;
                    $word_hash{"$_"}{"$value"} = $num;
                }
                else{
                    $word_hash{"$_"}{"$value"} = 1;
                }
            }
        }
    }
    $count_hash{"$_"} = $word_count;
}

@num = keys %word_hash;
$size = @num;
print("$size\n");

foreach my $key1 (sort keys %word_hash){
    my $hash2 = $word_hash{$key1};
    print("$key1\n");
    $totalNum = $count_hash{"$key1"};
    print("$totalNum\n");
    foreach my $key2 (sort keys %$hash2){
        # print ($key1."\t".$key2."\t".$hash2->{$key2}."\n");
        $aimWord = $key2;
        # print("$aimWord\n");
    }
    print("$key1==================================\n");
}
