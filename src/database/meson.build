database_src = [
    'mysql_common.c',
    'mysql_common.h',
]

# TODO: WITH_MYSQL trickery

libdatabase = static_library(
    'slurm_mysql', # executable name
    database_src, # source files
    include_directories : [slurm_inc],
    dependencies : [pthread_libs, dl_libs],
)

