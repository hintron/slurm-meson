libjobacct_gather_common_src = [
    'common_jag.c',
    'common_jag.h',
]

libjobacct_gather_common = static_library(
    'jobacct_gather_common', # name
    libjobacct_gather_common_src, # source files
    include_directories: [slurm_inc],
)
