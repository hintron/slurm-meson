jobcomp_cgroup_src = [
    'jobacct_gather_cgroup.c',
    'jobacct_gather_cgroup_cpuacct.c',
    'jobacct_gather_cgroup_memory.c',
    'jobacct_gather_cgroup_blkio.c',
    'jobacct_gather_cgroup.h',
]

jobcomp_cgroup = shared_module(
    'jobcomp_cgroup', # name
    jobcomp_cgroup_src, # source files
    include_directories: [slurm_inc],
    link_with: [libjobacct_gather_common],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)
