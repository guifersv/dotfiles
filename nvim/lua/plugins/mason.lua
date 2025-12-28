---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        -- install formatters
        "csharpier",

        -- install debuggers
        "netcoredbg",
      },
    },
  },
}
