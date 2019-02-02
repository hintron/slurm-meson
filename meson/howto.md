# How to build Slurm master with Meson

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

Clone slurm-meson:

    git clone git@github.com:hintron/slurm-meson.git ~/slurm-meson/slurm

Configure with Meson (developer mode):

    cd ~/slurm-meson/slurm
    meson ../meson-build/build -Dmultiple_slurmd=true --werror --prefix=$HOME/slurm-meson/meson-build

Build with Meson:

    cd ../meson-build/build
    ninja install

And that's it!

## Configuring Meson to statically link libslurm:

    meson ../meson-build/build -Dstatic_libslurm=true --prefix=$HOME/slurm-meson/meson-build


## Resources

* https://mesonbuild.com/Quick-guide.html