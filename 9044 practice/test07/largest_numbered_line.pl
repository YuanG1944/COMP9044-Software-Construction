#!/usr/bin/perl -w
@result = ();
@content = ();
$max_num = -99999;

while($line = <>){
    my @line_num = split(" ", $line);
    foreach my $num (@line_num){
        if($num =~ /\d/){
            # $num =~ /([0-9]+)/; 
            # $num =~ s/[a-zA-Z]//g;
            $num =~ /(-?\d*\.?\d+)/g;
            $num = $1;
            if($num > $max_num){
                $max_num = $num;
            }
        }
    }
    push @content, $line;
}

#$_[0]->@line_num $_[1]->$max_num $_[2]->$size
sub hasMaxNum{
    for($i = 0; $i < $_[2]; $i++){
        if($_[0][$i] =~ /\d/){
            # $_[0][$i] =~ /([0-9]+)/;
            # $_[0][$i] =~ s/[a-zA-Z]//g;
            $_[0][$i] =~ /(-?\d*\.?\d+)/g;
            $_[0][$i] = $1; 
            if($_[0][$i] == $_[1]){
                return 1;
            }
        }
    }
    return 0;
}

foreach $value (@content){
    my @line_num = split(" ", $value);
    my $size = @line_num;
    $r_line = \@line_num;
    #$_[0]->@line_num $_[1]->$max_num $_[2]->$size
    if(hasMaxNum($r_line, $max_num, $size)){
        push @result, $value;
    }
}

foreach $value (@result){
    print($value);
}