#!/usr/bin/perl
# vim: fdm=marker
use strict;
use warnings;
use feature qw(say);
use Test::More;
use FindBin;
chdir $FindBin::Bin;

subtest 'example1' => sub { #{{{
    my @result = `cat enshura_2_ex1.dat | ../enshura_2.pl`;
    chomp @result;
    my @expect = qw(60000 40000 0 70000 15000 700000 950000);
    is_deeply \@result,\@expect;
}; #}}}
subtest 'example2' => sub { #{{{
    my @result = `cat enshura_2_ex2.dat | ../enshura_2.pl`;
    chomp @result;
    my @expect = qw(1003 2302 421 32124 3 0 3214);
    is_deeply \@result,\@expect;
}; #}}}
done_testing;
