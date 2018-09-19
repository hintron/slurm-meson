project('slurm', 'c',
    meson_version : '>= 0.47.0',
)

cc = meson.get_compiler('c')

# For porting from autotools, see:
# https://wiki.gnome.org/Initiatives/GnomeGoals/MesonPorting
# http://mesonbuild.com/Porting-from-autotools.html

prefix = get_option('prefix')
sysconfdir = join_paths(prefix, get_option('sysconfdir'))
libdir = join_paths(prefix, get_option('libdir'))
pkglibdir = join_paths(libdir, 'slurm')

message('prefix: @0@'.format(prefix))
message('sysconfdir: @0@'.format(sysconfdir))
message('libdir: @0@'.format(libdir))
message('pkglibdfir: @0@'.format(pkglibdir))

##########################
# Configure Section
##########################
conf_data = configuration_data()

# https://mesonbuild.com/Adding-arguments.html
add_project_arguments('-DHAVE_CONFIG_H', language : 'c')



# X_AC_SLURM_VERSION from slurm.m4
# Make sure to escape \ for meson strings
# \1 == 0x01 in meson >= 0.46; https://mesonbuild.com/Release-notes-for-0-46-0.html
project = run_command('perl', '-ne', 'print,exit if s/^\\s*NAME:\\s*(\\S*).*/\\1/i', 'META').stdout().strip()
conf_data.set_quoted('PROJECT', project, description: 'Define the project\'s name')


api_current = run_command('perl', '-ne', 'print,exit if s/^\\s*API_CURRENT:\\s*(\\S*).*/\\1/i', 'META').stdout().strip()
api_age = run_command('perl', '-ne', 'print,exit if s/^\\s*API_AGE:\\s*(\\S*).*/\\1/i', 'META').stdout().strip()
api_revision = run_command('perl', '-ne', 'print,exit if s/^\\s*API_REVISION:\\s*(\\S*).*/\\1/i', 'META').stdout().strip()
api_major = api_current.to_int() - api_age.to_int()
api_version = run_command('printf', '0x%02x%02x%02x', api_major.to_string(), api_age, api_revision).stdout().strip()

conf_data.set('SLURM_API_VERSION', api_version, description: 'Define the API\'s version')
conf_data.set('SLURM_API_CURRENT', api_current, description: 'API current version')
conf_data.set('SLURM_API_MAJOR', api_major, description: 'API current major')
conf_data.set('SLURM_API_AGE', api_age, description: 'API current age')
conf_data.set('SLURM_API_REVISION', api_revision, description: 'API current rev')


version = run_command('perl', '-ne', 'print,exit if s/^\\s*VERSION:\\s*(\\S*).*/\\1/i', 'META').stdout().strip()
slurm_major = run_command('perl', '-ne', 'print,exit if s/^\\s*MAJOR:\\s*(\\S*).*/\\1/i', 'META').stdout().strip()
slurm_minor = run_command('perl', '-ne', 'print,exit if s/^\\s*MINOR:\\s*(\\S*).*/\\1/i', 'META').stdout().strip()
slurm_micro = run_command('perl', '-ne', 'print,exit if s/^\\s*MICRO:\\s*(\\S*).*/\\1/i', 'META').stdout().strip()
release = run_command('perl', '-ne', 'print,exit if s/^\\s*RELEASE:\\s*(\\S*).*/\\1/i', 'META').stdout().strip()

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


# AC_INIT and PACKAGE_* shenanigans
package = 'slurm'
package_version = '@0@.@1@'.format(slurm_major, slurm_minor)
package_string = '@0@ @1@'.format(package, package_version)
conf_data.set_quoted('PACKAGE_NAME', package, description: 'Define to the full name of this package')
conf_data.set_quoted('PACKAGE_VERSION', package_version, description: 'Define to the version of this package')
conf_data.set_quoted('PACKAGE_STRING', package_string, description: 'Define to the full name of this package')
conf_data.set_quoted('PACKAGE_TARNAME', package, description: 'Define to the one symbol short name of this package')
conf_data.set_quoted('PACKAGE_URL', 'https://slurm.schedmd.com', description: 'Define to the home page for this package')
conf_data.set_quoted('PACKAGE_BUGREPORT', 'https://bugs.schedmd.com/', description: 'Define to the address where bug reports for this package should be sent')


