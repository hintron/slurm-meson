bcast_src = [
    'file_bcast.c',
    'file_bcast.h',
]

libbcast = build_target(
    'libbcast', # executable name
    [bcast_src], # source files
    include_directories : [slurm_inc],
    # dependencies : [dependency('zlib'), dependency('lz4')],
    link_with: [libslurm],
    target_type : libtype,
)


