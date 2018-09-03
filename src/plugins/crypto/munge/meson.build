crypto_munge_plugin_src = [
    'crypto_munge.c',
]

crypto_munge_plugin = shared_library(
    'crypto_munge', # executable name
    crypto_munge_plugin_src, # source files
    include_directories: [configuration_inc],
    dependencies: [dl_libs, pthread_libs, munge_libs],
    link_with: [libslurm],
    install : true,
    install_dir: join_paths(get_option('libdir'), 'slurm'),
)


