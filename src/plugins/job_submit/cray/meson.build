job_submit_cray_src = [
    'job_submit_cray.c',
]

job_submit_cray_plugin = shared_module(
    'job_submit_cray', # name
    job_submit_cray_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)

# TODO: DDEFAULT_SCRIPT_DIR=sysconfdir flag