sacctmgr_src = [
    'account_functions.c',
    'archive_functions.c',
    'association_functions.c',
    'config_functions.c',
    'cluster_functions.c',
    'common.c',
    'event_functions.c',
    'federation_functions.c',
    'file_functions.c',
    'runaway_job_functions.c',
    'job_functions.c',
    'reservation_functions.c',
    'resource_functions.c',
    'sacctmgr.c',
    'sacctmgr.h',
    'qos_functions.c',
    'txn_functions.c',
    'user_functions.c',
    'wckey_functions.c',
    'problem_functions.c',
    'tres_function.c',
]

sacctmgr = executable(
    'sacctmgr', # name
    sacctmgr_src, # source files
    include_directories: [slurm_inc],
    dependencies: [pthread_lib, dl_lib, readline_lib],
    link_with: [libslurmfull, libdaemonize],
    install: true,
    install_dir: get_option('bindir'),
    export_dynamic: true,
    install_rpath: executable_rpath,
)