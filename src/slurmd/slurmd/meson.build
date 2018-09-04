

slurmd_src = [
    'slurmd.c',
    'slurmd.h',
    'req.c',
    'req.h',
    'get_mach_stat.c',
    'get_mach_stat.h',
]



slurmd = executable(
    'slurmd', # name
    [slurmd_src], # source files
    include_directories: [slurm_inc],
    # TODO: Depend on hwloc, pam, util, ssh2
    dependencies: [pthread_libs, numa_libs, dl_libs],
    # dependencies: [pthread_libs, dl_libs, numa_libs],
    # link_with: [libcommon, libslurm, libdaemonize],
    link_with: [libcommon, libdaemonize, libslurmd_common, libspank, libbcast],
    install: true,
    install_dir: get_option('sbindir'),
)
