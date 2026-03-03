" ===[ Core Settings ]=========================================
set nocompatible
set cursorline
filetype plugin indent on
syntax enable
set encoding=utf-8
inoremap jk <Esc>
let mapleader = " "

" ===[ One Dark Pro Theme ]====================================
set termguicolors
set background=dark

set clipboard=unnamedplus

" Base Colors
highlight CursorLine   cterm=NONE gui=NONE guibg=#2c313a ctermbg=236
highlight Normal       guibg=#282c34 guifg=#d7dae0 ctermbg=235 ctermfg=253
highlight LineNr       guibg=#21252b guifg=#5c6370 ctermfg=242
highlight CursorLineNr guifg=#d19a66 ctermfg=173 gui=bold cterm=NONE

" ===[ Silent Operation ]======================================
set noerrorbells novisualbell t_vb=
set belloff=all
set mouse=""

" ===[ Interface Configuration ]===============================
set number
set showcmd
set laststatus=2
set title
set scrolloff=5

" ===[ Status Line ]===========================================
set statusline=
set statusline+=%#StatusLine#\ %<%f\ %m%r%h%w
set statusline+=%=
set statusline+=%#StatusLineNC#\ %y\ 
set statusline+=%#StatusLine#\ %3l:%-2c\ %P

" ===[ Editing Behavior ]=====================================
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set backspace=indent,eol,start
set listchars=tab:▸\ ,trail:·
set list

" ===[ File Handling ]========================================
set hidden
set confirm
set undofile
set undodir=~/.vim/undo
set noswapfile
set nobackup

" ===[ Search ]===============================================
set hlsearch
set incsearch
set ignorecase
set smartcase
nnoremap <silent> <Space> :nohlsearch<CR>

" ===[ Fix ESC Delay ]=========================================
set timeoutlen=200   " Time to wait for mapped sequence (ms)
set ttimeout         " Enable timeout for key codes
set ttimeoutlen=50   " Time to wait for key code sequence (shorter)
