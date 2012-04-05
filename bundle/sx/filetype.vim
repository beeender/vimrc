" my filetype file
if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufRead,BufNewFile *.{sx,sxdef}     setfiletype sx
    au! BufRead,BufNewFile *.{dox}          setfiletype doxygen
augroup END

