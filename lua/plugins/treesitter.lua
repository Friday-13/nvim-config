return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  -- грузим при открытии файла: highlight должен быть готов к первой отрисовке
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSInstall", "TSUpdate", "TSUpdateSync", "TSInstallInfo" },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        -- backend
        "python", "lua",
        -- frontend
        "javascript", "typescript", "tsx",
        "html", "css", "scss", "json", "jsonc",
        -- C
        "c", "cpp",
        -- прочее полезное
        "bash", "yaml", "toml", "markdown", "markdown_inline",
        "vim", "vimdoc", "gitignore", "dockerfile", "query",
      },
      auto_install = true, -- доустанавливать парсер при открытии незнакомого ft (нужен компилятор — gcc есть)
      sync_install = false,

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      -- treesitter-отступы. Экспериментально; для Python иногда спорит со smartindent —
      -- если начнёт мешать, добавь ft в disable = { "python" }.
      indent = {
        enable = true,
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",   -- нормальный режим, с cmp <C-Space> (insert) не конфликтует
          node_incremental = "<C-space>",
          scope_incremental = "<C-s>",
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
