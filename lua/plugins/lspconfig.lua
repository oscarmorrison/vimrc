return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      vtsls = {
        filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
      },
    },
  },
}
