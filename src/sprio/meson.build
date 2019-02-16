sprio_src = [
    'sprio.h',
    'print.h',
    'sprio.c',
    'print.c',
    'opts.c',
    'sort.c',
]

sprio = executable(
    'sprio', # name
    sprio_src, # source files
    include_directories: [slurm_inc],
    dependencies: [dl_lib],
    link_with: [libslurmfull],
    install: true,
    install_dir: get_option('bindir'),
    export_dynamic: true,
    install_rpath: executable_rpath,
)
