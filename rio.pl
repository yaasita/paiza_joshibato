#!/usr/bin/perl
use strict;
use warnings;
use feature qw(say);

<STDIN>;

my ($coffee, $water) = (0,0);

while (<STDIN>){
    my ($op, $g) = split(/\s/);
    if ($op eq "1"){
        $water += $g;
    }
    elsif ($op eq "2"){
        $coffee += $g;
    }
    elsif ($op eq "3"){
        my $percent_water  = $water  / ($coffee + $water);
        my $percent_coffee = $coffee / ($coffee + $water);
        $water  -= $g * $percent_water;
        $coffee -= $g * $percent_coffee;
    }
    trunc(\$water);
    trunc(\$coffee);
}
sub trunc {
    my $ref = shift;
    $$ref = int( $$ref * 10 ) / 10;
}
say int($coffee/($water+$coffee)*100);
