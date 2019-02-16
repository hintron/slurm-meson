subdir('cray')
subdir('ibmaem')
subdir('ipmi')
subdir('none')
subdir('rapl')
if freeipmi_lib.found()
    subdir('xcc')
else
    warning('Unable to build acct_gather_energy/xcc: freeipmi lib not found')
endif