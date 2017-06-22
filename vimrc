"File .vimrc
"Config settings for Andy Miller

"use vim settings, not vi settings
"must be first.  will affect other settings
set nocompatible
set shell=/bin/bash            " Vim's internal shell will use bash, mostly for R-plugin. 


"========== Pathogen for easy bundle management =========
execute pathogen#infect()

"========== YouCompleteMe options =======================
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
"let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
let g:ycm_key_list_select_completion = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

"=========== General config ===============
set backspace=indent,eol,start "backspace works over everything
set number                     "Turn on line numbers
set paste                      "don't insert tabs when pasting into shell
set autoread                   "reload files changed outside vim
set lazyredraw                 "buffer screen updates instead of updating all the time (speeds up scrolling)
filetype plugin on

"=========== Text Searchign ===================
set incsearch                  "search matches show up as you type
set hlsearch

"=========== Indentation ======================
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·
set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

"=========== Highlighting ========================
syntax on                      "Syntax highlihgting on
syntax enable
let c_comment_strings=1        "High light strings inside C comments
"autocmd FileType c,cpp source /home/acm/.vim/plugin/opengl.vim "OpenGL Syntax Highlighting
au BufRead,BufNewFile *.txx set filetype=cpp
hi Statement ctermfg=green          "Highlight language statments as green...
hi Search cterm=NONE ctermfg=grey ctermbg=magenta "Search highlight color in terminals

" associate *.stan with c++ filetype
au BufRead,BufNewFile *.stan setfiletype cpp

" embedded JS (for node.js dev)
au BufNewFile,BufRead *.ejs set filetype=html

" Highlight column 80.
set textwidth=80
set colorcolumn=80
highlight ColorColumn ctermbg=246 guibg=#2d2d2d

"===========  Code folding =======================
set foldmethod=indent  "Fold based on indentation
set foldnestmax=2      "Recursively fold only two down
set nofoldenable       " Dont fold by default
set foldlevel=1	       

" remap code folding za to ctrl-comma
nnoremap gg za
nnoremap GG zR
vnoremap gg zf
vnoremap GG zR


"===========  R plugin config
let vimrplugin_vsplit=1
let g:ScreenImpl = 'Tmux'
let g:ScreenShellGnuScreenVerticalSupport = 'native'
let g:vimrplugin_applescript = 0


"==========  Nerd Tree Settings =================
let g:NERDTreeWinSize = 20    "Sets NERDTree window width

"========= C++ Code Completion =========================
" configure tags - add additional tags here or comment out not-used ones
"set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/pcl
"set tags+=~/.vim/tags/opencl
"set tags+=~/.vim/tags/qt4
"set tags+=~/.vim/tags/vxl_core
"set tags+=~/.vim/tags/eigen3
" build tags of your own project with Ctrl-F12
"map <C-k> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" OmniCppComplete
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
"let OmniCpp_MayCompleteDot = 1 " autocomplete after .
"let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
"let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menuone,menu,longest,preview



" Lines added by the Vim-R-plugin command :RpluginConfig (2014-Oct-02 22:19):
" Change the <LocalLeader> key:
let maplocalleader = ","
" Use Ctrl+Space to do omnicompletion:
if has("gui_running")
    inoremap <C-Space> <C-x><C-o>
else
    inoremap <Nul> <C-x><C-o>
endif
" Press the space bar to send lines (in Normal mode) and selections to R:
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine

" Force Vim to use 256 colors if running in a capable terminal emulator:
if &term =~ "xterm" || &term =~ "256" || $DISPLAY != "" || $HAS_256_COLORS == "yes"
    set t_Co=256
endif

" There are hundreds of color schemes for Vim on the internet, but you can
" start with color schemes already installed.
" Click on GVim menu bar "Edit / Color scheme" to know the name of your
" preferred color scheme, then, remove the double quote (which is a comment
" character, like the # is for R language) and replace the value "not_defined"
" below:
"colorscheme not_defined

"============ IPython commands using screen ================================
" ervandew/screen configuration to send commands to ipython.

let g:ScreenImpl = "Tmux"

" Open an ipython3 shell.
autocmd FileType python map <LocalLeader>p :ScreenShell! ipython<CR>

" Open an ipython2 shell.
autocmd FileType python map <LocalLeader>pp :ScreenShell! ipython<CR>

