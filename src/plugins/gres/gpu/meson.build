gres_gpu_src = [
    'gres_gpu.c',
]

gres_gpu_plugin = shared_module(
    'gres_gpu', # name
    gres_gpu_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
    link_with: [gres_common],
)

# TODO: NVML libs, compile and link flags