job_submit_logging_src = [
    'job_submit_logging.c',
]

job_submit_logging_plugin = shared_module(
    'job_submit_logging', # name
    job_submit_logging_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)
