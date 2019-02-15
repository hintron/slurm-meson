proctrack_cray_src = [
    'proctrack_cray.c',
]

proctrack_cray_plugin = shared_module(
    'proctrack_cray', # name
    proctrack_cray_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)