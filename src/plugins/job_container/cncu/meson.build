job_container_cncu_src = [
    'job_container_cncu.c',
]

job_container_cncu = shared_module(
    'job_container_cncu', # name
    job_container_cncu_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)
# TODO: CRAY_JOB_LDFLAGS