# TODO:
# X_AC_RPATH

# Determine if each executable should have an rpath, and if that rpath
# should be absolute or relative to the executable install location
executable_rpath = ''
if get_option('static_libslurm') == false
    # For now, assume that rpath must be set for executables linking to shared libraries at run time
    # Determine if rpath should be absolute or relative
    # TODO: Is this a useful option?
    if get_option('rpath_absolute') # defaults to false
        executable_rpath = pkglibdir
    else
        executable_rpath = join_paths('$ORIGIN', '..', get_option('libdir'), 'slurm')
    endif
endif
message('Setting executables\' rpath to @0@'.format(executable_rpath))

# X_AC_DATABASES

# http://mesonbuild.com/Porting-from-autotools.html#finding-programs
# mysql_config/mariadb_config helper programs give data about the installation

db_config_program = ''
if find_program('mysql_config', required: false).found()
    db_config_program = 'mysql_config'
    # conf_data.set('HAVEMYSQLCONFIG', 1, description: '')
elif find_program('mariadb_config', required: false).found()
    db_config_program = 'mariadb_config'
    # conf_data.set('HAVEMYSQLCONFIG', 1, description: '')
else
    'mysql_config or mariadb_config not found. Evidently no MySQL/MariaDB development libs installed on system'
endif


# check for mysql-5.0.0+
mysql_version = run_command(db_config_program, '--version').stdout().strip()
if mysql_version.version_compare('<5.0.0')
    warning('mysql/mariadb installation is at version @0@, but version >= 5.0.0 is needed for the mysql interface'.format(mysql_version))
else
    # Tell the entire project where <mysql.h> exists
    add_project_arguments(run_command(db_config_program, '--include').stdout().strip(), language : 'c')
    # TODO: If MySQL is found, should I add -I... to the entire project's cflags, or
    # create an include directory? What are the repercussions?

    # mysql_inc = include_directories(run_command(db_config_program, '--variable=pkgincludedir').stdout().strip())
endif

mysql_libs = cc.find_library('mysqlclient', required: false)

# TODO: Do more for MYSQL checks?
# mysql_libs = run_command(db_config_program, '--libs_r')

# Check to see if this architecture should use slurm_* prefix function aliases for plugins
use_alias_desc = 'Define slurm_ prefix function aliases for plugins'
host = host_machine.system()
if host == 'darwin'
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

# X_AC_DLFCN
# See https://github.com/mesonbuild/meson/commit/192c96acefbff35044df19ad6f764d6ff28e4bce
dl_libs = cc.find_library('dl', required: false)

# TODO: Figure out dlopen trickery? Needed?
# See libtool.m4 @ 1821

# Do we need to do this? Doesn't really work anyways
# code_dlfcn = '''#include <dlfcn.h>
# int main (int argc, char ** argv) {
#     dlopen("fake", 0);
# }'''

# if cc.links(code_dlfcn, name: 'dl library is implicitly in system')
#     dl_libs = dependency('', required: false)
# elif cc.links(code_dlfcn, name: 'dl library is `dl`', flags: '-ldl')
#     dl_libs = dependency('dl', required: false)
# elif cc.links(code_dlfcn, name: 'dl library is `svdl`', flags: '-lsvdl')
#     dl_libs = dependency('svdl', required: false)
# endif




# TODO: X_AC_SLURM_PROGRAM_INVOCATION_NAME
# TODO: X_AC_PTRACE

# X_AC_AFFINITY
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


# cc.find_library checks in a similar way to AC_CHECK_LIB
# See https://github.com/mesonbuild/meson/issues/217
numa_libs = cc.find_library('numa', required: false)
# See https://mesonbuild.com/Reference-manual.html#external-library-object
if numa_libs.found()
    conf_data.set('HAVE_NUMA', 1, description: 'Define if numa library installed')
    # TODO: Only add this compiler flag where needed? e.g. task affinity plugin, slurmd, etc?
    add_project_arguments('-DNUMA_VERSION1_COMPATIBILITY', language : 'c')
endif

# TODO: What about checking for numa_available function in ac_check_lib?


# X_AC_PAM

# X_AC_LIBSLURM

# Determine if libslurm, libslurmfull, and libslurmdb should be statically or
# dynamically linked in
# https://mesonbuild.com/Wrap-best-practices-and-tips.html#make-libraries-buildable-both-as-static-and-shared

