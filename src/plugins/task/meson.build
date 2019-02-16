# Only build if HAVE_SCHED_SETAFFINITY
if conf_data.get('HAVE_SCHED_SETAFFINITY', 0) == 1
    subdir('affinity')
else
    warning('Unable to build task/affinity: HAVE_SCHED_SETAFFINITY != 1')
endif
subdir('cgroup')
subdir('cray')
subdir('none')