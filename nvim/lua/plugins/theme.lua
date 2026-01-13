return {
  'uhs-robert/oasis.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('oasis').setup { transparent = true }
    vim.cmd.colorscheme 'oasis-cactus'
  end,
}
