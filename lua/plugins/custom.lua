return {
  {
    "tpope/vim-surround",
    event = "BufReadPost",
  },
  {
    "mg979/vim-visual-multi",
    branch = "master",
  },
  {
    "chriskempson/base16-vim",
    lazy = false, -- Load immediately to apply the theme
    priority = 1000, -- Ensure it loads before other plugins
    config = function()
      -- Fetch the $BASE16_THEME environment variable
      local base16_theme = os.getenv("BASE16_THEME") or "oceanicnext"

      -- Apply the theme if it's not already applied
      if vim.g.colors_name ~= "base16-" .. base16_theme then
        vim.g.base16colorspace = 256 -- Use 256-color space
        vim.cmd("colorscheme base16-" .. base16_theme)
      end
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
  {
    "folke/zen-mode.nvim",
    opt = {
      window = {
        width = 120,
        options = {
          number = false,
          relativenumber = false,
        },
      },
    },
  },
  {
    "glidenote/newdayone.vim",
  },
}
