" syntax
syntax on

" auto indent
set autoindent
set cindent
set shiftwidth=3
" insert N space characters instead of tab
set tabstop=3
" insert real tab with CTRL<KEY>
set expandtab

" make backspace work like most other apps
set backspace=indent,eol,start
"visual bell instead of speaker
set visualbell
"show numbers
set number
"dont wrap lines
set nowrap
"incremental search (see search matching while typing command)
set incsearch
"display incomplete commands
set showcmd
"show cursor position
set ruler
" keep search matches highlighted
set hlsearch
" mouse at all times
set mouse=a
" size of the command line history
set history=100

"Commenting and Un-Commenting code
au FileType haskell,vhdl,ada let b:comment_leader = '-- '
au FileType vim let b:comment_leader = '" '
au FileType c,cpp,java let b:comment_leader = '// '
au FileType sh,make let b:comment_leader = '# '
au FileType tex let b:comment_leader = '% '
noremap <silent> ,c :<C-B>sil <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohl<CR>
noremap <silent> ,u :<C-B>sil <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohl<CR>

syntax on

"backup
set backup
set backupext=.bak
set backupdir=~/.vim/backupdir

""" Vundle
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle -- required! 
Bundle 'gmarik/vundle'

" My bundles here:
Bundle 'sjl/gundo.vim'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'plasticboy/vim-markdown'
" Colorscheme bundles
Bundle 'tomasr/molokai'
Bundle 'altercation/vim-colors-solarized'

" --- Examples
" original repos on GitHub
"Bundle 'tpope/vim-fugitive'
" vim-scripts repos
"Bundle 'FuzzyFinder'
" non-GitHub repos
"Bundle 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'
" ---

filetype plugin indent on     " required!
""" Vundle


""" gui options 
colorscheme molokai 
set guifont=Liberation\ Mono\ 10

"hide toolbars 
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

"set keys to show/hide toolbars 
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>
