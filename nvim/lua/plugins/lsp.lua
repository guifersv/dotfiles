return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "mason.nvim", opts = {} },
    "mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    { "j-hui/fidget.nvim", opts = {} },
    "saghen/blink.cmp",
  },
  config = function()
    --------------------------------------------------------------------
    -- Diagnostics
    --------------------------------------------------------------------
    vim.diagnostic.config {
      severity_sort = true,
      float = { border = "rounded" },
      virtual_text = { spacing = 2, source = "if_many" },
    }

    --------------------------------------------------------------------
    -- Blink capabilities
    --------------------------------------------------------------------
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    --------------------------------------------------------------------
    -- LSP servers
    --------------------------------------------------------------------
    local servers = {
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = { command = "clippy" },
            procMacro = { enable = true },
          },
        },
      },

      taplo = {
        settings = {
          evenBetterToml = {
            schema = { enabled = true },
          },
        },
      },

      lua_ls = {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            completion = { callSnippet = "Replace" },
          },
        },
      },
    }

    --------------------------------------------------------------------
    -- Mason install
    --------------------------------------------------------------------
    require("mason-tool-installer").setup {
      ensure_installed = vim.tbl_keys(servers),
    }

    --------------------------------------------------------------------
    -- Mason LSP setup
    --------------------------------------------------------------------
    require("mason-lspconfig").setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend(
            "force",
            {},
            capabilities,
            server.capabilities or {}
          )
          require("lspconfig")[server_name].setup(server)
        end,
      },
    }
  end,
}
