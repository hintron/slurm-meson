sshare_src = [
    'process.c',
    'sshare.c',
    'sshare.h',
]

sshare = executable(
    'sshare', # name
    sshare_src, # source files
    include_directories: [slurm_inc],
    dependencies: [dl_lib, math_lib, readline_lib],
    link_with: [libslurmfull],
    install: true,
    install_dir: get_option('bindir'),
    export_dynamic: true,
    install_rpath: executable_rpath,
)
