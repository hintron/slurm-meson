core_spec_cray_src = [
    'core_spec_cray.c',
]

core_spec_cray_plugin = shared_module(
    'core_spec_cray', # name
    core_spec_cray_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)

# TODO: Cray job cpp and ld flags