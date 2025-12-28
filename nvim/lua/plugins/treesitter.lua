---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "c_sharp",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
