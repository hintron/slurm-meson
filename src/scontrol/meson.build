scontrol_src = [
    'create_res.c',
    'info_burst_buffer.c',
    'info_assoc_mgr.c',
    'info_fed.c',
    'info_job.c',
    'info_layout.c',
    'info_lics.c',
    'info_node.c',
    'info_part.c',
    'info_res.c',
    'reboot_node.c',
    'scontrol.c',
    'scontrol.h',
    'update_job.c',
    'update_layout.c',
    'update_node.c',
    'update_part.c',
    'update_step.c',
    'update_powercap.c',
]

scontrol = executable(
    'scontrol', # name
    scontrol_src, # source files
    include_directories: [slurm_inc],
    dependencies: [dl_libs, pthread_libs],
    link_with: [libslurmfull],
    install: true,
    install_dir: get_option('bindir'),
    export_dynamic: true,
    install_rpath: executable_rpath,
)
