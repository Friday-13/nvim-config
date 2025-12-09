-- colors for LSP messages in code
vim.opt.termguicolors = true
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#F28B82", bg = "#3B1F1F" })
vim.api.nvim_set_hl(0, "DiagnosticWarn",  { fg = "#FFD480", bg = "#3B2F1F" })
vim.api.nvim_set_hl(0, "DiagnosticInfo",  { fg = "#A7C7E7", bg = "#1F2F3B" })
vim.api.nvim_set_hl(0, "DiagnosticHint",  { fg = "#81C784", bg = "#1F3B2F"})

-- color for Telescope window
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none", fg = "#7a7a7a" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none", fg = "#7a7a7a",  })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "none", fg = "#7a7a7a", })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "none", fg = "#7a7a7a",  })
