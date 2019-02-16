subdir('cray')
subdir('ibmaem')
subdir('ipmi')
subdir('none')
subdir('rapl')
if conf_data.get('HAVE_FREEIPMI', 0) == 1
    subdir('xcc')
else
    warning('Unable to build acct_gather_energy/xcc: HAVE_FREEIPMI != 1')
endif