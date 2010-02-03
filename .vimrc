colorscheme morning
" :nohl
if has("gui_running")
	colorscheme metacosm 
	set guitablabel=%t     "set the tab title to the filename only
	syntax on
" 	set hlsearch
	if has("gui_gtk2")
		set guifont=Courier\ New\ 11
	elseif has("x11")
		set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
	else
		set guifont=Courier_New:h11:cDEFAULT
	endif
endif
" Ûse Spaces instead of tab characters
set tabstop=4
set shiftwidth=4
" Use spaces instead tabs in the autoidentation
set expandtab

set autowriteall
set diffopt=vertical
syntax on
set sm
set hlsearch
set backspace=indent,eol,start
set nocuc nocul				"to prevent the highlighting of the first caracter on gvim
set viminfo^=h
" let @/=""
"if has("vms")
"   set nobackup		" do not keep a backup file, use versions instead
" else
"   set backup		" keep a backup file
" endif

set backup
set backupext=.bak
set backupdir=~/.vim/backupdir

set history=100		" keep 100 lines of command line history
set ruler			" show the cursor position all the time
set showcmd			" display incomplete commands
set incsearch		" do incremental searching

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
  augroup END
else
  set autoindent		" always set autoindenting on
endif 					" has("autocmd")

set showmatch 			"mostra caracteres ( { [ quando fechados
" set textwidth=79 		"largura do texto
set nowrap  			"sem wrap (quebra de linha)
set mouse=a 			"habilita todas as acoes do mouse
set nu 					"numeracao de linhas
" set ts=4 				"Seta onde o tab para
set sw=4
"Switch between .cpp an .h files
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
map <F3> :e %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>
map <F2> :vsp,<CR>

"Commenting and Un-Commenting code
au FileType haskell,vhdl,ada let b:comment_leader = '-- '
au FileType vim let b:comment_leader = '" '
au FileType c,cpp,java let b:comment_leader = '// '
au FileType sh,make let b:comment_leader = '# '
au FileType tex let b:comment_leader = '% '
noremap <silent> ,c :<C-B>sil <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohl<CR>
noremap <silent> ,u :<C-B>sil <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohl<CR>

"Resize windows height (horizontal) and whidth (vertical)
if bufwinnr(1)
	map <S-Right> <C-W>> 
	map <S-Left> <C-W><
 	map <S-Up> <C-W> + 
 	map <S-Down> <C-W> -
endif 


"Fast window minimize with ctrl+j and ctrl+k
set wmh=0 
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_ 

" "Automatic change the working directory to the directory of the file being edited
" function! CHANGE_CURR_DIR()
" 	let _dir = expand("%:p:h")
" 	exec "cd " . _dir
" 	unlet _dir
" endfunction 
" autocmd BufEnter * call CHANGE_CURR_DIR()

"Build ctags files recursively starting by the current directory to use with omnicomplete. 
 map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" map <F12> :!ctags-exuberant -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
set tags=tags;/

"Shows Taglist window
nnoremap <silent> <F8> :TlistToggle<CR>
set completeopt=menu

" Popup menu hightLight Group
highlight Pmenu ctermbg=6 
highlight PmenuSel ctermbg=4 
highlight PmenuSbar ctermbg=4 

" use global scope search
let OmniCpp_GlobalScopeSearch = 1
" 0 = namespaces disabled
" 1 = search namespaces in the current buffer
" 2 = search namespaces in the current buffer and in included files
let OmniCpp_NamespaceSearch = 2
" 0 = auto
" 1 = always show all members
let OmniCpp_DisplayMode = 1
" " 0 = don't show scope in abbreviation
" " 1 = show scope in abbreviation and remove the last column
" let OmniCpp_ShowScopeInAbbr = 0
" " This option allows to display the prototype of a function in the
" abbreviation part of the popup menu.
" " 0 = don't display prototype in abbreviation
" " 1 = display prototype in abbreviation
" let OmniCpp_ShowPrototypeInAbbr = 1
" This option allows to show/hide the access information ('+', '#', '-') in the popup menu.
" 0 = hide access
" 1 = show access
let OmniCpp_ShowAccess = 0
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

