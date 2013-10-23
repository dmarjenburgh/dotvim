"--------- Vundle bundles ----------- }}}

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-classpath'
Bundle 'guns/vim-clojure-static'
Bundle 'altercation/vim-colors-solarized'

Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'bling/vim-airline'

Bundle 'godlygeek/tabular'
Bundle 'atsepkov/vim-tabularity'
" vim-scripts repos

" non github repos

" git repos on your local machine (ie. when working on your own plugin)
Bundle 'file:///home/daniel/github/forks/paredit.vim'
Bundle 'file:///home/daniel/github/local/visincr'

" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

"-------------------------------------- }}}

"--------- Options, etc ----------- }}}
let mapleader = ','

syntax enable

set background=dark
colorscheme solarized

set number
set cursorline

set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set backspace=eol,indent,start

set noswapfile

set incsearch
set hlsearch

set nowrap

set splitright
set splitbelow

set autochdir

set shortmess=I

set showcmd
set wildmenu
set wildmode=list:longest

set scrolloff=8 sidescrolloff=5
set complete-=i
set noeb vb
set t_vb=

set history=1000

if has('gui_running')
  set antialias
  set guifont=Liberation\ Mono\ for\ PowerLine\ 11
  set guioptions=aci
endif

"-------------------------------------- }}}

"--------- Custom mappings ----------- }}}
nnoremap Y y$
nnoremap <silent> <C-j> O<Esc>j
nnoremap <silent> <M-j> ddp
nnoremap <silent> <M-k> ddkP
nnoremap <silent> <Leader>ev :vs $MYVIMRC<cr>
nnoremap <silent> <Leader>sv :so $MYVIMRC<cr>
nnoremap ; :
nnoremap <silent> <C-L> :set nohlsearch<cr>
"-------------------------------------- }}}

"---------- Custom functions ---------" {{{
"-------------------------------------- }}}

"---------- Plugin options -----------"

" NERDTree
let NERDTreeShowBookmarks = 1
nnoremap <silent> <C-N> :NERDTreeToggle<cr>

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2
" let g:airline_theme='powerlineish'

" Paredit
let g:paredit_electric_return=0

"-------------------------------------- }}}
