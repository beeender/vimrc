if did_filetype()   " filetype already set..
    finish      " ..don't do these checks
endif
if getline(1) =~ '^#!.*\<sxs\>' || getline(1) =~ ';; \\file'
    setfiletype sx
endif

