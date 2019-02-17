cred_none_plugin_src = [
    'cred_none.c',
]

cred_none_plugin = shared_module(
    'cred_none', # name
    cred_none_plugin_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)
