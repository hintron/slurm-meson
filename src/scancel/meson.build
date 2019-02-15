scancel_src = [
    'scancel.h',
    'scancel.c',
    'opt.c',
]

scancel = executable(
    'scancel', # name
    scancel_src, # source files
    include_directories: [slurm_inc],
    dependencies: [dl_libs, pthread_libs],
    link_with: [libslurmfull],
    install: true,
    install_dir: get_option('bindir'),
    export_dynamic: true,
    install_rpath: executable_rpath,
)
