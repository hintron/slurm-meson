task_cray_src = [
    'task_cray.c',
]

task_cray = shared_module(
    'task_cray', # name
    task_cray_src, # source files
    include_directories: [slurm_inc],
    dependencies: [numa_lib],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
    # Force use of numa v1
    c_args: ['-DNUMA_VERSION1_COMPATIBILITY'],
)

# TODO: Set CRAY_TASK_CPPFLAGS