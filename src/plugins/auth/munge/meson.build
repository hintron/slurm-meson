if munge_libs.found()
    auth_munge_plugin = shared_module(
        'auth_munge', # name
        'auth_munge.c', # source files
        include_directories: [slurm_inc],
        dependencies: [munge_libs],
        install: true,
        install_dir: pkglibdir,
        name_prefix: '',
    )
else
    warning('auth/munge not being built because munge_libs not found')
endif