return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<space>f",
      function()
        -- lsp_format = "fallback": для ft без форматтера (напр. lua) откатывается на LSP
        require("conform").format({ async = false, lsp_format = "fallback" })
      end,
      mode = "n",
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      -- python: сначала сортировка импортов (замена isort), затем формат (замена black)
      python = { "ruff_organize_imports", "ruff_format" },
      -- frontend
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      vue = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      html = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      -- C
      c = { "clang_format" },
      cpp = { "clang_format" },
    },
    -- format_on_save намеренно выключен: у тебя агрессивный auto-save, автоформат на
    -- каждое сохранение мешал бы. Форматируем вручную по <space>f.
  },
}
