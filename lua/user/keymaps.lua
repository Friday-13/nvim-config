vim.keymap.set("i", "jk", "<Esc>", { noremap = true })
vim.keymap.set("n", ",<space>", ":nohlsearch<CR>")

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true }) -- TODO: check this line

-- Go to next or prev tab by H and L accordingly
vim.keymap.set("n", "H", "gT")
vim.keymap.set("n", "L", "gt")

-- Buffer keys
local opts = { silent = true, noremap = true }

-- close buffer
vim.keymap.set("n", "<Leader>bd", ":Bclose<CR>", opts)
vim.keymap.set("n", "gw", ":Bclose<CR>", opts)

-- navigate buffer
vim.keymap.set("n", "gn", ":bn<CR>", opts)
vim.keymap.set("n", "gp", ":bp<CR>", opts)

--prettier
vim.keymap.set("n", "<Leader>p", "<Plug>(Prettier)")
vim.keymap.set("x", "<Leader>p", "<Plug>(Prettier)")

--neoformat
vim.keymap.set("n", "ff", ":Neoformat<CR>", { silent = true })
