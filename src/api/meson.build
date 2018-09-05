# TODO: WITH_GNU_LD trickery

slurmapi_src = [
    'allocate.c',
    'allocate_msg.c',
    'block_info.c',
    'burst_buffer_info.c',
    'assoc_mgr_info.c',
    'cancel.c',
    'checkpoint.c',
    'complete.c',
    'config_info.c',
    'federation_info.c',
    'front_end_info.c',
    'init_msg.c',
    'job_info.c',
    'job_step_info.c',
    'layout_info.c',
    'license_info.c',
    'node_info.c',
    'partition_info.c',
    'pmi_server.c',
    'pmi_server.h',
    'powercap_info.c',
    'reservation_info.c',
    'signal.c',
    'slurm_get_statistics.c',
    'slurm_hostlist.c',
    'slurm_pmi.c',
    'slurm_pmi.h',
    'step_ctx.c',
    'step_ctx.h',
    'step_io.c',
    'step_io.h',
    'step_launch.c',
    'step_launch.h',
    'submit.c',
    'suspend.c',
    'topo_info.c',
    'triggers.c',
    'reconfigure.c',
    'update_config.c',
]

libslurmhelper = static_library(
    'slurmhelper', # name
    [slurmapi_src], # source files
    include_directories: [slurm_inc],
    dependencies: [pthread_libs],
    link_with: [libcommon, libeio, libspank],
)

#  TODO: Add in API version info to this library
libslurm = build_target(
    'slurm', # name
    include_directories: [slurm_inc],
    dependencies: [pthread_libs, dl_libs],
    link_with: [libslurmhelper],
    target_type: libslurm_type,
)

libslurmfull = build_target(
    'slurmfull', # name
    include_directories: [slurm_inc],
    dependencies: [pthread_libs, dl_libs],
    link_with: [libslurmhelper],
    target_type: libslurm_type,
)