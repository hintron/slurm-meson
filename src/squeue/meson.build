squeue_src = [
    'squeue.c',
    'squeue.h',
    'print.c',
    'print.h',
    'opts.c',
    'sort.c',
]

squeue = executable(
    'squeue', # name
    squeue_src, # source files
    include_directories: [slurm_inc],
    dependencies: [dl_lib, pthread_lib],
    link_with: [libslurmfull],
    install: true,
    install_dir: get_option('bindir'),
    export_dynamic: true,
    install_rpath: executable_rpath,
)