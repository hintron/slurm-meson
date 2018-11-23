if conf_data.get('WITH_CURL', false)
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