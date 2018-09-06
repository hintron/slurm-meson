# Conditionally build smap only
if build_smap
    smap_src = [
        'smap.h',
        'smap.c',
        'job_functions.c',
        'partition_functions.c',
        'grid_functions.c',
        'reservation_functions.c',
        'opts.c',
    ]

    smap = executable(
        'smap', # name
        smap_src, # source files
        include_directories: [slurm_inc],
        dependencies: [dl_libs, ncurses_libs],
        link_with: [libslurmfull],
        install: true,
        install_dir: get_option('bindir'),
        export_dynamic: true,
        install_rpath: executable_rpath,
    )
endif