
# TODO: Use vcs_tag() to get vcs commit info easily!


# Generate a file on the fly
# Seee https://mesonbuild.com/Generating-sources.html#generating-sources
# https://mesonbuild.com/Reference-manual.html#custom_target


generate_global_defaults = join_paths(meson.current_source_dir(), 'generate_global_defaults_c.sh')
global_defaults_src = custom_target(
    'global_defaults',
    output : ['global_defaults.c'],
    command : [generate_global_defaults, pkglibdir, sysconfdir],
    capture: true
)



libcommon_sources = [
    'assoc_mgr.c', 'assoc_mgr.h',
    'cpu_frequency.c', 'cpu_frequency.h',
    'node_features.c', 'node_features.h',
    'xmalloc.c', 'xmalloc.h',
    'xassert.c', 'xassert.h',
    'xstring.c', 'xstring.h',
    'xsignal.c', 'xsignal.h',
    'strnatcmp.c', 'strnatcmp.h',
    'forward.c', 'forward.h',
    'msg_aggr.c', 'msg_aggr.h',
    'strlcpy.c', 'strlcpy.h',
    'list.c', 'list.h',
    'xtree.c', 'xtree.h',
    'xhash.c', 'xhash.h',
    'net.c', 'net.h',
    'log.c', 'log.h',
    'cbuf.c', 'cbuf.h',
    'bitstring.c', 'bitstring.h',
    'mpi.c', 'slurm_mpi.h',
    'pack.c', 'pack.h',
    'parse_config.c', 'parse_config.h',
    'parse_value.c', 'parse_value.h',
    'plugin.c', 'plugin.h',
    'plugrack.c', 'plugrack.h',
    'power.c', 'power.h',
    'print_fields.c', 'print_fields.h',
    'read_config.c', 'read_config.h',
    'node_select.c', 'node_select.h',
    'env.c', 'env.h',
    'fd.c', 'fd.h',
    'slurm_cred.h',
    'slurm_cred.c',
    'slurm_errno.c',
    'slurm_ext_sensors.c', 'slurm_ext_sensors.h',
    'slurm_mcs.c',
    'slurm_mcs.h',
    'slurm_priority.c',
    'slurm_priority.h',
    'slurm_protocol_api.c',
    'slurm_protocol_api.h',
    'slurm_protocol_pack.c',
    'slurm_protocol_pack.h',
    'slurm_protocol_util.c',
    'slurm_protocol_util.h',
    'slurm_protocol_socket_implementation.c',
    'slurm_protocol_socket_common.h',
    'slurm_protocol_common.h',
    'slurm_protocol_interface.h',
    'slurm_protocol_defs.c',
    'slurm_protocol_defs.h',
    'slurm_rlimits_info.h',
    'slurm_rlimits_info.c',
    'slurmdb_defs.c', 'slurmdb_defs.h',
    'slurmdb_pack.c', 'slurmdb_pack.h',
    'slurmdbd_defs.c', 'slurmdbd_defs.h',
    'slurmdbd_pack.c', 'slurmdbd_pack.h',
    'working_cluster.c', 'working_cluster.h',
    'uid.c', 'uid.h',
    'util-net.c', 'util-net.h',
    'slurm_auth.c', 'slurm_auth.h',
    'slurm_acct_gather.c', 'slurm_acct_gather.h',
    'slurm_accounting_storage.c', 'slurm_accounting_storage.h',
    'slurm_jobacct_gather.c', 'slurm_jobacct_gather.h',
    'slurm_acct_gather_energy.c', 'slurm_acct_gather_energy.h',
    'slurm_acct_gather_profile.c', 'slurm_acct_gather_profile.h',
    'slurm_acct_gather_interconnect.c', 'slurm_acct_gather_interconnect.h',
    'slurm_acct_gather_filesystem.c', 'slurm_acct_gather_filesystem.h',
    'slurm_jobcomp.c', 'slurm_jobcomp.h',
    'slurm_opt.h',
    'slurm_route.c', 'slurm_route.h',
    'slurm_time.c', 'slurm_time.h',
    'slurm_topology.c', 'slurm_topology.h',
    'switch.c', 'switch.h',
    'macros.h',
    'slurm_selecttype_info.c',
    'slurm_selecttype_info.h',
    'slurm_resource_info.c',
    'slurm_resource_info.h',
    'hostlist.c', 'hostlist.h',
    'slurm_step_layout.c', 'slurm_step_layout.h',
    'checkpoint.c', 'checkpoint.h',
    'job_resources.c', 'job_resources.h',
    'parse_time.c', 'parse_time.h',
    'job_options.c', 'job_options.h',
    global_defaults_src,
    'timers.c', 'timers.h',
    'slurm_xlator.h',
    'stepd_api.c', 'stepd_api.h',
    'write_labelled_message.c',
    'write_labelled_message.h',
    'proc_args.c', 'proc_args.h',
    'node_conf.h', 'node_conf.c',
    'gres.h', 'gres.c',
    'entity.h', 'entity.c',
    'layout.h', 'layout.c',
    'layouts_mgr.h', 'layouts_mgr.c',
    'mapping.c', 'mapping.h',
    'xcgroup_read_config.c', 'xcgroup_read_config.h',
    'xlua.c', 'xlua.h',
    'callerid.c', 'callerid.h',
    'group_cache.c', 'group_cache.h',
    'slurm_persist_conn.c', 'slurm_persist_conn.h',
    'run_command.c', 'run_command.h',
    'x11_util.c', 'x11_util.h',
    'state_control.c', 'state_control.h',
    'tres_bind.c', 'tres_bind.h',
    'tres_frequency.c', 'tres_frequency.h',
]


# TODO: If --build-static-libslurm ...
# https://mesonbuild.c'om/Wrap-best-practices-and-tips.h'tml#make-libraries-buildable-both-as-static-and-shared


# if get_option('shared_lib')
#     libtype = 'shared_library'
# else
    libtype = 'static_library'
# endif

libcommon = build_target(
    'libcommon', # executable name
    libcommon_sources, # source files
    include_directories : [slurm_inc],
    target_type : libtype,
)




libdaemonize_sources = [
    'daemonize.c',
    'daemonize.h',
]

libdaemonize = build_target(
    'libdaemonize', # executable name
    libdaemonize_sources, # source files
    include_directories : slurm_inc,
    target_type : libtype,
)



libeio_sources = [
    'eio.c',
    'eio.h',
    'io_hdr.c',
    'io_hdr.h',
]

libeio = build_target(
    'libeio', # executable name
    libeio_sources, # source files
    include_directories : slurm_inc,
    target_type : libtype,
)



libspank_sources = [
    'plugstack.c',
    'plugstack.h',
    'optz.c',
    'optz.h',
]

libspank = build_target(
    'libspank', # executable name
    libspank_sources, # source files
    include_directories: slurm_inc,
    target_type: libtype,
)

