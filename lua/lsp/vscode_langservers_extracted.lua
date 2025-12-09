local capabilities = vim.lsp.protocol.make_client_capabilities();
vim.lsp.config("html", {
  on_attach = require("lsp.default_on_attach"),
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = capabilities,
})

vim.lsp.config("cssls", {
  on_attach = require("lsp.default_on_attach"),
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = capabilities,
})

vim.lsp.enable("html", true)
vim.lsp.enable("cssls", true)
