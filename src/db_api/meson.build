db_api_src = [
    'account_functions.c',
    'archive_functions.c',
    'assoc_functions.c',
    'cluster_functions.c',
    'cluster_report_functions.c',
    'coord_functions.c',
    'connection_functions.c',
    'extra_get_functions.c',
    'federation_functions.c',
    'job_functions.c',
    'job_report_functions.c',
    'qos_functions.c',
    'resource_functions.c',
    'tres_functions.c',
    'usage_functions.c',
    'user_functions.c',
    'user_report_functions.c',
    'wckey_functions.c',
]

# TODO: WITH_GNU_LD trickery

# TODO: API version stuff

libslurmdb = build_target(
    'slurmdb', # name
    db_api_src, # source files
    include_directories: [slurm_inc],
    dependencies: [pthread_libs, dl_libs],
    # TODO: The makefile says it needs this...
    # link_with: [libslurmhelper],
    link_with: [libslurmfull],
    target_type: libslurm_type,
)