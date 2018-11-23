select_cons_tres_src = [
    'dist_tasks.c',
    'dist_tasks.h',
    'job_test.c',
    'job_test.h',
    'select_cons_tres.c',
    'select_cons_tres.h',
]

select_cons_tres = shared_module(
    'select_cons_tres', # name
    select_cons_tres_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)