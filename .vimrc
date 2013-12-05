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


"Switch between .cpp an .h files
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
map <F3> :e %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>
map <F2> :vsp,<CR>



" ctags
" install ctags
" install taglist

"Build ctags files recursively starting by the current directory to use with omnicomplete. 
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
set tags=tags;/
"Shows Taglist window
nnoremap <silent> <F8> :TlistToggle<CR>
set completeopt=menu


" omnicpp
" use global scope search
let OmniCpp_GlobalScopeSearch = 1
" 0 = namespaces disabled ; 1 = search namespaces in the current buffer ; 2 = search namespaces in the current buffer and in included files
let OmniCpp_NamespaceSearch = 2
" 0 = auto ; 1 = always show all members
let OmniCpp_DisplayMode = 1
" " 0 = don't show scope in abbreviation ; 1 = show scope in abbreviation and remove the last column
" let OmniCpp_ShowScopeInAbbr = 0
" " 0 = don't display prototype in abbreviation ; 1 = display prototype in abbreviation part of the popup menu.
" let OmniCpp_ShowPrototypeInAbbr = 1
" 0 = hide access ; 1 = show access information ('+', '#', '-') in the popup menu.
let OmniCpp_ShowAccess = 1
let &errorformat="%f:%l:%c: %t%*[^:]:%m,%f:%l: %t%*[^:]:%m," . &errorformat "highlight de erros mas não warnings
"
" " This option can be use if you don't want to parse using namespace
" declarations in included files and want to add namespaces that are always
" used in your project.
" let OmniCpp_DefaultNamespaces = ["std"]
"
" " Complete Behaviour
" let OmniCpp_MayCompleteDot = 0
" let OmniCpp_MayCompleteArrow = 0
" let OmniCpp_MayCompleteScope = 0
"
"  When 'completeopt' does not contain "longest", Vim automatically select the
" first entry of the popup menu. You can change this behaviour with the
" OmniCpp_SelectFirstItem option.
" let OmniCpp_SelectFirstItem = 0 


" Vundle
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My bundles here:
Bundle 'sjl/gundo.vim'
" Colorscheme bundles
Bundle 'tomasr/molokai'
Bundle 'altercation/vim-colors-solarized'

" --- Examples
" original repos on GitHub
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
" non-GitHub repos
"Bundle 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
"
" gui options 

"colourscheme
colorscheme molokai 

"font
set guifont=Liberation\ Mono\ 10

"hide toolbars 
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

"set keys to show/hide toolbars 
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>

