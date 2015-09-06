#!/usr/bin/perl
use strict;
use warnings;
use feature qw(say);

<STDIN>;
# 回分になりえる単語作成
my @list;
my @list_c; #中央に置く必要があるやつ
{
    my @input = <STDIN>;
    chomp @input;
    my $rev = sub {
        my $in = shift;
        my $reverse = reverse $in;
        if ($in eq $reverse){
            return 0;
        }
        for (@input){
            if ($_ eq $reverse){
                return 1;
            }
        }
        return 0;
    };
    for (@input){
        push (@list,$_) if $rev->($_);
    }
    for (@input){
        push (@list_c,$_) if $_ eq reverse $_;
    }
}
# 前半,後半,中央部に分けて保存
# part_a + part_c + part_b
my (@part_a,@part_b,@part_c);
{
    my $pop = sub {
        my $ref = shift;
        @{$ref} = sort @{$ref};
        my $a = shift @{$ref};
        my $i=0;
        for (@{$ref}){
            last if $_ eq reverse $a;
            $i++;
        }
        my $b = splice(@{$ref},$i,1);
        return ($a,$b);
    };
    while (@list+0 != 0){
        my ($a , $b) = $pop->(\@list);
        push (@part_a,$a);
        push (@part_b,$b);
    }
    my @c = sort @list_c;
    push (@part_c,shift @c);
}
# 出力
{
    for (@part_a){
        print;
    }
    for (@part_c){
        print;
    }
    for (reverse @part_b){
        print;
    }
}
