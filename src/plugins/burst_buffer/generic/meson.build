burst_buffer_generic_src = [
    'burst_buffer_generic.c',
]

burst_buffer_generic_plugin = shared_module(
    'burst_buffer_generic', # name
    burst_buffer_generic_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
    link_with: [burst_buffer_common],
)
