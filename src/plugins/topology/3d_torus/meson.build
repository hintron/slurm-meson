topology_3d_torus_src = [
    'hilbert.c',
    'hilbert.h',
    'hilbert_slurm.c',
    'topology_3d_torus.c',
]

topology_3d_torus = shared_module(
    'topology_3d_torus', # name
    topology_3d_torus_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)