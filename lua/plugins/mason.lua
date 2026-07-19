return {
  {
    "williamboman/mason.nvim",
    -- НЕ ленивый: mason должен прописать свой bin в PATH до того, как
    -- стартуют LSP-серверы и none-ls полезет искать eslint_d/prettier/clang-format.
    lazy = false,
    priority = 100, -- раньше остальных eager-плагинов, но после colorscheme (1000)
    build = ":MasonUpdate",
    opts = {
      -- PATH = "prepend" (дефолт): mason-версии бинарников имеют приоритет над системными
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    lazy = false,
    opts = {
      -- имена — это mason-пакеты (не имена lspconfig-серверов)
      ensure_installed = {
        -- LSP
        "basedpyright",               -- python: типы/hover
        "ruff",                       -- python: линтинг + формат (заменяет black+isort)
        "typescript-language-server", -- ts_ls
        "lua-language-server",        -- lua_ls
        "html-lsp",                   -- html
        "css-lsp",                    -- cssls
        "stylelint-lsp",              -- stylelint_lsp
        "clangd",
        -- инструменты none-ls
        "eslint_d",
        "prettier",
        "clang-format",
      },
      -- ставить недостающее при старте, но не запускать блокирующе
      run_on_start = true,
      -- небольшая задержка, чтобы не мешать первичной отрисовке
      start_delay = 3000,
    },
  },
}
