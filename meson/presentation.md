Meson Presentation

See https://mesonbuild.com/Comparisons.html

Meson
========
Pros
--------
+ Fast build times with Ninja
    * https://mesonbuild.com/Performance-comparison.html
    * 'empty build' or 'nothing needed' build times are instantaneous
+ Can do everything that Autotools can (as far as I can tell)
+ Easier maintenance due to simplicity and explicitness
    * Python-like simple syntax
    * Easy to use
+ Supports unity builds for even faster build times from scratch
+ Well documented
+ Open Source
+ Actively developed
+ No need for running autogen to generate makefiles
+ Guides to port from Autotools to Meson
    * https://mesonbuild.com/Porting-from-autotools.html#porting-from-autotools
    * https://wiki.gnome.org/Initiatives/GnomeGoals/MesonPorting
+ Used by some large projects:
    * Systemd - https://github.com/systemd/systemd
    * All GNOME projects (see meson porting webpage above)
        ** GLib - https://gitlab.gnome.org/GNOME/glib
        ** GTK+ - https://gitlab.gnome.org/GNOME/gtk
        ** HexChat IRC Chat Client - https://github.com/hexchat/hexchat
    * Xorg - https://gitlab.freedesktop.org/xorg/xserver
+ It's a joy to use compared to Autotools
+ Native support for modern tools (coverage, Valgrind, static analyzers)
+ Does not use Make or shell scripts
    * It can still call external scripts and programs if needed
+ Is built with portability and cross-compilation in mind
+ Works with other languages, like Rust

Cons
--------
- Relatively new
- Does not yet have a very large user base
- Unfamiliar to the team; yet another thing to learn
- Because of active development, meson OS packages are old
- Requires python3, pip3, and installing meson via pip3
- Slightly different command line syntax to build and configure a project
- Mainly developed by one guy, with only a small supplementary development team
    * If that guy disappears, then there could be a support problem
- Because of active development, feature set is changing
- Linux distros know the Autotools workflow well; they may not know or want to
know how to use Meson

Autotools
===========
Pros
--------
+ Stable
+ De facto standard - Used by many people
+ Well-known by a lot of people
+ Understood(?) by our team
+ Can do everything

Cons
--------
- Difficult to understand
    * Harder to maintain build scripts
    * Easier to introduce bugs and errors
    * Harder to track down build/link bugs
- Slower
    * Reduces programmer productivity waiting for builds
- More verbose
- Relies on shell scripts and Make
- Possibly not as portable



Conclusion
===========
* I believe that moving to Meson will reduce our technical debt.
* It will save debugging time when we have issues figuring out random linking
errors.
* It will also save developer time with the faster build times.
* Maintaining and editing the build scripts will also be easier and less
error-prone.

My recommendation is to give it a try alongside autotools until it proves to be
stable.
If needed, we can even do separate meson_<release> branches, so it's isolated.
