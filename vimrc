set nocompatible        "This must be first, because it changes other options as a side effect.
scriptencoding utf-8    "Set scriptencoding to utf-8 (listchars)

" Add NeoBundle to runtimepath
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Initialize neobundle
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Plugins
NeoBundle 'tpope/vim-commentary'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'd11wtq/ctrlp_bdelete.vim'
NeoBundle 'tacahiroy/ctrlp-funky'
NeoBundle 'marijnh/tern_for_vim', {
\ 'build' : {
\     'unix' : 'npm install'
\ }
\ }
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'bling/vim-airline'
NeoBundle 'duff/vim-bufonly'
NeoBundle 'gregsexton/MatchTag'
NeoBundle 'kris89/vim-multiple-cursors'
NeoBundle 'kris89/vim-hybrid'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'honza/vim-snippets'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'othree/html5.vim'
NeoBundle 'xsbeats/vim-blade'
NeoBundle 'elzr/vim-json'
NeoBundle 'evidens/vim-twig'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'joshtronic/php.vim'
NeoBundle 'stephpy/vim-yaml'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'mhinz/vim-startify'

" Finish NeoBundle initialization
call neobundle#end()

" Enable plugins and indents by filetype
filetype plugin indent on

" Call NeoBundle command for checking bundles
NeoBundleCheck

" Change leader to a comma because the backslash is too far away
let mapleader = ","

" ================ GUI options ====================

set guioptions-=m                           "remove menu bar
set guioptions-=T                           "remove toolbar
set guioptions-=L                           "remove left scrollbar when vertical split
set guioptions-=l                           "remove left scrollbar
set guifont=Inconsolata\ for\ Powerline\ 12 "font setup
set linespace=10                            "Set lineheight in gvim

" ================ General Config ====================

set t_Co=256                                        "Set 256 colors
set title                                           "change the terminal's title
set number                                          "Line numbers are good
set backspace=indent,eol,start                      "Allow backspace in insert mode
set history=500                                     "Store lots of :cmdline history
set showcmd                                         "Show incomplete cmds down the bottom
set noshowmode                                      "Hide showmode because of the powerline plugin
set gdefault                                        "Set global flag for search and replace
set noerrorbells                                    "No error bells
set gcr=a:blinkon500-blinkwait500-blinkoff500       "Set cursor blinking rate
set cursorline                                      "Highlight current line
set visualbell                                      "No sounds
set autoread                                        "Reload files changed outside vim
set smartcase                                       "Smart case search if there is uppercase
set ignorecase                                      "case insensitive search
set hlsearch                                        "Highlight search term
set incsearch                                       "Jump to found term while searching
set showmatch                                       "Highlight matching bracket
set mouse=a                                         "Enable mouse
set nostartofline                                   "Jump to first non-blank character
set timeoutlen=1000 ttimeoutlen=200                 "Reduce Command timeout for faster escape and O
set laststatus=2                                    "Show statusbar
set fileencoding=utf-8 encoding=utf-8               "Set utf-8 encoding on write
set wrap                                            "Enable word wrap
set linebreak                                       "Wrap lines at convenient points
set listchars=tab:\ \ ,trail:·                      "Set trails for tabs and spaces
set list                                            "Enable listchars
set completeopt-=preview                            "Disable preview for autocomplete
set background=dark                                 "Set background to dark
set hidden                                          "Hide buffers in background
set colorcolumn=80                                  "Add right margin

"turn on syntax highlighting
syntax on

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

" Auto-remove trailing spaces
autocmd BufWritePre * :call StripTrailingWhitespaces()

" Remove unused markers for snippets
autocmd InsertLeave * NeoSnippetClearMarkers

" If no file is selected, execute Startify
autocmd VimEnter * if !argc() | Startify | endif

" ================ Completion =======================

set wildmode=list:full
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
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

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Abbreviations ========================

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

" Disable autocomplete before multiple cursors to avoid conflict
function! Multiple_cursors_before()
    exe 'NeoCompleteLock'
endfunction

" Enable autocomplete after multiple cursors
function! Multiple_cursors_after()
    exe 'NeoCompleteUnlock'
endfunction

" Remove trailing spaces on save
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

"Initialize ctrlp plugin for deleting buffers from list
call ctrlp_bdelete#init()

" ================ Custom mappings ========================

" Comment map
nmap <Leader>c gcc
" Map save to Ctrl + S
map <c-s> :w<CR>

" Easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
" Trigger easy align with Vim movement
nmap <Leader>a <Plug>(EasyAlign)
" Delete all buffers
nmap <silent> <Leader>da :exec "1," . bufnr('$') . "bd"<cr>

" Map save to ctrl+s
imap <c-s> <C-o>:w<CR>

" Expand snippets on tab if snippets exists, otherwise do autocompletion
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
" If popup window is visible do autocompletion from back
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"Fix for jumping over placeholders for neosnippet
smap <expr><TAB> neosnippet#jumpable() ?
\ "\<Plug>(neosnippet_jump)"
\: "\<TAB>"

" Map for Escape key
inoremap jj <Esc>
" Paste from system clipboard with Ctrl + v
inoremap <C-v> <Esc>"+p

