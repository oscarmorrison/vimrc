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
au BufRead,BufNewFile *.hbs setfiletype html

" Autocomplete
set completeopt=longest,menuone
set splitbelow

" Visual "
" set so=40
set ruler
syntax enable
set smarttab
set shiftwidth=4
set softtabstop=4
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
set nospell

" Shortcuts "
let mapleader = ","
nnoremap <leader>n :NERDTreeTabsToggle<CR>
nnoremap <leader>f :NERDTreeTabsFind<CR>
nnoremap <leader>t :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>G :Commits<CR>
nnoremap <leader>m :bn<CR>
nnoremap <leader>M :bp<CR>
nnoremap <leader>B :Bclose<CR>
nnoremap <leader>W :bd<CR>
noremap <leader>e :Geeknote<CR>
noremap <leader>c :reg<CR>
noremap <leader>c :lclose<CR>
noremap <leader>C :Errors<CR>
noremap <leader>g :TernDef<CR>
noremap <leader>d :TernDoc<CR>
noremap <leader>r :TernRename<CR>
noremap <leader>y :w !pbcopy<CR>
noremap <leader>s :split<CR>
nnoremap <leader>w /\s\+$
nnoremap <leader>o :on<CR>

" Abbreviations
iabbrev <?p <?php?><Left><Left>

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
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ,"trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"] 
let g:syntastic_html_tidy_quiet_messages = { 'regex': [
            \'proprietary attribute',
            \'is not recognized!',
            \'discarding unexpected',
            \'<form> lacks "action" attribute',
            \'<input> attribute .\{-\} lacks value',
            \'lacks "src" attribute',
            \] }
let g:syntastic_javascript_checkers = ['eslint']


Plug 'jiangmiao/auto-pairs'

Plug 'itchyny/vim-cursorword'

Plug 'timakro/vim-searchant'

Plug 'scrooloose/nerdtree'
let NERDTreeShowHidden=1
let NERDTreeMapOpenInTab='\r'
let NERDTreeIgnore = ['\.DS_Store$']

Plug 'jistr/vim-nerdtree-tabs'
let g:NERDTreeMapOpenInTab = '<2-LeftMouse>'

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'

Plug 'neilagabriel/vim-geeknote'
let g:GeeknoteFormat="markdown"

Plug 'ternjs/tern_for_vim'

Plug 'valloric/youcompleteme'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_add_preview_to_completeopt = 0
set completeopt-=preview

Plug 'tpope/vim-commentary'

Plug 'pangloss/vim-javascript', { 'for': [ 'javascript', 'jsx' ] }
Plug 'mxw/vim-jsx', { 'for': [ 'javascript', 'jsx' ] }

Plug 'StanAngeloff/php.vim'

Plug 'shawncplus/phpcomplete.vim'

Plug 'alvan/vim-closetag'
let g:closetag_filenames = "*.jsx, *.html,*.xhtml,*.phtml,*.php"

Plug 'jwalton512/vim-blade'

call plug#end()

" Base16 "
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

highlight IncSearch cterm=NONE ctermbg=lightblue
highlight Search cterm=NONE ctermbg=lightblue
highlight SearchCurrent ctermfg=DarkGrey ctermbg=white
