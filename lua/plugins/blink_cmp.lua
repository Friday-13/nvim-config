return {
  "saghen/blink.cmp",
  version = "*", -- релизный тег
  build = "cargo build --release", -- собирает Rust-матчер локально (rustc/cargo есть в системе)
  event = "InsertEnter",
  opts = {
    keymap = {
      preset = "enter", -- <CR> подтверждает выбор (как было в nvim-cmp)
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
