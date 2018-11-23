jobcomp_mysql_src = [
    'jobacct_gather_linux.c',
]

jobcomp_mysql = shared_module(
    'jobcomp_mysql', # name
    jobcomp_mysql_src, # source files
    include_directories: [slurm_inc],
    link_with: [libjobacct_gather_common],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)
