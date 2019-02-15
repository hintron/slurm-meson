sh5util_src = [
    'sh5util.c',
    'sh5util.h',
]
sh5util = executable(
    'sh5util', # name
    sh5util_src, # source files
    include_directories: [slurm_inc],
    dependencies: [dl_libs, hdf5_libs],
    link_with: [libslurmfull, libhdf5_api],
    install: true,
    install_dir: get_option('bindir'),
    export_dynamic: true,
    install_rpath: executable_rpath,
)

# TODO: HDF5_CPPFLAGS, CMD_LDFLAGS, HDF5_LDFLAGS