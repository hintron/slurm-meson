proctrack_cgroup_src = [
    'proctrack_cgroup.c',
]

proctrack_cgroup_plugin = shared_module(
    'proctrack_cgroup', # name
    proctrack_cgroup_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)