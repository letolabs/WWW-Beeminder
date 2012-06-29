#!perl

use Test::More;
use WWW::Beeminder;
use Data::Dumper;

# This actually hits the Beeminder API. Yes mocking would be better, but
# since the Beeminder API is still in flux, not very useful.

# Example curl code that submits some data to Beeminder:
# curl -d "origin=bmndr_test&datapoints_text=26 42&sendmail=0" http://beta.beeminder.com/dukeleto/goals/testing/datapoints/create_all

my $bee = WWW::Beeminder->new(
    username => 'dukeleto',
    goal     => 'testing',
);

isa_ok($bee, 'WWW::Beeminder');


my $r = $bee->add_data({
    datapoints_text => '29 99',
    sendmail        => 0,
});

print Dumper [ $r ];

ok($r->is_success, 'got a successful response from beeminder');

done_testing;
