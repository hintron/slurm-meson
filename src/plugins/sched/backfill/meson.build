sched_backfill_src = [
    'backfill_wrapper.c',
    'backfill.c',
    'backfill.h',
]

sched_backfill_plugin = shared_module(
    'sched_backfill', # executable name
    sched_backfill_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)