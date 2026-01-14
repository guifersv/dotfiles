require("config.options")
require("config.mappings")
require("config.lazy")

require 'nvim-treesitter'.install { 'rust', 'toml' }

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'rust' },
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    vim.keymap.set(
      "n",
      "<leader>aa",
      function()
        vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
        -- or vim.lsp.buf.codeAction() if you don't want grouping.
      end,
      { silent = true, buffer = bufnr }
    )
    vim.keymap.set(
      "n",
      "K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
      function()
        vim.cmd.RustLsp({ 'hover', 'actions' })
      end,
      { silent = true, buffer = bufnr }
    )
    vim.treesitter.start()
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo.foldmethod = 'expr'
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
