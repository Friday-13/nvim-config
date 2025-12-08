print('pyright config')
vim.lsp.config("pyright", {
  on_attach = require("lsp.default_on_attach"),
  flags = {
    debounce_text_changes = 150,
  }
})

vim.lsp.enable("pyright", true)
