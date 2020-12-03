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

# $dir = "./lyrics/*.txt";
# @files = glob($dir);
# foreach(@files){
#     $sum = 0;
#     open(FILE, "<$_");
#     foreach my $key1 (keys %hash_map){
#         my $hash2 = $hash_map{$key1};
#         foreach my $key2 (keys %$hash2){
#             $word_count = 0;
#             $aim_count = 0;
#             # print ($key1."\t".$key2."\t".$hash2->{$key2}."\n");
#             $aimWord = $key2;
#             while($readline = <FILE>){
#                 chomp $readline;
#                 @words = split(/[^A-Za-z]+/, $readline);
#                 foreach $value (@words){
#                     if($value =~ m/[A-Za-z]/){
#                         $word_count++;
#                     }
#                     $word = lc $value;
#                     if($word =~ /^$aimWord$/){
#                         $aim_count++;
#                     }
#                 }
#             }
#             $mutip = $hash2->{$key2};
#             $num = $aim_count / $word_count;
#             $num = $num * $mutip;
#             $sum += $num;
#         }
#         print("$key1==================================\n");
#     }
# }

foreach my $key1 (sort keys %hash_map){
    my $hash2 = $hash_map{$key1};
    $dir = "./lyrics/*.txt";
    @files = glob($dir);
    @the_max = ();
    $the_max[0] = -100000;
    $the_max[1] = "unknown";
    foreach(@files){
        $name = $_;
        # print("FILENAME: $_\n");
        $sum = 0;
        foreach my $key2 (sort keys %$hash2){
            $word_count = 0;
            $aim_count = 0;
            # print("key2: $key2\n");
            open(FILE, "<$name");
            # print ($key1."\t".$key2."\t".$hash2->{$key2}."\n");
            $aimWord = lc $key2;
            # print("666666666666:$aimWord\n");
            while($readline = <FILE>){
                chomp $readline;
                @words = split(/[^A-Za-z]+/, $readline);
                foreach $value (@words){
                    if($value =~ m/[A-Za-z]/){
                        $word_count++;
                    }
                    $word = lc $value;
                    if($word =~ /^$aimWord$/){
                        $aim_count++;
                        # print($aim_count);
                    }
                }
            }
            close(FILE);
            $logNum = log(($aim_count + 1) / $word_count);
            $logNum = sprintf "%.4f",$logNum;
            $mutip = $hash2->{$key2};
            # print("key +++++++++++ $mutip\n");
            $logNum = $logNum * $mutip;
            $artist = $name;
            $artist =~ s/.\/lyrics\///g;
            $artist =~ s/.txt//g;
            $artist =~ s/_/ /g;
            # print("log(($aim_count+1)/ $word_count) = $logNum $artist\n");
            $sum += $logNum;
            # $sum = sprintf "%.1f",$sum;
            # print("$sum\n");
        }
        $artist2 = $_;
        $artist2 =~ s/.\/lyrics\///g;
        $artist2 =~ s/.txt//g;
        $artist2 =~ s/_/ /g;
        if($sum > $the_max[0]){
            $the_max[0] = $sum;
            $the_max[1] = $artist2;
        }
        # print("++++++++++++++sum: $sum\n");
    }
    $the_max[0] = sprintf "%.1f",$the_max[0];
    # print("++++++++++++++sum: $the_max[0]  $the_max[1]\n");
    $key1 =~ s/\.\///g;
    # print("$key1==================================\n");
    print("$key1 most resembles the work of $the_max[1] (log-probability=$the_max[0])\n");
}


# foreach my $key1 (keys %hash_map){
#     my $hash2 = $hash_map{$key1};
#     foreach my $key2 (sort keys %$hash2){
#         # print ($key1."\t".$key2."\t".$hash2->{$key2}."\n");
#         $aimWord = $key2;
#         print("$aimWord\n");
#     }
#     print("$key1==================================\n");
# }