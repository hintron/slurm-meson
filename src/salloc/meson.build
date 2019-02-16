salloc_src = [
    'salloc.c',
    'salloc.h',
    'opt.c',
    'opt.h',
]

salloc = executable(
    'salloc', # name
    salloc_src, # source files
    include_directories: [slurm_inc],
    dependencies: [dl_lib],
    link_with: [libslurmfull],
    install: true,
    install_dir: get_option('bindir'),
    export_dynamic: true,
    install_rpath: executable_rpath,
)
