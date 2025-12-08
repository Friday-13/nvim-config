vim.lsp.config("clangd", {
  on_attach = require("lsp.default_on_attach"),
  flags = {
    debounce_text_changes = 150,
  },
  cmd = { "clangd", "--background-index", "--clang-tidy", "--completion-style=detailed" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = vim.fs.root(0, { "compile_commands.json", ".git" })
})

vim.lsp.enable("clangd", true)
