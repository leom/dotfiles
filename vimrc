set nocompatible
"source $VIMRUNTIME/vimrc_example.vim

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'

let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn)$'
let g:ctrlp_max_files = 90000
let g:ctrlp_max_height = 20
let g:ctrlp_clear_cache_on_exit = 1

" doesn't work with 7.0, need to git reset --hard cdb31d423c996db298db57d69999f7c899188c9d
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Syntastic' 

filetype plugin indent on
syntax on
set bs=4
set et
set nu
set sts=4
set sw=4
set ts=4
set vb

set autoindent
set backspace=indent,eol,start
set backupdir=~/.backups
set cindent
set ignorecase
set incsearch
set foldmethod=marker
set nocompatible
set nowrap
set numberwidth=5
set ruler
set scrolljump=5
set scrolloff=3
set showcmd
set showmatch
set showtabline=2
set smartindent
set splitright
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc     " MacOSX/Linux

set t_Co=256

let g:netrw_keepdir=0
let g:explVertical=1
let g:explStartRight=1
let g:explWinSize=25
let g:Powerline_symbols = 'unicode'
let mapleader=","

let g:syntastic_python_checker="flake8"
let g:syntastic_python_checker_args="--ignore=E501,"

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
nmap <C-S-f> :Ack<space>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 0
map <silent> <leader>e :NERDTreeToggle<CR>

if has("autocmd")
    autocmd BufEnter *.ctp set syn=php
    autocmd BufEnter *.module set syn=php
    autocmd FileType python set listchars=tab:>-,trail:~,extends:>,precedes:< ts=4 sw=4 et sta sts list    " Python
endif


"inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" This function determines, wether we are on the start of the line text (then tab indents) or
" if we want to try autocompletion
function InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
