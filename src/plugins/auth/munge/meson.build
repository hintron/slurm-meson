auth_munge_plugin = shared_module(
    'auth_munge', # name
    'auth_munge.c', # source files
    include_directories: [slurm_inc],
    dependencies: [munge_libs],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)