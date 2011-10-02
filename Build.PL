use 5.006;
use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
				 module_name         => 'URL::Check',
				 license             => 'perl',
				 dist_author         => q{Alexandre Masselot <alexandre.masselot@gmail.com>},
				 dist_version_from   => 'lib/URL/Check.pm',
				 build_requires => {
						    'Test::More' => 0,
						   },
				 requires => {
					      'perl' => 5.006,
					      'LWP::Simple' => 0,
					      'Time::HiRes' => 0,
					      'Mail::Sendmail' => 0,
					     },
				 add_to_cleanup      => [ 'URL-Check-*' ],
				 create_makefile_pl => 'traditional',
				);

$builder->create_build_script();
