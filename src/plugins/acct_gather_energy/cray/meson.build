acct_gather_energy_cray_src = [
    'acct_gather_energy_cray.c',
]

acct_gather_energy_cray = shared_module(
    'acct_gather_energy_cray', # name
    acct_gather_energy_cray_src, # source files
    include_directories: [slurm_inc],
    dependencies: [math_lib],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)