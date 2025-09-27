return {
  'numToStr/Comment.nvim',
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require('Comment').setup()
    -- Use Ctrl+/ instead 
    vim.keymap.set('n', '<leader>c', '<Plug>(comment_toggle_linewise_current)', { desc = 'Toggle comment' })
    vim.keymap.set('v', '<leader>c', '<Plug>(comment_toggle_linewise_visual)', { desc = 'Toggle comment' })   
  end,
}
