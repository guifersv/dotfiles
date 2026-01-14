return {
  {
    'saecki/crates.nvim',
    tag = 'stable',
    config = function()
      require('crates').setup()
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    ft = "rust",
  }
}
