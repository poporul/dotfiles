set nocompatible
filetype off

set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'

Plugin 'kchmck/vim-coffee-script'
Plugin 'altercation/vim-colors-solarized'

Plugin 'kien/ctrlp.vim'

Plugin 'groenewege/vim-less'
Plugin 'slim-template/vim-slim.git'

Plugin 'L9'
Plugin 'FuzzyFinder'

Plugin 'lucapette/vim-ruby-doc'

call vundle#end()

set backupdir=$HOME/.vim/backup/
set directory=$HOME/.vim/swap/
set undodir=$HOME/.vim/undo/

filetype indent plugin on

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
"set cursorline
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
set laststatus=2

" Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" use the same symbols as textmate for tabstops and eols
set listchars=tab:▸\ ,eol:¬

if !exists("autocommands_loaded")
  let autocommands_loaded = 1

  au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,config.ru,*.rabl} set ft=ruby
  au BufRead,BufNewFile *.json set ft=javascript
  au BufRead,BufNewFile {*.hbs,*.html.hbs} set ft=html

  " tmp fix
  au BufRead,BufNewFile *.html.slim set ft=slim
endif

au FileType html setlocal softtabstop=4 tabstop=4 shiftwidth=4

" NERDTree
let NERDTreeShowHidden=1

set hlsearch
set incsearch
set ignorecase
set smartcase

" Allow backspacing for everything
set backspace=indent,eol,start

" 256 colors for terminal vim
set t_Co=256

if has('mouse')
  set mouse=a
endif

"This unsets the last search pattern register by hitting return
nnoremap <silent> <cr> :noh<cr>

" Shortcut for save
nnoremap <leader>w :w!<cr>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
nmap <leader>p :CtrlP<CR>
nmap <leader>cp :CtrlPClearCache<CR>

map <leader>q :NERDTreeToggle<CR>

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
nnoremap <C-x> <C-w>x

nnoremap <leader>t :tabnew<CR>

nnoremap <C-S-l> :tabnext<CR>
nnoremap <C-S-h> :tabprevious<CR>

nnoremap - x
nnoremap <Space> viw

inoremap <C-d> <Esc>ddi
inoremap jk <Esc>

function! s:ConfigSolarized()
  if !has('gui_running')
    let g:solarized_termtrans=1

    if (&t_Co >= 256 || $TERM == 'xterm-256color')
    else
      let g:solarized_termcolors=16
    endif
  endif
endfunction

function! s:ConfigTmux()
  if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
endfunction

call s:ConfigSolarized()
call s:ConfigTmux()

function! s:Compile()
  let l:program_name = "vimcompiled"

  execute "!gcc -Wall % -o " . l:program_name . " && ./vimcompiled"
  silent execute "!rm " . l:program_name
endfunction

function! s:ShowRuntimePaths()
  let l:paths = sort(split(&runtimepath, ','))
  echo join(l:paths, "\n")
endfunction

command Compile :call s:Compile()
command ShowRuntimePaths :call s:ShowRuntimePaths()

nnoremap <leader>r :Compile<CR>
