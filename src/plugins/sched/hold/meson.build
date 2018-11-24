sched_hold_src = [
    'hold_wrapper.c',
]

sched_hold_plugin = shared_module(
    'sched_hold', # name
    sched_hold_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)