# htmldir = ${datadir}/doc/${PACKAGE}-${SLURM_VERSION_STRING}/html

man8 = [
	'slurmctld.8',
	'slurmd.8',
	'slurmdbd.8',
	'slurmstepd.8',
	'spank.8',
]


install_man(man8)
html_dir = join_paths(get_option('datadir'), package + '-' + slurm_version_string, 'html')

# EXTRA_DIST = $(man8_MANS)


# TODO:
# if HAVE_MAN2HTML

# html8_data = [
# 	'slurmctld.html',
# 	'slurmd.html',
# 	'slurmdbd.html',
# 	'slurmstepd.html',
# 	'spank.html',
# ]
# MOSTLYCLEANFILES = ${html_DATA}

# EXTRA_DIST += $(html_DATA)

# SUFFIXES = .html

# .8.html:
# 	`dirname $<`/../man2html.py @SLURM_MAJOR@.@SLURM_MINOR@ $(srcdir)/../../html/header.txt $(srcdir)/../../html/footer.txt $<

# endif

man2html_py = join_paths(meson.current_source_dir(), '..', 'man2html.py')
header = join_paths(meson.current_source_dir(), '..', '..', 'html', 'header.txt')
footer = join_paths(meson.current_source_dir(), '..', '..', 'html', 'footer.txt')
foreach file : man8

	message('Converting ' + file + ' to html file')
	global_defaults_src = custom_target(
		file,
		command : [man2html_py, slurm_major_minor, header, footer, file],
		capture: true,
		output : [file + 'asdfsad'],
	)
endforeach


