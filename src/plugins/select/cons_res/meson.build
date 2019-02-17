select_cons_res_plugin_src = [
    'select_cons_res.c',
    'select_cons_res.h',
    'dist_tasks.c',
    'dist_tasks.h',
    'job_test.c',
    'job_test.h',
]

select_cons_res_plugin = shared_module(
    'select_cons_res', # name
    select_cons_res_plugin_src, # source files
    include_directories: [slurm_inc],
    dependencies: [dl_lib, pthread_lib],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)