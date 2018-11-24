mpi_pmix_src = [
    'mpi_pmix.c',
    'pmixp_common.h',
    'pmixp_coll.h',
    'pmixp_agent.c',
    'pmixp_client.c',
    'pmixp_nspaces.c',
    'pmixp_info.c',
    'pmixp_agent.h',
    'pmixp_client.h',
    'pmixp_nspaces.h',
    'pmixp_info.h',
    'pmixp_server.c',
    'pmixp_state.c',
    'pmixp_io.c',
    'pmixp_utils.c',
    'pmixp_dmdx.c',
    'pmixp_server.h',
    'pmixp_state.h',
    'pmixp_io.h',
    'pmixp_utils.h',
    'pmixp_dmdx.h',
    'pmixp_conn.c',
    'pmixp_dconn.c',
    'pmixp_dconn_tcp.c',
    'pmixp_conn.h',
    'pmixp_dconn.h',
    'pmixp_dconn_tcp.h',
    'pmixp_coll.c',
    'pmixp_coll_tree.c',
    'pmixp_coll_ring.c',
]

if conf_data.get('HAVE_UCX', false)
    mpi_pmix_src += [
        'pmixp_dconn_ucx.c',
        'pmixp_dconn_ucx.h',
    ]
endif

# TODO: HAVE_PMIX_V1, HAVE_PMIX_V2, HAVE_PMIX_V3

mpi_pmix_plugin = shared_module(
    'mpi_pmix', # name
    mpi_pmix_src, # source files
    include_directories: [slurm_inc],
    install: true,
    install_dir: pkglibdir,
    name_prefix: '',
    dependencies: [hwloc_libs],
    link_with: [libslurmd_reverse_tree_math],
)
# TODO: HAVE_UCX
# TODO: libs and flags HWLOC, UCX