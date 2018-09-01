project('slurm', 'c')

cc = meson.get_compiler('c')
##########################
# Configure Section
##########################
conf_data = configuration_data()

# X_AC_SLURM_VERSION
version = run_command('perl', '-ne', 'print,exit if s/^\s*VERSION:\s*(\S*).*/\1/i', 'META').stdout().strip()
slurm_major = run_command('perl', '-ne', 'print,exit if s/^\s*MAJOR:\s*(\S*).*/\1/i', 'META').stdout().strip()
slurm_minor = run_command('perl', '-ne', 'print,exit if s/^\s*MINOR:\s*(\S*).*/\1/i', 'META').stdout().strip()
slurm_micro = run_command('perl', '-ne', 'print,exit if s/^\s*MICRO:\s*(\S*).*/\1/i', 'META').stdout().strip()
release = run_command('perl', '-ne', 'print,exit if s/^\s*RELEASE:\s*(\S*).*/\1/i', 'META').stdout().strip()
conf_data.set_quoted('VERSION', version, description: 'Define the project\'s version')
conf_data.set_quoted('SLURM_MAJOR', slurm_major, description: 'Define the project\'s major version')
conf_data.set_quoted('SLURM_MINOR', slurm_minor, description: 'Define the project\'s minor version')
conf_data.set_quoted('SLURM_MICRO', slurm_micro, description: 'Define the project\'s micro version')
conf_data.set_quoted('RELEASE', release, description: 'Define the project\'s release')

slurm_version_number = run_command('printf', '0x%02x%02x%02x', slurm_major, slurm_minor, slurm_micro).stdout().strip()
conf_data.set('SLURM_VERSION_NUMBER', slurm_version_number, description: 'Slurm Version Number')

if slurm_major + '.' + slurm_minor + '.' + slurm_micro != version
    error('META information is inconsistent: $VERSION != $SLURM_MAJOR.$SLURM_MINOR.$SLURM_MICRO!')
endif

conf_data.set_quoted('SLURM_VERSION_STRING', '19.05.0-0pre0', description: 'Define the project\'s version string')
conf_data.set_quoted('PACKAGE_NAME', 'slurm', description: 'Define to the full name of this package')

# TODO:
# X_AC_RPATH
# X_AC_DATABASES

# Check to see if this architecture should use slurm_* prefix function aliases for plugins
use_alias_desc = 'Define slurm_ prefix function aliases for plugins'
if host_machine.system() == 'darwin'
    conf_data.set('USE_ALIAS', 0, description: use_alias_desc)
else
    conf_data.set('USE_ALIAS', 1, description: use_alias_desc)
endif

# TODO: Check for programs
# TODO: Check for libraries
# TODO: Check for header files

# TODO: X_AC__SYSTEM_CONFIGURATION

# TODO: X_AC_DLFCN
# TODO: X_AC_SLURM_PROGRAM_INVOCATION_NAME
# TODO: X_AC_PTRACE

# X_AC_AFFINITY

# For test code compilation:
# https://mesonbuild.com/Reference-manual.html#compiler-object
# https://mesonbuild.com/Syntax.html#strings
# https://mesonbuild.com/Reference-manual.html#run-result-object
code_affinity_3 = '''#define _GNU_SOURCE
#include <sched.h>
int main (int argc, char ** argv) {
    cpu_set_t mask;
    sched_getaffinity(0, sizeof(cpu_set_t), &mask);
}'''

code_affinity_2 = '''#define _GNU_SOURCE
#include <sched.h>
int main (int argc, char ** argv) {
    cpu_set_t mask;
    sched_getaffinity(0, &mask);
}'''

if cc.run(code_affinity_3).compiled()
    conf_data.set('SCHED_GETAFFINITY_THREE_ARGS', 1, description: 'Define to 1 if sched_getaffinity takes three arguments')
endif
if cc.run(code_affinity_2).compiled()
    conf_data.set('SCHED_GETAFFINITY_TWO_ARGS', 1, description: 'Define to 1 if sched_getaffinity takes two arguments')
endif

  # AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[#define _GNU_SOURCE
  #   #include <sched.h>]], [[cpu_set_t mask;
  #   sched_getaffinity(0, sizeof(cpu_set_t), &mask);]])],[AC_DEFINE(SCHED_GETAFFINITY_THREE_ARGS, 1,
  #            [Define to 1 if sched_getaffinity takes three arguments.])],[])

  # AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[#define _GNU_SOURCE
  #   #include <sched.h>]], [[cpu_set_t mask;
  #   sched_getaffinity(0, &mask);]])],[AC_DEFINE(SCHED_GETAFFINITY_TWO_ARGS, 1,
  #            [Define to 1 if sched_getaffinity takes two arguments.])],[])



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
    conf_data.set_quoted('SLEEP_CMD', '/bin/sleep', description: 'Define path to sleep command')
endif

sucmd_desc = 'Define path to su command'
if find_program('su').found()
    conf_data.set_quoted('SUCMD', '/bin/su', description: sucmd_desc)
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



# Derived from the helper script ac_converter.py
check_functions = [
  ['HAVE_FACCESSAT', 'faccessat', '#include<unistd.h>'],
  ['HAVE_FDATASYNC', 'fdatasync', '#include<unistd.h>'],
  ['HAVE_HSTRERROR', 'hstrerror', '#include<netdb.h>'],
  ['HAVE_INET_ATON', 'inet_aton', '#include<arpa/inet.h>'],
  ['HAVE_INET_PTON', 'inet_pton', '#include<arpa/inet.h>'],
  ['HAVE_MALLOC', 'malloc', '#include<stdlib.h>'],
  ['HAVE_SCHED_SETAFFINITY', 'sched_setaffinity', '#include<sched.h>'],
  ['HAVE_SETRESUID', 'setresuid', '#include<unistd.h>'],
  ['HAVE_STATFS', 'statfs', '#include<mount.h>'],
  ['HAVE_STATVFS', 'statvfs', '#include<sys/statvfs.h>'],
  ['HAVE_STRERROR', 'strerror', '#include<string.h>'],
  ['HAVE_STRERROR_R', 'strerror_r', '#include<string.h>'],
  ['HAVE_STRLCPY', 'strlcpy', '#include<string.h>'],
  ['HAVE_STRNDUP', 'strndup', '#include<string.h>'],
  ['HAVE_STRSIGNAL', 'strsignal', '#include<signal.h>'],
  ['HAVE_SYSCTLBYNAME', 'sysctlbyname', '#include<sys/sysctl.h>'],
]

foreach f : check_functions
  if cc.has_function(f.get(1), prefix : f.get(2))
    conf_data.set(f.get(0), 1)
  endif
endforeach





configure_file(
    output : 'config.h',
    configuration : conf_data
)

##########################
# Build Section
##########################


configuration_inc = include_directories('.')


# TODO: First compile libslurm, slurmctld, slurmd
# TODO: Then compile slurmdbd, srun, salloc, sinfo


subdir('slurm')
subdir('src')


# Finish compiling



# References:
# https://mesonbuild.com/Porting-from-autotools.html#porting-from-autotools
# https://mesonbuild.com/Configuration.html