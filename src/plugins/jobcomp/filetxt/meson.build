jobcomp_filetxt_src = [
    'jobcomp_filetxt.c',
    'filetxt_jobcomp_process.c',
    'filetxt_jobcomp_process.h',
]

jobcomp_filetxt = shared_module(
    'jobcomp_filetxt', # name
    jobcomp_filetxt_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)