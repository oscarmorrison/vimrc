" VIMRC - Oscar Morrison - me@oscarmorrison.com "

" General "
set eol
set history=500
filetype plugin on
filetype indent on
set autoread
set ignorecase
set smartcase
set hlsearch
set incsearch
set expandtab
set clipboard=unnamed

set wildmenu
set backspace=indent,eol,start
au BufRead,BufNewFile *.hbs setfiletype html
au BufRead,BufNewFile *.edge setfiletype html

" Autocomplete
set completeopt=longest,menuone
set splitbelow

" Visual "
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

" Tettra Abbreviations "
iabbrev <?p <?php?><Left><Left>
iabbrev =- =>
inoremap -- ->
inoremap <?? <?php
inoremap <?? <?php
inoremap cnl console.log()<Left>
inoremap ddd dd("");<Left><Left><Left>

" Shortcuts "
let mapleader = ","
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>F :CtrlSF<CR>
vnoremap <leader>F :CtrlSF<CR>
nnoremap <leader>O :CtrlSFOpen<CR>
nnoremap <leader>t :Files<CR>
nnoremap <leader>a :Ag<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>G :Commits<CR>
nnoremap <leader>m :bn<CR>
nnoremap <leader>M :bp<CR>
nnoremap <leader>B :bd<CR>
noremap <leader>e :Geeknote<CR>
noremap <leader>c :reg<CR>
noremap <leader>c :lclose<CR>
noremap <leader>C :Errors<CR>
noremap <leader>g :TernDef<CR>
noremap <leader>d :TernDoc<CR>
noremap <leader>r :TernRename<CR>
noremap <leader>y :w !pbopy<CR>
noremap <leader>s :split<CR>
nnoremap <leader>w /\s\+$
nnoremap <leader>o :on<CR>
nnoremap <leader>l :MtaJumpToOtherTag<CR>
nnoremap <leader>x :ColorHEX<CR>
nnoremap <leader># :set nonumber!<CR>
nnoremap <2-LeftMouse> <c-w>gf

" Special short cuts for delete and paste to black hole register
noremap <LEADER>d "_d
noremap <LEADER>p "_dp

" Run current buffer in node
nnoremap <leader>R :!/usr/local/bin/node %<CR>

" Alternative ESC Key
inoremap jk <esc>
inoremap kj <esc>
inoremap ;' <esc>
inoremap '; <esc>

let g:searchant_map_stop = 0
nmap <leader>/ <Plug>SearchantStop


if has("mouse")
	set mouse+=a
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

"~~~~~~ Vim Plug ~~~~~~"
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
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
let g:syntastic_javascript_checkers = ['eslint']

Plug 'jiangmiao/auto-pairs'

Plug 'itchyny/vim-cursorword'

Plug 'timakro/vim-searchant'

Plug 'scrooloose/nerdtree'
let NERDTreeShowHidden=1
let NERDTreeMapOpenInTab='\r'
let NERDTreeMapOpenInTab='<ENTER>'
let NERDTreeIgnore = ['\.DS_Store$']
let g:NERDTreeMapOpenInTab = '<2-LeftMouse>'

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

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

" Plug 'pangloss/vim-javascript', { 'for': [ 'javascript', 'javascript.jsx' ] }
" Plug 'mxw/vim-jsx', { 'for': [ 'javascript', 'javascript.jsx' ] }
" let g:jsx_ext_required = 0

Plug 'chemzqm/vim-jsx-improve'

Plug 'StanAngeloff/php.vim'

Plug 'shawncplus/phpcomplete.vim'

Plug 'alvan/vim-closetag'
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.edge"

Plug 'jwalton512/vim-blade'

Plug 'Valloric/MatchTagAlways'
let g:mta_filetypes = {
    \'javascript.jsx': 1,
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
\}

Plug 'iandoe/vim-osx-colorpicker'
let g:colorpicker_app = 'iTerm.app'

Plug 'tpope/vim-abolish'

Plug 'jelera/vim-javascript-syntax'

Plug 'dyng/ctrlsf.vim'

call plug#end()

" Base16 "
if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
endif

highlight IncSearch cterm=NONE ctermbg=lightblue
highlight Search cterm=NONE ctermbg=lightblue
highlight SearchCurrent ctermfg=DarkGrey ctermbg=white
hi link javaScriptTemplateDelim String
hi link javaScriptTemplateVar Text
hi link javaScriptTemplateString String
hi htmlArg gui=italic
hi Comment gui=italic
hi Type    gui=italic
hi htmlArg cterm=italic
hi Comment cterm=italic
hi Type    cterm=italic
