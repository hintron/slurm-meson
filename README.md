# Slurm Meson

This is an up-to-date fork of the latest
[Slurm](https://github.com/SchedMD/slurm/) with [Meson](https://mesonbuild.com/)
enabled as the build system.

The goal is to provide both a Meson-enabled Slurm fork as well as
standalone patches for existing Slurm installations to become Meson-compatible.
This will be done for each major release starting from Slurm 19.05 and
continuing until Meson is adopted into the Slurm codebase.

This project was started because ~I hate Autotools with a burning, fiery
passion and wish it would die a horrible, painful death~ Autotools is _slightly_
less dev-friendly than Meson.

## Quickstart (Ubuntu 18.04)

    sudo apt-get install python3 python3-pip ninja-build
    pip3 install --user meson
    export PATH="$HOME/.local/bin:$PATH"
    git clone git@github.com:hintron/slurm-meson.git ~/slurm-meson/slurm
    cd ~/slurm-meson
    meson setup meson-build/build slurm --prefix=$HOME/slurm-meson/meson-build
    ninja -C meson-build/build install

And that's it! On my laptop, the configure stage (`meson setup`) takes about 5
seconds and the build stage (`ninja install`) less than 30. For more details,
see [meson/howto.md](meson/howto.md).

For details on how to get started with Meson, see
https://mesonbuild.com/Quick-guide.html.

## Contributing

If you are interested in the project, let us know! We are looking for help to
get this working on various systems and with various Slurm configurations.

The immediate near-term goal is to get Slurm 19.05 to build solely with Meson.

See [meson/developers.md](meson/developers.md).

## Other Docs
Checkout these other docs:
* [meson/howto.md](meson/howto.md)
* [meson/notes.md](meson/notes.md)
* [meson/presentation.md](meson/presentation.md)
* [meson/developers.md](meson/developers.md)