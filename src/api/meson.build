# TODO: WITH_GNU_LD trickery
# If not GNU LD (MacOS), then don't do version script to restrict symbols
slurmdbapi_src = [
    'account_functions.c',
    'archive_functions.c',
    'assoc_functions.c',
    'cluster_functions.c',
    'cluster_report_functions.c',
    'coord_functions.c',
    'connection_functions.c',
    'extra_get_functions.c',
    'federation_functions.c',
    'job_functions.c',
    'job_report_functions.c',
    'qos_functions.c',
    'resource_functions.c',
    'tres_functions.c',
    'usage_functions.c',
    'user_functions.c',
    'user_report_functions.c',
    'wckey_functions.c',
]

slurmapi_src = [
    'allocate.c',
    'allocate_msg.c',
    'block_info.c',
    'burst_buffer_info.c',
    'assoc_mgr_info.c',
    'cancel.c',
    'checkpoint.c',
    'complete.c',
    'config_info.c',
    'federation_info.c',
    'front_end_info.c',
    'init_msg.c',
    'job_info.c',
    'job_step_info.c',
    'layout_info.c',
    'license_info.c',
    'node_info.c',
    'partition_info.c',
    'pmi_server.c',
    'pmi_server.h',
    'powercap_info.c',
    'reservation_info.c',
    'signal.c',
    'slurm_get_statistics.c',
    'slurm_pmi.c',
    'slurm_pmi.h',
    'step_ctx.c',
    'step_ctx.h',
    'step_io.c',
    'step_io.h',
    'step_launch.c',
    'step_launch.h',
    'submit.c',
    'suspend.c',
    'topo_info.c',
    'triggers.c',
    'reconfigure.c',
    'update_config.c',
    slurmdbapi_src,
]

# TODO: Add in API version info to this library and to .so outputs

# See https://github.com/mesonbuild/meson/issues/3047#issue-296332081
libslurm_mapfile = 'meson.libslurm.map'
vflag = '-Wl,--version-script,@0@/@1@'.format(meson.current_source_dir(), libslurm_mapfile)
libslurm = build_target(
    'slurm', # name
    [slurmapi_src], # source files
    include_directories: [slurm_inc],
    dependencies: [pthread_lib, dl_lib],
    # Specify a version script to limit visibility of symbols
    link_args: [vflag],
    # This says that if the sym vis map string changes, relink (but not recompile)
    link_depends: [libslurm_mapfile],
    link_whole: [libcommon, libeio, libspank],
    target_type: libslurm_type,
    install: libslurm_install,
    install_dir: pkglibdir,
)

# Build both shared AND static libraries, so tests can link against either one
# See https://mesonbuild.com/Reference-manual.html#both_libraries
libslurmfull = both_libraries(
    'slurmfull', # name
    [slurmapi_src], # source files
    include_directories: [slurm_inc],
    dependencies: [pthread_lib, dl_lib],
    link_whole: [libcommon, libeio, libspank],
    install: libslurm_install,
    install_dir: pkglibdir,
)
# The returned build target is always the shared library. Get the static library
libslurmfull_a = libslurmfull.get_static_lib()
if libslurm_type == 'static_library'
    # Change the build target pointer to the static lib
    libslurmfull = libslurmfull_a
    # We don't care about losing the handle to the shared lib
endif