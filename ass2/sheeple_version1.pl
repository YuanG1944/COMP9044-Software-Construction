#!/usr/bin/perl -w

$sh_fileName = $ARGV[0];

#$_[0]->@readline
sub echof{
    if($_[0] =~ /(.*)(\s+)(\#)(.*)/){
        ($_[0], $note) = annotation($_[0]);
    }
    if(!$note){
        $note = "";
    }
    chomp($note);
    $_[0] =~ /(\s+|)echo(\s|)(.*|)/;
    $content = $3;
    if($content =~ /^(\')/){
        $content =~ s/^(\')//g;
        $content =~ s/(\')$//g;
    }elsif($content =~ /^(\")/){
        $content =~ s/^(\")//g;
        $content =~ s/(\")$//g;
    }
    $content =~ s/\"/\\\"/g;
    $_[0] =~ /(\s+|)echo(\s|)(.*|)/;
    print("$1print \"$content\\n\";$note\n");
    $note = "";
}

#$_[0]->@readline
sub sys{
    if($_[0] =~ /(.*)(\s+)(\#)(.*)/){
        ($_[0], $note) = annotation($_[0]);
    }
    if(!$note){
        $note = "";
    }
    chomp($note);
    $_[0] =~ /(\s+|)(ls|pwd|id|date)(\s|)(.*|)/;
    print("$1system \"$2$3$4\";$note\n");
    $note = "";
}

#$_[0]->@readline
sub valuation{
    if($_[0] =~ /(.*)(\s+)(\#)(.*)/){
        ($_[0], $note) = annotation($_[0]);
    }
    if(!$note){
        $note = "";
    }
    chomp($note);
    $_[0] =~ /(\s+|)(.*)=(.*)/;
    $l = $2;
    $r = $3;
    if($r =~ /^\$/){
        $r = $r;
    }else{
        $r = "\'$r\'";
    }
    $_[0] =~ /(\s+|)(.*)=(.*)/;
    print("$1\$$l = $r;$note\n");
    $note = "";
}

#$_[0]->@readline
sub cdf{
    if($_[0] =~ /(.*)(\s+)(\#)(.*)/){
        ($_[0], $note) = annotation($_[0]);
    }
    if(!$note){
        $note = "";
    }
    chomp($note);
    $_[0] =~ /(\s+|^)cd(\s|)(.*)/;
    print("$1chdir \'$3\';$note\n");
    $note = "";
}

#$_[0]->@readline
sub exitf{
    if($_[0] =~ /(.*)(\s+)(\#)(.*)/){
        ($_[0], $note) = annotation($_[0]);
    }
    if(!$note){
        $note = "";
    }
    chomp($note);
    $_[0] =~ /(\s+|)(exit)(\s|)(.*)/;
    print("$1$2 $4;$note\n");
    $note = "";
}

#$_[0]->@readline
sub readf{
    $_[0] =~ /(\s+|)(read)(\s|)(.*)/;
    print("$1\$$4 = <STDIN>;\n");
    print("$1chomp \$$4;\n");
}

#$_[0]->@readline
sub annotation{
    if($_[0] !~ /\#\!\/bin\/dash/){
        $_[0] =~ /(.*)(\s+)(\#)(.*)/;
        return "$1", "$2$3$4\n";
    }
}

#$_[0]->@readline
sub argvf{
    if($_[0] =~ /\$([0-9]+)(\s|$)/){
        $_[0] =~ /\$([0-9]+)/;
        $val = $1 - 1;
        $_[0] =~ s/\$[1-9]+/\$ARGV[$val]/g;
    }
    return $_[0];
}

#$_[0]->@readline
sub forf{
    $_[0] =~ /(\s+|)for (.*) in (.*)/;
    $a = $2;
    $b = $3;
    if($b =~ /^(\*)/){
        $b = "glob(\"$b\")";
    }else{
        @b = split(" ", $b);
        foreach $i (@b){
            if($i =~ /[a-zA-Z]/){
                $i = "\'$i\'";
            }
        }
        $b = join(", ", @b);
    }
    $_[0] =~ /(\s+|)for (.*) in (.*)/;
    print("$1foreach \$$a ($b) {\n");
}

sub whilef{
    if($_[0] =~ /(\s+|^)(while) test (.*) (.*) (.*)/){
        $_[0] =~ /(\s+|^)(while) test (.*) (.*) (.*)/;
        $f = $2;
        $a = "$3";
        $b = "$5";
        $op = $4;
        $op =~ s/-eq/==/g;
        $op =~ s/-ne/!=/g;
        $op =~ s/-gt/>/g;
        $op =~ s/-ge/>=/g;
        $op =~ s/-lt/</g;
        $op =~ s/-le/<=/g;
        $_[0] =~ /(\s+|^)(while) test (.*) (.*) (.*)/;
        print("$1$f ($a $op $b) {\n");
    }
}

#$_[0]->#$_[0]
sub iftest_3f{
    if($_[0] =~ /(\s+|^)(if) test (.*) (.*) (.*)/){
        $_[0] =~ /(\s+|)(if) test (.*) (.*) (.*)/;
        $f = $2;
        $a = "\'$3\'";
        $b = "\'$5\'";
        $op = $4;
        $op =~ s/=/eq/g;
        $op =~ s/!=/ne/g;
        $_[0] =~ /(\s+|)(if) test (.*) (.*) (.*)/;
        print("$1$f ($a $op $b) {\n");
    }elsif($_[0] =~ /(\s+|^)(elif) test (.*) (.*) (.*)/){
        $_[0] =~ /(\s+|^)(elif) test (.*) (.*) (.*)/;
        $a = "\'$3\'";
        $b = "\'$5\'";
        $f = $2;
        $op = $4;
        $f =~ s/elif/elsif/g;
        $op =~ s/=/eq/g;
        $op =~ s/!=/ne/g;
        $_[0] =~ /(\s+|)(elif) test (.*) (.*) (.*)/;
        print("$1} $f ($a $op $b) {\n");
    }
}

#$_[0]->#$_[0]
sub iftest_2f{
    if($_[0] =~ /(\s+|^)(if) test (.*) (.*)/){
        $_[0] =~ /(\s+|)(if) test (.*) (.*)/;
        $f = $2;
        $a = "$3";
        $b = "\'$4\'";
        print("$1$f ($a $b) {\n");
    }elsif($_[0] =~ /(\s+|^)(elif) test (.*) (.*)/){
        $_[0] =~ /(\s+|^)(elif) test (.*) (.*)/;
        $a = "$3";
        $b = "\'$4\'";
        $f = $2;
        $f =~ s/elif/elsif/g;
        $_[0] =~ /(\s+|^)(elif) test (.*) (.*)/;
        print("$1} $f ($a $b) {\n");
    }
}

#$_[0]->#$_[0]
sub if_bracketf{
    if($_[0] =~ /(\s+|^)(if) \[ (.*) (.*) \]/){
        $_[0] =~ /(\s+|^)(if) \[ (.*) (.*) \]/;
        $f = $2;
        $a = "$3";
        $b = "\'$4\'";
        print("$1$f ($a $b) {\n");
    }elsif($_[0] =~ /(\s+|^)(elif) \[ (.*) (.*) \]/){
        $_[0] =~ /(\s+|^)(elif) \[ (.*) (.*) \]/;
        $a = "$3";
        $b = "\'$4\'";
        $f = $2;
        $f =~ s/elif/elsif/g;
        $_[0] =~ /(\s+|^)(elif) \[ (.*) (.*) \]/;
        print("$1} $f ($a $b) {\n");
    }
}


#==================================================================================================================


sub oneLineOpt{
    #echo->print
    if($_[0] =~ /(\s+|^)echo(\s|)(.*|)/){
        echof($_[0]);
    #sys
    }elsif($_[0] =~ /(\s+|^)(ls|pwd|id|date)(\s|)(.*|)/){
        sys($_[0]);
    #valuation
    }elsif($_[0] =~ /([0-9a-zA-Z_]+)=(.*)/){
        valuation($_[0]);
    #cd
    }elsif($_[0] =~ /(\s+|^)cd(\s|)(.*|)/){
        cdf($_[0]);
    }elsif($_[0] =~ /(\s+|^)exit(\s|)(.*|)/){
        exitf($_[0]);
    }elsif($_[0] =~ /(\s+|^)read(\s|)(.*|)/){
        readf($_[0]);
    }
}

#$_[0]->$readline $_[1]->$content_ptr $_[2]->$forcount
sub forLineOpt{
    while(1){
        $_[0] = shift @{$_[1]};
        $_[0] = argvf($_[0]);
        if($_[0] =~ /^(\s+|)for/){
            $_[2]++;
            forf($_[0]);
        }
        # print("$forline");
        oneLineOpt($_[0]);
        if($_[0] =~ /^(\s+|)done/){
            $_[0] =~ /(\s+|)done/;
            print("$1}\n");
            $_[2]--;
        }
        if($_[2] == 0){
            last;
        }   
    }
}

sub whileLineOpt{
    while(1){
        $_[0] = shift @{$_[1]};
        $_[0] = argvf($_[0]);
        if($_[0] =~ /^(\s+|)while/){
            $_[2]++;
            whilef($_[0]);
        }
        # print("$forline");
        oneLineOpt($_[0]);
        if($_[0] =~ /^(\s+|)done/){
            $_[0] =~ /(\s+|)done/;
            print("$1}\n");
            $_[2]--;
        }
        if($_[2] == 0){
            last;
        }   
    }
}

sub iff{
    # @arr = ();
    if($_[0] =~ /(\s+|^)(if|elif) test (.*) (.*) (.*)/){
        # print("3333333\n");
        iftest_3f($_[0]);
    }elsif($_[0] =~ /(\s+|^)(if|elif) test (.*) (.*)/){
        # print("222222222\n");
        iftest_2f($_[0]);
    }elsif($_[0] =~ /(\s+|^)(if|elif) \[ (.*) (.*) \]/){
        # print("[][][][][][]\n"); 
        if_bracketf($_[0]);
    }elsif($_[0] =~ /(\s+|^)else/){
        $_[0] =~ /(\s+|^)else/;
        print("$1} else {\n");
    }
}

#$_[0]->$readline $_[1]->$content_ptr $_[2]->$ifcount
sub ifLineOpt{
    $elifcount = 0;
    while(1){
        $_[0] = shift @{$_[1]};
        $_[0] = argvf($_[0]);
        if($_[0] =~ /^(\s+|)if/){
            $_[2]++;
        }
        if($_[0] =~ /^(\s+|)elif/){
            $elifcount = $_[2];
        }
        if($elifcount > 0){
            $_[0] = "    $_[0]";
        }
        iff($_[0]);
        # print("$forline");
        oneLineOpt($_[0]);
        if($_[0] =~ /^(\s+|)fi/){
            $_[0] =~ /(\s+|)fi/;
            print("$1}\n");
            $_[2]--;
        }
        if($_[2] == 0){
            last;
        }   
    }
}


#==================================================================================================================
print("#!/usr/bin/perl -w\n");
open(my $files, "<$sh_fileName") or die "Can't open $!";
@file_content = (<$files>);
close $files;
$forcount = 0;
$ifcount = 0;

while(@file_content){
    my $readline = shift @file_content;
    $readline = argvf($readline);
    # annotation($readline);
    # chomp $readline;
    if($readline =~ /\#/){
        my $tmp = $readline;
        $tmp=~s/^ +//;
        if($readline =~ /^\#/){
            if($readline !~ /\#\!\/bin\/dash/){
                print("$readline");
                next;
            }
        }
    }
    if($readline =~ /^\n/){
        print("\n");
    }elsif($readline =~ /^(\s+|^)for/){
        unshift @file_content, $readline;
        $content_ptr = \@file_content; 
        forLineOpt($readline, $content_ptr, $forcount);
    }elsif($readline =~ /^(\s+|^)if/){
        unshift @file_content, $readline;
        $content_ptr = \@file_content; 
        ifLineOpt($readline, $content_ptr, $ifcount);
    }elsif($readline =~ /^(\s+|^)while/){
        unshift @file_content, $readline;
        $content_ptr = \@file_content; 
        whileLineOpt($readline, $content_ptr, $ifcount);
    }else{
        oneLineOpt($readline);
    }
}