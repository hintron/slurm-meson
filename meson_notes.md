Meson Notes
============

I will write down what I learn so I don't forget, and to aid in porting future
code.

Setting rpath for executables
==============================

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


Upgrading from Meson 0.45 to 0.47
==================================

Some of the Slurm build code taken from configure.ac had `\1` or `\0` in
them. This caused issues, since Meson 0.46 introduced byte literals of the form
`\ooo` of *up to* three octal digits. Well, `\1` is one octal digit, but I
didn't realize that's how the syntax worked just based off of the documentation.
I had to look up the 0.46 build notes and python's own documentation to double
check.


Getting plugins to work
========================

The plugins would not link correctly unless `export_dynamic: true` was set in
executable(). This is because the plugin .so libraries are expecting the symbols
of the executable to be available for use, and this isn't the default. This
basically just sets the `-export-dynamic` linker flag, as can be seen in the
corresponding Makefile.am.

Dependencies
=============

For whatever reason, using dependency() didn't work for me. So I instead did
e.g. `mysql_libs = cc.find_library('mysqlclient', required: false)` to find
libraries. This worked with mysql, dl, numa, util, and munge. Only `threads`
seems to work with dependency().

globals_default.c
==================

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


library prefix
===============

There is a default 'lib' prefix to all libraries. To get rid of it, specify
`name_prefix=''`. This was needed for slurm to find the plugin shared libraries.


libslurm, libslurmfull, libcommon
==================================

libcommon is the library from src/common.

libslurmfull and libslurm are what is considered the "Slurm API." They are built
using the code in src/api, as well as linking in libcommon, libspank, and
libeio.

libslurm and libslurmfull are the same thing, except that libslurmfull has ALL
symbols, where as libslurm ONLY should have the Slurm API symbols.
I think this means that libslurmfull also should expose all symbols from
libcommon, libspank, and libeio.

I was having a bunch of problems during compile time linking executables that
used libslurmfull only when libslurmfull was set as a shared library.
The reason was that the symbols in libcommon, etc. were not exposed properly.
Cutting out the middle-man libslurmhelper and using `link_whole` instead of
`link_with` for libcommon, etc. solved the issue. This copied all the right
objects into the .so file.

In cutting out libslurmhelper, I also set the src
files. Without that, the .so files were almost completely empty. I debugged this
with `nm -g src/api/libslurmfull.so`. I could also see that the file size was
suspiciously small, which implied that symbols were being optimized out or
simply not being put in.

TODO: As of this writing, libslurm and libslurmfull are the same. I need to
limit the symbols in libslurm to only those found in the src/api source files.
I think this just requires not using link_whole when it comes to libslurm.




Things to look into
====================

* Explicit -lm for the math library: only needed if -nostdlib or -nodefaultlibs
is specified. For now, ignore porting over -lm stuff
https://stackoverflow.com/questions/1033898/why-do-you-have-to-link-the-math-library-in-c

* 
