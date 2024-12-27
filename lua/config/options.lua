-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = ","

-- From old vim
--
-- General Settings
vim.opt.eol = true -- Ensure files end with a newline (good for version control)
vim.opt.autoread = true -- Reload files if changed outside Neovim
vim.opt.ignorecase = true -- Make searches case-insensitive
vim.opt.smartcase = true -- Use case-sensitive search if uppercase is present
vim.opt.hlsearch = true -- Highlight search results
vim.opt.incsearch = true -- Show search matches incrementally
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.clipboard = "unnamedplus" -- Use the system clipboard for copy-paste

-- Command Line
vim.opt.wildmenu = true -- Enhanced command-line navigation
vim.opt.backspace = { "indent", "eol", "start" } -- More intuitive backspace behavior

-- Autocomplete
vim.opt.completeopt = { "menuone", "noselect" } -- Fine-tune autocomplete behavior
vim.opt.splitbelow = true -- Open horizontal splits below the current window

-- Visual Settings
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.number = true -- Show absolute line number for the current line
vim.opt.numberwidth = 2
vim.opt.laststatus = 3 -- Use a global status line (modern Neovim default)
vim.opt.shiftwidth = 4 -- Use 4 spaces for each indentation level
vim.opt.softtabstop = 4 -- Insert 4 spaces when Tab is pressed
vim.opt.tabstop = 4 -- Render a tab character as 4 spaces
vim.opt.autoindent = true -- Copy the indentation from the previous line
vim.opt.smartindent = true -- Add extra indentation for code structures
vim.opt.wrap = true -- Wrap long lines
vim.opt.spell = false -- Disable spell checking

vim.opt.termguicolors = true
vim.opt.backspace = { "indent", "eol", "start" }

-- this remove the trailing dashes when typing
vim.opt.list = false

-- Add line number size configuration
vim.opt.signcolumn = "yes:1"  -- Fixed-width sign column

vim.api.nvim_create_autocmd("ColorScheme", {
callback = function()
    -- Make line numbers smaller and darker
    vim.api.nvim_set_hl(0, "LineNr", {
    fg = "#505050",  -- darker gray color
    bold = false,
    italic = false,
    cterm = { bold = false },
    ctermfg = "darkgray",
    })
    -- Also adjust the current line number appearance
    vim.api.nvim_set_hl(0, "CursorLineNr", {
    fg = "#707070",  -- slightly lighter than normal line numbers
    bold = false,
    italic = false,
    cterm = { bold = false },
    ctermfg = "gray",
    })
end,
})
