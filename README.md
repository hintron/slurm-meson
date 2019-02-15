# Slurm Meson

This is a port of [Slurm](https://github.com/SchedMD/slurm/) to enable using
[Meson](https://mesonbuild.com/) as the build system.

The eventual goal is to provide a Meson-enabling patch for each major release of
Slurm until Meson is adopted into the Slurm codebase.

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
