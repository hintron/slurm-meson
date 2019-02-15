select_cray_src = [
    'ccm.c',
    'ccm.h',
    'select_cray.c',
]

select_cray = shared_module(
    'select_cray', # name
    select_cray_src, # source files
    include_directories: [slurm_inc, include_directories('../other')],
    install: true,
    install_dir: pkglibdir,
    link_with: [libother_select],
    name_prefix: '',
)