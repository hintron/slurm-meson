launch_poe_src = [
    'launch_poe.c',
]

launch_poe_plugin = shared_module(
    'launch_poe', # name
    launch_poe_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)