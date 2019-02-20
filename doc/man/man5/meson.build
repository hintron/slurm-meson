# Note

man5 = [
	'acct_gather.conf.5',
	'burst_buffer.conf.5',
	'cgroup.conf.5',
	'cray.conf.5',
	'ext_sensors.conf.5',
	'gres.conf.5',
	'knl.conf.5',
	'nonstop.conf.5',
	'slurm.conf.5',
	'slurmdbd.conf.5',
	'topology.conf.5',
]

install_man(man5)

if man2html.found()
	html_dir = join_paths(get_option('datadir'), package + '-' + slurm_version_string, 'html')
	man2html_py = join_paths(meson.current_source_dir(), '..', 'man2html.py')
	header = join_paths(meson.current_source_dir(), '..', '..', 'html', 'header.txt')
	footer = join_paths(meson.current_source_dir(), '..', '..', 'html', 'footer.txt')
	foreach man : man5
		name = man.split('.5')[0]
		man_full = join_paths(meson.current_source_dir(), man)
		html = name + '.html'
		custom_target(
			html,
			command : [
				man2html_py,
				slurm_major_minor,
				header,
				footer,
				# Pass in current build dir (build/doc/man/man5) to man2html_py so
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
