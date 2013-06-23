use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'WWW::Beeminder',
    license             => 'perl',
    dist_author         => 'Jonathan "Duke" Leto <jonathan@leto.net>',
    dist_abstract       => 'Perl interface to the Beeminder API',
    dist_version_from   => 'lib/WWW/Beeminder.pm',
    include_dirs        => '',
    build_requires => {
        'Test::Most'      => '0.25',
    },
    configure_requires => { 'Module::Build' => '0.4005' },
    requires => {
    },
    add_to_cleanup      => [ 'WWW-Beeminder*' ],
    meta_merge     => {
        resources => {
            repository  => 'http://github.com/letolabs/WWW-Beeminder/tree/master'
        },
    },
);

$builder->create_build_script();
print "Have a great day!\n";
