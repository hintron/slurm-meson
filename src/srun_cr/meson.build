srun_cr = executable(
    'srun_cr', # name
    'srun_cr.c', # source files
    include_directories: [slurm_inc],
    dependencies: [dl_lib, pthread_lib, blcr_lib],
    link_with: [libslurmfull],
    install: true,
    install_dir: get_option('bindir'),
    export_dynamic: true,
    install_rpath: executable_rpath,
)
