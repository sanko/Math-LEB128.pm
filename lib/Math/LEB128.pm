package Math::LEB128 0.01 {
    use v5.36;
    use Exporter 'import';
    our @EXPORT_OK   = qw[leb128_encode leb128_decode];
    our %EXPORT_TAGS = ( all => \@EXPORT_OK );

    sub leb128_encode ($value) {
        my $encoded = "";
        do {
            my $byte = $value & 0x7F;
            $byte |= ( $value >= 0x80 ) ? 0x80 : 0;
            $encoded .= chr($byte);
            $value >>= 7;
        } while ($value);
        return $encoded;
    }

    sub leb128_decode ($encoded) {
        my $value = 0;
        my $shift = 0;
        while ($encoded) {
            my $byte = ord($encoded);
            $encoded = substr( $encoded, 1 );
            $value |= ( $byte & 0x7F ) << $shift;
            $shift += 7;
        }
        return $value;
    }

    # TODO: decode signed ints
}
1;
__END__

=encoding utf-8

=head1 NAME

Math::LEB128 - Variable-length Compression for Arbitrarily Large Integers

=head1 SYNOPSIS

    use Math::LEB128 qw[:all];
    my $encoded = leb128_encode( '624485' );
    my $num     = leb128_decode( $encoded );

=head1 DESCRIPTION

LEB128 or Little Endian Base 128 is a variable-length code compression used to store arbitrarily large integers in a
small number of bytes. LEB128 is used in the DWARF debug file format and the WebAssembly binary encoding for all
integer literals.

As of right now, this code is very much not optimized for speed. I spent as much time copying and pasting the above
description as I did converting the pseudocode into perl.

=head1 Functions

These may be called directly, imported by name, or with the C<:all> tag.

=head2 C<leb128_encode( ... )>

    leb128_encode( '624485' );

Encodes an unsigned number.

=head2 C<leb128_encode( ... )>

    leb128_decode("\xE5\x8E\x26");

Decodes an unsigned number.

=begin :todo

Decode signed integers

=end :todo

=head1 See Also

L<LEB128 on Wikipedia.org|https://en.wikipedia.org/wiki/LEB128>

=head1 LICENSE

Copyright (C) Sanko Robinson.

This library is free software; you can redistribute it and/or modify it under the terms found in the Artistic License
2. Other copyrights, terms, and conditions may apply to data transmitted through this module.

=head1 AUTHOR

Sanko Robinson E<lt>sanko@cpan.orgE<gt>

=begin stopwords

pseudocode

=end stopwords

=cut
