#!/usr/bin/perl -w
$size = @ARGV;

if($size < 2){
    print("Usage: $0 <files>\n");
    exit 1;
    # die "Usage: $0 <files>\n";
}else{
    open($CMP, '<', $ARGV[0]);
    @comp = <$CMP>;
    $comp_size = @comp;
    close($CMP);

    foreach $name (@ARGV){
        open($file, '<', $name) or die "$name not exist\n";
        @line_arr = <$file>;
        $line_size =  @line_arr;
        # @line_arr = map split @line_arr;
        close($file);
        if($line_size != $comp_size){
            # die "$name is not identical\n";
            print("$name is not identical\n");
            exit 1;
        }elsif($line_size == $comp_size){
            for (0..$comp_size - 1){
                if ($comp[$_] != $line_arr[$_]){
                    print("$name is not identical\n");
                    exit 1;
                    # die "$name is not identical\n";
                }
            }
        }
    }
    print("All files are identical\n");
}