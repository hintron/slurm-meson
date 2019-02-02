subdir('libsrun')

srun_src = [
    'srun.c',
    'srun_pty.c',
    'srun_pty.h',
    'srun.wrapper.c',
]

srun = executable(
    'srun', # name
    srun_src, # source files
    include_directories: [slurm_inc, include_directories('libsrun')],
    dependencies: [pthread_libs, dl_libs],
    link_with: [libslurmfull, libfile_bcast, libsrun, libdaemonize],
    install: true,
    install_dir: get_option('bindir'),
    export_dynamic: true,
    install_rpath: executable_rpath,
)