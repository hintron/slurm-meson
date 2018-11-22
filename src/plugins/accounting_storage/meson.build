subdir('common')
subdir('none')
subdir('slurmdbd')
if mysql_libs.found()
    subdir('mysql')
else
    warning('accounting_storage/mysql not being built because mysql_libs are empty')
endif
# TODO:
# subdir('filetxt')
