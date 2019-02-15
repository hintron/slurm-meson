if mysql_libs.found()
    accounting_storage_mysql_src = [
        'accounting_storage_mysql.c',
        'accounting_storage_mysql.h',
        'as_mysql_acct.c',
        'as_mysql_acct.h',
        'as_mysql_tres.c',
        'as_mysql_tres.h',
        'as_mysql_archive.c',
        'as_mysql_archive.h',
        'as_mysql_assoc.c',
        'as_mysql_assoc.h',
        'as_mysql_cluster.c',
        'as_mysql_cluster.h',
        'as_mysql_convert.c',
        'as_mysql_convert.h',
        'as_mysql_federation.c',
        'as_mysql_federation.h',
        'as_mysql_fix_runaway_jobs.c',
        'as_mysql_fix_runaway_jobs.h',
        'as_mysql_job.c',
        'as_mysql_job.h',
        'as_mysql_jobacct_process.c',
        'as_mysql_jobacct_process.h',
        'as_mysql_problems.c',
        'as_mysql_problems.h',
        'as_mysql_qos.c',
        'as_mysql_qos.h',
        'as_mysql_resource.c',
        'as_mysql_resource.h',
        'as_mysql_resv.c',
        'as_mysql_resv.h',
        'as_mysql_rollup.c',
        'as_mysql_rollup.h',
        'as_mysql_txn.c',
        'as_mysql_txn.h',
        'as_mysql_usage.c',
        'as_mysql_usage.h',
        'as_mysql_user.c',
        'as_mysql_user.h',
        'as_mysql_wckey.c',
        'as_mysql_wckey.h',
    ]

    accounting_storage_mysql_plugin = shared_module(
        'accounting_storage_mysql', # name
        accounting_storage_mysql_src, # source files
        include_directories: [slurm_inc],
        dependencies: [pthread_libs, dl_libs, mysql_libs],
        link_with: [libdatabase, libaccounting_storage_common],
        install: true,
        install_dir: pkglibdir,
        name_prefix: '',
        c_args: [mysql_cflags],
    )
else
    warning('accounting_storage/mysql not being built because mysql_libs are empty')
endif
