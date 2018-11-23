job_submit_throttle_src = [
    'job_submit_throttle.c',
]

job_submit_throttle_plugin = shared_module(
    'job_submit_throttle', # name
    job_submit_throttle_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)