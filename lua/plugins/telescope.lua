return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
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
    end
}
