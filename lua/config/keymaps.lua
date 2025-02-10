-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- short cut keys for command CtrlSF Search
vim.keymap.set("n", "<leader>sf", ":CtrlSF <C-R><C-W><CR>", { silent = true })

-- shortcut to find trailing whitespace
vim.keymap.set("n", "<leader>w", function()
  -- The actual search for trailing whitespace
  vim.cmd("/\\s\\+$<CR>")
end, { desc = "Search for trailing whitespace" })
