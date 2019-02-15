sacct_src = [
    'options.c',
    'print.c',
    'process.c',
    'sacct.c',
    'sacct.h',
]

sacct = executable(
    'sacct', # name
    sacct_src, # source files
    include_directories: [slurm_inc],
    dependencies: [dl_libs],
    link_with: [libslurmfull],
    install: true,
    install_dir: get_option('bindir'),
    export_dynamic: true,
    install_rpath: executable_rpath,
)
