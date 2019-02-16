acct_gather_energy_xcc_src = [
    'acct_gather_energy_xcc.c',
]

acct_gather_energy_xcc = shared_module(
    'acct_gather_energy_xcc', # name
    acct_gather_energy_xcc_src, # source files
    include_directories: [slurm_inc],
    dependencies: [math_libs],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)