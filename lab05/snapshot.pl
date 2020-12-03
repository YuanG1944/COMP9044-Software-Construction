#!/usr/bin/perl -w
use File::Copy;

#$_[0]:文件名 $_[1]:为循环第几次了 $_[2]:1为save 2为load
sub creat_file{
    scalar(@_);
    if($_[2] == 1){
        copy("$_[0]",".snapshot.$_[1]/$_[0]") || warn "could not copy files :$!" ;
    }else{
        move("$_[0]",".snapshot.$_[1]/$_[0]") || warn "could not copy files :$!" ;
    }
    # print("Creating snapshot $_[1]");
}

$dir_file = "\*";
@files = glob( $dir_file );

if($ARGV[0] =~ /^save$/){
    if( ! -e ".snapshot.0"){
        mkdir ".snapshot.0";
        foreach(@files){
            if ($_ !~ /.pl/){
                creat_file($_, "0", 1);
            }
        }
        print("Creating snapshot 0\n");
    }else{
        my $n = 0;
        for(;;){
            if(-e ".snapshot.$n"){
                $n = $n + 1;
            }else{
                mkdir ".snapshot.$n";
                last;
            }
        }
        foreach(@files){
            if ($_ !~ /.pl/){
                creat_file($_, $n, 1);
            }
        }
        print("Creating snapshot $n\n");
    }
}elsif($ARGV[0] =~ /^load$/){
    my $n = 0;
    for(;;){
        if(-e ".snapshot.$n"){
            $n = $n + 1;
        }else{
            mkdir ".snapshot.$n";
            last;
        }
    }
    foreach(@files){
        if ($_ !~ /.pl/){
            creat_file($_, $n, 2);
        }
    }
    print("Creating snapshot $n\n");

    $dir = ".snapshot.$ARGV[1]/*";
    @name = glob($dir);
    foreach(@name){
        copy("$_", ".") || warn "could not copy files :$!";
    }
    print("Restoring snapshot $ARGV[1]\n");
}