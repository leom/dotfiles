filetype off                   " required!
source $VIMRUNTIME/vimrc_example.vim
behave mswin

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'

filetype plugin indent on
syntax on
set ai
set backupdir=~/tmp/leo_vim
set bs=2
set clipboard+=unnamed
set guifont=Monaco:h8:cANSI
set guioptions-=T
set ignorecase
set incsearch
set keymodel=""
set nocompatible
set nocp
set nowrap
set nu
set numberwidth=5
set ruler
set showmatch
set si
set sw=4
set ts=4
set vb

nmap <silent> <C-N> :silent noh<CR>

nmap ,j :tabprevious<CR>
nmap ,l :tabnext<CR>
map ,j :tabprevious<CR>
map ,l :tabnext<CR>
imap ,j <Esc>:tabprevious<CR>i
imap ,l <Esc>:tabnext<CR>i
nmap <C-t> :tabnew<CR>
imap <C-t> <Esc>:tabnew<CR>

map ,e :execute 'NERDTreeToggle "'.getcwd().'"'<CR>
map <C-l> :buffers<CR>
map <C-Space> :bn<CR>
map <C-BackSpace> :bp<CR>

if has("autocmd")
  " PHP specific fixes
  " highlights interpolated variables in sql strings and does sql-syntax highlighting. yay
  autocmd FileType php let php_sql_query=1
  " does exactly that. highlights html inside of php strings
  autocmd FileType php let php_htmlInStrings=1

  " settings for cake
  au BufEnter,BufRead,BufNewFile  *.ctp set filetype=php ai

  autocmd FileType python set listchars=tab:>-,trail:~,extends:>,precedes:< ts=4 sw=4 et sta sts list    " Python
endif

colo zellner
