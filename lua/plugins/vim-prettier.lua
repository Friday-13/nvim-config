return {
"prettier/vim-prettier",
  build = "npm install --frozen-lockfile --production",
  init = function()
      vim.g.prettier_autoformat = 0
      vim.g.prettier_autoformat_require_pragma = 0
    end,
}
