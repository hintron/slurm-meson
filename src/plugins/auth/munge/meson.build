auth_munge_plugin = shared_module(
    'auth_munge', # name
    'auth_munge.c', # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    dependencies: [munge_libs],
    name_prefix: '',
)