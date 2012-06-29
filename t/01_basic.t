#!perl

use Test::More;
use WWW::Beeminder;

# curl -d "origin=bmndr_test&datapoints_text=26 42&sendmail=0"
# http://beta.beeminder.com/dukeleto/goals/testing/datapoints/create_all

my $bee = WWW::Beeminder->new(
    username => 'dukeleto_api',
    goal     => 'testing',
);

isa_ok($bee, 'WWW::Beeminder');

done_testing;
