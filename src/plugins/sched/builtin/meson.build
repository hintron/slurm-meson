sched_builtin_src = [
    'builtin_wrapper.c',
    'builtin.c',
    'builtin.h',
]

sched_builtin_plugin = shared_module(
    'sched_builtin', # name
    sched_builtin_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)