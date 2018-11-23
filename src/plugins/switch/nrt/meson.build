if conf_data.get('HAVE_NRT', false)
    # TODO: Finish libpermapi
    subdir('libpermapi')

    switch_nrt_src = [
        'nrt.c',
        'nrt_keys.h',
        'slurm_nrt.h',
        'switch_nrt.c',
    ]

    switch_nrt = shared_module(
        'switch_nrt', # name
        switch_nrt_src, # source files
        include_directories: [slurm_inc],
        install: true,
        install_dir: pkglibdir,
        name_prefix: '',
    )
endif