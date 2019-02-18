slurm_h_data = configuration_data()
slurm_h_data.set('SLURM_VERSION_NUMBER', slurm_version_number)
slurm_h = configure_file(
    input : 'slurm.h.in.meson',
    output : 'slurm.h',
    configuration : slurm_h_data
)

# Copy headers to include directory
# This is like pkginclude_HEADERS in the top-level Makefile.am
headers = [
    'pmi.h',
    'slurmdb.h',
    'slurm_errno.h',
    slurm_h,
    'smd_ns.h',
    'spank.h',
]

install_headers(headers, subdir : 'slurm')

