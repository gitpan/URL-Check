#!/usr/bin/env perl
use strict;
use warnings;
use URL::Check;
use Getopt::Long;
use Pod::Usage;

=head1 NAME

url-check.pl - check a list of urls for existence, speed contents based on a config file...

=head1 SYNOPSIS

url-check.pl --config=/path/to/config.txt

If no --config is passed, $URL_CHECK_CONFIG is taken ad the default file name

=cut

my ($config, $help);

GetOptions (
	    "config=s"   => \$config,
	    "help" => \$help
	   ) || pod2usage(2);

if ($help) {
  pod2usage(1);
  exit(0);
}

URL::Check::readConfig($config);
URL::Check::run();
my %report = URL::Check::errorReport();
if (%report) {
  URL::Check::submitReport(%report);
}
