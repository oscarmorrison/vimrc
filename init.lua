-- init.lua

-- 1. Bootstrap LazyVim (or your chosen lazy config).
require("config.lazy")

local focused = false

local function Focus()
  if not focused then
    -- Enter focus mode
    focused = true

    -- Disable completions in this buffer
    local cmp = require("cmp")
    cmp.setup.buffer({
      enabled = false,
      sources = {},
    })

    -- Stop all active LSPs
    vim.cmd("LspStop")

    -- Disable mini.animate’s blinking
    require("mini.animate").setup({
      cursor = { enable = false },
      scroll = { enable = false },
      resize = { enable = false },
      open   = { enable = false },
      close  = { enable = false },
    })

    -- Optionally enable spell checking + set markdown
    vim.cmd("setlocal spell")
    vim.bo.filetype = "markdown"

    -- Enter Zen Mode
    require("zen-mode").toggle({
      window = {
        width = 120,
        options = {
          number         = false,
          relativenumber = false,
        },
      },
    })

    -- Hide status line + tab line
    vim.opt.laststatus = 0
    vim.opt.showtabline = 0

  else
    -- Exit focus mode
    focused = false

    -- Re-enable completions
    local cmp = require("cmp")
    cmp.setup.buffer({ enabled = true })

    -- Restart LSP
    vim.cmd("LspStart")

    -- Re-enable mini.animate
    require("mini.animate").setup()

    -- Exit Zen Mode
    require("zen-mode").toggle()

    -- Restore status line + tab line
    vim.opt.laststatus = 2
    vim.opt.showtabline = 2
  end
end

-- Create :Focus command
vim.api.nvim_create_user_command("Focus", Focus, {})