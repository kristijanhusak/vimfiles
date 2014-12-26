set nocompatible                                                                "This must be first, because it changes other options as a side effect.
filetype off                                                                    "required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-commentary'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'd11wtq/ctrlp_bdelete.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'Raimondi/delimitMate'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'duff/vim-bufonly'
Plugin 'gregsexton/MatchTag'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'kristijanhusak/vim-hybrid'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet'
Plugin 'honza/vim-snippets'
Plugin 'othree/html5.vim'
Plugin 'xsbeats/vim-blade'
Plugin 'elzr/vim-json'
Plugin 'evidens/vim-twig'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'joshtronic/php.vim'
Plugin 'stephpy/vim-yaml'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mhinz/vim-startify'

call vundle#end()                                                               "Finish Vundle initialization

filetype plugin indent on                                                       "Enable plugins and indents by filetype

let mapleader = ","                                                             "Change leader to a comma

let g:enable_bold_font = 1                                                      "Enable bold font in colorscheme

" ================ GUI options ====================

set guioptions-=m                                                               "remove menu bar
set guioptions-=T                                                               "remove toolbar
set guioptions-=L                                                               "remove left scrollbar when vertical split
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
set completeopt-=preview                                                        "Disable preview for autocomplete
set background=dark                                                             "Set background to dark
set hidden                                                                      "Hide buffers in background
set colorcolumn=80                                                              "Add right margin
set conceallevel=2 concealcursor=i                                              "neosnippets conceal marker

syntax on                                                                       "turn on syntax highlighting

colorscheme hybrid_reverse

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

autocmd BufWritePre * :call StripTrailingWhitespaces()                          "Auto-remove trailing spaces
autocmd InsertLeave * NeoSnippetClearMarkers                                    "Remove unused markers for snippets
autocmd VimEnter * if !argc() | Startify | endif                                "If no file is selected, execute Startify
autocmd filetype html setlocal shiftwidth=2 softtabstop=2 tabstop=2             "Set 2 indent for html
autocmd filetype css,scss setlocal iskeyword+=-                                 "Treat words with hyphens as whole word

autocmd GUIEnter * set vb t_vb=                                                 "Disable visual bell completely
autocmd VimEnter * set vb t_vb=

" ================ Completion =======================

set wildmode=list:full
set wildmenu                                                                    "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~                                                     "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*vendor/**
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

function! Multiple_cursors_before()
    exe 'NeoCompleteLock'
endfunction

function! Multiple_cursors_after()
    exe 'NeoCompleteUnlock'
endfunction

function! StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfunction

" vp doesn't replace paste buffer
function! RestoreRegister()
    let @" = s:restore_reg
    return ''
endfunction

function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction

" Initialize ctrlp plugin for deleting buffers from list
call ctrlp_bdelete#init()

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

" Down is really the next line
nnoremap j gj
nnoremap k gk

" Expand snippets on tab if snippets exists, otherwise do autocompletion
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
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

" Switch jump half page to Ctrl-f so multiple cursors can be bind to Ctrl-d
nnoremap <C-f> <C-d>

" Auto change directory to match current file
nnoremap <Leader>dc :cd %:p:h<CR>:pwd<CR>

" Filesearch plugin map for searching in whole folder
nnoremap <Leader>f :Ack

" Toggle buffer list
nnoremap <Leader>b :CtrlPBuffer<CR>
" Ctrlp plugin fuzzy search tags
nnoremap <Leader>t :CtrlPFunky<CR>
nnoremap <Leader>T :CtrlPBufTag<CR>

" Maps for indentation in normal mode
nnoremap <tab> >>
nnoremap <s-tab> <<

" Indenting in visual mode
xnoremap <s-tab> <gv
xnoremap <tab> >gv

" Fugitive commands
nnoremap <Leader>gs :Gstatus<CR>

" Resize window with shift + and shift -
nnoremap + <c-w>5>
nnoremap _ <c-w>5<

" Center highlighted search
nnoremap n nzz
nnoremap N Nzz

" Prevent overriding yank register with overriten text, must be near end of file
vmap <expr>p <sid>Repl()

" ================ plugins setups ========================

let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:25,results:25'           "Ctrlp window setup
let g:ctrlp_extensions = ['funky']

let g:airline_powerline_fonts = 1                                               "Enable powerline fonts
let g:airline_theme = "hybrid"                                                  "Set theme to powerline default theme
let g:airline_section_y = '%{(&fenc == "" ? &enc : &fenc)}'                     "set encoding type info
let g:airline_section_z = '%{substitute(getcwd(), expand("$HOME"), "~", "g")}'  "Set relative path
let g:airline#extensions#whitespace#enabled = 0                                 "Disable whitespace extension

let g:gitgutter_realtime = 0                                                    "Disable gitgutter in realtime
let g:gitgutter_eager = 0                                                       "Disable gitgutter to eager load on tab or buffer switch

let g:user_emmet_expandabbr_key = '<c-e>'                                       "Change trigger emmet key
let g:user_emmet_next_key = '<c-n>'                                             "Change trigger jump to next for emmet

let g:NERDTreeChDirMode = 2                                                     "NERDTree change directory only on root change
let g:NERDTreeShowHidden = 1                                                    "Show hidden files in NERDTree
let g:NERDTreeIgnore=['\.git$', '\.sass-cache$']

let g:neocomplete#enable_at_startup = 1                                         "Enable autocomplete
let g:neocomplete#enable_smart_case = 1                                         "Use smartcase.
let g:neocomplete#data_directory = '~/.vim/.neocomplete'                        "Folder where neocomplete saves cache
let g:neocomplete#max_list = 15                                                 "Limit neocomplete list to 10 entries

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
let g:syntastic_auto_jump = 3                                                   "Jump to first error detected
let g:syntastic_php_checkers = ['php']                                          "Enable only basic syntax checking for php
let g:syntastic_javascript_checkers = ['jshint', 'jscs']                        "Enable these linters for js
let g:syntastic_scss_checkers = []                                              "Disable scss checking

let g:multi_cursor_use_default_mapping = 0                                      "Disable default mappings for multiple cursors
let g:multi_cursor_exit_from_insert_mode = 0                                    "Do not clear multi cursors selection on <Esc> press
let g:multi_cursor_exit_from_visual_mode = 0                                    "Do not clear multi cursors selection on <Esc> press
let g:multi_cursor_next_key = '<C-d>'                                           "Set start and next multiple cursor to Ctrl-d
let g:multi_cursor_prev_key = '<C-r>'                                           "Set prev multiple cursor
let g:multi_cursor_skip_key = '<C-x>'                                           "Set skip cursor
let g:multi_cursor_quit_key = '<Esc>'                                           "Exit multiple cursor mode

let g:vim_json_syntax_conceal = 0                                               "Disable setting quotes for json syntax

let delimitMate_expand_cr = 1                                                   "auto indent on enter

" Include local vimrc if exists
if filereadable(glob("$HOME/.vimrc.local"))
    source $HOME/.vimrc.local
endif
