slurm_h_data = configuration_data()

# Replace HAVE_SYS_SOCKET_H and SLURM_VERSION_NUMBER
slurm_h_data.set('HAVE_SYS_SOCKET_H', 1)
slurm_h_data.set('SLURM_VERSION_NUMBER', slurm_version_number)

configure_file(
    input : 'slurm.h.in.meson',
    output : 'slurm.h',
    configuration : slurm_h_data
)
