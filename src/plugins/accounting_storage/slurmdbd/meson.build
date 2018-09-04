accounting_storage_slurmdbd_src = [
    'accounting_storage_slurmdbd.c',
    'slurmdbd_agent.c',
    'slurmdbd_agent.h',
]

accounting_storage_slurmdbd_plugin = shared_module(
    'accounting_storage_slurmdbd', # executable name
    accounting_storage_slurmdbd_src, # source files
    include_directories: [slurm_inc],
    install : true,
    install_dir: pkglibdir,
    name_prefix: '',
)