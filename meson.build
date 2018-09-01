project('slurm', 'c')

cc = meson.get_compiler('c')
##########################
# Configure Section
##########################
conf_data = configuration_data()

# https://mesonbuild.com/Adding-arguments.html
add_project_arguments('-DHAVE_CONFIG_H', language : 'c')



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

# Check for header files
check_headers = [
    ['HAVE_MCHECK_H', 'mcheck.h'],
    ['HAVE_VALUES_H', 'values.h'],
    ['HAVE_SOCKET_H', 'socket.h'],
    ['HAVE_SYS_SOCKET_H', 'sys/socket.h'],
    ['HAVE_STDBOOL_H', 'stdbool.h'],
    ['HAVE_SYS_IPC_H', 'sys/ipc.h'],
    ['HAVE_SYS_SHM_H', 'sys/shm.h'],
    ['HAVE_SYS_SEM_H', 'sys/sem.h'],
    ['HAVE_ERRNO_H', 'errno.h'],
    ['HAVE_STDLIB_H', 'stdlib.h'],
    ['HAVE_DIRENT_H', 'dirent.h'],
    ['HAVE_PTHREAD_H', 'pthread.h'],
    ['HAVE_SYS_PRCTL_H', 'sys/prctl.h'],
    ['HAVE_SYSINT_H', 'sysint.h'],
    ['HAVE_INTTYPES_H', 'inttypes.h'],
    ['HAVE_TERMCAP_H', 'termcap.h'],
    ['HAVE_NETDB_H', 'netdb.h'],
    ['HAVE_SYS_SYSTEMCFG_H', 'sys/systemcfg.h'],
    ['HAVE_NCURSES_H', 'ncurses.h'],
    ['HAVE_CURSES_H', 'curses.h'],
    ['HAVE_SYS_DR_H', 'sys/dr.h'],
    ['HAVE_SYS_VFS_H', 'sys/vfs.h'],
    ['HAVE_PAM_APPL_H', 'pam/pam_appl.h'],
    ['HAVE_SECURITY_PAM_APPL_H', 'security/pam_appl.h'],
    ['HAVE_SYS_SYSCTL_H', 'sys/sysctl.h'],
    ['HAVE_PTY_H', 'pty.h'],
    ['HAVE_UTMP_H', 'utmp.h'],
    ['HAVE_SYS_SYSLOG_H', 'sys/syslog.h'],
    ['HAVE_LINUX_SCHED_H', 'linux/sched.h'],
    ['HAVE_KSTAT_H', 'kstat.h'],
    ['HAVE_PATHS_H', 'paths.h'],
    ['HAVE_LIMITS_H', 'limits.h'],
    ['HAVE_SYS_STATFS_H', 'sys/statfs.h'],
    ['HAVE_SYS_PTRACE_H', 'sys/ptrace.h'],
    ['HAVE_FLOAT_H', 'float.h'],
    ['HAVE_SYS_STATVFS_H', 'sys/statvfs.h'],
    ['HAVE_SYS_STATVFS_H', 'sys/sysmacros.h'],
]

foreach h : check_headers
    if cc.has_header(h.get(1))
        desc = 'Define to 1 if you have the <' + h.get(1) + '> header file'
        conf_data.set(h.get(0), 1, description: desc)
    endif
endforeach


# TODO: AC_HEADER_MAJOR
# https://www.gnu.org/software/autoconf/manual/autoconf-2.67/html_node/Particular-Headers.html
# https://github.com/mozilla/rr/commit/5a16d15ef348c069b82449dcdeaeea3c1eb8639b
# NOTE: To get rid of warnings, explicitly force sys/sysmacros.h to be included, rather than rely on sys/types.h to include it implicitly
# if cc.has_header_symbol('sys/types.h', 'major') and cc.has_header_symbol('sys/types.h', 'minor') and cc.has_header_symbol('sys/types.h', 'makedev')
#     message('`major`, `minor`, and `makedev` are in sys/types.h')
if cc.has_header_symbol('sys/makedev.h', 'major') and cc.has_header_symbol('sys/makedev.h', 'minor') and cc.has_header_symbol('sys/makedev.h', 'makedev')
    conf_data.set('MAJOR_IN_MKDEV', 1, description: '`major`, `minor`, and `makedev` are declared in sys/makedev.h')
elif cc.has_header_symbol('sys/sysmacros.h', 'major') and cc.has_header_symbol('sys/sysmacros.h', 'minor') and cc.has_header_symbol('sys/sysmacros.h', 'makedev')
    conf_data.set('MAJOR_IN_SYSMACROS', 1, description: '`major`, `minor`, and `makedev` are declared in sys/sysmacros.h')
endif

# TODO: X_AC__SYSTEM_CONFIGURATION

# TODO: X_AC_DLFCN
# TODO: X_AC_SLURM_PROGRAM_INVOCATION_NAME
# TODO: X_AC_PTRACE

# TODO: Finish X_AC_AFFINITY

# For test code compilation:
# https://mesonbuild.com/Compiler-properties.html#does-code-compile
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

if cc.compiles(code_affinity_3, name: 'sched_getaffinity() 3 arguments')
    conf_data.set('SCHED_GETAFFINITY_THREE_ARGS', 1, description: 'Define to 1 if sched_getaffinity takes three arguments')
endif
if cc.compiles(code_affinity_2, name: 'sched_getaffinity() 2 arguments')
    conf_data.set('SCHED_GETAFFINITY_TWO_ARGS', 1, description: 'Define to 1 if sched_getaffinity takes two arguments')
endif


# TODO: X_AC_LZ4
# TODO: X_AC_HWLOC
# TODO: X_AC_PMIX
# TODO: X_AC_FREEIPMI
# TODO: X_AC_RRDTOOL
# TODO: X_AC_UCX
# TODO: X_AC_SSH2

# TODO: X_AC_CRAY

# TODO: checks for system services.


# TODO: checks for system-specific stuff.

# TODO: check for how to emulate setproctitle

# TODO: X_AC_SETPROCTITLE

# TODO: check for debug compilation, must follow X_AC_CRAY

# TODO: X_AC_DEBUG


# Check for slurmctld, slurmd and slurmdbd default ports,
# and default number of slurmctld ports
# TODO: Support --with-slurmctld-port option to set defaults
conf_data.set('SLURMCTLD_PORT', 6817, description: 'Define the default port number for slurmctld')
conf_data.set('SLURMD_PORT', 6818, description: 'Define the default port number for slurmd')
conf_data.set('SLURMDBD_PORT', 6819, description: 'Define the default port number for slurmdbd')
conf_data.set('SLURMCTLD_PORT_COUNT', 1, description: 'Define the default port count for slurmctld')


# TODO: add SLURM_PREFIX to config.h



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