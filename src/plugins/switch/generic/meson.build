switch_generic_src = [
    'switch_generic.c',
]

switch_generic = shared_module(
    'switch_generic', # name
    switch_generic_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)