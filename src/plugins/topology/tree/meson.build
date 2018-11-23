topology_tree_src = [
    'topology_tree.c',
]

topology_tree = shared_module(
    'topology_tree', # name
    topology_tree_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)