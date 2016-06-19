set nocompatible                                                                "This must be first, because it changes other options as a side effect.
filetype off                                                                    "required
call plug#begin('~/.vim/bundle')

Plug 'ryanoasis/vim-webdevicons'
Plug 'tpope/vim-commentary'
Plug 'nelstrom/vim-visual-star-search'
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'duff/vim-bufonly'
Plug 'tmhedberg/matchit'
Plug 'gregsexton/MatchTag'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet'
Plug 'honza/vim-snippets'
Plug 'othree/html5.vim'
Plug 'xsbeats/vim-blade'
Plug 'elzr/vim-json'
Plug 'evidens/vim-twig'
Plug 'majutsushi/tagbar'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'StanAngeloff/php.vim'
Plug 'stephpy/vim-yaml'
Plug 'cakebaker/scss-syntax.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'mustache/vim-mustache-handlebars'
Plug 'mhinz/vim-startify'
Plug 'marijnh/tern_for_vim', {'do': 'npm install'}

call plug#end()

filetype plugin indent on                                                       "Enable plugins and indents by filetype

let g:mapleader = ","                                                           "Change leader to a comma

let g:enable_bold_font = 1                                                      "Enable bold font in colorscheme

" ================ GUI options ====================

set guioptions-=m                                                               "remove menu bar
set guioptions-=T                                                               "remove toolbar
set guioptions-=L                                                               "remove left scrollbar when vertical split
set guioptions-=r                                                               "remove left scrollbar when vertical split
set guioptions-=l                                                               "remove left scrollbar
set guifont=Inconsolata\ for\ Powerline\ 12                                     "font setup
set linespace=10                                                                "Set lineheight in gvim

" ================ General Config ====================

set t_Co=256                                                                    "Set 256 colors
set title                                                                       "change the terminal's title
set number                                                                      "Line numbers are good
set backspace=indent,eol,start                                                  "Allow backspace in insert mode
set history=500                                                                 "Store lots of :cmdline history
set showcmd                                                                     "Show incomplete cmds down the bottom
set noshowmode                                                                  "Hide showmode because of the powerline plugin
set gdefault                                                                    "Set global flag for search and replace
set gcr=a:blinkon500-blinkwait500-blinkoff500                                   "Set cursor blinking rate
set cursorline                                                                  "Highlight current line
set autoread                                                                    "Reload files changed outside vim
set smartcase                                                                   "Smart case search if there is uppercase
set ignorecase                                                                  "case insensitive search
set hlsearch                                                                    "Highlight search term
set incsearch                                                                   "Jump to found term while searching
set showmatch                                                                   "Highlight matching bracket
set mouse=a                                                                     "Enable mouse
set nostartofline                                                               "Jump to first non-blank character
set timeoutlen=1000 ttimeoutlen=200                                             "Reduce Command timeout for faster escape and O
set laststatus=2                                                                "Show statusbar
set fileencoding=utf-8 encoding=utf-8                                           "Set utf-8 encoding on write
set wrap                                                                        "Enable word wrap
set linebreak                                                                   "Wrap lines at convenient points
set listchars=tab:\ \ ,trail:·                                                  "Set trails for tabs and spaces
set list                                                                        "Enable listchars
set lazyredraw                                                                  "Do not redraw on registers and macros
set completeopt-=preview                                                        "Disable preview for autocomplete
set background=dark                                                             "Set background to dark
set hidden                                                                      "Hide buffers in background
set conceallevel=2 concealcursor=i                                              "neosnippets conceal marker
set splitright                                                                  "Set up new splits positions
set tags=./tags;/                                                               "Find tags file

syntax on                                                                       "turn on syntax highlighting

colorscheme hybrid_material

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================

" Keep undo history across sessions, by storing in file.
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" ================ Indentation ======================

set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set smartindent
set autoindent
set nofoldenable

" ================ Auto commands ======================

augroup vimrc
    autocmd!
augroup END

