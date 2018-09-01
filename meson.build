project('slurm', 'c')

##########################
# Configure Section
##########################
conf_data = configuration_data()

version = run_command('perl', '-ne', 'print,exit if s/^\s*VERSION:\s*(\S*).*/\1/i', 'META').stdout().strip()
slurm_major = run_command('perl', '-ne', 'print,exit if s/^\s*MAJOR:\s*(\S*).*/\1/i', 'META').stdout().strip()
slurm_minor = run_command('perl', '-ne', 'print,exit if s/^\s*MINOR:\s*(\S*).*/\1/i', 'META').stdout().strip()
slurm_micro = run_command('perl', '-ne', 'print,exit if s/^\s*MICRO:\s*(\S*).*/\1/i', 'META').stdout().strip()
release = run_command('perl', '-ne', 'print,exit if s/^\s*RELEASE:\s*(\S*).*/\1/i', 'META').stdout().strip()
conf_data.set_quoted('VERSION', version, description: 'Define the project\'s version.')
conf_data.set_quoted('SLURM_MAJOR', slurm_major, description: 'Define the project\'s major version.')
conf_data.set_quoted('SLURM_MINOR', slurm_minor, description: 'Define the project\'s minor version.')
conf_data.set_quoted('SLURM_MICRO', slurm_micro, description: 'Define the project\'s micro version.')
conf_data.set_quoted('RELEASE', release, description: 'Define the project\'s release.')

slurm_version_number = run_command('printf', '0x%02x%02x%02x', slurm_major, slurm_minor, slurm_micro).stdout().strip()
conf_data.set('SLURM_VERSION_NUMBER', slurm_version_number, description: 'Slurm Version Number')

if slurm_major + '.' + slurm_minor + '.' + slurm_micro != version
    error('META information is inconsistent: $VERSION != $SLURM_MAJOR.$SLURM_MINOR.$SLURM_MICRO!')
endif

conf_data.set_quoted('SLURM_VERSION_STRING', '19.05.0-0pre0', description: 'Define the project\'s version string')
conf_data.set_quoted('PACKAGE_NAME', 'slurm', description: 'Define to the full name of this package')

# Check to see if this architecture should use slurm_* prefix function aliases for plugins.
use_alias_desc = 'Define slurm_ prefix function aliases for plugins'
if host_machine.system() == 'darwin'
    conf_data.set('USE_ALIAS', 0, description: use_alias_desc)
else
    conf_data.set('USE_ALIAS', 1, description: use_alias_desc)
endif



# TODO: Support --with-slurmctld-port option to set defaults
conf_data.set('SLURMCTLD_PORT', 6817, description: 'Define the default port number for slurmctld')
conf_data.set('SLURMD_PORT', 6818, description: 'Define the default port number for slurmd')
conf_data.set('SLURMDBD_PORT', 6819, description: 'Define the default port number for slurmdbd')
conf_data.set('SLURMCTLD_PORT_COUNT', 1, description: 'Define the default port count for slurmctld')






conf_data.set_quoted('SLURM_PREFIX', get_option('prefix'), description: 'Define Slurm installation prefix')

message('Checking whether to enable multiple-slurmd support... ')
if get_option('enable-multiple-slurmd')
    # conf_data.set('MULTIPLE_SLURMD', true)
    conf_data.set('MULTIPLE_SLURMD', true, description: 'Enable multiple slurmd on one node')
    message('Yes')
    message(get_option('enable-multiple-slurmd'))
else
    message('No')
endif


if find_program('sleep').found()
    conf_data.set('SLEEP_CMD', '"/bin/sleep"', description: 'Define path to sleep command')
endif

sucmd_desc = 'Define path to su command'
if find_program('su').found()
    conf_data.set('SUCMD', '"/bin/su"', description: sucmd_desc)
endif



message('Checking whether to link to libslurm.so instead of libslurm.o... ')
if get_option('without-shared-libslurm')
    shared_libslurm = false
    message('No')
else
    shared_libslurm = true
    message('Yes')
endif




# message('Checking library containing dlopen... ')
# DL_LIBS = dependency('dl')
# if DL_LIBS.is_found()
#     message('Found')
# else
#     message('Not found')
# endif
# # TODO: How to check for DL_LIBS? Or do I just specify it as a dependency?
# # AC_DEFUN([X_AC_DLFCN], [
# #   AC_MSG_CHECKING([library containing dlopen])
# #   AC_CHECK_LIB([], [dlopen], [ac_have_dlopen=yes; DL_LIBS=""],
# #     [AC_CHECK_LIB([dl], [dlopen], [ac_have_dlopen=yes; DL_LIBS="-ldl"],
# #       [AC_CHECK_LIB([svdl], [dlopen], [ac_have_dlopen=yes; DL_LIBS="-lsvdl"])])])

# #   AC_SUBST(DL_LIBS)
# # ])

# # DL_LIBS =







configure_file(
    output : 'config.h',
    configuration : conf_data
)


configuration_inc = include_directories('.')





# TODO: First compile libslurm, slurmctld, slurmd
# TODO: Then compile slurmdbd, srun, salloc, sinfo


subdir('slurm')
subdir('src')


# Finish compiling



# References:
# https://mesonbuild.com/Porting-from-autotools.html#porting-from-autotools
# https://mesonbuild.com/Configuration.html