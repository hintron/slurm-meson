# Meson Notes Overview

I will write down what I learn so I don't forget, and to aid in porting future
code.

# Setting rpath for executables

Getting executables to access shared libraries (e.g. libslurmfull.so) was a pain
point.
See https://github.com/mesonbuild/meson/issues/3038

Use `install_rpath` in `executable()`! I was trying to use build_path before, to
no effect. For some reason, I didn't see it because it didn't show up in the
documentation search online.
See https://mesonbuild.com/Reference-manual.html#executable

Use `$ORIGIN` as the path where the executable is installed for relative paths.

NOTE: It seems that Meson puts in placeholder 'X's for the rpath during compile
time, I guess to allocate enough space in the executable for the eventual rpath.
See build.ninja.

Not sure what the double `$` in $$ORIGIN means in build.ninja...


# Upgrading from Meson 0.45 to 0.47

Some of the Slurm build code taken from configure.ac had `\1` or `\0` in
them. This caused issues, since Meson 0.46 introduced byte literals of the form
`\ooo` of *up to* three octal digits. Well, `\1` is one octal digit, but I
didn't realize that's how the syntax worked just based off of the documentation.
I had to look up the 0.46 build notes and python's own documentation to double
check.


# Getting plugins to work

The plugins would not link correctly unless `export_dynamic: true` was set in
executable(). This is because the plugin .so libraries are expecting the symbols
of the executable to be available for use, and this isn't the default. This
basically just sets the `-export-dynamic` linker flag, as can be seen in the
corresponding Makefile.am.

https://mesonbuild.com/Reference-manual.html#shared_module
Use shared_module() over shared_library(), because that allows this .so to
access the caller's symbols (if the caller has export-dynamic set).
https://stackoverflow.com/a/17083153
(-Wl,--export-dynamic flag)


So, shared_module means it will ONLY be `dlopen()`ed. On Linux, you can
statically link to a shared module (e.g. `lhwloc`) AND `dlopen` it. But on
MacOS, if you try to statically link a shared module, it will fail.
So just make sure that if any non-plugin .so files are linked to, don't make it
a shared module.
See https://stackoverflow.com/questions/4845984/difference-between-modules-and-shared-libraries

# Dependencies

For whatever reason, using dependency() didn't work for me. So I instead did
e.g. `mysql_libs = cc.find_library('mysqlclient', required: false)` to find
libraries. This worked with mysql, dl, numa, util, and munge. Only `threads`
seems to work with dependency().

# globals_default.c

Generating this was a bit of a pain, because Meson does not support using shell
syntax in the run_command() function. So there was no easy way in Meson to
write a file with string interpolation and redirect it to a new output file.

The best workaround I found was to write a shell script that takes in arguments
that will be used for string templating. Then, the strings are simply echoed to
stdout. See generate_global_defaults_c.sh

Using custom_target(), all I needed to do was specify `capture: true`, set the
output file name, and call the shell script with my args via run_command().
Pretty slick!

Related: printing the git commit will be very easy, due to the vcs_tag()
function.


# library prefix

There is a default 'lib' prefix to all libraries. To get rid of it, specify
`name_prefix=''`. This was needed for Slurm to find the plugin shared libraries.


# libslurm, libslurmfull, libcommon

libcommon includes all the code in src/common.

libslurm is what is considered the "Slurm API." It is built
using the code in src/api, as well as linking in libcommon, libspank, and
libeio.

libslurm and libslurmfull are the same thing, except that libslurmfull has ALL
symbols, including from libcommon, where as libslurm ONLY exposes Slurm API
symbols from src/api/.

I was having a bunch of problems during compile time linking executables that
used libslurmfull only when libslurmfull was set as a shared library.
The reason was that the symbols in libcommon, etc. were not exposed properly.
Cutting out the middle-man libslurmhelper and using `link_whole` instead of
`link_with` for libcommon, etc. solved the issue. This copied all the right
symbols into the .so file.

In cutting out libslurmhelper, I also set the src
files. Without that, the .so files were almost completely empty. I debugged this
with `nm -g src/api/libslurmfull.so`. I could also see that the file size was
suspiciously small, which implied that symbols were being optimized out or
simply not being put in.

For history of libslurmhelper, see commit bf26d99230ef1bcd6af5155f715a28ee7934e88b:

"Make a convenience library libslurmhelper.la which has the same contents
as libslurm.  However, libslurmhelper exports ALL symbols, not just the
ones in the SLURM API.  This can be used by slurm commands that want to
use both libcommon and libslurm functions."

I don't get what this means... Isn't libcommon in libslurm? libslurmhelper
sounds exactly like libslurmfull. It sounds like libslurmfull was made without
realizing that libslurmhelper was the same thing.

From _src/api/Makefile.am_:
```
# Note that libslurmhelper is mostly the same as libslurm, except that
# it exports ALL symbols used by the process, libcommon, libeio, etc.
# Only link with libslurmhelper if you are sure you are not going to be
# loading a plugin that could use something you yourself are not
# calling from here.
# libslurm.o only contains all the api symbols and will export
# them to plugins that are loaded.
# Also, libslurmhelper, libslurm.o are for convenience, they are not installed.
```

