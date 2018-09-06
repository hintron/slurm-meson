Meson How-To
=====================================================

https://mesonbuild.com/Quick-guide.html

How to build Slurm master with Meson
=====================================

Install Python3 and Ninja:

    sudo apt-get install python3 ninja-build

Install the latest version of Meson with Python3 Pip:

    pip3 install --user meson

Make sure meson is installed and the version is > 0.45:

    meson --version

If meson is not installed, make sure to add pip packages to your PATH (e.g. in ~/.bashrc):

    if [ -d "$HOME/.local/bin" ] ; then
        PATH="$HOME/.local/bin:$PATH"
    fi

Clone Slurm (meson branch):

    git clone -b meson https://bitbucket.org/kolob/slurm_fork.git ~/slurm_test/master/slurm

Set up build dir:

    cd ~/slurm_test/master/slurm/

Configure with Meson:

    meson ../meson_build/build -Dmultiple_slurmd=true -Dstatic_libslurm=true --werror --prefix=$HOME/slurm_test/master/meson_build

Build with Meson:

    cd ../meson_build/build
    ninja install

And that's it!

WIP: configuring Meson to dynamically link libslurm:
=====================================================

    meson ../meson_build/build -Dmultiple_slurmd=true -Dstatic_libslurm=true --werror --prefix=$HOME/slurm_test/master/meson_build

Currently, the executables can't find the shared libraries at run time...
