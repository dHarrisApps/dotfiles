if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
set shell=/bin/bash
set nocompatible              " be iMproved, required
filetype off                  " required

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

call plug#begin('~/.vim/plugged')

Plug 'terryma/vim-multiple-cursors'
Plug 'slim-template/vim-slim'
Plug 'tomtom/tcomment_vim'
Plug 'Yggdroot/indentLine'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'sheerun/vim-polyglot'
Plug 'liuchengxu/vim-clap'

" Color Schemes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'joshdick/onedark.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }

call plug#end()            " required

filetype plugin indent on    " required

let g:dracula_italic = 0 " for dracula theme

let g:dracula_colorterm = 0

syntax on
colorscheme dracula

set number
set expandtab
set nowrap
set tabstop=2
set softtabstop=2
set shiftwidth=2
set backspace=2
set autoindent
set copyindent
set shiftwidth=2
set colorcolumn=80
set splitbelow
set splitright
set hlsearch
set ignorecase
set nobackup
set nowb
set noswapfile

" Speed highlighting up
set nocursorcolumn
set nocursorline
syntax sync minlines=256

" Make `jj` and `jk` throw you into normal mode
inoremap jj <esc>
inoremap jk <esc>

" Disable beeping
set noeb vb t_vb=

let &t_SI.="\e[6 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)