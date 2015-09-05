#!/usr/bin/perl
# vim: fdm=marker
use strict;
use warnings;
use feature qw(say);
use Test::More;
use FindBin;
chdir $FindBin::Bin;

subtest 'example1' => sub { #{{{
    my $result = `cat enshura_1_ex1.dat | ../enshura_1.pl`;
    is $result,"Paiza";
}; #}}}
subtest 'example2' => sub { #{{{
    my $result = `cat enshura_1_ex2.dat | ../enshura_1.pl`;
    is $result,"aceghjln";
}; #}}}
done_testing;

