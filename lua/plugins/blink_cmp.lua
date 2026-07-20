return {
  "saghen/blink.cmp",
  -- ВАЖНО: релиз v1.10.2 не поддерживает Neovim 0.12 (у нас 0.12.4).
  -- В 0.12 отсутствующая LSP-документация приходит как vim.NIL (не nil), и
  -- старый blink совал её в treesitter-подсветку документации →
  -- "treesitter.lua:197: attempt to call method 'range' (a nil value)".
  -- Пинимся на коммит с фиксом vim.NIL (последний из ветки v1 до перехода на
  -- blink.cmp v2, которая тянет отдельную зависимость saghen/blink.lib).
  -- Когда выйдет релиз > 1.10.2 с поддержкой 0.12 — вернуть version = "*".
  commit = "90d14caca4ae557665ab105080c27d5f289a2e30",
  build = "cargo build --release", -- собирает Rust-матчер локально (rustc/cargo есть в системе)
  event = "InsertEnter",
  opts = {
    keymap = {
      preset = "enter", -- <CR> подтверждает выбор (как было в nvim-cmp)
      -- <C-Space>: показать меню автодополнения и справку (документацию),
      -- повторное нажатие прячет окно документации. Раньше <C-Space> держал
      -- incremental_selection из treesitter — после миграции на main он освободился.
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      -- прокрутка документации на привычных <C-d>/<C-f>
      ["<C-d>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      -- остальное из preset "default": <C-Space> показать, <C-e> закрыть,
      -- <C-n>/<C-p> навигация, <C-y> принять, <C-k> подпись, <Tab>/<S-Tab> сниппеты
    },
    completion = {
      -- как раньше (autocomplete = false): popup не выскакивает сам, вызывается <C-Space>
      menu = { auto_show = false },
      documentation = { auto_show = true, auto_show_delay_ms = 200 },
    },
    -- встроенный signature help — заменяет lsp_signature.nvim
    signature = { enabled = true },
    -- источники по умолчанию: lsp, path, snippets, buffer (больше, чем было)
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
