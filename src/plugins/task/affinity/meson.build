# Only build if HAVE_SCHED_SETAFFINITY
if conf_data.get('HAVE_SCHED_SETAFFINITY', 0) == 1
    task_affinity_src = [
        'affinity.c',
        'affinity.h',
        'cpuset.c',
        'dist_tasks.c',
        'dist_tasks.h',
        'numa.c',
        'schedutils.c',
        'task_affinity.c',
    ]

    task_affinity = shared_module(
        'task_affinity', # name
        task_affinity_src, # source files
        include_directories: [slurm_inc],
        dependencies: [numa_libs],
        install: true,
        install_dir: pkglibdir,
        name_prefix: '',
        # Force use of numa v1
        c_args: ['-DNUMA_VERSION1_COMPATIBILITY'],
    )
endif

