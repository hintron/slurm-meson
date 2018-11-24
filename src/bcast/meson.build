bcast_src = [
    'file_bcast.c',
    'file_bcast.h',
]

libfile_bcast = static_library(
    'file_bcast', # name
    [bcast_src], # source files
    include_directories: [slurm_inc],
    dependencies: [lz4_lib, z_lib],
    link_with: [libslurm],
)

# TODO: ZLIB_LDFLAGS, ZLIB_CPPFLAGS, LZ4_LDFLAGS, LZ4_CPPFLAGS
