jobcomp_script_src = [
    'jobcomp_script.c',
]

jobcomp_script = shared_module(
    'jobcomp_script', # name
    jobcomp_script_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)