" Close whichever shell is running.
autocmd FileType python map <LocalLeader>q :ScreenQuit<CR>

" Send current line to python and move to next line.
autocmd FileType python map <LocalLeader>r V:ScreenSend<CR>j
autocmd FileType python map <Space> V:ScreenSend<CR>j

" Send visual selection to python and move to next line.
autocmd FileType python map <LocalLeader>v :ScreenSend<CR>`>0j
autocmd FileType python map <LocalLeader><Space> :ScreenSend<CR>`>0j

" Send a carriage return line to python.
autocmd FileType python map <LocalLeader>a :call g:ScreenShellSend("\r")<CR>

" Clear screen.
autocmd FileType python map <LocalLeader>L
      \ :call g:ScreenShellSend('!clear')<CR>

" Start a time block to execute code in.
autocmd FileType python map <LocalLeader>t
      \ :call g:ScreenShellSend('%%time')<CR>

" Start a timeit block to execute code in.
autocmd FileType python map <LocalLeader>tt
      \ :call g:ScreenShellSend('%%timeit')<CR>

" Start a debugger repl to execute code in.
autocmd FileType python map <LocalLeader>db
      \ :call g:ScreenShellSend('%%debug')<CR>

" Start a profiling block to execute code in.
autocmd FileType python map <LocalLeader>pr
      \ :call g:ScreenShellSend('%%prun')<CR>

" Print the current working directory.
autocmd FileType python map <LocalLeader>gw
      \ :call g:ScreenShellSend('!pwd')<CR>

" send a cpaste to ipython (for funcitons that don't work w/ the block stuff)
autocmd FileType python map <LocalLeader>cp
      \ :call g:ScreenShellSend('%cpaste')<CR>
autocmd FileType python map <LocalLeader>pc
      \ :call g:ScreenShellSend('--')<CR>

" Set working directory to current file's folder.
function SetWD()
  let wd = '!cd ' . expand('%:p:h')
  :call g:ScreenShellSend(wd)
endfunction
autocmd FileType python map <LocalLeader>sw :call SetWD()<CR>

" Get ipython help for word under cursor. Complement it with Shift + K.
function GetHelp()
  let w = expand("<cword>") . "??"
  :call g:ScreenShellSend(w)
endfunction
autocmd FileType python map <LocalLeader>h :call GetHelp()<CR>

" Get `dir` help for word under cursor.
function GetDir()
  let w = "dir(" . expand("<cword>") . ")"
  :call g:ScreenShellSend(w)
endfunction
autocmd FileType python map <LocalLeader>d :call GetDir()<CR>

" Get length of vector for word under cursor.
function GetLen()
  let w = "len(" . expand("<cword>") . ")"
  :call g:ScreenShellSend(w)
endfunction
autocmd FileType python map <LocalLeader>l :call GetLen()<CR>

" Print shape of a numpy Array
function PrintShape()
  let w = expand("<cword>") . ".shape"
  : call g:ScreenShellSend(w)
endfunction
autocmd FileType python map <LocalLeader>s :call PrintShape()<CR>

" print value of variable for word under cursor.
function PrintVar()
  let w = "print " . expand("<cword>")
  :call g:ScreenShellSend(w)
endfunction
autocmd FileType python map <LocalLeader>, :call PrintVar()<CR>
"===================================================================


"============ Julia commands using tmux ================================
" ervandew/screen configuration to send commands to julia repl

let g:ScreenImpl = "Tmux"

" Open an ipython3 shell.
autocmd FileType julia map <LocalLeader>p :ScreenShell! julia<CR>

" Open an ipython2 shell.
autocmd FileType julia map <LocalLeader>pp :ScreenShell! julia<CR>

" Close whichever shell is running.
autocmd FileType julia map <LocalLeader>q :ScreenQuit<CR>

" Send current line to python and move to next line.
autocmd FileType julia map <LocalLeader>r V:ScreenSend<CR>j
autocmd FileType julia map <Space> V:ScreenSend<CR>j

" Send visual selection to python and move to next line.
autocmd FileType julia map <LocalLeader>v :ScreenSend<CR>`>0j
autocmd FileType julia map <LocalLeader><Space> :ScreenSend<CR>`>0j

" Send a carriage return line to python.
autocmd FileType julia map <LocalLeader>a :call g:ScreenShellSend("\r")<CR>

"===================================================================


"========= AIRLINE theme  =========
:let g:airline_theme='dark'

