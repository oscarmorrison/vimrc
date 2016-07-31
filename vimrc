

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