if get_option('static_libslurm')
    libslurm_type = 'static_library'
    libslurm_install = false
    message('libslurm, libslurmfull, and libslurmdb will be STATICALLY linked (static library)')
else
    libslurm_type = 'shared_library'
    libslurm_install = true
    message('libslurm, libslurmfull, and libslurmdb will be DYNAMICALLY linked (shared library)')
endif

# X_AC_ISO
# X_AC_ENV_LOGIC
# X_AC_SLURM_BIGENDIAN
# X_AC_UID_GID_SIZE_CHECK
# X_AC_JSON
# AC_PROG_GCC_TRADITIONAL([])
# AX_GCC_BUILTIN(__builtin_clzll)
# AX_GCC_BUILTIN(__builtin_ctzll)
# AX_GCC_BUILTIN(__builtin_popcountll)
# AC_FUNC_MALLOC
# AC_FUNC_STRERROR_R

# AC_CHECK_FUNCS( \
#    fdatasync \
#    hstrerror \
#    strerror  \
#    mtrace    \
#    strndup   \
#    strlcpy   \
#    strsignal \
#    inet_aton \
#    inet_ntop \
#    inet_pton \
#    setproctitle \
#    sysctlbyname \
#    cfmakeraw \
#    setresuid \
#    get_current_dir_name \
#    faccessat \
#    eaccess \
#    statvfs \
#    statfs \
# )

# AC_CHECK_DECLS([hstrerror, strsignal, sys_siglist])

# ACX_PTHREAD([], AC_MSG_ERROR([Error: Cannot figure out how to use pthreads!]))
pthread_libs = dependency('threads')

# X_AC_DIMENSIONS

# X_AC_OFED

# AX_LIB_HDF5()
# AM_CONDITIONAL(BUILD_HDF5, test "$with_hdf5" = "yes")
# AC_DEFINE([H5_NO_DEPRECATED_SYMBOLS], [1], [Make sure we get the 1.8 HDF5 API])

# TODO: X_AC_LZ4
# TODO: X_AC_HWLOC
# TODO: X_AC_PMIX
# TODO: X_AC_FREEIPMI
# TODO: X_AC_RRDTOOL
# TODO: X_AC_UCX
# TODO: X_AC_SSH2

# X_AC_NCURSES

ncurses = cc.find_library('ncurses', required: false)
curses = cc.find_library('curses', required: false)
tinfo = cc.find_library('tinfo', required: false)

# Only build smap if some curses library has been found
ncurses_libs = []
build_smap = false
if ncurses.found()
    ncurses_libs = [ncurses]
    build_smap = true
elif curses.found()
    ncurses_libs = [curses]
    build_smap = true
else
    warning('Cannot build smap: no curses or ncurses library found')
endif

if tinfo.found()
    ncurses_libs += tinfo
endif

# TODO: Build test ncurses program and try to link it


# TODO: Test for check

# AM_PATH_GLIB_2_0
glib_libs = dependency('glib-2.0', required: false)

# AM_PATH_GTK_2_0

# TODO: gthread module
# TODO: Get this gtk check to work!
gtk_string = 'gtk2.0-0'
gtk_libs = dependency(gtk_string, required: false)
# gtk_libs = cc.find_library(gtk_string, required: false)

build_sview = false
if gtk_libs.found()
    build_sview = true
else
    warning('Cannot build sview: @0@ not found'.format(gtk_string))
endif

# TODO: Anything more to do with gtk?



# TODO: X_AC_CRAY


# checks for system services.

# checks for system-specific stuff.




# X_AC_SETPROCTITLE
# check for how to emulate setproctitle
setproc_strat_desc = 'Define to the setproctitle() emulation type'
if host == 'linux'
    conf_data.set('SETPROCTITLE_STRATEGY', 'PS_USE_CLOBBER_ARGV', description: setproc_strat_desc)
else
    conf_data.set('SETPROCTITLE_STRATEGY', 'PS_USE_NONE', description: setproc_strat_desc)
endif
conf_data.set('SETPROCTITLE_PS_PADDING', '\'\\0\'', description: 'Define if you need setproctitle padding')


# TODO: HAVE__PROGNAME

