if conf_data.get('BUILD_OFED', false)
    acct_gather_interconnect_ofed_src = [
        'acct_gather_interconnect_ofed.c',
        'acct_gather_interconnect_ofed.h',
    ]

    acct_gather_interconnect_ofed = shared_module(
        'acct_gather_interconnect_ofed', # name
        acct_gather_interconnect_ofed_src, # source files
        include_directories: [slurm_inc],
        dependencies: [ofed_libs],
        install: true,
        install_dir: pkglibdir,
        name_prefix: '',
    )
    # TODO: OFED_CPPFLAGS, OFED_LDFLAGS
endif