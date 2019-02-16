sattach_src = [
    'attach.c',
    'attach.h',
    'opt.c',
    'opt.h',
    'sattach.c',
    'sattach.wrapper.c',
]

sattach = executable(
    'sattach', # name
    sattach_src, # source files
    include_directories: [slurm_inc],
    dependencies: [dl_lib, pthread_lib],
    link_with: [libslurmfull],
    install: true,
    install_dir: get_option('bindir'),
    export_dynamic: true,
    install_rpath: executable_rpath,
)

# TODO: install-exec-local trickery