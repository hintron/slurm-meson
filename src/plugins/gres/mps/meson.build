gres_mps_src = [
    'gres_mps.c',
]

gres_mps_plugin = shared_module(
    'gres_mps', # name
    gres_mps_src, # source files
    include_directories: [slurm_inc],
    dependencies: [nvml_libs],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
    link_with: [gres_common],
)

# TODO: NVML libs, compile and link flags