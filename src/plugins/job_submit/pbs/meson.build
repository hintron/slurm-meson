job_submit_pbs_src = [
    'job_submit_pbs.c',
]

job_submit_pbs_plugin = shared_module(
    'job_submit_pbs', # name
    job_submit_pbs_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)

spank_pbs_src = [
    'spank_pbs.c',
]

spank_pbs_plugin = shared_module(
    'spank_pbs', # name
    spank_pbs_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)