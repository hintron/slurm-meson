acct_gather_energy_rapl_src = [
    'acct_gather_energy_rapl.c',
]

acct_gather_energy_rapl = shared_module(
    'acct_gather_energy_rapl', # name
    acct_gather_energy_rapl_src, # source files
    include_directories: [slurm_inc],
    dependencies: [math_lib],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)