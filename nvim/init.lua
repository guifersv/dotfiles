require("config.options")
require("config.mappings")
require("config.lazy")

require'nvim-treesitter'.install { 'rust' }
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'rust' },
  callback = function()
    vim.treesitter.start()
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo.foldmethod = 'expr'
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
