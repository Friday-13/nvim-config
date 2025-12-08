vim.api.nvim_create_user_command("Bclose", function(opts)
  local bufnr = vim.api.nvim_get_current_buf()
  local modified = vim.bo[bufnr].modified
  local force = opts.bang == "!"

  if modified and not force then
    vim.notify("Buffer has unsaved changes", vim.log.levels.WARN)
    return
  end

  vim.api.nvim_buf_delete(bufnr, { force = force })
end, { bang = true })

