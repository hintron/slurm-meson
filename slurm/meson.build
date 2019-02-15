slurm_h_data = configuration_data()

slurm_h_data.set('SLURM_VERSION_NUMBER', slurm_version_number)

configure_file(
    input : 'slurm.h.in.meson',
    output : 'slurm.h',
    configuration : slurm_h_data
)
