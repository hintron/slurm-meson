slurmdbd_src = [
    'backup.c',
    'backup.h',
    'proc_req.c',
    'proc_req.h',
    'read_config.c',
    'read_config.h',
    'rpc_mgr.c',
    'rpc_mgr.h',
    'slurmdbd.c',
    'slurmdbd.h',
]

# Note: Make sure export_dynamic and implib are set, so that plugins can easily
# access slurmdbd functions (symbols).
# https://stackoverflow.com/a/17083153 (-Wl,--export-dynamic flag)
# https://mesonbuild.com/Reference-manual.html#shared_module

slurmdbd = executable(
    'slurmdbd', # name
    slurmdbd_src, # source files
    include_directories: [slurm_inc],
    dependencies: [pthread_libs, dl_libs],
    link_with: [libslurm, libdaemonize],
    install: true,
    install_dir: get_option('sbindir'),
    # Either implib and/or export_dynamic need to be set for plugins to access slurmdbd functions
    export_dynamic: true,
)
