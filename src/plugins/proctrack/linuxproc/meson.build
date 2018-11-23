proctrack_linuxproc_src = [
    'proctrack_linuxproc.c',
    'kill_tree.c',
    'kill_tree.h',
]

proctrack_linuxproc_plugin = shared_module(
    'proctrack_linuxproc', # name
    proctrack_linuxproc_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)