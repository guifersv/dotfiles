return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    { "j-hui/fidget.nvim",    opts = {} },
    "saghen/blink.cmp",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    ------------------------------------------------------------
    -- LSP Attach (keymaps & features)
    ------------------------------------------------------------
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or "n"
          vim.keymap.set(mode, keys, func, {
            buffer = event.buf,
            desc = "LSP: " .. desc,
          })
        end

        map("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
        map("gr", require("telescope.builtin").lsp_references, "Goto References")
        map("gI", require("telescope.builtin").lsp_implementations, "Goto Implementation")
        map("gT", require("telescope.builtin").lsp_type_definitions, "Goto Type")
        map("<leader>lr", vim.lsp.buf.rename, "Rename")
        map("<leader>la", vim.lsp.buf.code_action, "Code Action", { "n", "x" })
        map("K", vim.lsp.buf.hover, "Hover")

        local client = vim.lsp.get_client_by_id(event.data.client_id)

        if client and client.supports_method("textDocument/inlayHint") then
          map("<leader>th", function()
            vim.lsp.inlay_hint.enable(
              not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf }
            )
          end, "Toggle Inlay Hints")
        end
      end,
    })

    ------------------------------------------------------------
    -- Diagnostics
    ------------------------------------------------------------
    vim.diagnostic.config {
      severity_sort = true,
      float = { border = "rounded" },
      virtual_text = { spacing = 2, source = "if_many" },
      underline = true,
    }

    ------------------------------------------------------------
    -- Blink capabilities
    ------------------------------------------------------------
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    ------------------------------------------------------------
    -- Servers
    ------------------------------------------------------------
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

    ------------------------------------------------------------
    -- Mason install
    ------------------------------------------------------------
    require("mason-tool-installer").setup {
      ensure_installed = vim.tbl_keys(servers),
    }

    ------------------------------------------------------------
    -- LSP setup
    ------------------------------------------------------------
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
