libsrun_src = [
    'allocate.c',
    'allocate.h',
    'debugger.c',
    'debugger.h',
    'fname.c',
    'fname.h',
    'launch.c',
    'launch.h',
    'multi_prog.c',
    'multi_prog.h',
    'opt.c',
    'opt.h',
    'srun_job.c',
    'srun_job.h',
]

libsrun = static_library(
    'srun', # name
    libsrun_src, # source files
    include_directories: [slurm_inc],
    dependencies: [dl_lib],
)