if conf_data.get('WITH_JSON_PARSER', 0) == 1
    burst_buffer_cray_src = [
        'burst_buffer_cray.c',
    ]

    burst_buffer_cray_plugin = shared_module(
        'burst_buffer_cray', # name
        burst_buffer_cray_src, # source files
        include_directories: [slurm_inc],
        install: true,
        install_dir: pkglibdir,
        name_prefix: '',
        link_with: [burst_buffer_common],
    )
endif
