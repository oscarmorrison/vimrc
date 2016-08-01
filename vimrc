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

" Visual "
set so=7
set ruler
set cmdheight=2
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

if has("mouse")
	set mouse=a
endif



" Vim Plug "
call plug#begin('~/.vim/plugged')

" Base16 color schemes "
Plug 'chriskempson/base16-vim'

call plug#end()


" Base16 "

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
