return {
  "karloskar/poetry-nvim",
  ft = "python",
  config = function()
    require("poetry-nvim").setup()
  end
}
