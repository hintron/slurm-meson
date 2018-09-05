crypto_munge_plugin_src = [
    'crypto_munge.c',
]

crypto_munge_plugin = shared_library(
    'crypto_munge', # name
    crypto_munge_plugin_src, # source files
    include_directories: [slurm_inc],
    dependencies: [dl_libs, pthread_libs, munge_libs],
    # link_with: [libslurmfull],
    link_with: [libslurmhelper],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)


