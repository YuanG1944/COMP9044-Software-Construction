#!/bin/usr/perl -w

@files1 = glob( "./*" );

foreach $filename ( @files1 ){
    print("$filename");
}