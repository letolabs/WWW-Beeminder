package WWW::Beeminder;
use Moose;
use JSON;
use namespace::autoclean;

our $VERSION = '0.01';

$VERSION = eval $VERSION; # numify for warning-free dev releases

__PACKAGE__->meta->make_immutable(inline_constructor => 0);
