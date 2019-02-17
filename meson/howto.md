# How to install Meson

Install Python3 (>= 3.5) and Ninja (>= 1.5). E.g. on Ubuntu:

    sudo apt-get install python3 python3-pip ninja-build

Install the latest version of Meson with Python3 Pip:

    pip3 install --user meson

Make sure meson is installed and the version is >= 0.46:

    meson --version

If meson is not installed, make sure to add pip packages to your PATH
(e.g. in ~/.bashrc):

    if [ -d "$HOME/.local/bin" ] ; then
        PATH="$HOME/.local/bin:$PATH"
    fi



# How to get the Slurm Meson source code

## Git Repo

Simply clone the latest 19.05-capable Slurm Meson branch with Git:

    git clone git@github.com:hintron/slurm-meson.git ~/slurm-meson/slurm

## Repo-less

Navigate to https://github.com/hintron/slurm-meson/releases to see a list of
Meson-capable Slurm releases. All downloads all free of git repos.
You can download a release through the browser or via curl like
so:

    wget https://github.com/hintron/slurm-meson/archive/<tag>.tar.gz

Once downloaded, extract it:

    tar xvf <tarfile>
    mkdir -p ~/slurm-meson
    mv slurm-meson-<tag> ~/slurm-meson/slurm



# How to patch an existing Slurm installation

Go to the Slurm source directory. E.g.:

    cd ~/slurm-meson/slurm

In GitHub, navigate to Releases:
https://github.com/hintron/slurm-meson/releases. Then, click the link to the
commit. Make `<patch-url>` out of the link by appending `.patch` to the end of
the url.

An example `<patch-url>` would be
https://github.com/hintron/slurm-meson/commit/c1cf7586da7291d39a730db063f4c952436a3629.patch,
which corresponds to tag `meson1905-19-02-14`
(https://github.com/hintron/slurm-meson/releases/tag/meson1905-19-02-14).

If your Slurm source has a Git repo, you can use Git to apply the patch. This
first method does not use any intermediate files:

    curl <patch-url> | git am
    # or...
    curl <patch-url> | git apply

Alternatively, you can save the patch file from `<patch-url>` to `<patch-file>`.
Simply navigate to `<patch-url>` in a browser and right click to save-as the
the patch, or download it via `wget` like so:

    wget  -O <patch-file>

Then apply it with Git:
    git am <patch-file>
    # or...
    git apply <patch-file>


If your Slurm source does not have a Git repo, you can use the `patch` program:

    patch -p1 < <patch-file>
    # or...
    curl <patch-url> | patch -p1

Using `patch` seems to apply the patch cleaner than Git.
To undo a patch applied with the second method, you can simply do:

    patch -p1 -R < <patch>
    # or...
    curl <patch-url> | patch -p1 -R



# How to build Slurm with Meson

Configure with Meson:

    cd ~/slurm-meson
    meson setup meson-build/build slurm --prefix=$HOME/slurm-meson/meson-build

You can optionally add developer options like `-Dmultiple-slurmd=true` and
`--werror`:
    meson setup meson-build/build slurm --prefix=$HOME/slurm-meson/meson-build --werror -Dmultiple-slurmd=true

The syntax is either `meson setup <builddir> <srcdir> [options]` or, if the
current working directory is already at  _slurm/_, do
`meson <builddir> [options]`.

Build with Meson:

    ninja -C meson-build/build install
    # or
    cd ../meson-build/build
    ninja install

And that's it! The build should take less than 30 seconds.

## Reconfiguring

In the _meson-build/build_, simply do `ninja reconfigure` or `meson --reconfigure`
to rerun the configuration.

## Configuring Meson to statically link libslurm:

Add the `-Dstatic-libslurm=true` option to the Meson configure command.
