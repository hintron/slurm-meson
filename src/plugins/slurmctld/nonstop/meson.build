slurmctld_nonstop_src = [
    'do_work.c',
    'do_work.h',
    'msg.c',
    'msg.h',
    'nonstop.c',
    'read_config.c',
    'read_config.h',
]

slurmctld_nonstop_plugin = shared_module(
    'slurmctld_nonstop', # name
    slurmctld_nonstop_src, # source files
    include_directories: [slurm_inc],
    dependencies: [munge_lib],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)

# TODO: Add munge cflags, ldflags