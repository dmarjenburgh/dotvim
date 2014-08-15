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
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-projectionist'
Bundle 'tpope/vim-leiningen'
Bundle 'tpope/vim-ragtag'
Bundle 'guns/vim-clojure-static'
Bundle 'altercation/vim-colors-solarized'

Bundle 'fatih/vim-go'

Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'bling/vim-airline'

Bundle 'kien/ctrlp.vim'
Bundle 'godlygeek/tabular'
Bundle 'atsepkov/vim-tabularity'
Bundle "lepture/vim-jinja"
Bundle "mattn/emmet-vim"
Bundle 'suan/vim-instant-markdown'

Bundle 'rodjek/vim-puppet'

" vim-scripts repos
Bundle 'vim-vagrant'
Bundle 'Puppet-Syntax-Highlighting'
Bundle 'JavaScript-Indent'
Bundle 'VisIncr'
Bundle 'paredit.vim'
Bundle 'grails-vim'

" non github repos

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
colorscheme Tomorrow-Night

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

set history=1000

if has('gui_running')
  set antialias
  if has('mac')
    set guifont=Liberation_MONO_for_Powerline:h13
  elseif has('gui_gtk2')
    set guifont=Liberation\ Mono\ for\ PowerLine\ 13
  else
    set guifont=Liberation_MONO_for_Powerline:h13
  endif
  set guioptions=aci
endif

set noeb vb
autocmd GUIEnter * set t_vb=

autocmd BufWritePre *.{clj,php,java,js} call StripTrailingWhitespace()
"-------------------------------------- }}}

"--------- Custom mappings ----------- }}}
nnoremap Y y$
nnoremap <silent> <C-j> O<Esc>j
nnoremap <silent> <M-j> ddp
nnoremap <silent> <M-k> ddkP
nnoremap <silent> <Leader>ev :vs $MYVIMRC<CR>
nnoremap <silent> <Leader>sv :so $MYVIMRC<CR>
nnoremap ; :
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
nnoremap <C-Right> :bnext<CR>
nnoremap <C-Left> :bprevious<CR>
"-------------------------------------- }}}

"---------- Custom functions ---------" {{{

function! ReindentTopLevelForm()
  let l:line = line('.')
  let l:column = col('.')
  normal [[v%=
  call cursor(l:line, l:column)
endfunction

function! StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    let l:line = line('.')
    let l:column = col('.')
    %s/\s\+$//e
    call cursor(l:line, l:column)
  endif
endfunction

autocmd FileType clojure nnoremap <silent> <buffer> <Leader>= :call ReindentTopLevelForm()<cr>
"-------------------------------------- }}}

"---------- Plugin options -----------"

" Vim Clojure Static
let g:clojure_fuzzy_indent = 1
let g:clojure_fuzzy_indent_patterns = ['run\*\?\>', 'fresh', 'conde', 'def\*', 'facts\?', 'describe', 'it', 'go-\?', '^send']

" NERDTree
let NERDTreeShowBookmarks = 1
nnoremap <silent> <C-N> :NERDTreeToggle<CR>

" Airline
let g:airline#extensions#tabline#enabled = 1
if has('gui_running')
  let g:airline_powerline_fonts = 1
else
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '◀'
  let g:airline_theme ='powerlineish'
endif
set laststatus=2

" Paredit
" let g:paredit_electric_return = 0

" Emmet
let g:user_emmet_mode = 'iv'
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key = '<Tab>'

autocmd FileType html,xhtml,css,mustache,eruby EmmetInstall

" Emmet
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key = "<Tab>"
let g:user_emmet_mode = 'iv'
autocmd FileType html,xhtml,mustache,twig,css EmmetInstall

" Vim-Clojure Static
let g:clojure_align_multiline_strings = 1

" CtrlP
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['pom.xml', 'project.clj']

"-------------------------------------- }}}
