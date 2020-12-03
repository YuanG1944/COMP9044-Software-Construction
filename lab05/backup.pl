#!/usr/bin/perl -w
use File::Copy ;
$file_name = $ARGV[0];

# $hide_file = "\.$file_name*";

# my @files = glob( $hide_file );
$n = 1;
sub copy_file{
    scalar(@_);
    copy("$_[0]",".$_[0].$_[1]") || warn "could not copy files :$!" ;
    print("Backup of \'$_[0]\' saved as \'.$_[0].$_[1]\'");
}

if( -e "$file_name"){
    for(;;){
        if( ! -e ".$file_name.0" ){
            copy_file($file_name, "0");
            last;
        }else{
            if(-e ".$ARGV[0].$n"){
                $n = $n + 1;
            }else{
                copy_file($file_name, $n);
                last;
            }
        }
    }
}
