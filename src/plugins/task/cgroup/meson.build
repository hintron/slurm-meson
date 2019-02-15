task_cgroup_src = [
    'task_cgroup.h',
    'task_cgroup.c',
    'task_cgroup_cpuset.h',
    'task_cgroup_cpuset.c',
    'task_cgroup_memory.h',
    'task_cgroup_memory.c',
    'task_cgroup_devices.h',
    'task_cgroup_devices.c',
]

task_cgroup = shared_module(
    'task_cgroup', # name
    task_cgroup_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)

# TODO: Set HWLOC_CPPFLAGS