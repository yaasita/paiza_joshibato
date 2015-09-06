#!/usr/bin/perl
# vim: fdm=marker
use strict;
use warnings;
use feature qw(say);
use Test::More;
use FindBin;
chdir $FindBin::Bin;

subtest 'example1' => sub { #{{{
    my $result = `cat matsue-ruby_ex1.dat | ../matsue-ruby.pl`;
    chomp $result;
    is $result,"fdkjnvqaqvnjkdf";
}; #}}}
subtest 'example2' => sub { #{{{
    my $result = `cat matsue-ruby_ex2.dat | ../matsue-ruby.pl`;
    chomp $result;
    is $result,"hujxnrnwoownrnxjuh";
}; #}}}
done_testing;

