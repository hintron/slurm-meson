if build_hdf5
    subdir('hdf5')
else
    warning('Unable to build acct_gather_profile/hdf5: build_hdf5 was false')
endif
if conf_data.get('WITH_CURL', 0) == 1
    subdir('influxdb')
else
    warning('Unable to build acct_gather_profile/influxdb: WITH_CURL != 1')
endif
subdir('none')