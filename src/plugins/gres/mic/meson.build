gres_mic_src = [
    'gres_mic.c',
]

gres_mic_plugin = shared_module(
    'gres_mic', # name
    gres_mic_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
    link_with: [gres_common],
)
