gres_nic_src = [
    'gres_nic.c',
]

gres_nic_plugin = shared_module(
    'gres_nic', # name
    gres_nic_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
    link_with: [gres_common],
)
