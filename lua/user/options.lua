vim.opt.mouse = 'a' -- enable mouse
vim.opt.number = true
vim.opt.colorcolumn = '79'
vim.opt.swapfile = false
vim.opt.scrolloff = 7


vim.opt.softtabstop = 4
vim.opt.autoindent = true
vim.opt.fileformat = 'unix'
vim.opt.encoding = 'utf-8'


-- for tabulation
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.shiftwidth=2

vim.cmd([[filetype indent on]])


-- leader bind to space       
vim.g.mapleader = ","

-- netrw file explorer settings
vim.g.netrw_banner = 1 -- hide banner above files
vim.g.netrw_liststyle = 3 -- tree instead of plain view
vim.g.netrw_browse_split = 0  -- vertical split window when Enter pressed on file

vim.opt.relativenumber = true

vim.g.transparent_enabled = true

vim.filetype.add({
  extension = {
    md = "markdown",
    MD = "markdown",
  },
})

-- autocomplete options
vim.opt.completeopt = { "menuone", "noselect" }

