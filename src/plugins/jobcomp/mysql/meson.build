if conf_data.get('WITH_MYSQL', 0) == 1
    jobcomp_mysql_src = [
        'jobcomp_mysql.c',
        'mysql_jobcomp_process.c',
        'mysql_jobcomp_process.h',
    ]

    jobcomp_mysql = shared_module(
        'jobcomp_mysql', # name
        jobcomp_mysql_src, # source files
        include_directories: [slurm_inc],
        dependencies: [mysql_libs],
        link_with: [libdatabase],
        install: true,
        install_dir: pkglibdir,
        name_prefix: '',
    )
    # TODO: MYSQL_CFLAGS
endif