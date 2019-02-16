acct_gather_energy_ibmaem_src = [
    'acct_gather_energy_ibmaem.c',
]

acct_gather_energy_ibmaem = shared_module(
    'acct_gather_energy_ibmaem', # name
    acct_gather_energy_ibmaem_src, # source files
    include_directories: [slurm_inc],
    dependencies: [math_lib],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)