#!/usr/bin/perl
# vim: fdm=marker
use strict;
use warnings;
use feature qw(say);
use Test::More;
use FindBin;
chdir $FindBin::Bin;

subtest 'example1' => sub { #{{{
    my $result = `cat enshura_4_RENA_ex1.dat | ../enshura_4_RENA.pl`;
    is 0+$result,6664;

}; #}}}
subtest 'example2' => sub { #{{{
    my $result = `cat enshura_4_RENA_ex2.dat | ../enshura_4_RENA.pl`;
    is 0+$result,17895;
}; #}}}
done_testing;
