return {
"Pocco81/auto-save.nvim",
config = function()
  local autoSave = require("auto-save")
  autoSave.setup(
    {
      debounce_delay = 2000, -- delay after which a pending save is executed
    }
  )
end
}
