power_none_src = [
    'power_none.c',
]

power_none_plugin = shared_module(
    'power_none', # name
    power_none_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
    link_with: [power_common],
)
