use Module::Build;
Module::Build->new(
    module_name => 'File::Slurp::Unicode',
    license     => 'perl',
    dist_author => 'David Caldwell <david@porkrind.org>',
    requires      => {
        perl => '5.10.0',
    },
)->create_build_script;
