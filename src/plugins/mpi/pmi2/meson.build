mpi_pmi2_src = [
    'mpi_pmi2.c',
    'agent.c',
    'agent.h',
    'client.c',
    'client.h',
    'kvs.c',
    'kvs.h',
    'info.c',
    'info.h',
    'pmi1.c',
    'pmi2.c',
    'pmi.h',
    'setup.c',
    'setup.h',
    'spawn.c',
    'spawn.h',
    'tree.c',
    'tree.h',
    'nameserv.c',
    'nameserv.h',
    'ring.c',
    'ring.h',
]

mpi_pmi2_plugin = shared_module(
    'mpi_pmi2', # name
    mpi_pmi2_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
    link_with: [libslurmd_reverse_tree_math],
)
