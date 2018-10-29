set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"ctrlp options
"Sets home as location with .git
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': ['<c-t>'],
  \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
  \ }

"let g:auto_type_info=0
set t_RV=

autocmd FileType make setlocal noexpandtab


set runtimepath^=~/.vim/bundle/ctrl.vim


"au BufNewFile,BufRead *.v,*.vx,*.vt,*.vp set ft=verilog

set pastetoggle=<F2>


"===== Vim Help/Topics =====

" 'Ctrl+]' follows link
" 'Ctrl+T' goes back

" Note -- :help vim-modes
" Note -- :help i_CTRL-U
" Note -- :help ins-special-keys



"===== Pathogen =====

" Note -- must come before filetype settings

" enable pathogen, a plugin to manage other plugins
"execute pathogen#infect()



"==== Prevent Deafness/Blindness =====
  
" use visual bell instead of beeping
set visualbell

" what to do for a visual bell: nothing
set t_vb=

" my terminal supports more than just 8 colors
set t_Co=256



"===== Movement =====

" 'backspace' eats up: indent, eol, and start-of-insert
set backspace=indent,eol,start

" keys that wrap lines: 'backspace', 'space', 'left', 'right', 'h', 'l'
"set whichwrap=b,s,<,>,h,l

" make the behavior of 'Y' consistent with 'D'
nmap Y y$

" move up/down by one row in a soft-wrapped multirow line
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk



"===== Filetype =====

" Note -- $VIMRUNTIME/filetype.vim
" Note -- $VIMRUNTIME/ftplugin/python.vim
" Note -- $VIMRUNTIME/indent/python.vim
" Note -- $VIMRUNTIME/syntax/python.vim

" enable filetype plugin/indent
filetype plugin on
filetype indent on

" enable syntax highlighting
"source ~/.vim/syntax/verilog_systemverilog.vim
syntax on

au BufNewFile,BufRead *.t set ft=lua
au BufNewFile,BufRead *.cpp set syntax=cpp11
au FileType python setl tabstop=2 shiftwidth=2 softtabstop=2

"===== LaTeX =====

" filetype: LaTeX instead of TeX for *.tex
let g:tex_flavor='latex'


" indent: don't indent braces
let g:tex_indent_brace=0



"===== Save & Load =====

" do not create *.swp files
set noswapfile

" save file before :make or switching buffers
set autowrite

" load file when it is changed externally
set autoread



"===== Wrapping =====

" Note -- hard-wrap inserts a linebreak character

" hard-wrap: textwidth
"set textwidth=80

" hard-wrap: disable hard-wrap based on distance from edge of the window
"set wrapmargin=0

" soft-wrap: disable soft-wrap
"set wrap

set autoread

"===== Tabs =====

" Note -- tabstop == 8
" Note -- softtabstop == shiftwidth

" visually appearing length of the '\t' character
set tabstop=2

" length of the 'tab', 'backspace' keys (during insert mode)
set softtabstop=2

" length of the '>', '<' keys (during normal mode)
set shiftwidth=2

" visualize the lengths of softtabstop/shiftwidth using only ' ' characters
set expandtab

" for 'tab'/'backspace' at the beginning of a line, follow shiftwidth
set smarttab



"===== Indentation =====

" Note -- never use smartindent

" inherit indentation from previous line
set autoindent

" disable C-style indentation
set nocindent

" smartindent is deprecated in favor of cindent
set nosmartindent



"===== Formatting =====

"Note -- :help formatoptions
"Note -- :help fo-table

" gq: join sentences with just a single space
set nojoinspaces

" gq: auto-wrap text using textwidth
set formatoptions+=t

" gq: ignore numbered list
set formatoptions+=n

" gq: disable automatic formatting
set formatoptions-=a



"===== Search =====

" highlight search
set hlsearch

" incremental search
set incsearch

" clear highlight
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR>
endi



"===== Auto-Completion & Wildcard-Expansion =====

" auto-completetion: don't search included files
set complete-=i

" wildcard-expansion: show matches for commands/files
set wildmenu

" wildcard-expansion: exclude certain files
set wildignore=*.o,*.pdf,*.pyc,*.aux



"===== Interface =====

" status-line: always show (even when there's only one window)
set laststatus=2

" status-line: show line-number, column-number, percent-scroll
set ruler

"set statusline=\ %{IsPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" show line-number
set number

" show number of lines selected in Visual mode
set showcmd

" partially display a soft-wrapped multirow line at the bottom edge of window
set display=lastline

" Note -- enabling vim-mouse allows you to:
" 1. click-navigate to any location in a window
" 2. click-navigate to any location in a different window
" 3. drag-select within a window
" 4. drag-adjust window partitions
" 5. fall-back to xterm-cursor by using 'shift'

" Note -- enabling vim-mouse prevents you from:
" 1. right-click copy/paste (requires xterm-cursor)

" enable vim-mouse
set mouse=a


" white character symbols for :set list
if &listchars ==# 'eol:$'
  set listchars=eol:$,tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
    let &listchars = "eol:\u00ac,tab:\u25b8 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
  endif
endif



"===== Highlighting =====

" Note -- :help highlight-groups (e.g., SpellBad)
" Note -- :help highlight-args (e.g., underline)
" Note -- :help cterm-colors (e.g., White)

" search
highlight Search ctermbg=DarkGray
highlight IncSearch ctermbg=DarkGray

" matching parentheses/braces/bracketscterm
highlight MatchParen cterm=underline ctermfg=NONE ctermbg=NONE

" misspelled words
highlight SpellBad cterm=underline ctermfg=NONE ctermbg=NONE
highlight SpellCap cterm=underline ctermfg=NONE ctermbg=NONE
highlight SpellLocal cterm=underline ctermfg=NONE ctermbg=NONE
highlight SpellRare cterm=underline ctermfg=NONE ctermbg=NONE

" popup menu: regular item
highlight Pmenu ctermfg=White ctermbg=Gray

" popup menu: selected item
highlight PmenuSel ctermfg=White ctermbg=DarkGray

" popup menu: scrollbar
highlight PmenuSBar ctermbg=Gray

" popup menu: scrollbar thumb
highlight PmenuThumb ctermbg=DarkGray



"===== Spellcheck =====

" disable spellcheck in comments
let g:tex_comment_nospell=1

" workaround when spellcheck doesn't work for *.tex
"syntax spell toplevel



"===== Misc. =====

" 010 is considered to be decimal, not octal
set nrformats=hex

"===== undo history =====
"set undofile
"set undodir=/home/rdaly/.vimundo/

"===== Mappings =====

" timeouts for mappings (e.g., ',n')
set timeout
set timeoutlen=500

" edit .vimrc
nmap ,v :e $MYVIMRC<CR>

" spellcheck
nmap ,n ]s
nmap ,p [s
nmap ,a zg
nmap ,? z=

" disable Execute mode
map Q <NOP>

noremap <C-a> 0
noremap <C-e> $

" navigates to the current file's directory
" Note -- the dot signifies string concatenation
map ,e :e <C-R>=expand('%:h') . '/' <CR>


"===== Macros =====
"This is only for xterm
"XFree86 xterm
"Map to F13 ^[O2P
":set <C-Left>=^O2P
"Map to F14 ^[O2Q
":set <C-Right>=^O2Q
"nnoremap <C-Left> :tabprevious<CR>
"nnoremap <C-Right> :tabnext<CR>
nnoremap <S-Left> :tabprevious<CR>
nnoremap <S-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
set pastetoggle=<F2>
