libslurmd_reverse_tree_math = static_library(
    'slurmd_reverse_tree_math', # name
    ['reverse_tree_math.c', 'reverse_tree_math.h'], # source files
)

slurmd_common_src = [
    'core_spec_plugin.c',
    'core_spec_plugin.h',
    'fname.c',
    'fname.h',
    'job_container_plugin.c',
    'job_container_plugin.h',
    'log_ctld.c',
    'log_ctld.h',
    'proctrack.c',
    'proctrack.h',
    'setproctitle.c',
    'setproctitle.h',
    'slurmd_cgroup.c',
    'slurmd_cgroup.h',
    'slurmstepd_init.c',
    'slurmstepd_init.h',
    'run_script.c',
    'run_script.h',
    'task_plugin.c',
    'task_plugin.h',
    'set_oomadj.c',
    'set_oomadj.h',
    'reverse_tree.h',
    'xcpuinfo.c',
    'xcpuinfo.h',
    'xcgroup.c',
    'xcgroup.h',
]

libslurmd_common = static_library(
    'slurmd_common', # name
    [slurmd_common_src], # source files
    include_directories: [slurm_inc],
    dependencies: [hwloc_libs],
    link_with: [libslurmd_reverse_tree_math],
)

# TODO: Add in HWLOC CPP and LD flags instead of global flags