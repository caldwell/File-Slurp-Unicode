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
my @data = map { "$_\n" } qw(line1 line2 line3);
my $data = join '', @data;
print $fh $data;

sub compare {
    my ($test_name) = @_;
    seek($fh, 0,0);
    is_deeply([$fh->getlines], \@data, $test_name);
}

write_file $name, @data;
compare("list");

write_file $name, $data;
compare("scalar");

write_file $name, \@data;
compare("array ref");

write_file $name, \$data;
compare("scalar ref");

write_file $name, { buf_ref => \$data };
compare("buf_ref");

