select_cons_res_plugin_src = [
    'select_cons_res.c',
    'select_cons_res.h',
    'dist_tasks.c',
    'dist_tasks.h',
    'job_test.c',
    'job_test.h',
]

# https://mesonbuild.com/Reference-manual.html#shared_module
# Use shared_module() over shared_library(), because that allows this .so to
# access the caller's symbols (if the caller has export-dynamic set)
select_cons_res_plugin = shared_module(
    'select_cons_res', # name
    select_cons_res_plugin_src, # source files
    include_directories: [slurm_inc],
    dependencies: [dl_libs, pthread_libs],
    link_with: [libcommon],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)