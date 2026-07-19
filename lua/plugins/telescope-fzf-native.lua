return {
  'nvim-telescope/telescope-fzf-native.nvim',
  build = 'make',
  cond = vim.fn.executable("make") == 1,
  lazy = true, -- грузится как зависимость telescope, расширение подключается в telescope.lua
}
