" Vim indent file
" Language:     SX
" Maintainer:   Geir Erikstad <geir@kvaleberg.com>
" Created:      2010 Feb 15
" Updated:      2010 Dec 08

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

" expandtab changes tabs to spaces
set expandtab

setlocal indentexpr=GetSXIndent(v:lnum)
setlocal indentkeys=0{,0},0),o,O,e,!^F


if exists("*GetSXIndent")
    finish
endif

function! s:GetPrevNonCommentLineNum(line_num)
    let SKIP_LINES = '^\s*\;.*'
    let nline = a:line_num
    while nline > 0
        let nline = prevnonblank(nline-1)
        if getline(nline) =~ '|#'
            call cursor(nline, 1)
            let nline = searchpair('#|', '', '|#', 'bW')
        elseif getline(nline) !~? SKIP_LINES
            break
        endif
    endwhile
    return nline
endfunction

function! s:CountOpenParanthesis(line_num)
    let n_open = 0
    let n_close = 0
    let line = getline(a:line_num)
    let pattern = '[();]'
    let i = match(line, pattern)
    let comment = 0
    while i != -1
        if line[i] == '(' && !comment
            let n_open += 1
        elseif line[i] == ')' && !comment
            let n_close += 1
        endif
        if line[i] == ';'
            let comment = 1
        endif
        let i = match(line, pattern, i + 1)
    endwhile
    return n_open - n_close
endfunction

function! s:GetIndentOfMatchingWhenOrIf(line_num)
    let paran_count = -1
    let WHEN = '.*\<\(when\|if\)\>.*'
    let nline = a:line_num
    while nline > 0
        let nline = s:GetPrevNonCommentLineNum(nline)
        let paran_count += s:CountOpenParanthesis(nline)
        if paran_count == 0
            if getline(nline) =~ WHEN
                return indent(nline) + 1
            endif
        endif
    endwhile
    return indent(s:GetPrevNonCommentLineNum(a:line_num))
endfunction

function! GetSXIndent(line_num)
    " Line 0 should be at column 0
    if a:line_num == 0
        return 0
    endif

    let this_codeline = getline(a:line_num)

    let prev_codeline_num = s:GetPrevNonCommentLineNum(a:line_num)
    let new_indent = indent(prev_codeline_num)

    if this_codeline =~ '^\s*\<else\>\s*$'
        return s:GetIndentOfMatchingWhenOrIf(a:line_num)
    endif

    if this_codeline =~ '^\s*)\s*$'
        " Returns indent of matching paranthesis
        call cursor(this_codeline, 1)
        return searchpairpos('(', '', ')', 'bW')[1] - 1
    endif

    let prev_codeline = getline(prev_codeline_num)

    if prev_codeline =~ '^\s*\<else\>\s*$'
        return new_indent + 3
    endif

    let prev_codeline_open_paranthesis = s:CountOpenParanthesis(prev_codeline_num)

    if prev_codeline =~ '^\s*)\s*$'
        return new_indent
    else
        return new_indent + prev_codeline_open_paranthesis * &sw
    endif

    return new_indent
endfunction
