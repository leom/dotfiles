set nocompatible
filetype off
"source $VIMRUNTIME/vimrc_example.vim

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'Syntastic' 
Plugin 'myusuf3/numbers.vim'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-fugitive'
Plugin 'JazzCore/ctrlp-cmatcher'
Plugin 'godlygeek/tabular'
Plugin 'rking/ag.vim'
Plugin 'groenewege/vim-less'
Plugin 'joonty/vdebug.git'
Plugin 'plasticboy/vim-markdown'
Plugin 'flazz/vim-colorschemes'
Plugin 'sheerun/vim-polyglot'

call vundle#end()
filetype plugin indent on

let g:ctrlp_max_files = 90000
let g:ctrlp_max_height = 20
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
    \ --ignore .git 
    \ --ignore .svn
    \ --ignore .hg
    \ --ignore .DS_store
    \ --ignore "**/*.pyc"
    \ --ignore "**/*.min.js"
    \ --ignore "**/*.min.css"
    \ -g ""'

syntax on
set bs=
set nu

set autoindent
set backspace=indent,eol,start
set backupdir=~/.backups
set cindent
set cursorline
set encoding=utf-8 " Necessary to show Unicode glyphs
set expandtab
set foldmethod=marker
set ignorecase
set incsearch
set laststatus=2   " Always show the statusline
set nocompatible
set nowrap
set numberwidth=5
set ruler
set scrolljump=5
set scrolloff=3
set shiftwidth=4
set showcmd
set showmatch
set showtabline=2
set smartindent
set smarttab
set softtabstop=4
set splitright
set tabstop=4
set visualbell

colorscheme earendel
set guioptions=-m
set guioptions=-T
set guioptions=-r

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc     " MacOSX/Linux

set t_Co=256

let g:netrw_keepdir=0
let g:explVertical=1
let g:explStartRight=1
let g:explWinSize=25
let mapleader=","
let NERDTreeIgnore=['\.pyc$']
let g:airline#extensions#whitespace#checks = []
let g:airline#extensions#branch#format = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}

    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.whitespace = 'Ξ'
endif

function! AirlineInit()
    let g:airline_section_a = airline#section#create(['mode'])
    let g:airline_section_b = airline#section#create(["%{fnamemodify(getcwd(), ':t')}"])
    let g:airline_section_c = airline#section#create(['%m', '%t'])
    let g:airline_section_x = airline#section#create([' '])
    let g:airline_section_y = airline#section#create(['branch'])
    let g:airline_section_z = airline#section#create_right(['%l', '%c'])
endfunction

autocmd VimEnter * call AirlineInit()

"let g:syntastic_python_checker="flake8"
"let g:syntastic_python_checker_args="--ignore=E501,"

noremap <C-B> :!php -l %<CR>

nmap <silent> <C-N> :silent noh<CR>

nmap <leader>j :tabprevious<CR>
nmap <leader>l :tabnext<CR>
map <leader>j :tabprevious<CR>
map <leader>l :tabnext<CR>
imap <leader>j <Esc>:tabprevious<CR>i
imap <leader>l <Esc>:tabnext<CR>i
nmap <C-t> :tabnew<CR>
imap <C-t> <Esc>:tabnew<CR>

map <C-l> :buffers<CR>
map <C-f> :Ag<space>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 0
map <silent> <leader>e :NERDTreeToggle<CR>

if has("autocmd")
    autocmd BufEnter *.ctp set syn=php
    autocmd BufEnter *.module set syn=php
    autocmd BufEnter *.phtml set syn=php
    autocmd FileType python set listchars=tab:>-,trail:~,extends:>,precedes:<  list" Python
endif

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cursorline
    autocmd WinLeave * set nocursorline
augroup END

"inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" This function determines, wether we are on the start of the line text (then tab indents) or
" if we want to try autocompletion
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction


" love this idea! Stolen from:
" https://github.com/teranex/dotvim/blob/master/vimrc

" Host specific config ===================================================
" check for the existence of a host-specific vimrc file and source it
" by example: if your host is named 'andoria', this will source
" ~/scripts/vim/vimrc-andoria if it exists
let hostfile=$HOME.'/.vim/vimrc-'.hostname()
if filereadable(hostfile)
    exe 'source ' . hostfile
endif
