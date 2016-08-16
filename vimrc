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
set wildmenu
set backspace=indent,eol,start

" Autocomplete
set completeopt=longest,menuone

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
let g:netrw_liststyle=3 "Explorer Style

" Shortcuts "
let mapleader = ","
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>t :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>g :Commits<CR>
nnoremap <leader>m :bn<CR>
nnoremap <leader>M :bp<CR>
nnoremap <leader>w :Bclose<CR>
noremap <leader>e :Geeknote<CR>
noremap <leader>c :reg<CR>
noremap <leader>s :lclose<CR>
noremap <leader>S :Errors<CR>

let g:searchant_map_stop = 0
nmap <leader>/ <Plug>SearchantStop


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

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
Plug 'edkolev/promptline.vim'

Plug 'tpope/vim-surround'

Plug 'terryma/vim-multiple-cursors'

Plug 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

Plug 'jiangmiao/auto-pairs'

Plug 'itchyny/vim-cursorword'

Plug 'timakro/vim-searchant'

Plug 'scrooloose/nerdtree'

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'

Plug 'neilagabriel/vim-geeknote'
let g:GeeknoteFormat="markdown"

Plug 'ternjs/tern_for_vim'

Plug 'valloric/youcompleteme'

call plug#end()

" Base16 "
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

highlight IncSearch cterm=NONE ctermbg=lightblue
highlight Search cterm=NONE ctermbg=lightblue
highlight SearchCurrent ctermfg=DarkGrey ctermbg=white
nnoremap <leader>m :bn<CR>
