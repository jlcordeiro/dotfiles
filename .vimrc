syntax on

" auto indent
set autoindent
set cindent
set shiftwidth=4
" insert N space characters instead of tab
set tabstop=4
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
" highlight cursor line
set cursorline
" keep search matches highlighted
set hlsearch
" mouse at all times
set mouse=a
" size of the command line history
set history=100
"show invisibles
set list
set listchars=tab:▸\ ,eol:¬

"Open epub files
au BufReadCmd *.epub call zip#Browse(expand("<amatch>"))

"Commenting and Un-Commenting code
au FileType haskell,vhdl,ada let b:comment_leader = '-- '
au FileType vim let b:comment_leader = '" '
au FileType c,cpp,java let b:comment_leader = '// '
au FileType sh,make,py let b:comment_leader = '# '
au FileType tex let b:comment_leader = '% '
noremap <silent> ,c :<C-B>sil <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohl<CR>
noremap <silent> ,u :<C-B>sil <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohl<CR>

"backup
"set backup
"set backupext=.bak
"set backupdir=~/.vim/backupdir

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
Bundle 'Xuyuanp/nerdtree-git-plugin'
Bundle 'plasticboy/vim-markdown'
"Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/syntastic'
Bundle 'myusuf3/numbers.vim'
Bundle 'nvie/vim-flake8'
"Bundle 'tomtom/tlib_vim'
Bundle 'marcweber/vim-addon-mw-utils'
" Bundle 'jlcordeiro/vim-snippets'
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


""" status
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#CursorColumn#
set statusline+=%{StatuslineGit()}
set statusline+=\ %f%m
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 



""" Syntastic
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [], 'passive_filetypes': ['html','c','cpp','hpp'] }
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '/usr/bin/python3'



""" Markdown
let g:vim_markdown_folding_disabled=1

""" gui options 
colorscheme molokai 
set t_Co=256

"nerdtree
let NERDTreeIgnore=['\.o$', '\~$', '\.pyc$']

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Python / PEP8
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix
let python_highlight_all=1
let g:flake8_cmd="python3 -m pyflakes"

