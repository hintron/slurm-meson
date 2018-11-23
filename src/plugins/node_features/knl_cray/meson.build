if conf_data.get('WITH_JSON_PARSER', false)
    node_features_knl_generic_src = [
        'node_features_knl_generic.c',
    ]

    node_features_knl_generic_plugin = shared_module(
        'node_features_knl_generic', # name
        node_features_knl_generic_src, # source files
        include_directories: [slurm_inc],
        install: true,
        install_dir: pkglibdir,
        name_prefix: '',
    )
endif