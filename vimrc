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
filetype plugin indent on

"Indent style.
"This is for working.
"set cino={1s
"switch and case at the same level.
:set cinoptions=l1
"C++ scope declaration (private, public, etc.)
set cino+=g0

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
imap { {}<LEFT>
imap [ []<LEFT>
inoremap " ""<LEFT>


"MRU setting
let MRU_Max_Entries = 100
let MRU_Auto_Close = 1

if !has("gui_running")
set t_Co=256
endif
colorscheme gentooish

set wildmenu "For invoke ext-command auto-completion

set ignorecase "Ignore case when searching
set smartcase "Not for # * etc.

"Source special vim rc for particular projects
if filereadable("custom_vimrc")
    source custom_vimrc
endif

"EasyGrep
let g:EasyGrepMode = 2
let g:EasyGrepRecursive = 1
if has('win32') || has ('win64')
    let g:EasyGrepFileAssociations = $VIM."/EasyGrepFileAssociations"
else
    let g:EasyGrepFileAssociations = $HOME."/.vim"."/EasyGrepFileAssociations"
endif

"vim-notes
let g:notes_directories = ['~/Documents/Notes', '~/Dropbox/Shared Notes']

"ctrlp
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 40
let g:ctrlp_lazy_update = 1
let g:ctrlp_by_filename = 1
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/](\.git|\.hg|\.svn|out)$',
            \ 'file': '\v\.(exe|so|dll|jar|apk)$',
            \ }

"YouCompleteMe
"Turn off extra conf load query.
let g:ycm_confirm_extra_conf = 0

