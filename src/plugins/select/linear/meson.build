select_linear_src = [
    'select_linear.c',
    'select_linear.h',
]

select_linear = shared_module(
    'select_linear', # name
    select_linear_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)