if conf_data.get('WITH_CURL', false)
    acct_gather_profile_influxdb_src = [
        'acct_gather_profile_influxdb.c',
    ]

    acct_gather_profile_influxdb = shared_module(
        'acct_gather_profile_influxdb', # name
        acct_gather_profile_influxdb_src, # source files
        include_directories: [slurm_inc],
        dependencies: [libcurl],
        install: true,
        install_dir: pkglibdir,
        name_prefix: '',
    )
    # TODO: LIBCURL_CPPFLAGS, SO_LDFLAGS
endif