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
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --js-completer' }
Plug 'mattn/emmet-vim'

" fzf.vim
Plug 'junegunn/fzf.vim'

" Syntax checking
Plug 'w0rp/ale'

" Syntax definitions
Plug 'vim-python/python-syntax'
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'

" snippets
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" tagbar
Plug 'majutsushi/tagbar'

" colorschemes
Plug 'tomasr/molokai'
Plug 'chriskempson/base16-vim'
Plug 'dracula/vim'
Plug 'mhartington/oceanic-next'
Plug 'joshdick/onedark.vim'
Plug 'liuchengxu/space-vim-dark'

" airline = light powerline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" comments
Plug 'tpope/vim-commentary'

" vim-autoformat
" Plug 'Chiel92/vim-autoformat'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" nerdtree
Plug 'scrooloose/nerdtree'

" surround
Plug 'tpope/vim-surround'

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

" Increase speed with which git-gutter is updated
set updatetime=500

" When splitting, open new window on the right/below current window
set splitright
set splitbelow

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
" reload vimrc
augroup reload-vimrc
  autocmd!
  autocmd BufWritePost .vimrc source %
  autocmd BufWritePost .vimrc AirlineRefresh
augroup END

"*****************************************************************************
"" Mapping
"*****************************************************************************

" map leader to <space>
nnoremap <Space> <Nop>
let mapleader = "\<Space>"

" Clean search (highlight)
nnoremap <silent> <leader>c :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" center screen on next/previous search result
nnoremap n nzz
nnoremap N Nzz

" map ç key in ABNT keyboard to replace key in same position in us keyboard
nnoremap ç ;
nnoremap Ç :

" Delete buffer
noremap <leader>d :bp<bar>sp<bar>bn<bar>bd<CR>

" Save buffer
noremap <leader>w :w<CR>

" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>x :bn<CR>

" Recover from accidental Ctrl-U
" http://vim.wikia.com/wiki/VimTip436
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>

" split/window creation
" nnoremap <leader>s :split<CR>
nnoremap <leader>v :vsplit<CR>

" close window
noremap <leader>D :close<CR>

" easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Auto-insert closing parenthesis/brace
inoremap ( ()<Left>
inoremap { {}<Left>

"*****************************************************************************
"" Visual Settings
"*****************************************************************************

set showcmd
set laststatus=2 " last windows will always have status line
set ruler " Shows the current line number at the bottom right of the screen
set wildmenu " Command-line completion
set wildmode=list:longest " Show list and complete until point of ambiguity

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
" colorscheme dracula
" colorscheme molokai
" colorscheme OceanicNext
colorscheme onedark

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
let python_highlight_all = 1

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

" fzf.vim
nnoremap <C-P> :FZF<CR>
map <leader>f :Ag<CR>
let g:fzf_layout = {'down': '~100%'}

" Customize fzf colors to match color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" YouCompleteMe
let g:ycm_python_binary_path = 'python'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_seed_identifiers_with_syntax = 1 " enable completion with language keywords
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<C-J>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>', '<C-K>']

" Add YouCompleteMe semantic triggers
" css https://github.com/Valloric/YouCompleteMe/issues/413
let g:ycm_semantic_triggers = {
      \ 'css': ['re!^\s{4}', 're!:\s+'],
      \ 'html': ['<', '"', '</', ' '],
      \}

map <leader>g :YcmCompleter GoTo<CR>
map <leader>G :YcmCompleter GetDoc<CR>

" ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" let g:UltiSnipsEditSplit="vertical"

" ale - Asynchronous Lint Engine
let g:ale_echo_msg_format = '[%linter%] %severity% - %s'

let g:ale_linters = {
      \ 'css': ['stylelint'],
      \ 'python': ['flake8'],
      \}

let g:ale_fixers = {
      \ 'css': ['prettier'],
      \ 'javascript': ['prettier'],
      \ 'python': ['black'],
      \}

nmap <F5> <Plug>(ale_fix)

" vim-autoformat
" let g:formatters_python= ['yapf']

" noremap <leader>y :Autoformat<CR>

" tagbar
nnoremap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1 " move cursor to Tagbar when it opens
let g:tagbar_left = 1

" vim-airline
" let g:airline_theme = 'base16'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1

let g:airline_extensions = ['ale', 'branch', 'tabline', 'tagbar', 'virtualenv']

let g:airline#extensions#tabline#fnamecollapse = 0 " do not collapse directory names
let g:airline#extensions#tabline#fnamemod = ':t' " show only tail of filename

" git-gutter
let g:gitgutter_map_keys = 0

" nerdtree
noremap <F3> :NERDTreeToggle<CR>
let g:NERDTreeIgnore=['\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeShowHidden = 1
