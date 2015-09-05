#!/usr/bin/perl
use strict;
use warnings;
use feature qw(say);

my $in = <STDIN>;
chomp $in;

my $upper = substr($in,0,1);
my $lower = substr($in,1,1);
say $in + $upper + $lower;
