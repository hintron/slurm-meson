subdir('cgroup')
subdir('linuxproc')
subdir('pgid')

# TODO: Is this correct?
if conf_data.get('HAVE_NATIVE_CRAY', 0) == 1 and conf_data.get('HAVE_REAL_CRAY', 0) == 1
    subdir('cray')
endif
if conf_data.get('HAVE_LUA', 0) == 1
    subdir('lua')
endif