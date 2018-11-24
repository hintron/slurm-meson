# Conditionally build sview
if build_sview
    sview_src = [
        'sview.h',
        'gthread_helper.h',
        'sview.c',
        'popups.c',
        'grid.c',
        'part_info.c',
        'job_info.c',
        'front_end_info.c',
        'node_info.c',
        'resv_info.c',
        'submit_info.c',
        'admin_info.c',
        'common.c',
        'config_info.c',
        'defaults.c',
        'gthread_helper.c',
        'bb_info.c',
    ]

    sview = executable(
        'sview', # name
        sview_src, # source files
        include_directories: [slurm_inc],
        dependencies: [dl_libs, gtk_libs],
        link_with: [libslurmfull, libslurmdb],
        install: true,
        install_dir: get_option('bindir'),
        export_dynamic: true,
        install_rpath: executable_rpath,
    )
endif