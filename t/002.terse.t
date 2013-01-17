use strict;
use warnings;

use Test::More tests => 1;

use B::Size2;
use B::Size2::Terse;

foreach my $pkg (qw(main B::Size2 B::Size2::Terse)) {
	my($subs, $opcount, $opsize) = B::Size2::Terse::package_size($pkg);
}
pass "use of package_size()";
