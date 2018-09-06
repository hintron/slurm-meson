sbcast_src = [
    'sbcast.h',
    'sbcast.c',
    'opts.c',
]

sbcast = executable(
    'sbcast', # name
    sbcast_src, # source files
    include_directories: [slurm_inc],
    dependencies: [dl_libs],
    link_with: [libslurmfull, libfile_bcast],
    install: true,
    install_dir: get_option('bindir'),
    export_dynamic: true,
    install_rpath: executable_rpath,
)

# TODO: -lm
