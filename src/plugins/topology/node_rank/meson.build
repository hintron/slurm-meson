topology_node_rank_src = [
    'topology_node_rank.c',
]

topology_node_rank = shared_module(
    'topology_node_rank', # name
    topology_node_rank_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)