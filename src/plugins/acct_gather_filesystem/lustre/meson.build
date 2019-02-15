acct_gather_filesystem_lustre_src = [
    'acct_gather_filesystem_lustre.c',
]

acct_gather_filesystem_lustre = shared_module(
    'acct_gather_filesystem_lustre', # name
    acct_gather_filesystem_lustre_src, # source files
    include_directories: [slurm_inc],
    dependencies: [math_libs],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)