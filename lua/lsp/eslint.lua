-- ESLint LSP (vscode-eslint): диагностика + автофиксы для JS/TS.
-- Форматирование остаётся за prettier (conform); eslint здесь не форматирует.
vim.lsp.config("eslint", {
  on_attach = function(client, bufnr)
    require("lsp.default_on_attach")(client, bufnr)

    -- Автофикс ВСЕХ ESLint-проблем ПО КЛАВИШЕ (не на сохранение — у тебя auto-save).
    -- Бьём напрямую в code action source.fixAll.eslint, без гонки с сохранением.
    vim.keymap.set("n", "<space>ef", function()
      vim.lsp.buf.code_action({
        context = { only = { "source.fixAll.eslint" }, diagnostics = {} },
        apply = true,
      })
    end, { buffer = bufnr, silent = true, desc = "ESLint: fix all" })
  end,
})

vim.lsp.enable("eslint", true)
