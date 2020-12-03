#!/usr/bin/perl -w

$num = shift @ARGV;
%file_map = ();
$count = 0;
$total = 0;
while(defined($line = <>)){
    $total++;
    chomp $line;
    $line =~ s/\s//g;
    $line = lc $line;
    $file_map{$line}++;
    if($file_map{$line} == 1){
        $count++;
    }
    if($count == $num){
        print("$num distinct lines seen after $total lines read.\n");
        exit 0;
    }
}
print "End of input reached after $total lines read - $num different lines not seen.\n" if not defined $line;