" Down is really the next line
nnoremap j gj
nnoremap k gk
" Yank to the end of the line
nnoremap Y y$
" Also save with ,w
nnoremap <Leader>w :w<CR>
" Clear search highlight
nnoremap <Leader><space> :noh<CR>
" Open NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>
" Toggle between last 2 buffers
nnoremap <leader><tab> <c-^>
" Switch jump half page to Ctrl-f so multiple cursors can be bind to Ctrl-d ( Sublime text like )
nnoremap <C-f> <C-d>
"Auto change directory to match current file
nnoremap <Leader>dc :cd %:p:h<CR>:pwd<CR>
" Paste from yank register
nnoremap <Leader>p "0p
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
" Fugitive commands
nnoremap <Leader>gs :Gstatus<CR>
" Find current file in NERDTree
nnoremap <Leader>hf :NERDTreeFind<CR>
"Resize window with shift + and shift -
nnoremap + <c-w>5>
nnoremap _ <c-w>5<
" go to end of pasted text
nnoremap p p`]

"Indenting in visual mode
xnoremap <s-tab> <gv
xnoremap <tab> >gv

"Line comment command
xmap <Leader>c gc

"Move to the end of yanked text after yank and paste
vnoremap y y']
vnoremap p p`]
"Copy to system clipboard
vnoremap <C-c> "+y

"Trigger easy plugin in visual mode
vmap <Leader>a <Plug>(EasyAlign)

"Prevent overriding yank register with overriten text, must be near end of file
vmap <expr>p <sid>Repl()

" ================ plugins setups ========================

let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:25,results:25'   "Ctrlp window setup
let g:ctrlp_extensions = ['funky']

let g:airline_powerline_fonts = 1                           "Enable powerline fonts
let g:airline_theme = "powerlineish"                        "Set theme to powerline default theme
let g:airline_section_y = '%{(&fenc == "" ? &enc : &fenc)}'                       "set encoding type info
let g:airline_section_z = '%{substitute(getcwd(), expand("$HOME"), "~", "g")}'    "Set relative path
let g:airline_section_c = '%<%f %#__accent_red#%m%#__restore__# %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#' "Adds red modified
let g:airline#extensions#whitespace#enabled = 0             "Disable whitespace extension

let g:UltiSnipsExpandTrigger="<c-j>"                        "Trigger snippets with Ctrl + j

let g:ycm_add_preview_to_completeopt = 0                    "Disable preview window
let g:ycm_confirm_extra_conf = 0                            "Disable question for loading

let g:gitgutter_realtime = 0                                "Disable gitgutter in realtime
let g:gitgutter_eager = 0                                   "Disable gitgutter to eager load on tab or buffer switch

let g:user_emmet_expandabbr_key = '<c-e>'                   "Change trigger emmet key
let g:user_emmet_next_key = '<c-n>'                         "Change trigger jump to next for emmet

let g:NERDTreeChDirMode = 2                                 "NERDTree change directory only on root change
let g:NERDTreeShowHidden = 1                                "Show hidden files in NERDTree
let g:NERDTreeIgnore=['\.git$', '\.sass-cache$']

let g:neocomplete#enable_at_startup = 1                     "Enable autocomplete
let g:neocomplete#enable_smart_case = 1                     "Use smartcase.
let g:neocomplete#data_directory = '~/.vim/.neocomplete'    "Folder where neocomplete saves cache
let g:neocomplete#max_list = 15                             "Limit neocomplete list to 10 entries

let g:neosnippet#snippets_directory = '~/.vim/bundle/vim-snippets/snippets'  "Tell Neosnippet about the snippets folder
let g:neosnippet#disable_runtime_snippets = {'_' : 1}

let g:ackhighlight = 1                                      "Highlight current search

let g:syntastic_auto_loc_list = 1                           "Show syntastic window when there are errors, otherwise close
let g:syntastic_always_populate_loc_list = 1                "Always popuplate syntastic error list
let g:syntastic_php_checkers = ['php']                      "Enable only basic syntax checking for php
let g:syntastic_javascript_checkers = ['jshint', 'jscs']    "Enable these linters for js

let g:multi_cursor_use_default_mapping = 0                  "Disable default mappings for multiple cursors
let g:multi_cursor_next_key = '<C-d>'                       "Set start and next multiple cursor to Ctrl-d ( Sublime text like  )
let g:multi_cursor_prev_key = '<C-r>'                       "Set prev multiple cursor
let g:multi_cursor_skip_key = '<C-x>'                       "Set skip cursor
let g:multi_cursor_quit_key = '<Esc>'                       "Exit multiple cursor mode

let g:vim_json_syntax_conceal = 0                           "Disable setting quotes for json syntax

let g:AutoPairsCenterLine = 0                               "Disable auto pairs center screen option to avoid bug with snippets

let g:indentLine_char = '┆'                                 "Set higher line for indentLine
let g:indentLine_color_term = '236'                         "Indent line color for terminal
let g:indentLine_color_gui = '#333333'                      "Indent line color for gvim
let g:indentLine_faster = 1                                 "Better performance while using indentLine

" Include local vimrc if exists
if filereadable(glob("$HOME/.vimrc.local"))
    source $HOME/.vimrc.local
endif
