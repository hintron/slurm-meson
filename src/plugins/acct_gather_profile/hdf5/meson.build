if conf_data.get('BUILD_HDF5', 0) == 1
    libhdf5_api_src = [
        'acct_gather_profile_hdf5.c',
    ]

    libhdf5_api = static_library(
        'hdf5_api', # name
        libhdf5_api_src, # source files
        include_directories: [slurm_inc],
        dependencies: [hdf5_libs],
    )

    acct_gather_profile_hdf5_src = [
        'acct_gather_profile_hdf5.c',
    ]

    acct_gather_profile_hdf5 = shared_module(
        'acct_gather_profile_hdf5', # name
        acct_gather_profile_hdf5_src, # source files
        include_directories: [slurm_inc],
        dependencies: [hdf5_libs],
        install: true,
        install_dir: pkglibdir,
        name_prefix: '',
    )

    # TODO: HDF5_CPPFLAGS, HDF5_LDFLAGS
    subdir('sh5util')
endif