use Module::Build;

my $build = Module::Build->new(
    module_name        => 'Widget::Meta',
    license            => 'perl',
    dist_author        => 'David Wheeler <david@kineticode.com>',
    dist_abstract      => 'Metadata for user interface widgets',
    build_requires     => { Test::Simple  => '0.17' },
    create_makefile_pl => 'passthrough',
);
$build->create_build_script;
