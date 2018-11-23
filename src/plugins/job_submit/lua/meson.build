if conf_data.get('HAVE_LUA', false)
    job_submit_lua_src = [
        'job_submit_lua.c',
    ]

    job_submit_lua_plugin = shared_module(
        'job_submit_lua', # name
        job_submit_lua_src, # source files
        include_directories: [slurm_inc],
        dependencies: [lua_libs],
        install: true,
        install_dir: pkglibdir,
        name_prefix: '',
    )
endif

# TODO: DDEFAULT_SCRIPT_DIR=sysconfdir flag