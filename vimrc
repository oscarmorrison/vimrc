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
vnoremap <leader>F :CtrlSF<CR>
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

"~~~~~~ Vim Plug ~~~~~~"
call plug#begin('~/.vim/plugged')

" Plug 'github/copilot.vim'
" imap <silent> <C-j> <Plug>(copilot-next)
" imap <silent> <C-k> <Plug>(copilot-previous)
" imap <silent> <C-\> <Plug>(copilot-dismiss)

Plug 'Exafunction/codeium.vim'
nnoremap <C-Tab> :call codeium#CycleCompletions(1)<CR>

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
set statusline+=%3*%{codeium#GetStatusString()}
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
let g:syntastic_javascript_eslint_args = ['--config', '.eslintrc.json']

"maybreak python stuff
let g:syntastic_python_python_exec = '/usr/local/bin/python3'

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
let $FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!{node_modules/*,.git/*,vendor/*}"'

Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'

Plug 'ternjs/tern_for_vim'

" Plug 'valloric/youcompleteme'
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_add_preview_to_completeopt = 0
" set completeopt-=preview

Plug 'tpope/vim-commentary'

" Plug 'pangloss/vim-javascript', { 'for': [ 'javascript', 'javascript.jsx' ] }
" Plug 'mxw/vim-jsx', { 'for': [ 'javascript', 'javascript.jsx' ] }
" let g:jsx_ext_required = 0
Plug 'jelera/vim-javascript-syntax'

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

Plug 'dyng/ctrlsf.vim'

Plug 'qwertologe/nextval.vim'

" " For auto importing file paths
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}

" Enable tab completion
" temprorarily while copilot not working
" set wildmode=list:longest
" set wildmenu
" set wildignorecase

" New with NVIM
Plug 'neovim/nvim-lspconfig'

Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/buftabline.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'hrsh7th/nvim-compe'
Plug 'jamessan/vim-gnupg'
autocmd FileType gpg if expand("%:e") == 'asc' | set filetype=markdown | endif
let g:GPGPreferArmor=1
let g:GPGDefaultRecipients=["me@oscarmorrison.com"]
Plug 'junegunn/goyo.vim'

Plug 'glidenote/newdayone.vim'

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



lua << EOF
local nvim_lsp = require('lspconfig')

-- Enable TypeScript Language Server
nvim_lsp.tsserver.setup{
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
        local ts_utils = require("nvim-lsp-ts-utils")

        -- defaults
        ts_utils.setup {
            debug = false,
            disable_commands = false,
            enable_import_on_completion = false,

            -- eslint
            eslint_enable_code_actions = true,
            eslint_enable_disable_comments = true,
            eslint_bin = "eslint",
            eslint_config_fallback = nil,
            eslint_enable_diagnostics = true,

            -- formatting
            enable_formatting = true,
            formatter = "prettier",
            formatter_config_fallback = nil,

            -- parentheses completion
            complete_parens = false,
            signature_help_in_parens = false,
        }

        -- required to fix code action ranges
        ts_utils.setup_client(client)
    end,
    flags = {
        debounce_text_changes = 150,
    }
}

-- Enable intelephense for PHP
nvim_lsp.intelephense.setup{
    settings = {
        intelephense = {
            files = {
                maxSize = 5000000
            }
        }
    }
}
EOF


lua << EOF
-- Autocompletion
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    snippets_nvim = true;
    treesitter = true;
  };
}

-- Just temp, while co-pilot not working
vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {expr = true})

-- Snippets
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

EOF

command! Focus call Focus()
let g:focused = 0
function! Focus()
  if g:focused == 0
    " magically enable focus stuff
    let g:focused = 1
    " enable distraction-free with a 120 column wide buffer
    :Goyo 120
    set filetype=markdown
    " disable CodeiumDisable
    :CodeiumDisable
  else
    " disable all of it again
    let g:focused = 0
    :Goyo
    " disable CodeiumDisable
    :CodeiumEnable
  endif
endfunction


autocmd FileType asc call Focus()