" Restore screen size and position.
if has("gui_running")
  function! ScreenFilename()
    if has('amiga')
      return "s:.vimsize"
    elseif has('win32')
      return $HOME."\\_vimsize"
    else
      return $HOME."/.vimsize"
    endif
  endfunction

  function! ScreenRestore()
    " Restore window size (columns and lines) and position
    " from values stored in vimsize file.
    " Must set font first so columns and lines are based on font size.
    let f = ScreenFilename()
    if has("gui_running") && g:restore_screen_size_pos && filereadable(f)
      for line in readfile(f)
        let sizepos = split(line)
        if len(sizepos) == 5 && sizepos[0] == v:servername
          silent! execute "set columns=".sizepos[1]." lines=".sizepos[2]
          silent! execute "winpos ".sizepos[3]." ".sizepos[4]
          return
        endif
      endfor
    endif
  endfunction

  function! ScreenSave()
    " Save window size and position.
    if has("gui_running") && g:restore_screen_size_pos
      let data = v:servername . ' ' . &columns . ' ' . &lines . ' ' .
            \ (getwinposx()<0?0:getwinposx()) . ' ' .
            \ (getwinposy()<0?0:getwinposy())
      let f = ScreenFilename()
      if filereadable(f)
        let lines = readfile(f)
        call filter(lines, "v:val !~ '^" . v:servername . "\\>'")
        call add(lines, data)
      else
        let lines = [data]
      endif
      call writefile(lines, f)
    endif
  endfunction

  if !exists('g:restore_screen_size_pos')
    let g:restore_screen_size_pos = 1
  endif
  autocmd VimEnter * call ScreenRestore()
  autocmd VimLeavePre * call ScreenSave()
endif





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 'Load Last Session' Option functions                       "
"                                                            "
" This set of functions make the vim/gvim      aks the user  "
" if he wants to load the last session a different one or    "
" skip the load :)                                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au VimLeave * call VimLeave()
au VimEnter * call VimEnter()
let g:PathToSessions = $HOME . "/.vim/sessions"

function! VimEnter()
  if argc() == 0
    let LoadLastSession = confirm("Restore Session?", "&No\n&Last\n&Other")
    if LoadLastSession == 3 
	  call LoadSessions()
    else
      if  LoadLastSession == 2
		  let curpath = getcwd()
		  exe "cd " . g:PathToSessions 
		  exe "source ./LastSession.vim"
		  exe "cd " . curpath 
      endif
    endif
  endif
endfunction

function! LoadSessions()
  let result = "List of sessions:"
  let sessionfiles = glob(g:PathToSessions . "/*")
  while stridx(sessionfiles, "\n") >= 0
    let index = stridx(sessionfiles, "\n")
    let sessionfile = strpart(sessionfiles, 0, index)
    let result = result . "\n " . fnamemodify(sessionfile, ":t:r")
    let sessionfiles = strpart(sessionfiles, index + 1)
  endwhile
  let result = result . "\n " . fnamemodify(sessionfiles, ":t:r")
  let result = result . "\n" . "Please enter a session name to load (or empty to start normally):"
  let curpath = getcwd()
  exe "cd " . g:PathToSessions 
  let sessionname = input(result,"", "file")
  if sessionname != ""
	  SetSession :let g:SessionFileName = sessionname
    exe "source " .  "./" . sessionname 
  endif
  exe "cd " . curpath 
endfunction

function! VimLeave()
	let curpath = getcwd()
	exe "cd " . g:PathToSessions 
	exe "mksession! " . "./LastSession.vim"
	if exists("g:SessionFileName") == 1
		if g:SessionFileName != ""
			exe "mksession! " . g:SessionFileName
		endif
	endif
	exe "cd " . curpath 
endfunction




function! SaveAsSession()
	let menu_text= "Save Session as (Leave empty to Cancel):"
	let curpath = getcwd()
	exe "cd " . g:PathToSessions
	let sessionname = input(menu_text,"","file")
	if sessionname != ""
		SetSession :let g:SessionFileName = sessionname
		exe "mksession! " . sessionname 
	endif
	exe "cd " . curpath 
endfunction




"Save and Load current session
" :map <F5> :mks! ~/.vim/sessions/defaultsession.vim <CR>
" :map <F6> :enew<BAR>only!<BAR>source ~/.vim/sessions/defaultsession.vim <CR>
:map <F5> :call SaveAsSession()<CR>
:map <F6> :call  LoadSessions()<CR>

" A command for setting the session name
com! -nargs=1 SetSession :let g:SessionFileName = g:PathToSessions . "/" . <args> . ".vim"
" .. and a command to unset it
com! -nargs=0 UnsetSession :let g:SessionFileName = ""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" END 'Load Last Session' Option functions                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



" Change to the directory of the current file
:autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | sil! lcd %:p:h | endif


" Automatically append closing characters
inoremap {      {}<Left>
inoremap {<CR>  {<CR><CR>}<UP>
inoremap {{     {
inoremap {}     {}<Left>

inoremap (      ()<Left>
inoremap ((     (
inoremap ()     ()<Left>

inoremap [      []<Left>
inoremap [[     [
inoremap []     []<Left>




