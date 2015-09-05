#!/usr/bin/perl
# vim: fdm=marker
use strict;
use warnings;
use feature qw(say);
use Test::More;
use FindBin;
chdir $FindBin::Bin;

subtest 'example1' => sub { #{{{
    my $result = `cat enshura_4_MINAMI_ex1.dat | ../enshura_4_MINAMI.pl`;
    my $expect = <<"EOS";
1 0 0
1 0 0
1 0 0
1 0 1
EOS
    is $result,$expect;

}; #}}}
subtest 'example2' => sub { #{{{
    my $result = `cat enshura_4_MINAMI_ex2.dat | ../enshura_4_MINAMI.pl`;
my $expect = <<"EOS";
0 0 0
0 0 0
0 1 0
1 1 1
1 1 1
EOS
    is $result,$expect;
}; #}}}
done_testing;
