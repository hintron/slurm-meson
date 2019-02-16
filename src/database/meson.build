if conf_data.get('WITH_MYSQL', 0) == 1
    database_src = [
        'mysql_common.c',
        'mysql_common.h',
    ]

    libdatabase = static_library(
        'slurm_mysql', # name
        database_src, # source files
        include_directories: [slurm_inc],
        dependencies: [pthread_lib, dl_lib],
    )
endif
