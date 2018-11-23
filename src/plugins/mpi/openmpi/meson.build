mpi_openmpi_src = [
    'mpi_openmpi.c',
]

mpi_openmpi_plugin = shared_module(
    'mpi_openmpi', # name
    mpi_openmpi_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)
