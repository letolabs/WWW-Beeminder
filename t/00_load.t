#!perl

use Test::More tests => 1;

BEGIN {
	use_ok( 'WWW::Beeminder' );
}

diag( "Testing WWW::Beeminder $WWW::Beeminder::VERSION, Perl $], $^X" );
