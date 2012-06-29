package WWW::Beeminder;
use Moose;
use JSON;
use WWW::Mechanize;
use namespace::autoclean;

has base_url => ( is => 'rw', isa => 'Str', default => 'http://beta.beeminder.com' );

has username => ( is => 'rw', isa => 'Str', default => '' );
has goal     => ( is => 'rw', isa => 'Str', default => '' );

our $VERSION = '0.01';

sub add_data {
    my ($self, $data) = @_;


    $self->username or die "You must specify a username before adding data";

    $self->goal or die "You must specify a goal before adding data";

    my $post_url = sprintf("%s/%s/goals/%s/datapoints/create_all",
        $self->base_url,
        $self->username,
        $self->goal,
    );

    #warn "POSTing to $post_url";

    # specify a default origin if none was provided
    $data->{origin} ||= $self->username . '_api';


    my $mech = WWW::Mechanize->new;

    $mech->add_header('content-type' => 'application/x-www-form-urlencoded');

    my $r    = $mech->post( $self->base_url(), $data);


    # crappy, but just return the LWP response for now
    return $r;
}


$VERSION = eval $VERSION; # numify for warning-free dev releases

__PACKAGE__->meta->make_immutable(inline_constructor => 0);
