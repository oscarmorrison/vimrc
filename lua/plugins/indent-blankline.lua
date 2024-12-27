return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- Function to dynamically calculate colors based on the background
      local function setup_highlight_groups()
        local background = vim.o.background -- 'dark' or 'light'
        if background == "dark" then
          -- Dark theme colors
          vim.api.nvim_set_hl(0, "IndentStripe1", { bg = "#1B2B34" }) -- Original dark background
          vim.api.nvim_set_hl(0, "IndentStripe2", { bg = "#232E38" }) -- Slightly lighter
        else
          -- Light theme colors
          vim.api.nvim_set_hl(0, "IndentStripe1", { bg = "#FDF6E3" }) -- Light theme background
          vim.api.nvim_set_hl(0, "IndentStripe2", { bg = "#F6EFD9" }) -- Slightly darker
        end
      end

      -- Set up highlight groups for the current colorscheme
      setup_highlight_groups()

      -- Autocmd to update highlight groups when the colorscheme changes
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = setup_highlight_groups,
      })

      -- Configure indent-blankline.nvim
      require("ibl").setup({
        indent = {
          highlight = { "IndentStripe1", "IndentStripe2" }, -- Alternating subtle backgrounds
          char = "", -- No character, only background
        },
        whitespace = {
          highlight = { "IndentStripe1", "IndentStripe2" },
          remove_blankline_trail = false,
        },
        scope = { enabled = false },
      })
    end,
  },
}
