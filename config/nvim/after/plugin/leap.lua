vim.keymap.set({'n', 'x', 'o'}, '<leader>s', function ()
  require('leap').leap { target_windows = { vim.api.nvim_get_current_win() } }
end)
