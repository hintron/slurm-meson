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

# How to patch an existing Slurm installation with Git

In GitHub, navigate to the meson19.05 branch: https://github.com/hintron/slurm-meson/commits/meson19.05

There should only be a single Meson-related commit. It should be all the commits
from the meson branch squashed into a single commit. Click it.

E.g. https://github.com/hintron/slurm-meson/commit/9c66895d1710ba1d4f04c489bd734e328fa49be2

Make it a patch by appending `.patch` to the end of the url. E.g.:

https://github.com/hintron/slurm-meson/commit/9c66895d1710ba1d4f04c489bd734e328fa49be2.patch

Right click to save-as the file.

In the Slurm git repo, make sure you are on the latest Slurm 19.05 branch and do

    git am <patch>

You should now have a patched Meson-capable Slurm source.

    git am


## Configuring Meson to statically link libslurm:

    meson ../meson-build/build -Dstatic_libslurm=true --prefix=$HOME/slurm-meson/meson-build


## Resources

* https://mesonbuild.com/Quick-guide.html