sh5util_src = [
    'sh5util.c',
    'sh5util.h',
]
sh5util = executable(
    'sh5util', # name
    sh5util_src, # source files
    include_directories: [slurm_inc],
    dependencies: [dl_lib, hdf5_lib, hdf5_hl_lib],
    # TODO: Makefile calls for libslurm.o. Can I get away with libslurmfull.so? libslurmfull.a?
    link_with: [libslurmfull, libhdf5_api],
    install: true,
    install_dir: get_option('bindir'),
    export_dynamic: true,
    install_rpath: executable_rpath,
)

# TODO: HDF5_CPPFLAGS, CMD_LDFLAGS, HDF5_LDFLAGS