accounting_storage_filetxt_src = [
    'accounting_storage_filetxt.c',
    'filetxt_jobacct_process.c',
    'filetxt_jobacct_process.h',
]

accounting_storage_filetxt_plugin = shared_module(
    'accounting_storage_filetxt', # name
    accounting_storage_filetxt_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)