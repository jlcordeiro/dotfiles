syntax on

set autoindent
set cindent
set shiftwidth=4
set tabstop=4
set expandtab
" make backspace work like most other apps
set backspace=indent,eol,start
set visualbell
set number
set nowrap
set incsearch
set showcmd
set ruler
set cursorline
set hlsearch
set mouse=a
set history=100
set updatetime=500
"show invisibles
set list
set listchars=tab:▸\ ,eol:¬,trail:.

" swap / backup / undo
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

"Commenting and Un-Commenting code
au FileType haskell,vhdl,ada let b:comment_leader = '-- '
au FileType vim let b:comment_leader = '" '
au FileType c,cpp,java let b:comment_leader = '// '
au FileType sh,make,py let b:comment_leader = '# '
au FileType tex let b:comment_leader = '% '
noremap <silent> ,c :<C-B>sil <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohl<CR>
noremap <silent> ,u :<C-B>sil <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohl<CR>

""" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'mbbill/undotree'
Bundle 'plasticboy/vim-markdown'
Bundle 'scrooloose/syntastic'
Bundle 'myusuf3/numbers.vim'
Bundle 'nvie/vim-flake8'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'morhetz/gruvbox'
" rg
Bundle 'jremmen/vim-ripgrep'
if executable('rg')
    let g:rg_derive_root='true'
endif

filetype plugin indent on     " required!


""" netrw
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 15
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END



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
colorscheme gruvbox
set background=dark
set colorcolumn=80

" Enable folding
set foldmethod=indent
set foldlevel=99

" Python / PEP8
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix
let python_highlight_all=1
let g:flake8_cmd="python3 -m pyflakes"


" ignore files we'll never want in vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*.make

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|bin|build)$',
  \ 'file': '\v\.(exe|so|o|make)$',
  \ }


" leader
let mapleader = " "
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>p :CtrlP .<CR>
nnoremap <Leader>= :vertical resize +5<CR>
nnoremap <Leader>+ :vertical resize +50<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>_ :vertical resize -50<CR>
