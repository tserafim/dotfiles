"*****************************************************************************
" vim basics based on vim-sensible, idiomatic-vim
" https://github.com/tpope/vim-sensible
" https://github.com/romainl/idiomatic-vimrc
"
" vim superpowers based on vim-bootstrap
" https://github.com/avelino/vim-bootstrap
"*****************************************************************************

"*****************************************************************************
"" Plug Load
"*****************************************************************************
call plug#begin('~/.vim/plugged')

" Autocomplete
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" ctrlp
Plug 'ctrlpvim/ctrlp.vim'

" Syntax checking
Plug 'scrooloose/syntastic'

" snippetes
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" tagbar
Plug 'majutsushi/tagbar'

" colorschemes
Plug 'tomasr/molokai'
Plug 'chriskempson/base16-vim'
Plug 'notpratheek/vim-luna'
Plug 'hhff/SpacegrayEighties.vim'

" airline = light powerlight
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" vim-autoformat
Plug 'Chiel92/vim-autoformat'

call plug#end()

if has('autocmd')
  filetype plugin indent on
endif

"*****************************************************************************
"" Sensible settings - organize later according to idiomatic-vimrc
"" https://github.com/romainl/idiomatic-vimrc
"*****************************************************************************

set autoindent " Minimal automatic indenting for any filetype
set backspace=indent,eol,start " Proper backspace behavior
set complete-=i " https://github.com/tpope/vim-sensible/issues/51
set smarttab

set nrformats-=octal

set ttimeout        " timeout on key codes
set ttimeoutlen=100

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

set laststatus=2 " last windows will always have status line
set ruler " Shows the current line number at the bottom right of the screen
set wildmenu " Command-line completion

if !&scrolloff
  set scrolloff=1 " minimum number of lines to show above/below cursor
endif
if !&sidescrolloff
  set sidescrolloff=5 " minimum number of lines to show to the right/left of cursor
endif
set display+=lastline " as much as possible of the last line will be displayed

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
  set shell=/bin/bash
endif

set autoread " automatically read file changed outside of vim

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

inoremap <C-U> <C-G>u<C-U>

" vim:set ft=vim et sw=2:

"*****************************************************************************
"" Basic setup
"*****************************************************************************

" Unleash all VIM power (break vi compatibility)
set nocompatible

" search settings
set hlsearch          " highlight search results
set incsearch        " Makes search act like search in modern browsers
set ignorecase      " Ignore case when searching
set smartcase       " When searching try to be smart about cases 


" Enable hidden buffers
set hidden

" Tabs. May be overwritten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

" Visit links below for more info on clipboard and vim
" http://vimcasts.org/episodes/accessing-the-system-clipboard-from-vim/
" http://vi.stackexchange.com/questions/84/how-can-i-copy-text-to-the-system-clipboard-from-vim
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

set wildignore=*.pyc
"*****************************************************************************
"" Mapping
"*****************************************************************************

" map leader to <space>
" nnoremap <Space> <Nop>
let mapleader = "\<Space>"

" Clean search (highlight)
noremap <leader>\ :noh<CR>

"  map ç key in ABNT keyboard to replace key in same position in us keyboard
nnoremap ç ;
nnoremap Ç :


"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Save file
nnoremap <leader>s :w<CR>

"*****************************************************************************
"" Visual Settings
"*****************************************************************************

" enable syntax highlighting
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" show absolute line numbers
set number

" show the matching part of the pair for [] {} and ()
set showmatch

" 'show' buffer on terminal title
set title

" highlight column
set colorcolumn=79

" color scheme
set background=dark
" colorscheme SpacegrayEighties
colorscheme base16-flat
" colorscheme base16-materia
" colorscheme base16-monokai

" guioptions
" http://vimdoc.sourceforge.net/htmldoc/options.html#'guioptions'
" default is: guioptions=agimrLtT
set guioptions=agimt

" font settings
if has('gui_running')
  if has('gui_gtk2')
    set guifont=Ubuntu\ Mono\ 12
  endif
endif

"*****************************************************************************
"" Python basic settings
"*****************************************************************************

" .py file configs
autocmd Filetype python setlocal
    \ tabstop=4             " set tabs to have 4 spaces
    \ softtabstop=4
    \ shiftwidth=4          " when using the >> or << commands, shift lines by 4 spaces
    \ textwidth=79
    \ expandtab            " expand tabs into spaces
    \ fileformat=unix

" enable all Python syntax highlighting features
let python_highlight_all = 1

"*****************************************************************************
"" HTML  basic settings
"*****************************************************************************

" .html file configs
autocmd Filetype html setlocal tabstop=2 softtabstop=2 shiftwidth=2

"*****************************************************************************
"" vim  basic settings
"*****************************************************************************

" .vimrc file configs
autocmd Filetype vim setlocal tabstop=2 softtabstop=2 shiftwidth=2

"*****************************************************************************
"" Plugin Settings
"*****************************************************************************

" ctrlp
let g:ctrlp_map= '<c-p>'
let g:ctrlp_cmd='CtrlP'

" YouCompleteMe
let g:ycm_python_binary_path = 'python'
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_seed_identifiers_with_syntax =1
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']

map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>d :YcmCompleter GetDoc<CR>

" ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"

" syntastic (recommended settings for beginners)
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_python_checkers=['python', 'flake8']

" vim-autoformat
let g:formatters_python= ['yapf']

noremap <leader>y :Autoformat<CR>

" tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1 " move cursor to Tagbar when it opens

" vim-airline
let g:airline_theme = 'base16_flat'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#ycm#error_symbol = 'E:'
let g:airline#extensions#ycm#warning_symbol = 'W:'

let g:airline#extensions#syntastic#enabled = 1

let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = ''
