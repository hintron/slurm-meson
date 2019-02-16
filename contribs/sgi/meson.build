sgi = executable(
    'netloc_to_topology', # name
    'netloc_to_topology.c', # source files
    include_directories: [slurm_inc],
    dependencies: [netloc_lib, hwloc_lib],
    # link_with: [netloc_lib, hwloc_lib],
    install: true,
    install_dir: get_option('bindir'),
    export_dynamic: true,
    install_rpath: executable_rpath,
)