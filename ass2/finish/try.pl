#!/usr/bin/perl -w

print "-n \"login:\" \n";
$name = <STDIN>;
chomp $name;
print "-n \"password:\"\n";
$passwd = <STDIN>;
chomp $passwd;
if ($name = "cht" && $passwd eq '"abc"') {
    print "the host and password is right!\n";
} else {
    print "input is error!\n";
}



# #deal with sub fuction, change $ARGV -> $_
# $count_f = 0;
# $fc_name = "_null";
# for(my $i = 0; $i < $fc_size; $i++){
#     if($file_content[$i] =~ /\{/){
#         $file_content[$i] =~ /(.*)\(\)(\s+|)\{/;
#         $fc_name = $1;
#         $count_f++;
#     }
#     if($file_content[$i] =~ /\}/){
#         $count_f--;
#     }
#     if($file_content[$i] =~ /ARGV/){
#         if($count_f > 0){
#             $file_content[$i] =~ s/ARGV/\_/g;
#         }
#     }
#     if($fc_name ne "_null" && $file_content[$i] =~ /$fc_name [^\{]/){
#         # $file_content[$i] =~ /$fc_name ([a-zA-Z0-9\"\'\s]+)[^or|^and]/;
#         if($file_content[$i] =~ /or|and/){
#             $file_content[$i] =~ /(\s+|)$fc_name ([a-zA-Z0-9\"\'\s]+) (or|and)(.*)/;
#             my $tmp = $2;
#             $tmp =~ s/ /, /g;
#             print("$tmp\n");
#         }else{
#             print("$file_content[$i]\n");
#         }
#     }
#     if($file_content[$i] =~ /([a-zA-Z0-9_]+)(\(\)) ({)/){
#         $file_content[$i] =~ /([a-zA-Z0-9_]+)(\(\)) ({)/;
#         $file_content[$i] =~ s/\(\)//g;
#         $file_content[$i] = "sub $file_content[$i]"
#     }
# }