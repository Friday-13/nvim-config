vim.lsp.config("stylelint_lsp", {
  on_attach = require("lsp.default_on_attach"),
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    stylelintplus = {
      -- autoFixOnSave = true,
      -- autoFixOnFormat = true,
    },
  }
})

vim.lsp.enable("stylelint_lsp", true)

