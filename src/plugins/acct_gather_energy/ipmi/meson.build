if conf_data.get('BUILD_IPMI', 0) == 1
    acct_gather_energy_impi_src = [
        'acct_gather_energy_impi.c',
        'acct_gather_energy_impi.h',
    ]

    acct_gather_energy_impi = shared_module(
        'acct_gather_energy_impi', # name
        acct_gather_energy_impi_src, # source files
        include_directories: [slurm_inc],
        dependencies: [freeimpi_libs],
        install: true,
        install_dir: pkglibdir,
        name_prefix: '',
    )
    # TODO: FREEIPMI_CPPFLAGS, FREEIPMI_LDFLAGS
endif