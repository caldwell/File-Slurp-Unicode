#!/usr/bin/perl

# This just tests that I mimic the File::Slurp APIs correctly.

use strict;
use warnings;

use Test::More;

plan tests => 5;

use File::Slurp::Unicode;
use File::Temp qw(tempfile);

my ($fh, $name) = tempfile();
$fh->autoflush(1);
my @expect = map { "$_\n" } qw(line1 line2 line3);
my $expect = join '', @expect;
print $fh $expect;

my @lines = read_file $name;
is_deeply(\@lines, \@expect, "list context");

my $data = read_file $name;
is($data, $expect, "scalar context");

my $data_ref;
read_file $name, buf_ref => \$data_ref;
is($data_ref, $expect, "buf_ref");

$data_ref = read_file $name, scalar_ref => 1;
is(${$data_ref}, $expect, "scalar_ref");

$data_ref = read_file $name, array_ref => 1;
is_deeply($data_ref, \@expect, "array_ref");

