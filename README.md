[![Actions Status](https://github.com/sanko/Math-LEB128.pm/actions/workflows/ci.yml/badge.svg)](https://github.com/sanko/Math-LEB128.pm/actions) [![MetaCPAN Release](https://badge.fury.io/pl/Math-LEB128.svg)](https://metacpan.org/release/Math-LEB128)
# NAME

Math::LEB128 - Variable-length Compression for Arbitrarily Large Integers

# SYNOPSIS

```perl
use Math::LEB128 qw[:all];
my $encoded = leb128_encode( '624485' );
my $num     = leb128_decode( $encoded );
```

# DESCRIPTION

LEB128 or Little Endian Base 128 is a variable-length code compression used to store arbitrarily large integers in a
small number of bytes. LEB128 is used in the DWARF debug file format and the WebAssembly binary encoding for all
integer literals.

As of right now, this code is very much not optimized for speed. I spent as much time copying and pasting the above
description as I did converting the pseudocode into perl.

# Functions

These may be called directly, imported by name, or with the `:all` tag.

## `leb128_encode( ... )`

```
leb128_encode( '624485' );
```

Encodes an unsigned number.

## `leb128_encode( ... )`

```
leb128_decode("\xE5\x8E\x26");
```

Decodes an unsigned number.

# See Also

[LEB128 on Wikipedia.org](https://en.wikipedia.org/wiki/LEB128)

# LICENSE

Copyright (C) Sanko Robinson.

This library is free software; you can redistribute it and/or modify it under the terms found in the Artistic License
2\. Other copyrights, terms, and conditions may apply to data transmitted through this module.

# AUTHOR

Sanko Robinson <sanko@cpan.org>
