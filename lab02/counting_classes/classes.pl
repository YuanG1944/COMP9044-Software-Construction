#!/usr/bin/perl -w
@ARGV = ("/home/sms/sturec/data/19T2_COMPSC.classes") if !@ARGV;
local %count;
while (<>) {
    $class = $1 and next if /^([A-Z]{4}\d{4})\s+/;
    $category = $1 and next if /^[a-z_]+\s+([A-Z]+)\s*$/;
    @f = split(/\t/);
    ($time,$room) = ($f[5] =~ /(\w{3}\s\S+)\s+(.*)/) or die "Can not parse: '$_'";
    next if $count{"$class$f[1]"}++;
    print "$class\t$f[1]\t$category\t$time\t$room\t$f[3]\t$f[4]\n";
}
