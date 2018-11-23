job_submit_defaults_src = [
    'job_submit_defaults.c',
]

job_submit_defaults_plugin = shared_module(
    'job_submit_defaults', # name
    job_submit_defaults_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)