autocmd vimrc BufWritePre * :call s:StripTrailingWhitespaces()                  "Auto-remove trailing spaces
autocmd vimrc InsertLeave * NeoSnippetClearMarkers                              "Remove unused markers for snippets
autocmd vimrc VimEnter * if !argc() | Startify | endif                          "If no file is selected, execute Startify
autocmd vimrc FileType html,javascript setlocal sw=2 sts=2 ts=2                 "Set 2 indent for html
autocmd vimrc FileType php,javascript setlocal cc=80                            "Set right margin only for php and js

autocmd vimrc GUIEnter * set vb t_vb=                                           "Disable visual bell completely
autocmd vimrc VimEnter * set vb t_vb=

autocmd vimrc BufNewFile,BufReadPost *.md set filetype=markdown                 "Set *.md extension to markdown filetype
autocmd vimrc FileType nerdtree syntax match hideBracketsInNerdTree
            \ "\]" contained conceal containedin=ALL

autocmd vimrc VimEnter,BufNewFile,BufReadPost * call s:LoadLocalVimrc()         "Load per project vimrc (Used for custom test mappings, etc.)

" ================ Completion =======================

set wildmode=list:full
set wildmenu                                                                    "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~                                                     "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules/**
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=8                                                                 "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=5

" ================ Abbreviations ====================

cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev Bd bd
cnoreabbrev bD bd
cnoreabbrev wrap set wrap
cnoreabbrev nowrap set nowrap
cnoreabbrev bda BufOnly
cnoreabbrev t tabe
cnoreabbrev T tabe

" ================ Functions ========================

function! s:StripTrailingWhitespaces()
    let l:l = line(".")
    let l:c = col(".")
    %s/\s\+$//e
    call cursor(l:l, l:c)
endfunction

function! s:LoadLocalVimrc()
    if filereadable(glob(getcwd() . '/.vimrc.local'))
        :execute 'source '.fnameescape(glob(getcwd(). '/.vimrc.local'))
    endif
endfunction

function! s:check_back_space()
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" ================ Custom mappings ========================

" Comment map
nmap <Leader>c gcc
" Line comment command
xmap <Leader>c gc

" Map save to Ctrl + S
map <c-s> :w<CR>
imap <c-s> <C-o>:w<CR>
" Also save with ,w
nnoremap <Leader>w :w<CR>

" Easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
" Open vertical split
nnoremap <Leader>v <C-w>v

" Down is really the next line
nnoremap j gj
nnoremap k gk

" Expand snippets on tab if snippets exists, otherwise do autocompletion
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\ : pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ neocomplete#start_manual_complete()
" If popup window is visible do autocompletion from back
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Fix for jumping over placeholders for neosnippet
smap <expr><TAB> neosnippet#jumpable() ?
\ "\<Plug>(neosnippet_jump)"
\: "\<TAB>"

" Map for Escape key
inoremap jj <Esc>

" Yank to the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap <C-c> "+y
" Paste from system clipboard with Ctrl + v
inoremap <C-v> <Esc>"+p
nnoremap <Leader>p "0p

" Move to the end of yanked text after yank and paste
nnoremap p p`]
vnoremap y y`]
vnoremap p p`]

" Move selected lines up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Clear search highlight
nnoremap <Leader><space> :noh<CR>

" Handle syntastic error window
nnoremap <Leader>es :Errors<CR>
nnoremap <Leader>ec :lclose<CR>

" Find current file in NERDTree
nnoremap <Leader>hf :NERDTreeFind<CR>
" Open NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>

" Toggle between last 2 buffers
nnoremap <leader><tab> <c-^>

" Auto change directory to match current file
nnoremap <Leader>dc :cd %:p:h<CR>:pwd<CR>

" Filesearch plugin map for searching in whole folder
nnoremap <Leader>f :Ack

" Toggle buffer list
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>t :CtrlPBufTag<CR>
nnoremap <Leader>T :TagbarToggle<CR>
nnoremap <Leader>m :CtrlPMRU<CR>

" Maps for indentation in normal mode
nnoremap <tab> >>
nnoremap <s-tab> <<

" Indenting in visual mode
xnoremap <s-tab> <gv
xnoremap <tab> >gv

" Resize window with shift + and shift -
nnoremap + <c-w>5>
nnoremap _ <c-w>5<

" Center highlighted search
nnoremap n nzz
nnoremap N Nzz

" ================ plugins setups ========================

let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:25,results:25'           "Ctrlp window setup
let g:ctrlp_custom_ignore = {'dir':  '\v[\/]\.(meteor)$'}                       "Ignore .meteor folder
let g:ctrlp_prompt_mappings = {'PrtDeleteEnt()': ['<c-@>']}                     "Map delete buffer in ctrlp

let g:airline_powerline_fonts = 1                                               "Enable powerline fonts
let g:airline_theme = "hybrid"                                                  "Set theme to powerline default theme
let g:airline_section_y = '%{substitute(getcwd(), expand("$HOME"), "~", "g")}'  "Set relative path
let g:airline#extensions#whitespace#enabled = 0                                 "Disable whitespace extension
let g:airline#extensions#tabline#enabled = 1                                    "Enable tabline extension
let g:airline#extensions#tabline#left_sep = ' '                                 "Left separator for tabline
let g:airline#extensions#tabline#left_alt_sep = '│'                             "Right separator for tabline

let g:gitgutter_realtime = 0                                                    "Disable gitgutter in realtime
let g:gitgutter_eager = 0                                                       "Disable gitgutter to eager load on tab or buffer switch

let g:user_emmet_expandabbr_key = '<c-e>'                                       "Change trigger emmet key
let g:user_emmet_next_key = '<c-n>'                                             "Change trigger jump to next for emmet

let g:tagbar_autofocus = 1                                                      "Focus tagbar when opened

let g:NERDTreeChDirMode = 2                                                     "Always change the root directory
let g:NERDTreeMinimalUI = 1                                                     "Disable help text and bookmark title
let g:NERDTreeShowHidden = 1                                                    "Show hidden files in NERDTree
let g:NERDTreeIgnore=['\.git$', '\.sass-cache$', '\.vagrant', '\.idea']

let g:neocomplete#enable_smart_case = 1                                         "Use smartcase.
let g:neocomplete#data_directory = '~/.vim/.neocomplete'                        "Folder where neocomplete saves cache
let g:neocomplete#max_list = 15                                                 "Limit neocomplete list to 10 entries
let g:neocomplete#disable_auto_complete = 1                                     "Disable automatic autocomplete
let g:neocomplete#enable_at_startup = 1                                         "Enable autocomplete

let g:neosnippet#disable_runtime_snippets = {'_' : 1}                           "Snippets setup
let g:neosnippet#snippets_directory = [
            \ '~/.vim/bundle/vim-snippets/snippets',
            \ '~/.vim/snippets']

let g:ackhighlight = 1                                                          "Highlight current search

let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = "x"
let g:syntastic_style_error_symbol = "x"
let g:syntastic_warning_symbol = "▵"
let g:syntastic_style_warning_symbol = "▵"
let g:syntastic_loc_list_height = 5                                             "Height of the errors window
let g:syntastic_always_populate_loc_list = 1                                    "Always popuplate syntastic error list
let g:syntastic_aggregate_errors = 1                                            "Show errors from all checkers
let g:syntastic_auto_jump = 3                                                   "Jump to first error detected
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']                        "Enable only basic syntax checking for php
let g:syntastic_javascript_checkers = ['jshint', 'jscs']                        "Enable these linters for js
let g:syntastic_scss_checkers = []                                              "Disable scss checking

let g:vim_json_syntax_conceal = 0                                               "Disable setting quotes for json syntax

let g:delimitMate_expand_cr = 1                                                 "auto indent on enter

let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '                                "Set up spacing for sidebar icons

" Include local vimrc if exists
if filereadable(glob("$HOME/.vimrc.local"))
    source $HOME/.vimrc.local
endif
