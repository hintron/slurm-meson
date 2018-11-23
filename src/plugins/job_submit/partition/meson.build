job_submit_partition_src = [
    'job_submit_partition.c',
]

job_submit_partition_plugin = shared_module(
    'job_submit_partition', # name
    job_submit_partition_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)