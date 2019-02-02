cred_munge_plugin_src = [
    'cred_munge.c',
]

cred_munge_plugin = shared_library(
    'cred_munge', # name
    cred_munge_plugin_src, # source files
    include_directories: [slurm_inc],
    dependencies: [dl_libs, pthread_libs, munge_libs],
    # TODO: Why is linking libslurmfull necessary, when other plugins don't need it?
    link_with: [libslurmfull],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)


