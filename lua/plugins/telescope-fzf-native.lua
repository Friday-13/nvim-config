return {
  'nvim-telescope/telescope-fzf-native.nvim',
  build = 'make',
  cond = vim.fn.executable("make") == 1,
  dependencies = { "nvim-telescope/telescope.nvim" }, -- fzf зависит от telescope
  config = function()
    local ok, telescope = pcall(require, "telescope")
    if ok then
      telescope.load_extension("fzf")
    end
  end,

}

