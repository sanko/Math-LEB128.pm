use Test2::V0;
use utf8;
#
use lib '../lib';
use Math::LEB128 qw[:all];
diag 'Math::LEB128 v' . $Math::LEB128::VERSION;
#
my %examples = (

    # Example from wikipedia
    wikipedia => [ '624485' => "\xE5\x8E\x26" ],

    # Examples and tests from https://github.com/bluk/leb128fmt
    bluk => [ '43110' => "\xE6\xD0\x02" ]
);
subtest $_ => sub {
    is leb128_encode( $examples{$_}[0] ), $examples{$_}[1], 'encode';
    is leb128_decode( $examples{$_}[1] ), $examples{$_}[0], 'decode';
    }
    for sort keys %examples;
done_testing;
