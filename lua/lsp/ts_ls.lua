local buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        -- silent = true,
    })
end

local default_on_attach = require("lsp.default_on_attach")

vim.lsp.config("ts_ls", {
  on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        -- local ts_utils = require("nvim-lsp-ts-utils")
        -- ts_utils.setup({})
        -- ts_utils.setup_client(client)
        buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
        buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
        buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")
        default_on_attach(client, bufnr)
  end,
  dependencies = { "nvim-lsp-ts-utils" },
})

vim.lsp.enable("ts_ls", true);
