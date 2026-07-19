-- basedpyright: типы, hover, автодополнение (форк pyright, быстрее и строже).
-- Линтинг и форматирование отданы ruff (см. lsp/ruff.lua).
vim.lsp.config("basedpyright", {
  on_attach = require("lsp.default_on_attach"),
  settings = {
    basedpyright = {
      -- организацию импортов делает ruff — чтобы не было двух источников
      disableOrganizeImports = true,
      analysis = {
        -- basedpyright по умолчанию "recommended" (очень строго и шумно).
        -- "standard" ближе к привычному pyright; поднимай до "strict" при желании.
        typeCheckingMode = "standard",
        diagnosticMode = "openFilesOnly",
      },
    },
  },
})

vim.lsp.enable("basedpyright", true)
