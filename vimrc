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
set clipboard=unnamedplus

set wildmenu
set backspace=indent,eol,start
au BufRead,BufNewFile *.hbs setfiletype html
au BufRead,BufNewFile *.edge setfiletype html
au BufRead,BufNewFile *.jinja setfiletype html

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
inoremap =- =>
inoremap -- ->
iabbrev <?p <?php?><Left><Left>
inoremap cnl console.log()<Left>
iabbrev ddd dd("");<Left><Left><Left>

" Shortcuts "
let mapleader = ","
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
vnoremap <leader>F <Plug>CtrlSFVwordPath
nnoremap <leader>O :CtrlSFOpen<CR>
nnoremap <leader>t :Files<CR>
nnoremap <leader>a :Ag<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>G :Commits<CR>
nnoremap <leader>m :bn<CR>
nnoremap <leader>M :bp<CR>
nnoremap <leader>B :bd<CR>
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
nnoremap <leader>T :SyntasticToggleMode<CR>
nnoremap <2-LeftMouse> <c-w>gf

" vim lsp goto definition
nnoremap <leader>gd <cmd>lua vim.lsp.buf.definition()<CR>

" Special short cuts for delete and paste to black hole register
noremap <LEADER>d "_d
noremap <LEADER>p "_dp

" Run current buffer in node
nnoremap <leader>R :!/usr/local/bin/node %<CR>

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

" ----> ----> ----> ----> ---->

" Avante and Dependencies
call plug#begin('~/.vim/plugged')

" Base16 Color Scheme
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
Plug 'edkolev/promptline.vim'

Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'

" Syntastic
" Plug 'scrooloose/syntastic' "Commenting this out to avoid conflict with avante

Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/vim-cursorword'
Plug 'timakro/vim-searchant'

Plug 'scrooloose/nerdtree'
let NERDTreeShowHidden=1
let NERDTreeMapOpenInTab='\r'
let NERDTreeIgnore = ['\.DS_Store$']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'jelera/vim-javascript-syntax'
Plug 'alvan/vim-closetag'
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.edge"
Plug 'jwalton512/vim-blade'
Plug 'Valloric/MatchTagAlways'
Plug 'iandoe/vim-osx-colorpicker'
Plug 'dyng/ctrlsf.vim'
Plug 'junegunn/goyo.vim'
Plug 'glidenote/newdayone.vim'

" LSP and Autocomplete
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v3.x'}
Plug 'onsails/lspkind.nvim'

" Remove these plugins
" Plug 'Exafunction/codeium.vim' " Removed Codeium
" Plug 'madox2/vim-ai' " Removed vim-ai

" Avante and its dependencies
" Deps for Avante
Plug 'stevearc/dressing.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'

" Optional deps
Plug 'nvim-tree/nvim-web-devicons'
Plug 'HakonHarnes/img-clip.nvim'
Plug 'zbirenbaum/copilot.lua'

" Avante
Plug 'yetone/avante.nvim', { 'branch': 'main', 'do': { -> avante#build() }, 'on': 'AvanteAsk' }

call plug#end()

" Base16
let base16_theme = expand('$BASE16_THEME')
if base16_theme == ""
    let base16_theme = "oceanicnext"
endif
if (!exists('g:colors_name') || g:colors_name != 'base16-'.base16_theme)
    let base16colorspace=256
    execute 'colorscheme base16-'.base16_theme
endif

" Custom Highlight
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

" Focus Mode
command! Focus call Focus()
let g:focused = 0
function! Focus()
  if g:focused == 0
    " magically enable focus stuff
    let g:focused = 1
    " enable distraction-free with a 120 column wide buffer
    :Goyo 120
    set filetype=markdown
  else
    " disable all of it again
    let g:focused = 0
    :Goyo
  endif
endfunction

autocmd FileType asc call Focus()

lua << EOF

-- Initialize and configure the plugins
require('mason').setup()
require('mason-lspconfig').setup {
    ensure_installed = { 'intelephense', 'tsserver' },
}

-- Setup nvim-cmp
local cmp = require'cmp'
local luasnip