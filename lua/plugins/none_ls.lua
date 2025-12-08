return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvimtools/none-ls-extras.nvim",
    "prettier/vim-prettier"
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
    debug = true,
    sources = {
        require("none-ls.diagnostics.eslint_d"),
        require("none-ls.code_actions.eslint_d"),
        -- null_ls.builtins.diagnostics.eslint_d,
        -- null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.prettier
    },
    on_attach = require("lsp.default_on_attach")
    })
  end
}
