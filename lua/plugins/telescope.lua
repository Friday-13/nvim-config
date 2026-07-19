return {
    'nvim-telescope/telescope.nvim',
    cmd = "Telescope",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim',
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup{
        defaults = {
          file_ignore_patterns = {
            "node_modules",
            "build",
            "Drivers",
            "Middlewares"
          }
        }
      }
      pcall(telescope.load_extension, "fzf")
    end
}
