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
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" ctrlp
Plug 'ctrlpvim/ctrlp.vim'

" Syntax checking
" Plug 'scrooloose/syntastic'

" snippetes
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" tagbar
" Plug 'majutsushi/tagbar'

" colorschemes
Plug 'tomasr/molokai'
Plug 'chriskempson/base16-vim'
Plug 'notpratheek/vim-luna'

" airline = light powerlight
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" vim-autoformat
" Plug 'Chiel92/vim-autoformat'

call plug#end()

"*****************************************************************************
"" Basic setup
"*****************************************************************************

" Unleash all VIM power (break vi compatibility)
set nocompatible

set hidden " Enable hidden buffers

set backspace=indent,eol,start " Proper backspace behavior

set autoread " automatically read file changed outside of vim

" Visit links below for more info on clipboard and vim
" http://vimcasts.org/episodes/accessing-the-system-clipboard-from-vim/
" http://vi.stackexchange.com/questions/84/how-can-i-copy-text-to-the-system-clipboard-from-vim
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

" Increase command line history size
if &history < 1000
  set history=1000
endif

" Maximum number of tab pages to be opened by -p command line argument
if &tabpagemax < 50
  set tabpagemax=50
endif

" search settings
set hlsearch          " highlight search results
set incsearch        " Makes search act like search in modern browsers
set ignorecase      " Ignore case when searching
set smartcase       " Do not ignorecase if search pattern has uppercase letter

" Tabs. May be overwritten by autocmd rules
set expandtab " when tab is pressed, insert spaces
set tabstop=4 " when tab is pressed, move this amount
set shiftwidth=4 " when indenting with '>', move this amount
set autoindent " new line inherits the indentation of previous line

if has('autocmd')
  filetype plugin indent on
endif

" vim autocomplete should not search tags in (i)nclude statements
set complete-=i " https://github.com/tpope/vim-sensible/issues/51

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

set formatoptions+=r  " insert comment char after hittig enter on Insert mode

"*****************************************************************************
"" Mapping
"*****************************************************************************

" map leader to <space>
nnoremap <Space> <Nop>
let mapleader = "\<Space>"

" Clean search (highlight)
nnoremap <silent> <leader>c :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" map ç key in ABNT keyboard to replace key in same position in us keyboard
nnoremap ç ;
nnoremap Ç :

" Delete buffer
noremap <leader>d :bd<CR>

" Buffer nav
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>

" Recover from accidental Ctrl-U
" http://vim.wikia.com/wiki/VimTip436
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>

"*****************************************************************************
"" Visual Settings
"*****************************************************************************

set showcmd
set laststatus=2 " last windows will always have status line
set ruler " Shows the current line number at the bottom right of the screen
set wildmenu " Command-line completion

if !&scrolloff
  set scrolloff=3 " minimum number of lines to show above/below cursor
endif
if !&sidescrolloff
  set sidescrolloff=5 " minimum number of lines to show to the right/left of cursor
endif

set display+=lastline " as much as possible of the last line will be displayed

" Strings to use in list mode
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  set list
endif

" enable syntax highlighting
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" show absolute line numbers
set number

" 'show' buffer on terminal title
set title

" color scheme settings
" https://superuser.com/questions/399296/256-color-support-for-vim-background-in-tmux
set t_ut=
set termguicolors
" colorscheme base16-solarized-dark
colorscheme base16-solarflare
" colorscheme base16-flat
" colorscheme base16-materia
" colorscheme base16-monokai

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

"*****************************************************************************
"" Python basic settings
"*****************************************************************************

" .py file configs
autocmd Filetype python setlocal
    \ colorcolumn=79

" enable all Python syntax highlighting features
" let python_highlight_all = 1

" set wildignore=*.pyc

"*****************************************************************************
"" HTML  basic settings
"*****************************************************************************

" .html file configs
autocmd Filetype html setlocal
    \ tabstop=2 shiftwidth=2

"*****************************************************************************
"" vim  basic settings
"*****************************************************************************

" .vimrc file configs
autocmd Filetype vim setlocal
    \ tabstop=2 shiftwidth=2

"*****************************************************************************
"" Plugin Settings
"*****************************************************************************

" matchit.vim is a plugin that comes with vim
" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" ctrlp
let g:ctrlp_map= '<c-p>'
let g:ctrlp_cmd='CtrlP'

" YouCompleteMe
" let g:ycm_python_binary_path = 'python'
" let g:ycm_autoclose_preview_window_after_insertion=1
" let g:ycm_seed_identifiers_with_syntax =1
" let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']

" map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
" map <leader>d :YcmCompleter GetDoc<CR>

" ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" let g:UltiSnipsEditSplit="vertical"

" syntastic (recommended settings for beginners)
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_loc_list_height = 5
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_aggregate_errors = 1
" let g:syntastic_python_checkers=['python', 'flake8']
" let g:syntastic_sh_checkers=['shellcheck']

" vim-autoformat
" let g:formatters_python= ['yapf']

" noremap <leader>y :Autoformat<CR>

" tagbar
" nmap <silent> <F4> :TagbarToggle<CR>
" let g:tagbar_autofocus = 1 " move cursor to Tagbar when it opens

" vim-airline
let g:airline_theme = 'base16_flat'
" let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1

" let g:airline#extensions#ycm#enabled = 1
" let g:airline#extensions#ycm#error_symbol = 'E:'
" let g:airline#extensions#ycm#warning_symbol = 'W:'

" let g:airline#extensions#syntastic#enabled = 1

" let g:airline#extensions#tagbar#enabled = 1
" let g:airline#extensions#tagbar#flags = ''
