man8 = [
	'slurmctld.8',
	'slurmd.8',
	'slurmdbd.8',
	'slurmstepd.8',
	'spank.8',
]

install_man(man8)

if man2html.found()
	html_dir = join_paths(get_option('datadir'), package + '-' + slurm_version_string, 'html')
	man2html_py = join_paths(meson.current_source_dir(), '..', 'man2html.py')
	header = join_paths(meson.current_source_dir(), '..', '..', 'html', 'header.txt')
	footer = join_paths(meson.current_source_dir(), '..', '..', 'html', 'footer.txt')
	foreach man : man8
		name = man.split('.8')[0]
		man_full = join_paths(meson.current_source_dir(), man)
		html = name + '.html'
		custom_target(
			html,
			command : [
				man2html_py,
				slurm_major_minor,
				header,
				footer,
				# Pass in current build dir (build/doc/man/man8) to man2html_py so
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
