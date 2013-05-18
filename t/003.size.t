use strict;
use warnings;
use Test::More;
use B ();
use B::Size2;

my @values = (
    \undef,
    \10,
    \10.2,
    \"foo",
    [],
    [1],
    {},
    {foo => "bar"},
    Test::More->builder, # object
    \*STDOUT,
    sub { my($foo, $bar) },
    qr/foobar/,
);

plan tests => scalar @values;

for my $v(@values) {
    my $b = B::svref_2object($v);
    cmp_ok $b->size, ">", 0, ref($b) . " size: " . $b->size;
}

