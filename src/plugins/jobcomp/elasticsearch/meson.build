if conf_data.get('WITH_CURL', 0) == 1
    jobcomp_elasticsearch_src = [
        'jobcomp_elasticsearch.c',
    ]

    jobcomp_elasticsearch = shared_module(
        'jobcomp_elasticsearch', # name
        jobcomp_elasticsearch_src, # source files
        include_directories: [slurm_inc],
        dependencies: [libcurl],
        install: true,
        install_dir: pkglibdir,
        name_prefix: '',
    )
endif