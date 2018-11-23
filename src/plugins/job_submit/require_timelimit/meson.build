job_submit_require_timelimit_src = [
    'job_submit_require_timelimit.c',
]

job_submit_require_timelimit_plugin = shared_module(
    'job_submit_require_timelimit', # name
    job_submit_require_timelimit_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)