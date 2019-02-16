sstat_src = [
    'options.c',
    'print.c',
    'sstat.c',
    'sstat.h',
]

sstat = executable(
    'sstat', # name
    sstat_src, # source files
    include_directories: [slurm_inc],
    dependencies: [dl_lib],
    link_with: [libslurmfull],
    install: true,
    install_dir: get_option('bindir'),
    export_dynamic: true,
    install_rpath: executable_rpath,
)
