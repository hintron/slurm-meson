priority_multifactor_src = [
    'priority_multifactor.c',
    'fair_tree.c',
    'fair_tree.h',
    'priority_multifactor.h',
]

priority_multifactor_plugin = shared_module(
    'priority_multifactor', # name
    priority_multifactor_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    dependencies: [mathlib],
    name_prefix: '',
)