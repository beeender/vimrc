" Enable pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Try to know current system
let s:win = has("win16") || has("win32") || has("win64")

"Set mapleader
let mapleader = ","
let g:mapleader = ","

syntax on
filetype plugin on

"---- Begin env set ----
"Set current file dir as the pwd. Confict with cscope
"set bsdir=buffer
"set autochdir

"Encoding set
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

"Show line number
"set nu

"Highlight searching result
set hlsearch

"Set tab relevant thing
set smarttab
set expandtab
set tabstop=4
set cindent shiftwidth=4
set autoindent shiftwidth=4

"Recursively looking for tags
set tags=tags,./tags,./../tags,./**/tags

"Font set
if s:win
    set guifont=monofur:h14
else
    set guifont=monofur\\,WenQuanYi\ Zen\ Hei\ 13
endif
"set guifont=Monaco\\,WenQuanYi\ Zen\ Hei\ 11
"set guifont=Anonymous\\,WenQuanYi\ Zen\ Hei\ 11

"Turn backup off
set nobackup
set nowb
set noswapfile

"Change buffer without saving
set hid

"Just set it as the tip recommand. Set magic on, for regular expressions
set magic

"Format the statusline
set laststatus=2
set statusline=
set statusline+=%f "path to the file in the buffer, relative to current directory
set statusline+=\ %h%1*%m%r%w%0* " flag
set statusline+=\ [%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{&encoding}, " encoding
set statusline+=%{&fileformat}] " file format
set statusline+=\ %l/%L

"Use cscope tags first.
set csto=0

"---- End env set ----

"setting for omnicppcomplete
set nocp
let OmniCpp_DefaultNamespaces = ["std"]

"For yankring
if has('viminfo')
        set vi^=!
endif 

"Make arrow key available
map <Up> gk
map <Down> gj

"Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif


"---- Begin key bindings ----
"Use Ctrl+HJKL to change window
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l
noremap <A-j> :res -1<CR>
noremap <A-k> :res +1<CR>
noremap <A-h> :vertical res -1<CR>
noremap <A-l> :vertical res +1<CR>

noremap <F2> :BufExplorer<CR>
map <silent> <F3> :if &guioptions =~# 'T' <Bar>
            \set guioptions-=T <Bar>
            \set guioptions-=m <bar>
            \else <Bar>
            \set guioptions+=T <Bar>
            \set guioptions+=m <Bar>
            \endif<CR>
noremap <F4> :tnext<CR>
noremap <F5> :tprevious<CR>
noremap <F6> :bdelete<CR>
noremap <A-n> :cn<CR>
noremap <A-p> :cp<CR>
"Key bindings for system clipboard vmap <leader>c "+y
nmap <leader>c "+y
vmap <leader>c "+y
imap <leader>v <ESC>"+p
vmap <leader>v <ESC>"+p
nmap <leader>v "+p

"Key bindings for NERDTree
noremap <leader>nn :NERDTreeToggle<CR>
noremap <leader>nf :NERDTreeFind<CR>
"---- End key bindings ----

"Brackets completion
imap ( ()<LEFT>
imap { {}<LEFT><SPACE>
imap [ []<LEFT>
inoremap ' ''<LEFT>
inoremap " ""<LEFT>


"MRU setting
let MRU_Max_Entries = 100
let MRU_Auto_Close = 1

"Set color
colo spring

"Indent style.
"This is for working.
set cino={1s

set wildmenu "For invoke ext-command auto-completion

set ignorecase "Ignore case when searching
set smartcase "Not for # * etc.


