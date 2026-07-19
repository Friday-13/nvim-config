vim.keymap.set("i", "jk", "<Esc>", { noremap = true })
vim.keymap.set("n", ",<space>", ":nohlsearch<CR>")

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true }) -- TODO: check this line

-- commenting: gc/gcc/visual gc — встроены в neovim 0.10+ (Comment.nvim больше не нужен).
-- gco/gcO — паритет с Comment.nvim: добавить закомментированную строку ниже/выше.
vim.keymap.set("n", "gco", "o<C-o>gcc", { remap = true, desc = "Comment line below" })
vim.keymap.set("n", "gcO", "O<C-o>gcc", { remap = true, desc = "Comment line above" })

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

--telescope
vim.keymap.set("n", "<Leader>f", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<Leader>g", "<cmd>Telescope live_grep<cr>")
