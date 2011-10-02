use strict;

use Test::More tests =>5;

use URL::Check;
use File::Basename qw/dirname/;



#check simple config with errors
my $configFile = "t/resources/config/toconsole-with-error.txt";
ok(-f $configFile, "checking presence of $configFile");

URL::Check::readConfig($configFile);
my %config = %URL::Check::config;


URL::Check::run();

my %report = URL::Check::errorReport();
ok(%report, "error report is not empty");

my $output ;
{
  local *STDOUT ;
  open STDOUT, ">", \$output or die "cannot redirect STDOUT to variable\n";
  URL::Check::submitReport(%report);
}

my $expected = <<EOT;
ERROR REPORT: 2 errors reported
http://aaa.bbb.ccc.ddd : cannot load content
http://zzz.yyy.xxx.www : cannot load content
EOT
is($output, $expected, "check console output");



#check simple with no error
$configFile = "t/resources/config/toconsole.txt";
ok(-f $configFile, "checking presence of $configFile");

URL::Check::readConfig($configFile);
%config = %URL::Check::config;

URL::Check::run();

%report = URL::Check::errorReport();
ok(! %report, "error report is empty");
