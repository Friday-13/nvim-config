return {
  "nvim-treesitter/nvim-treesitter",
  -- Ветка main — единственная, что поддерживает Neovim 0.11+/0.12 (у нас 0.12.4).
  -- Ветка master заморожена и под 0.12 падает: её directive-хендлеры написаны
  -- под старый API (см. коммит миграции). main — это полный rewrite с другим API.
  branch = "main",
  lazy = false, -- ВАЖНО: main НЕ поддерживает ленивую загрузку (см. README).
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup()

    -- На main нет опции ensure_installed — список парсеров ставим сами.
    -- install() работает асинхронно; парсеры качаются с готовым parser.c и
    -- компилируются gcc (tree-sitter-cli нужен только для «редких» грамматик).
    local ensure = {
      -- backend
      "python", "lua",
      -- frontend
      "javascript", "typescript", "tsx",
      "html", "css", "scss", "json",
      -- C
      "c", "cpp",
      -- прочее полезное
      "bash", "yaml", "toml", "markdown", "markdown_inline",
      "vim", "vimdoc", "gitignore", "dockerfile", "query",
    }
    require("nvim-treesitter").install(ensure)

    -- На main отдельного парсера jsonc нет — используем json для .jsonc-файлов.
    vim.treesitter.language.register("json", "jsonc")

    -- Подсветка на main НЕ включается опцией highlight = { enable = true } —
    -- её запускает vim.treesitter.start() (реализация подсветки живёт в самом Neovim).
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("user_treesitter", { clear = true }),
      callback = function(args)
        local buf = args.buf
        local ft = vim.bo[buf].filetype
        local lang = vim.treesitter.language.get_lang(ft) or ft

        -- Аналог auto_install: если парсер доступен, но не установлен —
        -- доустановить (асинхронно). Подсветка включится при следующем открытии.
        local installed = require("nvim-treesitter.config").get_installed("parsers")
        if not vim.tbl_contains(installed, lang) then
          if vim.tbl_contains(require("nvim-treesitter").get_available(), lang) then
            require("nvim-treesitter").install({ lang })
          end
          return
        end

        -- Подсветка.
        if pcall(vim.treesitter.start, buf, lang) then
          -- treesitter-отступы (экспериментально). Если для Python начнёт спорить
          -- со smartindent — просто убрать эту строку.
          vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })

    -- Заметка: incremental_selection в ветке main удалён. Прежние маппинги
    -- (<C-space>/<bs>/<C-s>) больше не работают. Если понадобится — подключить
    -- отдельный плагин (nvim-treesitter-textobjects или mini.ai).
  end,
}
