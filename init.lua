-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local focused = false -- Single declaration

local function Focus()
  if not focused then
    focused = true
    vim.cmd("setlocal spell") -- Enable spell checking
    vim.cmd("Copilot disable") -- Disable Copilot
    vim.bo.filetype = "markdown" -- Set filetype to markdown

    -- Enter Zen Mode
    require("zen-mode").toggle({
      window = {
        width = 120, -- Set the desired width for Zen Mode
        options = {
          number = false, -- Disable line numbers
          relativenumber = false, -- Disable relative line numbers
        },
      },
    })
    -- Disable completion suggestions
    vim.b.completion_enabled = false -- Disable buffer-specific completions
    require("blink.cmp").setup({
      completion = {
        enabled = false,
      },
      autocomplete = false,
    })
    -- Remove headers and footers
    vim.opt.laststatus = 0 -- Disable status line
    vim.opt.showtabline = 0 -- Disable tabline
  else
    focused = false

    -- Exit Zen Mode
    require("zen-mode").toggle()

    require("blink-cmp").setup({
      completion = {
        enabled = true,
      },
      autocomplete = true,
    })

    -- Restore headers and footers
    vim.opt.laststatus = 2 -- Re-enable status line
    vim.opt.showtabline = 2 -- Re-enable tabline
    -- Enable Copilot and completions
    vim.cmd("Copilot enable") -- Re-enable Copilot
  end
end

vim.api.nvim_create_user_command("Focus", Focus, {})
