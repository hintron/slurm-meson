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

# How to get the Slurm Meson source code

## Git Repo

Simply clone the latest 19.05-capable Slurm Meson branch with git:

    git clone git@github.com:hintron/slurm-meson.git ~/slurm-meson/slurm

## Repo-less

Navigate to https://github.com/hintron/slurm-meson/releases to see a list of
Meson-capable Slurm releases. These releases are all repo-free.
You can download a release manually through a web browser or via curl like so:

    wget https://github.com/hintron/slurm-meson/archive/<tag>.tar.gz

Once downloaded, extract it:

    tar xvf <tarfile>
    mkdir -p ~/slurm-meson
    mv slurm-meson-<tag> ~/slurm-meson/slurm

# How to patch an existing Slurm installation

Go to the Slurm source directory. E.g.:

    cd ~/slurm-meson/slurm

In GitHub, navigate to Releases: https://github.com/hintron/slurm-meson/releases

Then, click the link to the commit. Make a patch file out of the link by appending
`.patch` to the end of the url.

If your Slurm source has a git repo, you can use git to apply the patch.

The first method is without any intermediate files:

    curl <patch-url> | git am
    curl <patch-url> | git apply

Alternatively, you can right click and save-as the patch file in a browser, or download
it via wget like so:

    wget https://github.com/hintron/slurm-meson/commit/3dbb31ef5fd9717f9660ff80ec2b0fd7ca9882e0.patch
    git am <patch-file>
    git apply <patch-file>


If your Slurm source does not have a git repo, you can use the `patch` program:

    patch -p1 < <patch-file>

or

    curl <patch-url> | patch -p1

This second method seems to apply the patch cleaner than git.
To undo a patch applied with the second method, you can simply do:

    patch -p1 -R < <patch>

or

    curl <patch-url> | patch -p1 -R

# How to build Slurm with Meson

Configure with Meson:

    cd ~/slurm-meson/slurm
    meson ../meson-build/build --prefix=$HOME/slurm-meson/meson-build

You can optionally add developer options like `-Dmultiple_slurmd=true` and
`--werror`.

Build with Meson:

    cd ../meson-build/build
    ninja install

And that's it!

## Configuring Meson to statically link libslurm:

Add the `-Dstatic_libslurm=true` option to the Meson configure command.
