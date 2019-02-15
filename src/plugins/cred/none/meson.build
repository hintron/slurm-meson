cred_none_plugin_src = [
    'cred_none.c',
]

cred_none_plugin = shared_library(
    'cred_none', # name
    cred_none_plugin_src, # source files
    include_directories: [slurm_inc],
    # TODO: Why is linking libslurmfull necessary, when other plugins don't need it?
    link_with: [libslurmfull],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)


