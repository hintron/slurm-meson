# Methodology

Keep things simple. That's the whole point for switching over. Port the
existing Slurm build system where possible, but be wary of perpetuating
useless Autotool code.

# Resources

Here are some Meson guidelines to follow:

* https://wiki.gnome.org/Initiatives/GnomeGoals/MesonPorting
* https://mesonbuild.com/Porting-from-autotools.html#porting-from-autotools
* https://mesonbuild.com/Style-guide.html
* https://mesonbuild.com/howtox.html
* https://mesonbuild.com/Quick-guide.html

# Releases

Slurm Meson will periodically tag best-effort pre-releases until Slurm 19.05 is
released. The tag naming scheme will be:

    meson1905-YY-MM-DD

Once Slurm 19.05 is released, all the subsequent Slurm Meson releases _should_
be backwards compatible with all future Slurm minor releases.

If this turns out to not be true, we can cross that bridge when we get there.

At this point, Slurm Meson tag stable releases with the following naming scheme:

    meson1905-xX

Where little x is [a-z] and big X is [0-9], starting at `a0`. I just hate how
e.g. `v12` gets sorted before `v2`.

Once meson1905-a0 has been released, a new meson2002 branch will be started
(Slurm releases about every 9 months).


# Merging Slurm Meson into Slurm

Set up an "upstream" remote to track the Slurm source.

The main Slurm Meson porting (for Slurm 19.05, at least) will be done on the
meson1905 branch.

We will be using a merge workflow rather than a rebase workflow. It shouldn't
matter how often Slurm Meson is merged into Slurm mainline.

When merging Slurm Meson work into Slurm, it is important that you are on the
mainline Slurm branch. If you are on the Slurm Meson branch and merge Slurm
mainline in, though you will end up with basically the same result, in Github,
if you append `.patch` to the merge commit URL, it will generate a patch listing
the Slurm mainline commits instead of the Slurm Meson commits! Somehow, git or
GitHub is able to see who was the mainline and who was the thing that got
merged in.

To properly merge Slurm Meson work into mainline Slurm:

    git checkout slurm1905
    git fetch upstream
    git checkout -b temp upstream/master
    git merge slurm1905
    git checkout slurm1905
    git merge temp
    git push origin
    git branch -d temp

And now there is a merge commit that can produce a .patch file in GitHub!
If there is a simpler workflow, I'd like to hear about it :)