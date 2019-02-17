cred_munge_plugin_src = [
    'cred_munge.c',
]

cred_munge_plugin = shared_module(
    'cred_munge', # name
    cred_munge_plugin_src, # source files
    include_directories: [slurm_inc],
    dependencies: [dl_lib, pthread_lib, munge_lib],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)
