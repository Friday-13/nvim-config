-- ruff: линтинг + форматирование Python (Rust, очень быстрый).
-- Заменяет black (formatter) и isort (правила "I" + organize imports).
vim.lsp.config("ruff", {
  on_attach = function(client, bufnr)
    -- hover отдаём basedpyright; форматирование и сортировку импортов делает
    -- conform (ruff_format + ruff_organize_imports). ruff-LSP тут только линтинг + code actions.
    client.server_capabilities.hoverProvider = false
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    require("lsp.default_on_attach")(client, bufnr)
  end,
  init_options = {
    settings = {
      lint = {
        -- включаем isort-правила, чтобы несортированные импорты подсвечивались
        extendSelect = { "I" },
      },
    },
  },
})

vim.lsp.enable("ruff", true)
