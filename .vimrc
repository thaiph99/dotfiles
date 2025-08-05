" ===[ Core Settings ]=========================================
set nocompatible
filetype plugin indent on
syntax enable
set encoding=utf-8
inoremap jk <Esc>

" ===[ One Dark Pro Theme ]====================================
set termguicolors
set background=dark

" Base Colors
highlight Normal       guibg=#282c34 guifg=#d7dae0 ctermbg=235 ctermfg=253
highlight CursorLine   guibg=#2c313a ctermbg=236   gui=NONE
highlight LineNr       guibg=#21252b guifg=#5c6370 ctermfg=242
highlight CursorLineNr guifg=#d19a66 ctermfg=173   gui=bold

" Enhanced Syntax
highlight Comment      guifg=#5c6370 
highlight String       guifg=#98c379 gui=NONE      cterm=NONE
highlight Function     guifg=#61afef gui=bold      cterm=bold
highlight Identifier   guifg=#e06c75 gui=bold      cterm=bold
highlight Keyword      guifg=#c678dd gui=bold      cterm=bold
highlight Number       guifg=#d19a66 gui=bold      cterm=bold
highlight Operator     guifg=#56b6c2 gui=bold      cterm=bold
highlight Type         guifg=#e5c07b gui=bold      cterm=bold
highlight Constant     guifg=#d19a66 gui=bold      cterm=bold

" Interface Elements
" highlight Visual       guibg=#4b5263 gui=underline cterm=underline
highlight Visual       guibg=#4b5263 
highlight Search       guibg=#e5c07b guifg=#282c34 gui=bold  cterm=bold
highlight IncSearch    guibg=#c678dd guifg=#282c34 gui=bold  cterm=bold
highlight MatchParen   guibg=#3e4452 guifg=#e06c75 gui=bold  cterm=bold
highlight StatusLine   guibg=#3e4452 guifg=#abb2bf gui=bold  cterm=bold
highlight Pmenu        guibg=#3e4452 guifg=#abb2bf ctermbg=239

" ===[ Silent Operation ]======================================
set noerrorbells novisualbell t_vb=
set belloff=all
set mouse=a

" ===[ Movement Guards ]=======================================
nnoremap <silent> j :<C-u>execute line('.')+v:count1 > line('$') ? '' : 'normal! j'<CR>
nnoremap <silent> k :<C-u>execute line('.')-v:count1 < 1 ? '' : 'normal! k'<CR>
vnoremap j gj
vnoremap k gk

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
set noswapfile
set nobackup

" ===[ Search ]===============================================
set hlsearch
set incsearch
set ignorecase
set smartcase
nnoremap <silent> <Space> :nohlsearch<CR>

" ===[ Fix ESC Delay ]=========================================
set timeoutlen=300   " Time to wait for mapped sequence (ms)
set ttimeout         " Enable timeout for key codes
set ttimeoutlen=50   " Time to wait for key code sequence (shorter)
