#!/usr/bin/perl
use strict;
use warnings;
use feature qw(say);

<STDIN>;
# 回分になりえる単語作成
my @in = <STDIN>;
chomp @in;

my (@list, @list_c); # list_cは中央に置くやつ

# 単語が1文字の場合
if ( length($in[0]) == 1 ){
    my %count;
    $count{$_}++ for @in;
    for (keys %count){
        my $key = $_;
        push (@list, $key) for 1..(int ($count{$key}/2));
        push (@list_c,$key) if $count{$key} % 2 == 1;
    }
}
# 単語が2文字以上の場合
if ( length($in[0]) >= 2 ){
    my %count;
    $count{$_}++ for @in;
    my $i = 0;
    for (sort keys %count){
        my $key = $_;
        next unless exists($count{$key});
        if ( exists ($count{reverse $key}) and $count{reverse $key} > 0){
            $count{$key}++;
            $count{reverse $key}--;
            if ($count{reverse $key} == 0){
                delete($count{reverse $key});
            }
        }
    }
    for (keys %count){
        my $key = $_;
        push (@list, $key) for 1..(int ($count{$key}/2));
        push (@list_c, $key) if $count{$key} % 2 == 1;
    }
    @list_c = grep { reverse($_) eq $_ } @list_c;
}

# 出力
{
    # a + b + c の順で出す
    my (@a,$b,@c);
    for (sort @list){
        push(@a,$_);
        push(@c,scalar reverse $_)
    }
    $b = (sort @list_c)[0];
    print for @a;
    print $b if defined $b;
    print for reverse @c;
}
