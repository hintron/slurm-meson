#!/bin/sh

# Meson doesn't do shell commands, so call this shell script via run_command()

# Get args
pkglibdir="$1"
sysconfdir="$2"

# The `capture: true` option of custom_target() tells meson to write stdout to
# output file for us. So do that!
echo "/* This file autogenerated by src/common/meson.build */"
echo "char *default_plugin_path = \"${pkglibdir}\";"
echo "char *default_slurm_config_file = \"${sysconfdir}/slurm.conf\";"
echo "char *default_plugstack = \"${sysconfdir}/plugstack.conf\";"
