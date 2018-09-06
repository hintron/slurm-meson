# Conditionally build srun_cr
if build_srun_cr
    srun_cr = executable(
        'srun_cr', # name
        'srun_cr.c', # source files
        include_directories: [slurm_inc],
        dependencies: [dl_libs, pthread_libs, blcr_libs],
        link_with: [libslurmfull],
        install: true,
        install_dir: get_option('bindir'),
        export_dynamic: true,
        install_rpath: executable_rpath,
    )
endif