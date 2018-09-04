launch_slurm_src = [
    'launch_slurm.c',
    'task_state.c',
    'task_state.h',
]

launch_slurm_plugin = shared_module(
    'launch_slurm', # name
    launch_slurm_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)