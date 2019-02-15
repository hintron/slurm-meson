switch_cray_src = [
    'cookies.c',
    'gpu.c',
    'iaa.c',
    'pe_info.c',
    'scaling.c',
    'switch_cray.c',
    'switch_cray.h',
    'util.c',
]

switch_cray = shared_module(
    'switch_cray', # name
    switch_cray_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)