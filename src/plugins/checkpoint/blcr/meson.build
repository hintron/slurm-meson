if conf_data.get('WITH_BLCR', false)
    checkpoint_blcr_plugin = shared_module(
        'checkpoint_blcr', # name
        'checkpoint_blcr.c', # source files
        include_directories: [slurm_inc],
        install: true,
        install_dir: pkglibdir,
        name_prefix: '',
    )
    # TODO: DPKGLIBEXECDIR,
endif