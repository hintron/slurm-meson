job_submit_lua_src = [
    'job_submit_lua.c',
]

job_submit_lua_plugin = shared_module(
    'job_submit_lua', # name
    job_submit_lua_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)

# TODO: HAVE_LUA, lua libs
# TODO: DDEFAULT_SCRIPT_DIR=sysconfdir flag