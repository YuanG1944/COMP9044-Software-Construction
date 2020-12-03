#!/usr/bin/perl -w

%o_map = ();
$main = "";
$dir_c = "*.c";
@files_c = glob($dir_c);
$ifcount = 0;

foreach my $val (@files_c){
    $o_map{$val} = {};
    # print("$val\n");
    # print("$o_map{$val}\n");
}

#bfs
foreach my $val (keys %o_map){
    my @queue = ();
    push @queue, $val;
    while(@queue){
        my $tmp = shift @queue;
        # print("$tmp\n");
        open(my $files, "<$tmp") or die "Can't open $!";
        @file_content = (<$files>);
        close $files;
        while(@file_content){
            my $readline = shift @file_content;
            # print("$readline\n");
            # if($readline =~ /\#ifdef/){
            #     $ifcount++;
            # }
            # if($readline =~ /\#endif/){
            #     $ifcount--;
            # }
            chomp($readline);
            if($ifcount == 0){
                if($readline =~ /\#include "(.*)"/){
                    $readline =~ /\#include "(.*)"/;
                    $name = $1;
                    $o_map{"$val"}{"$name"}++;
                    if($o_map{"$val"}{"$name"} == 1){
                        push @queue, $name;
                    }
                    # print("$1 ");
                }elsif($readline =~ /^\s*(int|void)\s*main\s*\(/){
                    my $tmpval = $val;
                    $tmpval =~ s/\.c//g;
                    $main = $tmpval;
                }
            }
        }
    }
    # print("\n");
}

#output the result=========================================================
print("\# Makefile generated at ");
system "date";
print("\nCC = gcc\n");
print("CFLAGS = -Wall -g\n\n");

print("$main:  ");
foreach my $key (sort keys %o_map){
    my $ofile = $key;
    $ofile =~ s/\.c/\.o/g;
    print("$ofile ");
}
print("\n");
print("\t\$(CC) \$(CFLAGS) -o \$\@ ");
foreach my $key (sort keys %o_map){
    my $ofile = $key;
    $ofile =~ s/\.c/\.o/g;
    print("$ofile ");
}
print("\n\n");
foreach my $key (keys %o_map){
    my $hash2 = $o_map{$key};
    $a = scalar(keys %$hash2);
    if($a > 0){
        $ofile = $key;
        $ofile =~ s/\.c/\.o/g;
        print("$ofile: $key ");
        foreach my $key2 (keys %$hash2){
            print("$key2 ");
        }
        print("\n");
    }
}