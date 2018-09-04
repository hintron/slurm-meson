slurmstepd_src = [
    'slurmstepd.c',
    'slurmstepd.h',
    'mgr.c',
    'mgr.h',
    'task.c',
    'task.h',
    'slurmstepd_job.c',
    'slurmstepd_job.h',
    'io.c',
    'io.h',
    'ulimits.c',
    'ulimits.h',
    'pdebug.c',
    'pdebug.h',
    'pam_ses.c',
    'pam_ses.h',
    'req.c',
    'req.h',
    'multi_prog.c',
    'multi_prog.h',
    'step_terminate_monitor.c',
    'step_terminate_monitor.h',
]

# TODO: IF with X11, add sources

# if WITH_SLURM_X11
# slurmstepd_SOURCES += x11_forwarding.c x11_forwarding.h
# else
# EXTRA_slurmstepd_SOURCES = x11_forwarding.c x11_forwarding.h
# endif

slurmstepd = executable(
    'slurmstepd', # name
    [slurmstepd_src], # source files
    include_directories: [slurm_inc],
    # TODO: Depend on hwloc, pam, ssh2
    # slurmd and slurmstepd dependencies should match, or slurmstepd can silently fail
    dependencies: [pthread_libs, numa_libs, dl_libs, util_libs],
    link_with: [libslurmfull, libdaemonize, libslurmd_common],
    install: true,
    install_dir: get_option('sbindir'),
    export_dynamic: true,
)