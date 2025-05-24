" ===[ Core Settings ]==========================================
set nocompatible          " Disable vi compatibility
filetype plugin indent on " Filetype detection
syntax enable            " Syntax highlighting

" ===[ Silence All Annoyances ]=================================
set noerrorbells          " No audio bells
set novisualbell          " No screen flashing
set t_vb=                 " Disable terminal visual bell
set belloff=all           " Silence ALL bells

" ===[ Clean Interface ]========================================
set number                " Show line numbers
set norelativenumber      " No relative numbers (remove if you want them)
set termguicolors         " True color support
colorscheme slate         " Built-in dark theme

" ===[ Text Editing ]===========================================
set tabstop=4             " Visual spaces per tab
set shiftwidth=4          " Indent size
set expandtab             " Use spaces not tabs
set smartindent           " Smart autoindenting
set backspace=indent,eol,start " Normal backspace

" ===[ Search ]=================================================
set incsearch             " Show matches while typing
set hlsearch              " Highlight matches
set ignorecase            " Case-insensitive search
set smartcase             " Sensitive if uppercase used

" ===[ Window Behavior ]========================================
set scrolloff=5           " Keep context when scrolling
set splitbelow            " New splits go below
set splitright            " New splits go right
set laststatus=2          " Always show status line

" ===[ Status Line ]============================================
set statusline=
set statusline+=%<%f      " Filename
set statusline+=%h%m%r    " Flags
set statusline+=%=        " Right-align
set statusline+=%y        " Filetype
set statusline+=\ %3l:%-2c " Line:Column
set statusline+=\ %P      " Percentage

" ===[ Key Mappings ]===========================================
nnoremap <silent> <space> :nohlsearch<CR> " Clear highlights
nnoremap j gj             " Move by display lines
nnoremap k gk
vnoremap j gj
vnoremap k gk

" ===[ File Handling ]==========================================
set hidden                " Change buffers without saving
set confirm               " Confirm unsaved changes
set undofile              " Persistent undo
set undodir=~/.vim/undo   " Undo file location
set noswapfile            " No swap files
set nobackup              " No backup files
