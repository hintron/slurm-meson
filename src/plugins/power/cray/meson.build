if conf_data.get('WITH_JSON_PARSER', false)
    power_cray_src = [
        'power_cray.c',
    ]

    power_cray_plugin = shared_module(
        'power_cray', # name
        power_cray_src, # source files
        include_directories: [slurm_inc],
        install: true,
        install_dir: pkglibdir,
        name_prefix: '',
        link_with: [power_common],
    )
endif
