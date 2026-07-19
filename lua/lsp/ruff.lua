-- ruff: линтинг + форматирование Python (Rust, очень быстрый).
-- Заменяет black (formatter) и isort (правила "I" + organize imports).
vim.lsp.config("ruff", {
  on_attach = function(client, bufnr)
    -- hover/definition/completion отдаём basedpyright, ruff только линтит и форматирует
    client.server_capabilities.hoverProvider = false
    require("lsp.default_on_attach")(client, bufnr)

    -- organize imports (замена isort) — отдельным аккордом, без гонки с форматированием
    vim.keymap.set("n", "<space>oi", function()
      vim.lsp.buf.code_action({
        context = { only = { "source.organizeImports.ruff" }, diagnostics = {} },
        apply = true,
      })
    end, { buffer = bufnr, silent = true, desc = "Ruff: organize imports" })
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
