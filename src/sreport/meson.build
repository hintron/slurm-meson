sreport_src = [
    'sreport.c',
    'sreport.h',
    'cluster_reports.c',
    'cluster_reports.h',
    'job_reports.c',
    'job_reports.h',
    'user_reports.c',
    'user_reports.h',
    'resv_reports.c',
    'resv_reports.h',
    'common.c',
]

sreport = executable(
    'sreport', # name
    sreport_src, # source files
    include_directories: [slurm_inc],
    dependencies: [dl_libs, readline_libs],
    link_with: [libslurmfull, libslurmdb],
    install: true,
    install_dir: get_option('bindir'),
    export_dynamic: true,
    install_rpath: executable_rpath,
)