" VIMRC - Oscar Morrison - me@oscarmorrison.com "

" General "
set history=500
filetype plugin on
filetype indent on
set autoread
set ignorecase
set smartcase
set hlsearch
set incsearch
set expandtab
let mapleader = ","

" Visual "
set so=7
set ruler
syntax enable
set smarttab
set shiftwidth=4
set tabstop=4
set lbr
set tw=500
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set relativenumber
set number
set laststatus=2


" Shortcuts "
nnoremap <leader>no :noh<CR>

if has("mouse")
	set mouse=a
endif



" Vim Plug "
call plug#begin('~/.vim/plugged')

" Base16 color schemes "
Plug 'chriskempson/base16-vim'

" CommandT "
Plug 'wincent/command-t'

" Auto Complete"
Plug 'vim-scripts/AutoComplPop'

" Air line "
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()


" Base16 "

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