More info on libslurmfull vs. liblsurm:
https://bugs.schedmd.com/show_bug.cgi?id=4449

## Symbol Visibility
TODO: As of this writing, libslurm and libslurmfull are the same. I need to
limit the symbols in libslurm to only those found in the src/api source files.

`readelf -s ../lib/slurm/libslurm.so`

https://blogs.oracle.com/solaris/inside-elf-symbol-tables-v2

The `link_whole` argument to libslurm and libslurmfull causes Ninja to create a
.symbols file that can be accessed in a location like
_inspiron/build/src/api/ad4d739%40%40slurm%40sha/libslurm.so.symbols_.


slurm_xlator.h and strong_alias()
http://www.valvers.com/programming/c/gcc-weak-function-attributes/
A strong alias (which is the default alias unless specified as 'weak') is
saying that even if e.g. fatal() gets defined by the user's program and then
links the Slurm API in, we don't care because we aliased our fatal() to point to
slurm_fatal(). It's still unclear exactly how this is done.

https://stackoverflow.com/questions/30186256/what-is-the-difference-between-o-a-and-so-files

# Math library

Explicit -lm for the math library: only needed if -nostdlib or -nodefaultlibs
is specified.
See https://stackoverflow.com/questions/1033898/why-do-you-have-to-link-the-math-library-in-c
See https://mesonbuild.com/howtox.html#add-math-library-lm-portably

# Test Code Compilation

For test code compilation:
https://mesonbuild.com/Compiler-properties.html#does-code-compile
https://mesonbuild.com/Reference-manual.html#compiler-object
https://mesonbuild.com/Syntax.html#strings
https://mesonbuild.com/Reference-manual.html#run-result-object

# MariaDB 10.3 on Ubuntu 18.04

## Installing

Trying to install MariaDB with the default packages on Ubuntu doesn't work very
well. Let's instead force Ubuntu to install 10.3, so the server, client, and dev
packages are all on the same version.

See https://computingforgeeks.com/install-mariadb-10-on-ubuntu-18-04-and-centos-7/

Get a clean slate:
    sudo apt-get remove mariadb-server mysql-server libmysqlclient-dev

Prerequisites:
    sudo apt-get install software-properties-common

Add MariaDB 10.3 apt repository:
    sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
    sudo add-apt-repository 'deb [arch=amd64] http://mirror.zol.co.zw/mariadb/repo/10.3/ubuntu bionic main'

Install MariaDB 10.3L
    sudo apt update
    sudo apt -y install mariadb-server mariadb-client libmariadb-dev

Now, all versions should be at 10.3. Let's check:
    mysql -V # client
    mysqld -V # server
    mariadb_config # libmariadb-dev

Let's see if the mariadb service is up and running:
    sudo systemctl status mariadb

Restart or start the mariadb service if needed:
    sudo systemctl restart mariadb
    # sudo systemctl start mariadb

Be sure to reconfigure Slurm so it can use the MariaDB 10.3 dev library.
    ninja reconfigure

## Debugging

Debug mariadb configuration:
    mariadb_config

Make sure that `--socket` matches the socket that `mysql` command is trying to
access. If they differ (e.g. the former is `/tmp/mysql.sock` and the latter is
`/var/run/mysqld/mysqld.sock`) then likely the client and server versions of
mariadb are different.

See if mysqld is listening on port 3306:
    sudo netstat -tulpn

Download mysql-workbench to try accessing the DB via a GUI:
    sudo apt install mysql-workbench
    mysql-workbench

If the password is not blank, you can change it like so:
    sudo mysqladmin -u root -p'old_password' password ''

See https://serverfault.com/questions/103412/how-to-change-my-mysql-root-password-back-to-empty.

You may also try something like this:
    ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'new_password'

After running slurmdbd, if you get this error:

    slurmdbd: error: mysql_query failed: 1558 Column count of mysql.proc is wrong. Expected 21, found 20. Created with MariaDB 100138, now running 100312. Please use mysql_upgrade to fix this error

It means that the Slurm DB was created with an older version of mariadb/mysql.

Update the existing databases:
    sudo mysql_upgrade

Now things should work!


If you get something like:

    ERROR 1529  Plugin 'unix_socket' is not loaded
    FATAL ERROR: upgrade failes

then add the following (with sudo) to _/etc/mysql/mariadb.conf.d/50-server.cnf_
under `[mysqld]`

    plugin-load-add = auth_cocket.so

And rerun `sudo mysql_upgrade`.

# Setting up _slurmdbd_

Add the cluster to the DB:
    sacctmgr add cluster my_cluster
    sacctmgr show assoc

If you are running slurmdbd as a user other than root, add it to Slurm:
    sacctmgr add user name=my_name account=root

# Setting up _slurmctld_

Start slurmctld with -i to ignore previous state, if needed.

# Running testsuite

# AC_CHECK_LIB

cc.find_library() serves the same purpose.
See https://github.com/mesonbuild/meson/issues/217
See https://mesonbuild.com/Reference-manual.html#external-library-object

