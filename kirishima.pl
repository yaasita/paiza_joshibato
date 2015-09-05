#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;
use feature qw(say);

package Sugoroku;
use Data::Dumper;

sub new {
    my $class = shift;
    my $self = {
        masu => [],
        position => 0
    };
    for (@_){
        push(@{$self->{masu}},{
                val => $_,
                history => 0
            });
    }
    $self->{masu}->[0]->{history} = 1;
    return bless $self, $class;
}
sub progress {
    my $self = shift;
    my $num = shift;
    while (1){
        $self->{position} += $num;
        my $p = $self->{position};
        if ($p > @{$self->{masu}}-1 or $p < 0){
            return "No";
        }
        my $v = $self->{masu}->[$p]->{val};
        my $h = $self->{masu}->[$p]->{history};
        if ($self->{masu}->[$p]->{history}){
            last;
        }
        else {
            $self->{masu}->[$p]->{history} = 1;
        }
        $num = $v;
    }
    if ($self->{position} == @{$self->{masu}}-1){
        return "Yes";
    }
    else {
        return "No";
    }
}

package main;

<STDIN>;
my @masu;
{
    my $line = <STDIN>;
    chomp $line;
    @masu = split(/\s/,$line);
}
<STDIN>;

while (<STDIN>){
    chomp;
    my $sgrk = Sugoroku->new(@masu);
    say $sgrk->progress($_);
}
