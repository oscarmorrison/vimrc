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
" set so=40
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
set ttimeoutlen=50
set encoding=utf-8
hi Search cterm=NONE ctermfg=black ctermbg=blue
let g:netrw_liststyle=3 "Explorer Style

" Shortcuts "
let mapleader = ","
nnoremap <leader>/ :noh<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>o o<Esc>

if has("mouse")
	set mouse=a
endif

autocmd BufWritePre *.py,*.js :%s/\s\+$//e

" Airline Specific "
set guifont=Source\ Code\ Pro\ for\ Powerline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
      let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" Vim Plug "
call plug#begin('~/.vim/plugged')

Plug 'chriskempson/base16-vim'

Plug 'wincent/command-t'

Plug 'vim-scripts/AutoComplPop'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
Plug 'edkolev/promptline.vim'

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-surround'
"
Plug 'terryma/vim-multiple-cursors'

Plug 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

Plug 'scrooloose/nerdtree'

Plug 'jiangmiao/auto-pairs'

Plug 'itchyny/vim-cursorword'

Plug 'timakro/vim-searchant'

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

call plug#end()

" Base16 "
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

hi IncSearch cterm=NONE ctermbg=lightblue
hi Search cterm=NONE ctermbg=lightblue