# AC_MSG_CHECKING([for __progname])
# AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <stdio.h>]], [[extern char *__progname; puts(__progname);]])],[ac_have__progname=yes
# ],[])
# AC_MSG_RESULT(${ac_have__progname=no})
# if test "$ac_have__progname" = "yes"; then
#   AC_DEFINE([HAVE__PROGNAME], 1, [Define if you have __progname.])
# fi

# ])

# X_AC_DEBUG
# TODO:

# X_AC_SLURM_PORTS
# Check for slurmctld, slurmd and slurmdbd default ports,
# and default number of slurmctld ports
conf_data.set('SLURMCTLD_PORT', 6817, description: 'Define the default port number for slurmctld')
conf_data.set('SLURMD_PORT', 6818, description: 'Define the default port number for slurmd')
conf_data.set('SLURMDBD_PORT', 6819, description: 'Define the default port number for slurmdbd')
conf_data.set('SLURMCTLD_PORT_COUNT', 1, description: 'Define the default port count for slurmctld')
# TODO: Support --with-slurmctld-port option to set defaults

# Add SLURM_PREFIX to config.h
conf_data.set_quoted('SLURM_PREFIX', get_option('prefix'), description: 'Define Slurm installation prefix')

if find_program('sleep').found()
    conf_data.set_quoted('SLEEP_CMD', '/bin/sleep', description: 'Define path to sleep command')
endif

sucmd_desc = 'Define path to su command'
if find_program('su').found()
    conf_data.set_quoted('SUCMD', '/bin/su', description: sucmd_desc)
endif


# TODO:
# X_AC_NRT
# X_AC_SGI_JOB
# X_AC_NETLOC
# X_AC_LUA
# X_AC_MAN2HTML
# X_AC_PRINTF_NULL
# X_AC_READLINE
# X_AC_SLURM_WITH_SSL
# X_AC_SYSTEMD

# X_AC_MUNGE
munge_libs = cc.find_library('munge')
# TODO: What other munge stuff needs to be ported?

if get_option('multiple_slurmd')
    conf_data.set('MULTIPLE_SLURMD', true, description: 'Enable multiple slurmd on one node')
    multiple_slurmd_msg = 'YES'
else
    multiple_slurmd_msg = 'NO'
endif
message('Checking whether to enable multiple slurmd support... @0@'.format(multiple_slurmd_msg))

util_libs = cc.find_library('util')
# TODO: Check explicitly for openpty?

# X_AC_BLCR

# # TODO: Loop through all possible combinations of possible directories? Or waste of time?
# blcr_suffix = ['usr', join_paths('usr', 'local'), join_paths('opt', 'freeware'), join_paths('opt', 'blcr')]
# blcr_prefix = ['lib', 'lib64', '']
# if get_option('blcr')
#     blcr_suffix += get_option('blcr')
# endif
# foreach suffix : blcr_suffix
#     foreach prefix : items
#         if build_srun_cr == false
#             curr_dir += join_paths(prefix, suffix)
#             blcr_libs = cc.find_library('cr', dirs: curr_dir)
#             if blcr_libs.found()
#                 conf_data.set_quoted('BLCR_HOME', curr_dir, description: 'Define BLCR installation home')
#                 build_srun_cr = true # exit loop
#             endif
#         endif
#     endforeach
# endforeach

blcr_libs = cc.find_library('cr', required: false)
build_srun_cr = false
if blcr_libs.found()
    if not cc.has_header('libcr.h')
        warning('Unable to find the libcr.h header file for the BLCR (cr) library; cannot build srun_cr')
    elif not cc.has_function('cr_init', prefix: '#include <libcr.h>')
        # TODO: For some reason, the libcr .so files have no symbols when I install the libcr-dev package...
        warning('Unable to find the cr_init function in the BLCR (cr) library; cannot build srun_cr')
    else
        conf_data.set_quoted('BLCR_HOME', '/usr/lib', description: 'Define BLCR installation home')
        build_srun_cr = true
    endif
else
    warning('Unable to find the BLCR (cr) library; cannot build srun_cr')
endif





# LIBCURL_CHECK_CONFIG
# X_AC_DEPRECATED


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


slurm_inc = include_directories('.')

subdir('slurm')
subdir('src')

# Finish compiling



# References:
# https://mesonbuild.com/Porting-from-autotools.html#porting-from-autotools
# https://mesonbuild.com/Configuration.html