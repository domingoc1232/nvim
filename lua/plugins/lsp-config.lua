return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "pyright", "clangd"} -- could try "pylsp"
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Use the new vim.lsp.config API instead of require('lspconfig')
      local servers = { 'lua_ls', 'ts_ls', 'pyright', 'clangd' }

      for _, server in ipairs(servers) do
        vim.lsp.config[server] = {
          capabilities = capabilities,
        }
        vim.lsp.enable(server)
      end

      vim.diagnostic.config({
        virtual_text = {
          -- prefix = "●", -- Could be "■", "▎", "x"
          spacing = 2,
          -- severity = { min = vim.diagnostic.severity.ERROR },
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
 
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
 
    end
  }
}
