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
    # TODO: Depend on ssh2
    # slurmd and slurmstepd dependencies should match, or slurmstepd can silently fail
    dependencies: [pthread_lib, numa_lib, dl_lib, util_lib, hwloc_lib, pam_lib, pam_misc_lib],
    link_with: [libslurmfull, libdaemonize, libslurmd_common, libfile_bcast],
    install: true,
    install_dir: get_option('sbindir'),
    export_dynamic: true,
    install_rpath: executable_rpath,
    # c_args: [''],
    # This is needed to actually link to the libs that slurmd doesn't use
    # TODO: Or use link_whole?
    # link_args: ['-Wl,--no-as-needed'],
)