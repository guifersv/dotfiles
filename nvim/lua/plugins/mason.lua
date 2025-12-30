---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        -- install formatters
        "csharpier",

        -- install debuggers
        "netcoredbg",
      },
    },
  },
}
