#!/usr/bin/perl -w
# %hash_map_index = ();
%hash_map = ();
foreach $unname_aimWord (@ARGV){
    $unname_dir = "./$unname_aimWord";
    @unname_files = glob($unname_dir);
    foreach (@unname_files){
        if($_ =~ /$unname_aimWord/){
            $fileName = $_;
            open(FILE, "<$fileName");
            while($readline = <FILE>){
                chomp $readline;
                @words = split(/[^A-Za-z]+/, $readline);
                foreach $value (@words){
                    if($value =~ m/[A-Za-z]/){
                        $value = lc $value; 
                        if(exists($hash_map{"$fileName"}{"$value"})){
                            my $num = $hash_map{"$fileName"}{"$value"};
                            $num += 1;
                            $hash_map{"$fileName"}{"$value"} = $num;
                        }
                        else{
                            $hash_map{"$fileName"}{"$value"} = 1;
                        }
                    }
                }
            }
        }
    }
}

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


foreach my $key1 (sort keys %hash_map){
    my $hash2 = $hash_map{$key1};
    $dir = "./lyrics/*.txt";
    @files = glob($dir);
    @the_max = ();
    $the_max[0] = -1000000;
    $the_max[1] = "unknown";
    foreach(@files){
        $name = $_;
        # print("FILENAME: $_\n");
        $sum = 0;
        $word_count = $count_hash{"$_"};
        foreach my $key2 (sort keys %$hash2){
            $aim_count = 0;
            $aimWord = lc $key2;
            if(exists($word_hash{"$_"}{"$aimWord"})){
                $aim_count = $word_hash{"$_"}{"$aimWord"};
            }else{
                $aim_count = 0;
            } 

            $logNum = log(($aim_count + 1) / $word_count);
            $logNum = sprintf "%.4f",$logNum;
            $mutip = $hash2->{$key2};
            $logNum = $logNum * $mutip;
            $artist = $name;
            $artist =~ s/.\/lyrics\///g;
            $artist =~ s/.txt//g;
            $artist =~ s/_/ /g;
            $sum += $logNum;
        }
        $artist2 = $_;
        $artist2 =~ s/.\/lyrics\///g;
        $artist2 =~ s/.txt//g;
        $artist2 =~ s/_/ /g;
        if($sum > $the_max[0]){
            $the_max[0] = $sum;
            $the_max[1] = $artist2;
        }
    }
    $the_max[0] = sprintf "%.1f",$the_max[0];
    # print("++++++++++++++sum: $the_max[0]  $the_max[1]\n");
    $key1 =~ s/\.\///g;
    # print("$key1==================================\n");
    print("$key1 most resembles the work of $the_max[1] (log-probability=$the_max[0])\n");
}
