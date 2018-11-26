How to build Slurm master with Meson
=====================================

Install Python3 (>= 3.5) and Ninja (>= 1.5). E.g. on Ubuntu:

    sudo apt-get install python3 python3-pip ninja-build

Install the latest version of Meson with Python3 Pip:

    pip3 install --user meson

Make sure meson is installed and the version is >= 0.46:

    meson --version

If meson is not installed, make sure to add pip packages to your PATH (e.g. in ~/.bashrc):

    if [ -d "$HOME/.local/bin" ] ; then
        PATH="$HOME/.local/bin:$PATH"
    fi

Clone slurm_meson:

    git clone git@gitlab.com:hintron/slurm_meson.git ~/slurm_meson/slurm

Configure with Meson (developer mode):

    cd ~/slurm_meson/slurm
    meson ../meson_build/build -Dmultiple_slurmd=true --werror --prefix=$HOME/slurm_meson/meson_build

Build with Meson:

    cd ../meson_build/build
    ninja install

And that's it!

Configuring Meson to statically link libslurm:
=====================================================

    meson ../meson_build/build -Dstatic_libslurm=true -Dmultiple_slurmd=true --werror --prefix=$HOME/slurm_meson/meson_build


Resources
=============

See https://mesonbuild.com/Quick-guide.html