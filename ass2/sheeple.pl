#!/usr/bin/perl -w
#Read in file
$sh_fileName = $ARGV[0];

#echo->print
#$_[0]->@readline
sub echof{
    if(${$_[0]} =~ /(.*)(\s+)(\#)(.*)/){
        (${$_[0]}, $note) = annotation(${$_[0]});
    }
    if(!$note){
        $note = "";
    }
    chomp($note);
    if(${$_[0]} =~ /(.*[^\s]+)(\s+|)echo(\s|)(.*|)/){
        ${$_[0]} =~ /(.*[^\s]+)(\s+|)(echo)(\s|)(.*|)/;
        $front = $1;
        ${$_[0]} = "$3$4$5";
    }
    if(${$_[0]} =~ /(\s+|)echo(\s|)(.*|) (>>)(.*)/){
        ${$_[0]} =~ /(\s+|)echo(\s|)(.*|) (>>)(.*)/;
        $content = $3;
        ${$_[0]} = "$1open F, '$4', $5 or die;
    print F \"$content\\n\";$note
    close F;\n";
    }elsif(${$_[0]} =~ /(\s+|)echo(\s|)(.*|) (>)(.*)/){
        ${$_[0]} =~ /(\s+|)echo(\s|)(.*|) (>>)(.*)/;
        $content = $3;
        ${$_[0]} = "$1open F, '$4', $5 or die;
    print F \"$content\\n\";$note
    close F;\n";
    }else{
        ${$_[0]} =~ /(\s+|)echo(\s|)(.*|)/;
        $content = $3;
        if($content =~ /^(\')/){
            $content =~ s/^(\')//g;
            $content =~ s/(\')$//g;
        }elsif($content =~ /^(\")/){
            $content =~ s/^(\")//g;
            $content =~ s/(\")$//g;
        }
        $content =~ s/\"/\\\"/g;
        ${$_[0]} =~ /(\s+|)echo(\s|)(.*|)/;
        # ${$_[0]} = "$1print \"$content\\n\";$note\n";
        if(!$front){
            ${$_[0]} = "$1print \"$content\\n\";$note\n";
        }else{
            ${$_[0]} = "$front $1print \"$content\\n\";$note\n";
        }
        # print("$1print \"$content\\n\";$note\n");
    }
    
    $note = "";
    $front = "";
}

#local->my
#$_[0]->@readline
sub localf{
    if(${$_[0]} =~ /(.*)(\s+)(\#)(.*)/){
        (${$_[0]}, $note) = annotation(${$_[0]});
    }
    if(!$note){
        $note = "";
    }
    chomp($note);
    if(${$_[0]} =~ /(.*[^\s]+)(\s+|)local(\s|)(.*|)/){
        ${$_[0]} =~ /(.*[^\s]+)(\s+|)(local)(\s|)(.*|)/;
        $front = $1;
        ${$_[0]} = "$3$4$5";
    }
    ${$_[0]} =~ /(\s+|)(local)(\s|)(.*)/;
    $value = $4;

    my @b = split(" ", $value);
    foreach my $i (@b){
        if($i =~ /[a-zA-Z]/){
            $i = "\$$i";
        }
    }
    $value = join(", ", @b);

    ${$_[0]} =~ /(\s+|)(local)(\s|)(.*|)/;
    # ${$_[0]} = "$1print \"$content\\n\";$note\n";
    if(!$front){
        ${$_[0]} = "$1my ($value);$note\n";
    }else{
        ${$_[0]} = "$front $1my ($value);$note\n";
    }
    # print("$1print \"$content\\n\";$note\n");
    $note = "";
    $front = "";
}

#(ls|pwd|id|date|rm|fgrep|chmod) add system();
#$_[0]->@readline
sub sys{
    chomp(${$_[0]});
    if(${$_[0]} =~ /(.*)(\s+)(\#)(.*)/){
        (${$_[0]}, $note) = annotation(${$_[0]});
    }
    if(!$note){
        $note = "";
    }
    chomp($note);

    if(${$_[0]} =~ /(.*[^\s]+)(\s+|)(ls|pwd|id|date|rm|fgrep|chmod)(\s|)(.*|)/){
        ${$_[0]} =~ /(.*[^\s]+)(\s+|)(ls|pwd|id|date|rm|fgrep|chmod)(\s|)(.*|)/;
        $front = $1;
        ${$_[0]} = "$3$4$5";
    }
    ${$_[0]} =~ /(\s+|)(ls|pwd|id|date|rm|fgrep|chmod)(\s|)(.*|)/;
    ${$_[0]} = "$1system \"$2$3$4\";$note\n";
    if(!$front){
        ${$_[0]} = "$1system \"$2$3$4\";$note\n";
    }else{
        ${$_[0]} = "$front $1system \"$2$3$4\";$note\n";
    }
    # print("$1system \"$2$3$4\";$note\n");
    $note = "";
    $front = "";
}

#a=$b -> $a = $b
#$_[0]->@readline
sub valuation{
    if(${$_[0]} =~ /(.*)(\s+)(\#)(.*)/){
        (${$_[0]}, $note) = annotation(${$_[0]});
    }
    if(!$note){
        $note = "";
    }
    chomp($note);
    ${$_[0]} =~ /(\s+|)(.*)=(.*)/;
    $l = $2;
    $r = $3;
    if($r =~ /^[a-zA-Z\.\/]+/){
        $r = "\'$r\'";
    }else{
        $r = $r;
    }
    ${$_[0]} =~ /(\s+|)(.*)=(.*)/;
    ${$_[0]} = "$1\$$l = $r;$note\n";
    # print("$1\$$l = $r;$note\n");
    $note = "";
}

#cd->chdir
#$_[0]->@readline
sub cdf{
    if(${$_[0]} =~ /(.*)(\s+)(\#)(.*)/){
        (${$_[0]}, $note) = annotation(${$_[0]});
    }
    if(!$note){
        $note = "";
    }
    chomp($note);
    # ${$_[0]} =~ /(\s+|^)cd(\s|)(.*)/;
    ${$_[0]} =~ /(\s+|)(cd)(\s|)(.*|)/;
    ${$_[0]} = "$1chdir \'$4\';$note\n";
    # print("$1chdir \'$3\';$note\n");
    $note = "";
}

#exit/return a -> exit/return a;
#$_[0]->@readline
sub exitf{
    if(${$_[0]} =~ /(.*)(\s+)(\#)(.*)/){
        (${$_[0]}, $note) = annotation(${$_[0]});
    }
    if(!$note){
        $note = "";
    }
    chomp($note);
    if(${$_[0]} =~ /(.*[^\s]+)(\s+|)(exit|return)(\s|)(.*|)/){
        ${$_[0]} =~ /(.*[^\s]+)(\s+|)(exit|return)(\s|)(.*|)/;
        $front = $1;
        ${$_[0]} = "$3$4$5";
    }
    ${$_[0]} =~ /(\s+|^)(exit|return)(\s|)(.*)/;
    if(!$front){
        ${$_[0]} = "$1$2 $4;$note\n";
    }else{
        ${$_[0]} = "$front $1$2 $4;$note\n";
    }
    # print("$1$2 $4;$note\n");
    $note = "";
    $front = "";
}

#read -> <STDIN>, chomp
#$_[0]->@readline
sub readf{
    if(${$_[0]} =~ /(.*)(\s+)(\#)(.*)/){
        (${$_[0]}, $note) = annotation(${$_[0]});
    }
    if(!$note){
        $note = "";
    }
    chomp($note);
    ${$_[0]} =~ /(\s+|)(read)(\s|)(.*)/;
    ${$_[0]} = "$1\$$4 = <STDIN>;\n$1chomp \$$4;$note\n";
    $note = "";
    # print("$1\$$4 = <STDIN>;\n");
    # print("$1chomp \$$4;\n");
}

#test changes
#$_[0]->@readline
sub testf{
    if(${$_[0]} =~ /(.*)(\s+)(\#)(.*)/){
        (${$_[0]}, $note) = annotation(${$_[0]});
    }
    if(!$note){
        $note = "";
    }
    chomp($note);

    if(${$_[0]} =~ /(.*[^\s]+)(\s+|)(test)(\s|)(.*|)/){
        ${$_[0]} =~ /(.*[^\s]+)(\s+|)(test)(\s|)(.*|)/;
        $front = $1;
        ${$_[0]} = "$3$4$5";
    }
    ${$_[0]} =~ s/ -o / \|\| /g;
    ${$_[0]} =~ s/ -a / \&\& /g;
    if(${$_[0]} =~ /(\s+|)(test) (.*) (-[a-z]+) (.*)/){
        # print("=====1\n");
        ${$_[0]} =~ /(\s+|)(test) (.*) (-[a-z]+) (.*)/;
        $a = $3;
        $b = $5;
        $op = $4;
        $op =~ s/-eq/==/g;
        $op =~ s/-ne/!=/g;
        $op =~ s/-gt/>/g;
        $op =~ s/-ge/>=/g;
        $op =~ s/-lt/</g;
        $op =~ s/-le/<=/g;
        ${$_[0]} =~ /(\s+|)(test) (.*) (-[a-z]+) (.*)/;
        if(!$front){
            ${$_[0]} = "$1$a $op $b$note\n";
        }else{
            ${$_[0]} = "$front $1$a $op $b$note\n";
        }
    }elsif(${$_[0]} =~ /(\s+|)(test) (.*) (=|!=) (.*)/){
        # print("=====2\n");
        ${$_[0]} =~ /(\s+|)(test) (.*) (=|!=) (.*)/;
        $a = $3;
        $b = $5;
        $op = $4;
        if($a !~ /\$/){
            $a = "'$a'";
        }
        if($b !~ /\$/){
            $b = "'$b'";
        }
        
        if($op =~ /!=/){
            $op =~ s/!=/ne/g;
        }elsif($op =~ /=/){
            $op =~ s/=/eq/g;
        }
        ${$_[0]} =~ /(\s+|)(test) (.*) (=|!=) (.*)/;
        if(!$front){
            ${$_[0]} = "$1$a $op $b$note\n";
        }else{
            ${$_[0]} = "$front $1$a $op $b$note\n";
        }
    }elsif(${$_[0]} =~ /(\s+|)(test) (-[a-z+]) (.*)/){
        # print("=====3\n");
        ${$_[0]} =~ /(\s+|)(test) (-[a-z+]) (.*)/;
        $a = "'$4'";
        $op = $3;
        ${$_[0]} =~ /(\s+|)(test) (-[a-z+]) (.*)/;
        if(!$front){
            ${$_[0]} = "$1$op $a$note\n";
        }else{
            ${$_[0]} = "$front $1$op $a$note\n";
        }
    }
    $note = "";
    $front = "";
}

#expr changes
#$_[0]->@readline
sub exprf{
    if(${$_[0]} =~ /(.*)(\s+)(\#)(.*)/){
        (${$_[0]}, $note) = annotation(${$_[0]});
    }
    if(!$note){
        $note = "";
    }
    chomp($note);

    if(${$_[0]} =~ /(.*[^\s]+)(\s+|)(expr) (.*|)/){
        # print("=============2=\n");
        ${$_[0]} =~ /(.*[^\s]+)(\s+|)(expr) (.*|)/;
        $front = $1;
        ${$_[0]} = "$3 $4";
    }
    # print("${$_[0]}\n");

    if(${$_[0]} =~ /(\s+|)(expr) (.*)/){
        # print("=====1\n");
        ${$_[0]} =~ /(\s+|)(expr) (.*)/;
        $a = $3;
        $a =~ s/\\\*/\*/g;
        $a =~ s/\'\*\'/\*/g;
        ${$_[0]} =~ /(\s+|)(expr) (.*)/;
        if(!$front){
            ${$_[0]} = "$1$a$note\n";
        }else{
            ${$_[0]} = "$front $1$a$note\n";
        }
    }
    $note = "";
    $front = "";
}

#split front space
#$_[0]->@readline
sub annotation{
    if($_[0] !~ /\#\!\/bin\/dash/){
        $_[0] =~ /(.*[^\s]+)(\s+)(\#)(.*)/;
        return "$1", "$2$3$4\n";
    }
}

#change argv
#$_[0]->@readline
sub argvf{
    if($_[0] =~ /\$([0-9]+)(\s|$|\`|\))/){
        $_[0] =~ /\$([0-9]+)/;
        $val = $1 - 1;
        $_[0] =~ s/\$[0-9]+/\$ARGV[$val]/g;
    }elsif($_[0] =~ /(\$\#)(\s|$|\`|\))/){
        $_[0] =~ s/\$\#/\@ARGV/g;
    }elsif($_[0] =~ /(\$\*)(\s|$|\`|\))/){
        $_[0] =~ s/\$\*/\@ARGV/g;
    }elsif($_[0] =~ /(\$\@)(\s|$|\`|\))/){
        $_[0] =~ s/\$\@/\@ARGV/g;
    }
    return $_[0];
}

#` ` changes
#$_[0]->@readline
sub back_quotesf{
    if($_[0] =~ /(.*)`(.*)`(.*)/){
        $_[0] =~ /(.*)`(.*)`(.*)/;
        $calcu = $2;
        my $ptr = \$calcu;
        oneLineOpt($ptr);
        $_[0] =~ /(.*)`(.*)`(.*)/;
        $_[0] = "$1$calcu$3";
    }
    return $_[0];
}

#$( ) changes
#$_[0]->@readline
sub dollar_quotesf{
    if($_[0] =~ /(.*)\$\((.*)\)(.*)/){
        $_[0] =~ /(.*)\$\((.*)\)(.*)/;
        $calcu = $2;
        my $ptr = \$calcu;
        oneLineOpt($ptr);
        $_[0] =~ /(.*)\$\((.*)\)(.*)/;
        $_[0] = "$1$calcu$3";
    }
    return $_[0];
}

#[ ] changes
#$_[0]->@readline
sub big_quotesf{
    if($_[0] =~ /(.*)\[ (.*)\ ](.*)/){
        $_[0] =~ /(.*)\[ (.*) \](.*)/;
        $calcu = "test $2";
        my $ptr = \$calcu;
        oneLineOpt($ptr);
        $_[0] =~ /(.*)\$\((.*)\)(.*)/;
        $_[0] = "$1$calcu$3";
    }
    return $_[0];
}

#||/&& changes
#$_[0]->@readline
sub and_or_f{
    if($_[0] =~ /(\&\&|\|\|)/){
        if($_[0] =~ /test|\[ (.*) \]/){
            $_[0] =~ s/\&\&/and/;
            $_[0] =~ s/\|\|/or/;
        }else{
            $_[0] =~ s/\&\&/or/;
            $_[0] =~ s/\|\|/and/;
        }
        
    }
    return $_[0];
}

#if/elif/else changes
#$_[0]->@readline
sub if_check{
    if($_[0] =~ /(if|elif) (.*)/){
        if($_[0] !~ /(if|elif) test (.*)/ && $_[0] !~ /(if|elif) \$\((.*)\)/ && $_[0] !~ /(if|elif) \[(.*)\]/){
            if($_[0] =~ /^(\s+|)if (.*)/){
                $_[0] =~ s/if/if !/g;
            }elsif($_[0] =~ /^(\s+|)elif (.*)/){
                $_[0] =~ s/elif/elif !/g;
            }
        }
    }elsif($_[0] =~ /(while) (.*)/){
        if($_[0] !~ /(while) test (.*)/ && $_[0] !~ /(while) \$\((.*)\)/ && $_[0] !~ /(while) \[(.*)\]/){
            $_[0] =~ s/while/while !/g;
        }
    }
    return $_[0];
}

# $(()) changes
# $_[0]->@readline
sub double_quotesf{
    if($_[0] =~ /(.*)\$\(\((.*)\)\)(.*)/){
        $_[0] =~ /(.*)\$\(\((.*)\)\)(.*)/;
        $sp = $1;
        $sp2 = $3;
        $calcu = "$2";
        @b = split(" ", $calcu);
        foreach $i (@b){
            if($i =~ /^[a-zA-Z]+/){
                $i = "\$$i";
            }
            if($i =~ /^\([a-zA-Z]+/){
                $i =~ s/\(/\(\$/g;
            }
            if($i =~ /^[a-zA-Z]+\)/){
                $i =~ /(^[a-zA-Z]+)\)/;
                my $tmp = $1;
                $i =~ s/$tmp/\$$tmp/g;
            }
        }
        $calcu = join(" ", @b);
        $_[0] = "$sp$calcu$sp2";
    }
    return $_[0];
}


#Integration of the function====================================================================================================

sub oneLineOpt{
    #echo->print
    if(${$_[0]} =~ /(\s+|^)echo(\s|)(.*|)/){
        echof($_[0]);
    #sys
    }elsif(${$_[0]} =~ /(\s+|^)(ls|pwd|id|date|rm|fgrep|chmod)(\s|)(.*|)/){
        sys($_[0]);
    #valuation
    }elsif(${$_[0]} =~ /([0-9a-zA-Z_]+)=(.*)/){
        valuation($_[0]);
    #cd
    }elsif(${$_[0]} =~ /(\s+|^)cd(\s|)(.*|)/){
        cdf($_[0]);
    } elsif(${$_[0]} =~ /(\s+|^)(exit|return)(\s|)([\$\_A-Z-a-z0-9]+)$/){
        exitf($_[0]);
    }elsif(${$_[0]} =~ /(\s+|^)read(\s|)(.*|)/){
        readf($_[0]);
    }elsif(${$_[0]} =~ /(\s+|^)test(\s|)(.*|)/){
        testf($_[0]);
    }elsif(${$_[0]} =~ /(\s+|^)expr(\s|)(.*|)/){
        exprf($_[0]);
    }elsif(${$_[0]} =~ /(\s+|^)local(\s|)(.*|)/){
        localf($_[0]);
    }
}

sub forLineOpt{
    if(${$_[0]} =~ /(\s+|)for (.*) in (.*)/){
        ${$_[0]} =~ /(\s+|)for (.*) in (.*)/;
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
        ${$_[0]} =~ /(\s+|)for (.*) in (.*)/;
        ${$_[0]} = "$1foreach \$$a ($b) {";
        # print("$1foreach \$$a ($b) {\n");
    }elsif(${$_[0]} =~ /do$/){
        ${$_[0]} =~ s/do//g;
    }elsif(${$_[0]} =~ /(\s+|)done$/){
        ${$_[0]} =~ /(\s+|)done$/;
        ${$_[0]} = "$1}\n";
    }
}

sub whileLineOpt{
    if(${$_[0]} =~ /(\s+|)while (.*)/){
        ${$_[0]} =~ /(\s+|)while (.*)/;
        $a = "($2)";
        $a =~ s/true/0/g;
        $a =~ s/false/1/g;
        # if($a !~ /test/){
        #     $a = "! $a";
        # }
        ${$_[0]} =~ /(\s+|)while (.*)/;
        ${$_[0]} = "$1while $a {";
        # print("$1foreach \$$a ($b) {\n");
    }elsif(${$_[0]} =~ /do$/){
        ${$_[0]} =~ s/do//g;
    }elsif(${$_[0]} =~ /(\s+|)done$/){
        ${$_[0]} =~ /(\s+|)done$/;
        ${$_[0]} = "$1}\n";
    }
}

sub caseLineOpt{
    if(${$_[0]} =~ /(\s+|)case (.*) in/){
        ${$_[0]} =~ /(\s+|)case (.*) in/;
        $a = "($2)";
        ${$_[0]} =~ /(\s+|)case (.*) in/;
        ${$_[0]} = "$1given $a {\n";
        # print("$1foreach \$$a ($b) {\n");
    }elsif(${$_[0]} =~ /(\s+|)(.*)\) (.*)/){
        ${$_[0]} =~ /(\s+|)(.*)\) (.*)/;
        $a = $2;
        $b = $3;
        if($a !~ /\*/){
            ${$_[0]} =~ /(\s+|)(.*)\) (.*)/;
            ${$_[0]} = "$1when (\$\_ == $a) {\n   $1$b\n";
        }else{
            ${$_[0]} =~ /(\s+|)(.*)\) (.*)/;
            ${$_[0]} = "$1default {\n   $1$b\n";
        }
        
    }elsif(${$_[0]} =~ /(\s+|)\;\;/){
        ${$_[0]} =~ /(\s+|)\;\;/;
        ${$_[0]} = "$1}\n";
    }elsif(${$_[0]} =~ /(\s+|)esac/){
        ${$_[0]} =~ /(\s+|)esac/;
        ${$_[0]} = "$1}\n";
    }
}

sub ifLineOpt{
    if(${$_[0]} =~ /^(\s+|)if (.*)/){
        ${$_[0]} =~ /(\s+|)if (.*)/;
        $a = "($2)";
        $a =~ s/;//g;
        # if($a !~ /test/){
        #     $a = "! $a";
        # }
        ${$_[0]} =~ /(\s+|)if (.*)/;
        ${$_[0]} = "$1if $a {";
        # print("$1foreach \$$a ($b) {\n");
    }elsif(${$_[0]} =~ /(\s+|)elif (.*)/){
        ${$_[0]} =~ /(\s+|)elif (.*)/;
        $a = "($2)";
        $a =~ s/;//g;
        # if($a !~ /test/){
        #     $a = "! $a";
        # }
        ${$_[0]} =~ /(\s+|)elif (.*)/;
        ${$_[0]} = "$1} elsif $a {";
    }elsif(${$_[0]} =~ /(\s+|)else$/){
        ${$_[0]} =~ /(\s+|)else$/;
        ${$_[0]} = "$1} else {\n";
    }elsif(${$_[0]} =~ /then$/){
        ${$_[0]} =~ s/then//g;
    }elsif(${$_[0]} =~ /(\s+|)fi$/){
        ${$_[0]} =~ /(\s+|)fi$/;
        ${$_[0]} = "$1}\n";
    }
}


#main program==============================================

# print("#!/usr/bin/perl -w\n");
open(my $files, "<$sh_fileName") or die "Can't open $!";
@file_content = (<$files>);
$fc_size = @file_content;
close $files;

#deal with &&/|| line
for(my $i = 0; $i < $fc_size; $i++){
    my $count = 0;
    if($file_content[$i] =~ /(\&\&|\|\|)/){
        my $tmp = $file_content[$i];
        my @arr = split(" ", $tmp);
        foreach $val (@arr){
            if($val =~ /(\&\&|\|\|)/){
                $count++;
            }
        }
        if($count > 0){
            my $tmp2 = $file_content[$i];
            for(my $j = 0; $j < $count; $j++){
                $tmp2 = and_or_f($tmp);
                $tmp2 = double_quotesf($tmp);
                $tmp2 = argvf($tmp);
                $tmp2 = back_quotesf($tmp);
                $tmp2 = dollar_quotesf($tmp);
                $tmp2 = big_quotesf($tmp);
                my $readline = \$tmp2;
                oneLineOpt($readline);
            }
            $file_content[$i] = $tmp2;
        }
    }
}

#deal with normal line
for(my $i = 0; $i < $fc_size; $i++){
    if($file_content[$i] =~ /\#/){
        my $tmp = $file_content[$i];
        $tmp=~s/^ +//;
        if($tmp =~ /^\#/){
            if($file_content[$i] =~ /\#\!\/bin\/dash/){
                $file_content[$i] = "#!/usr/bin/perl -w\n";
            }else{
                next;
            }
        }
    }

    $file_content[$i] = if_check($file_content[$i]);
    $file_content[$i] = double_quotesf($file_content[$i]);
    $file_content[$i] = argvf($file_content[$i]);
    $file_content[$i] = back_quotesf($file_content[$i]);
    $file_content[$i] = dollar_quotesf($file_content[$i]);
    $file_content[$i] = big_quotesf($file_content[$i]);
    my $readline = \$file_content[$i];
    oneLineOpt($readline);
    
}

#deal with sub fuction, change $ARGV -> $_
$count_f = 0;
for(my $i = 0; $i < $fc_size; $i++){
    if($file_content[$i] =~ /\{/){
        $count_f++;
    }
    if($file_content[$i] =~ /\}/){
        $count_f--;
    }
    if($file_content[$i] =~ /ARGV/){
        if($count_f > 0){
            $file_content[$i] =~ s/ARGV/\_/g;
        }
    }
    
    if($file_content[$i] =~ /([a-zA-Z0-9_]+)(\(\)) ({)/){
        $file_content[$i] =~ /([a-zA-Z0-9_]+)(\(\)) ({)/;
        $file_content[$i] =~ s/\(\)//g;
        $file_content[$i] = "sub $file_content[$i]"
    }
}

#deal with for/while/if/case
$caseCount = 0;
for(my $i = 0; $i < $fc_size; $i++){
    my $readline = \$file_content[$i];
    forLineOpt($readline);
    whileLineOpt($readline);
    ifLineOpt($readline);

    if(${$readline} =~ /(\s+|)case (.*) in/){
        $caseCount++;
    }
    if($caseCount > 0){
        caseLineOpt($readline);
    }
    if(${$readline} =~ /(\s+|)esac/){
        $caseCount--;
    }

}

#print the result
print(@file_content);