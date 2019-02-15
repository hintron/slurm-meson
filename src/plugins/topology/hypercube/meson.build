topology_hypercube_src = [
    'topology_hypercube.c',
]

topology_hypercube = shared_module(
    'topology_hypercube', # name
    topology_hypercube_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)