# Slurm Meson

This is an up-to-date fork of the latest
[Slurm](https://github.com/SchedMD/slurm/) with [Meson](https://mesonbuild.com/)
enabled as the build system.

The goal is to provide both a Meson-enabled Slurm fork as well as
standalone patches for existing Slurm installations to become Meson-compatible.
This will be done for each major release starting for Slurm 19.05 and
continuing until Meson is adopted into the Slurm codebase.

This project was started because Autotools is a nightmare to maintain and use;
Meson isn't.

## Quickstart

See [meson/howto.md](meson/howto.md) for how to install Meson and build Slurm
with it.

## Contributing

If you are interested in the project, let us know! We are looking for help to
get this working on various systems and with various Slurm configurations.

The immediate near-term goal is to get Slurm 19.05 to build solely with Meson.

See [meson/developers.md](meson/developers.md).
