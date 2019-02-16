strigger_src = [
    'strigger.h',
    'strigger.c',
    'opts.c',
]

strigger = executable(
    'strigger', # name
    strigger_src, # source files
    include_directories: [slurm_inc],
    dependencies: [dl_lib],
    link_with: [libslurmfull],
    install: true,
    install_dir: get_option('bindir'),
    export_dynamic: true,
    install_rpath: executable_rpath,
)
