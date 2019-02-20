man1 = [
	'sacct.1',
	'sacctmgr.1',
	'salloc.1',
	'sattach.1',
	'sbatch.1',
	'sbcast.1',
	'scancel.1',
	'scontrol.1',
	'sdiag.1',
	'sinfo.1',
	'slurm.1',
	'sprio.1',
	'squeue.1',
	'sreport.1',
	'srun.1',
	'sshare.1',
	'sstat.1',
	'strigger.1',
]

if build_hdf5
	man1 += 'sh5util.1'
endif
if build_smap
	man1 += 'smap.1'
endif
if build_srun_cr
	man1 += 'srun_cr.1'
endif
if gtk_lib.found()
	man1 += 'sview.1'
endif

install_man(man1)

if man2html.found()
	html_dir = join_paths(get_option('datadir'), package + '-' + slurm_version_string, 'html')
	man2html_py = join_paths(meson.current_source_dir(), '..', 'man2html.py')
	header = join_paths(meson.current_source_dir(), '..', '..', 'html', 'header.txt')
	footer = join_paths(meson.current_source_dir(), '..', '..', 'html', 'footer.txt')
	foreach man : man1
		name = man.split('.1')[0]
		man_full = join_paths(meson.current_source_dir(), man)
		html = name + '.html'

		# Since the slurm.html target was already used with html/slurm.shtml,
		# make it different by adding to end of target name
		# See https://github.com/mesonbuild/meson/issues/4377
		man_html_target = man + '_mhtml'

		custom_target(
			man_html_target,
			command : [
				man2html_py,
				slurm_major_minor,
				header,
				footer,
				# Pass in current build dir (build/doc/man/man1) to man2html_py so
				# it can create the file where the install command can find it later
				'output_dir',
				meson.current_build_dir(),
				man_full
			],
			input: [man],
			output : [html],
			install: true,
			install_dir: html_dir,
		)
	endforeach
endif
