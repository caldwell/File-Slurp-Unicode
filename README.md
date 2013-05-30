File::Slurp::Unicode
====================

# This module is obsolete.

File::Slurp::Unicode is dead, long live File::Slurp.

File::Slurp now supports the 'binmode' options which is pretty much all this
module added (it's called 'encoding' here). It has supported the 'binmode'
option since version 9999.14 (released Sun Mar 20 16:26:47 EDT 2011) and so
users of this module should switch to using File::Slurp.

This module will receive no more updates.

To avoid confusion, I've removed File::Slurp::Unicode from CPAN. If you
really need it for some weird legacy reason, this repo is all that's left of
it.

Description
-----------

This module wraps the standard File::Slurp package and adds character
encoding support.

For full documentation, run:

    perldoc lib/File/Slurp/Unicode.pm


Installation
------------

To build, test and install:

     perl Build.PL
    ./Build
    ./Build test
    ./Build install


License
-------

Copyright 2010 David Caldwell <david@porkrind.org>

This perl module is free software; it may be redistributed
and/or modified under the same terms as Perl itself.
