#!/usr/bin/perl

# This tests the meat of what File::Slurp::Unicode does.

use strict;
use warnings;

use Test::More;

plan tests => 7;

use File::Temp qw(tempfile);
my ($fh, $name) = tempfile();

use Encode;
use utf8;
my $wide_data = "Dävîd";
my $bin_data = "D\xc3\xa4v\xc3\xaed";
my $latin_data = "D\xe4v\xeed";

use File::Slurp::Unicode;

write_file $name, $wide_data;
is(read_file($name), $wide_data, "Basic in/out parity");

write_file $name, $bin_data;
is(read_file($name), $wide_data, "Don't touch byte coded strings");
is(read_file($name, encoding => 'binary'), $bin_data, "Binary encoding read");

write_file $name, { encoding => 'binary' }, $bin_data;
is(read_file($name, encoding => 'binary'), $bin_data, "Binary encoding write");

eval { write_file $name, { encoding => 'binary' }, $wide_data; };
like($@, qr/Can't encode wide characters as binary/, "Writing wide characters as binary should die");

write_file $name, { encoding => 'latin1' }, $wide_data;
is(read_file($name, encoding => 'binary'), $latin_data, "Latin1 encoding write");
is(read_file($name, encoding => 'latin1'), $wide_data, "Latin1 encoding read");
