#!/usr/bin/perl
use strict;
use warnings;
use feature qw(say);

<STDIN>;

my ($coffee, $water);

while (<STDIN>){
    my ($op, $g) = split(/\s/);
    if ($op eq "1"){
        $water += $g;
    }
    elsif ($op eq "2"){
        $coffee += $g;
    }
    elsif ($op eq "3"){
        $water  -= $g * $water /($water + $coffee);
        $coffee -= $g * $coffee/($water + $coffee);
    }
}
say int($coffee/($water+$coffee)*100);
