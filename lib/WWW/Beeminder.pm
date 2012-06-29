package WWW::Beeminder;
use Moose;
use JSON;
use WWW::Mechanize;
use namespace::autoclean;

has base_url => ( is => 'rw', isa => 'Str', default => 'https://www.beeminder.com' );

has username => ( is => 'rw', isa => 'Str', default => '' );
has goal     => ( is => 'rw', isa => 'Str', default => '' );

our $VERSION = '0.01';

sub add_data {
    my ($self, $data) = @_;

    unless ($self->username) {
        die "You must specify a username before adding data";
    }

    my $mech = WWW::Mechanize->new;
    my $r    = $mech->post( $self->base_url(), $data );
}


$VERSION = eval $VERSION; # numify for warning-free dev releases

__PACKAGE__->meta->make_immutable(inline_constructor => 0);
