return {
    "neovim/nvim-lspconfig",
    config = function()
      local nvim_lsp = require("lspconfig")
      local servers = { 'pyright', 'rust_analyzer'}
      for _, lsp in ipairs(servers) do
        nvim_lsp[lsp].setup {
          on_attach = require("lsp.default_on_attach"),
          flags = {
            debounce_text_changes = 150,
          }
        }
      end
    end
}
