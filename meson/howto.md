# How to install Meson

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

# How to build Slurm master with Meson

Clone slurm-meson:

    git clone git@github.com:hintron/slurm-meson.git ~/slurm-meson/slurm

Configure with Meson (developer mode):

    cd ~/slurm-meson/slurm
    meson ../meson-build/build -Dmultiple_slurmd=true --werror --prefix=$HOME/slurm-meson/meson-build

Build with Meson:

    cd ../meson-build/build
    ninja install

And that's it!

# How to patch an existing Slurm installation

In GitHub, navigate to the meson19.05 branch: https://github.com/hintron/slurm-meson/commits/meson19.05

There should only be a single Meson-related commit. All the Slurm Meson commits
should be squashed into a single commit. Click it.

Make it a patch by appending `.patch` to the end of the url. Right click and
save-as the file.

Now, you have two options:

1) If your Slurm source has a git repo, you can apply the patch with git like
so:

    git am <patch>

or

    git apply

2) If your Slurm source does not have a git repo, you can use the `patch`
program

    patch -p1 < <patch>

This also works well in the case where git doesn't apply the patch correctly.
To undo the patch, you can simply do:

    patch -p1 -R < <patch>

## Configuring Meson to statically link libslurm:

    meson ../meson-build/build -Dstatic_libslurm=true --prefix=$HOME/slurm-meson/meson-build

## Resources

* https://mesonbuild.com/Quick-guide.html