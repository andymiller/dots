"acm: 8-1-19, switched to vim-plug
"  ... futzing w/ vim setup

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
" - Add new plug here, then run :PlugInstall
call plug#begin('~/.vim/plugged')

" Color/theme
"https://github.com/morhetz/gruvbox/wiki/Installation
Plug 'morhetz/gruvbox'

" Nerdtree + Git plugin (shows git status in nerdtree)
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'xuyuanp/nerdtree-git-plugin'

" Airline status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Parentheses surround stuff
Plug 'tpope/vim-surround'

" Git integration
Plug 'tpope/vim-fugitive'

" screen/tmux
Plug 'jpalardy/vim-slime', { 'for': 'python' }

" Code completion
"Plug 'valloric/youcompleteme'
"
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" close buffer plugin
Plug 'rbgrouleff/bclose.vim'

" end plugin setup
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""
" VI Config Options.  8-1-19 reboot
"""""""""""""""""""""""""""""""""""""""""""""""""""

" call gruvbox colorscheem
"  https://github.com/morhetz/gruvbox/wiki/Configuration
"set background=dark    " Setting dark mode
" soft, medium, and hard
let g:gruvbox_contrast_dark = 'medium'
colorscheme gruvbox

"========= AIRLINE theme  =========
"let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='gruvbox'

"============= Auto complete (still a mess ) ==========
" autocomplete
"let g:python3_host_prog = 'python'
"let g:deoplete#enable_at_startup = 1

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

"==========  Nerd Tree Settings =================
let g:NERDTreeWinSize = 20    "Sets NERDTree window width

"=========== Highlighting ========================
syntax on                      "Syntax highlihgting on
syntax enable
"let c_comment_strings=1        "High light strings inside C comments
"autocmd FileType c,cpp source /home/acm/.vim/plugin/opengl.vim "OpenGL Syntax Highlighting
"au BufRead,BufNewFile *.txx set filetype=cpp
"hi Statement ctermfg=green          "Highlight language statments as green...
"hi Search cterm=NONE ctermfg=grey ctermbg=magenta "Search highlight color in terminals
"
"" associate *.stan with c++ filetype
"au BufRead,BufNewFile *.stan setfiletype cpp
"
"" embedded JS (for node.js dev)
"au BufNewFile,BufRead *.ejs set filetype=html

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

"========== Vim-Slime Config ===============
" vim-slime configuration tips come from this repository:
"   - https://github.com/hanschen/vim-ipython-cell
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"

" always send commands to top RIGHT tmux pane.  don't ask by default
let g:slime_default_config = {
            \ 'socket_name': get(split($TMUX, ','), 0),
            \ 'target_pane': '{top-right}' }
let g:slime_dont_ask_default = 1

" fix paste issues in ipython
let g:slime_python_ipython = 1


" opening Ipython Shells
" Open an ipython3 shell.
" Change the <LocalLeader> key:
let maplocalleader = ","
autocmd FileType python map <LocalLeader>p :ScreenShell! ipython<CR>

" map spacebar to send
"xmap <Space> <Plug>SlimeRegionSend
"nmap <Space> <Plug>SlimeParagraphSend
"map <LocalLeader><Space> :SlimeSendCurrentLine<CR>j
map <Space> :SlimeSendCurrentLine<CR>j

"Double space sends full regions
xmap <LocalLeader><Space> <Plug>SlimeRegionSend
nmap <LocalLeader><Space> <Plug>SlimeParagraphSend}


"" Force Vim to use 256 colors if running in a capable terminal emulator:
""if &term =~ "xterm" || &term =~ "256" || $DISPLAY != "" || $HAS_256_COLORS == "yes"
""    set t_Co=256
""endif
"
"" There are hundreds of color schemes for Vim on the internet, but you can
"" start with color schemes already installed.
"" Click on GVim menu bar "Edit / Color scheme" to know the name of your
"" preferred color scheme, then, remove the double quote (which is a comment
"" character, like the # is for R language) and replace the value "not_defined"
"" below:
"
""============ IPython commands using screen ================================
"" ervandew/screen configuration to send commands to ipython.
"
"" Open an ipython3 shell.
"autocmd FileType python map <LocalLeader>p :ScreenShell! ipython<CR>
"
"" Open an ipython2 shell.
"autocmd FileType python map <LocalLeader>pp :ScreenShell! ipython<CR>
"
"" Close whichever shell is running.
"autocmd FileType python map <LocalLeader>q :ScreenQuit<CR>
"
"" Send current line to python and move to next line.
"autocmd FileType python map <LocalLeader>r V:ScreenSend<CR>j
"autocmd FileType python map <Space> V:ScreenSend<CR>j
"
"" Send visual selection to python and move to next line.
"autocmd FileType python map <LocalLeader>v :ScreenSend<CR>`>0j
"autocmd FileType python map <LocalLeader><Space> :ScreenSend<CR>`>0j
"
"" Send a carriage return line to python.
"autocmd FileType python map <LocalLeader>a :call g:ScreenShellSend("\r")<CR>
"
"" Clear screen.
"autocmd FileType python map <LocalLeader>L
"      \ :call g:ScreenShellSend('!clear')<CR>
"
"" Start a time block to execute code in.
"autocmd FileType python map <LocalLeader>t
"      \ :call g:ScreenShellSend('%%time')<CR>
"
"" Start a timeit block to execute code in.
"autocmd FileType python map <LocalLeader>tt
"      \ :call g:ScreenShellSend('%%timeit')<CR>
"
"" Start a debugger repl to execute code in.
"autocmd FileType python map <LocalLeader>db
"      \ :call g:ScreenShellSend('%%debug')<CR>
"
"" Start a profiling block to execute code in.
"autocmd FileType python map <LocalLeader>pr
"      \ :call g:ScreenShellSend('%%prun')<CR>
"
"" Print the current working directory.
"autocmd FileType python map <LocalLeader>gw
"      \ :call g:ScreenShellSend('!pwd')<CR>
"
"" send a cpaste to ipython (for funcitons that don't work w/ the block stuff)
"autocmd FileType python map <LocalLeader>cp
"      \ :call g:ScreenShellSend('%cpaste')<CR>
"autocmd FileType python map <LocalLeader>pc
"      \ :call g:ScreenShellSend('--')<CR>
""function SendVisualBlock()
""    :call g:ScreenShellSend('%cpaste')
""    :ScreenSend<CR>`>0
""    ":ScreenSend
""    :call g:ScreenShellSend('--')
""endfunction
""autocmd FileType python map <localLeader>cp
""      \ :call SendVisualBlock()<CR>
"
"" Set working directory to current file's folder.
"function SetWD()
"  let wd = '!cd ' . expand('%:p:h')
"  :call g:ScreenShellSend(wd)
"endfunction
"autocmd FileType python map <LocalLeader>sw :call SetWD()<CR>
"
"" Get ipython help for word under cursor. Complement it with Shift + K.
"function GetHelp()
"  let w = expand("<cword>") . "??"
"  :call g:ScreenShellSend(w)
"endfunction
"autocmd FileType python map <LocalLeader>h :call GetHelp()<CR>
"
"" Get `dir` help for word under cursor.
"function GetDir()
"  let w = "dir(" . expand("<cword>") . ")"
"  :call g:ScreenShellSend(w)
"endfunction
"autocmd FileType python map <LocalLeader>d :call GetDir()<CR>
"
"" Get length of vector for word under cursor.
"function GetLen()
"  let w = "len(" . expand("<cword>") . ")"
"  :call g:ScreenShellSend(w)
"endfunction
"autocmd FileType python map <LocalLeader>l :call GetLen()<CR>
"
"" Print shape of a numpy Array
"function PrintShape()
"  let w = expand("<cword>") . ".shape"
"  : call g:ScreenShellSend(w)
"endfunction
"autocmd FileType python map <LocalLeader>s :call PrintShape()<CR>
"
"" print value of variable for word under cursor.
"function PrintVar()
"  let w = "print " . expand("<cword>")
"  :call g:ScreenShellSend(w)
"endfunction
"autocmd FileType python map <LocalLeader>, :call PrintVar()<CR>
""===================================================================
"
""============ Julia commands using tmux ================================
"" ervandew/screen configuration to send commands to julia repl
"
"let g:ScreenImpl = "Tmux"
"
"" Open an ipython3 shell.
"autocmd FileType julia map <LocalLeader>p :ScreenShell! julia<CR>
"
"" Open an ipython2 shell.
"autocmd FileType julia map <LocalLeader>pp :ScreenShell! julia<CR>
"
"" Close whichever shell is running.
"autocmd FileType julia map <LocalLeader>q :ScreenQuit<CR>
"
"" Send current line to python and move to next line.
"autocmd FileType julia map <LocalLeader>r V:ScreenSend<CR>j
"autocmd FileType julia map <Space> V:ScreenSend<CR>j
"
"" Send visual selection to python and move to next line.
"autocmd FileType julia map <LocalLeader>v :ScreenSend<CR>`>0j
"autocmd FileType julia map <LocalLeader><Space> :ScreenSend<CR>`>0j
"
"" Send a carriage return line to python.
"autocmd FileType julia map <LocalLeader>a :call g:ScreenShellSend("\r")<CR>
