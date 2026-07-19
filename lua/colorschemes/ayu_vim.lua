return {
 "ayu-theme/ayu-vim",
 lazy = false,
 enabled = true,
 priority = 1000,
 config = function()
   vim.g.ayucolor = "dark"
   vim.cmd.colorscheme("ayu")
   vim.api.nvim_set_hl(0, "Visual", {
   bg = "#3E4B59",
 })
 end
}
