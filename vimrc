set nocompatible
filetype off

call plug#begin('~/.vim/extlib')

Plug 'JazzCore/ctrlp-cmatcher'
Plug 'bling/vim-airline'
Plug 'dense-analysis/ale'
Plug 'flazz/vim-colorschemes'
Plug 'godlygeek/tabular'
Plug 'groenewege/vim-less'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'myusuf3/numbers.vim'
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'plasticboy/vim-markdown'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'tpope/vim-fugitive'

call plug#end()

filetype plugin indent on

let g:ale_fixers = {
\    'css': ['prettier'],
\    'javascript': ['prettier'],
\    'json': ['prettier'],
\    'scss': ['prettier'],
\    'sql': ['prettier'],
\    'ts': ['prettier'],
\    'tsx': ['prettier'],
\    'typescript': ['prettier'],
\    'yaml': ['prettier'],
\    'yml': ['prettier'],
\}

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
set nofoldenable
set nowrap
set numberwidth=5
set ruler
set scrolljump=5
set scrolloff=3
set shiftwidth=2
set showcmd
set showmatch
set showtabline=2
set smartindent
set smarttab
set softtabstop=2
set splitright
set tabstop=2
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
let g:coc_global_extensions = [ 'coc-tsserver' ]

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
inoremap <silent><expr> <c-space> coc#refresh()

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

" https://medium.com/swlh/ultimate-vim-typescript-setup-35b5ac5c8c4e
" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

let g:fzf_preview_window = 'right:60%'
nnoremap <C-p> :Files<Cr>
map <silent> <leader>e :NERDTreeToggle<CR>

autocmd BufEnter *.ctp set syn=php
autocmd BufEnter *.module set syn=php
autocmd BufEnter *.phtml set syn=php
autocmd FileType python set listchars=tab:>-,trail:~,extends:>,precedes:<  list" Python
autocmd BufRead,BufNewFile *.md setlocal textwidth=72
autocmd BufEnter *.{jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{jsx,ts,tsx} :syntax sync clear

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
