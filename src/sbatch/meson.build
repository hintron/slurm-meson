sbatch_src = [
    'sbatch.c',
    'opt.c',
    'opt.h',
]

sbatch = executable(
    'sbatch', # name
    sbatch_src, # source files
    include_directories: [slurm_inc],
    dependencies: [dl_libs],
    link_with: [libslurmfull],
    install: true,
    install_dir: get_option('bindir'),
    export_dynamic: true,
    install_rpath: executable_rpath,
)
