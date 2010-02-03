let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
map! <S-Insert> <MiddleMouse>
map <NL> j_
map  k_ 
noremap <silent> ,u :sil s/^\V=escape(b:comment_leader,'\/')//e:nohl
noremap <silent> ,c :sil s/^/=escape(b:comment_leader,'\/')/:nohl
map Q gq
nmap <silent> \bv :VSBufExplorer
nmap <silent> \bs :HSBufExplorer
nmap <silent> \be :BufExplorer
nmap gx <Plug>NetrwBrowseX
map <S-Insert> <MiddleMouse>
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
nnoremap <silent> <F8> :TlistToggle
map <F12> :!ctags-exuberant -R --c++-kinds=+p --fields=+iaS --extra=+q .
map <F6> :enew|only!|source ~/.vim/sessions/defaultsession.vim 
map <F5> :mks! ~/.vim/sessions/defaultsession.vim 
map <S-Down>  -
map <S-Up>  + 
map <S-Left> <
map <S-Right> > 
map <F2> :vsp,
map <F3> :e %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,
inoremap  u
inoremap <expr>  omni#cpp#maycomplete#Complete()
inoremap ( ()<Left>
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> . omni#cpp#maycomplete#Dot()
inoremap <expr> : omni#cpp#maycomplete#Scope()
inoremap <expr> > omni#cpp#maycomplete#Arrow()
inoremap {} {}
inoremap {{ {
inoremap { {}O
inoremap { {}<Left>
let &cpo=s:cpo_save
unlet s:cpo_save
set autowriteall
set background=dark
set backspace=indent,eol,start
set backup
set backupdir=~/.vim/backupdir
set backupext=.bak
set cmdheight=2
set completeopt=menuone
set diffopt=vertical
set errorformat=%f:%l:%c:\ %t%*[^:]:%m,%f:%l:\ %t%*[^:]:%m,%*[^\"]\"%f\"%*\\D%l:\ %m,\"%f\"%*\\D%l:\ %m,%-G%f:%l:\ (Each\ undeclared\ identifier\ is\ reported\ only\ once,%-G%f:%l:\ for\ each\ function\ it\ appears\ in.),%f:%l:%c:%m,%f(%l):%m,%f:%l:%m,\"%f\"\\,\ line\ %l%*\\D%c%*[^\ ]\ %m,%D%*\\a[%*\\d]:\ Entering\ directory\ `%f',%X%*\\a[%*\\d]:\ Leaving\ directory\ `%f',%D%*\\a:\ Entering\ directory\ `%f',%X%*\\a:\ Leaving\ directory\ `%f',%DMaking\ %*\\a\ in\ %f,%f|%l|\ %m
set fileencodings=ucs-bom,utf-8,default,latin1
set guifont=DejaVu\ Sans\ Mono\ Bold\ 8.5
set guioptions=aegimrLtTc
set guitablabel=%t
set helplang=en
set history=100
set hlsearch
set iminsert=0
set imsearch=0
set incsearch
set mouse=a
set omnifunc=omni#cpp#complete#Main
set ruler
set scrollopt=ver,jump,hor
set shiftwidth=4
set showcmd
set showmatch
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.asv
set tabstop=4
set tags=tags;/
set termencoding=utf-8
set window=30
set winminheight=0
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +213 wam7dof_Spec.m
badd +103 /home/island/Work/wamsim_cortesao/wamsim/wam7dof_Spec.m_lastdefinitions
badd +690 /home/island/Work/wam_Spec.h
badd +207 /home/island/Work/wamsim_cortesao/wamsim/wam7dof_Spec.m
badd +37 wam7dof_Spec_e.m
badd +1 wam7dof_Spec.m_latest
badd +17 wam7dof_T03.c
badd +1 wam7dof_Spec.m_lastdefinitions
badd +1 wam7dof_Spec.m_default
badd +1 [BufExplorer]
badd +1 /home/island/Work/wamsim_modified/wam7dof_Spec.m_lastdefinitions
badd +82 xenodemo/main.c
badd +1 /usr/src/xenomai-2.4.4/examples/native/trivial-periodic.c
badd +203 control_app/mrctrlthread_funcs.cpp
badd +1 ,
badd +1 /usr/src/xenomai-2.4.4/examples/native/Makefile
badd +16 mr_utils/mutex.hpp
badd +1 control_app/Makefile
badd +23 .vimrc
badd +1 mr_proj-pqueiros/implementation/control_app/Makefile
badd +1 mr_proj-pqueiros/implementation/control_app/mrctrlthread_funcs.cpp
silent! argdel *
edit xenodemo/main.c
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'c'
setlocal filetype=c
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=0
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=omni#cpp#complete#Main
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'c'
setlocal syntax=c
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . s:sx
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
