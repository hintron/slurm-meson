proctrack_lua_src = [
    'proctrack_lua.c',
]

proctrack_lua_plugin = shared_module(
    'proctrack_lua', # name
    proctrack_lua_src, # source files
    include_directories: [slurm_inc],
    dependencies: [lua_libs],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
)