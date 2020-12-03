#!/usr/bin/perl -w

@words = @ARGV;
@result = ();
foreach $value (@words){
    $count = 0;
    # %vowels = ();
    $value_low = lc $value;
    $value_low = $value_low."+";
    @a = split(//, $value_low);
    foreach $_ (@a){
        if($_ =~ /[aeiou]/){
            $count++;
        }else{
            if($count >= 3){
                push(@result, $value);
            }
            $count = 0;
        }
    }
}
print(join " ", @result);
print("\n");