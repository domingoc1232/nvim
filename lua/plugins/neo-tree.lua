return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",    
    "MunifTanjim/nui.nvim",
  },
  config = function()
    -- Set a keymap to open and close the file explorer
    -- The '\' key is a common choice for this
    vim.keymap.set('n', '<leader>n', '<cmd>Neotree toggle<cr>', { desc = "Explorer (NeoTree)" })
  end,
}
