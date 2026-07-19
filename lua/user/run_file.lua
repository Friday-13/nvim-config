local function map_run_file(ft, cmd)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = ft,
    callback = function()
      vim.keymap.set(
        "n",
        "<C-h>",
        function()
          vim.cmd("w")
          vim.cmd("split | terminal "..cmd.." " .. vim.fn.shellescape(vim.fn.expand("%")))
        end,
        {buffer = true}
      )

      vim.keymap.set(
        "i",
        "<C-h>",
        function()
          vim.cmd("w")
          vim.cmd("split | terminal "..cmd.." " .. vim.fn.shellescape(vim.fn.expand("%")))
        end,
        {buffer = true}
      )
    end
  })
end

map_run_file("python", "python")
map_run_file("c", "gcc % -o out && ./out")
map_run_file("sh", "bash")
