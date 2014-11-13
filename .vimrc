set nocompatible
filetype off

set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'

Plugin 'kchmck/vim-coffee-script'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()

set backupdir=$HOME/.vim/backup/
set directory=$HOME/.vim/swap/
set undodir=$HOME/.vim/undo/

filetype on
filetype indent on
filetype plugin on

" Set map leader as comma
let mapleader = ","
let g:mapleader = ","

syntax on

colorscheme default

set history=1000

set wildmenu

set term=xterm
set t_Co=256

set invlist
set number
set wrap
set linebreak
set showcmd

" Show current position
set ruler
set cursorline
set hidden
set autoindent

" Padding for trigger scrolling
set scrolloff=2

" Tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab

set tabpagemax=10
set showtabline=2

" Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" use the same symbols as textmate for tabstops and eols
set listchars=tab:▸\ ,eol:¬

au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,config.ru} set ft=ruby
au BufRead,BufNewFile *.json set ft=javascript

" NERDTree
let NERDTreeShowHidden=1
map <leader>q :NERDTreeToggle<CR>

set hlsearch
set incsearch
set ignorecase
set smartcase

"This unsets the last search pattern register by hitting return
nnoremap <cr> :noh<cr>

" Shortcut for save
nnoremap <leader>w :w!<cr>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Allow backspacing for everything
set backspace=indent,eol,start

" 256 colors for terminal vim
set t_Co=256


" Disabling arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Convenient switching between windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap <leader>t :tabnew<CR>

nnoremap <S-l> :tabnext<CR>
nnoremap <S-h> :tabprevious<CR>

nnoremap <C-x> <C-w>x

function! ConfigSolarized()
  if !has('gui_running')
    " Compatibility for Terminal
    let g:solarized_termtrans=1

    if (&t_Co >= 256 || $TERM == 'xterm-256color')
      " Do nothing, it handles itself
    else
      " Make Solarized use 16 colors for Terminal support
      let g:solarized_termcolors=16
    endif
  endif
endfunction

function! ConfigTmux()
  " Making cursor a bar in insert mode
  if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
endfunction

call ConfigSolarized()
call ConfigTmux()

