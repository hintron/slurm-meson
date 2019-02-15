job_submit_all_partitions_src = [
    'job_submit_all_partitions.c',
]

job_submit_all_partitions_plugin = shared_module(
    'job_submit_all_partitions', # name
    job_submit_all_partitions_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)