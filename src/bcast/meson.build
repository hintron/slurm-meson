bcast_src = [
    'file_bcast.c',
    'file_bcast.h',
]

libfile_bcast = static_library(
    'file_bcast', # name
    [bcast_src], # source files
    include_directories: [slurm_inc],
    # TODO:
    # dependencies: [dependency('zlib'), dependency('lz4')],
    link_with: [libslurm],
)


