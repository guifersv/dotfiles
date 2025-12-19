return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        ensure_installed = {
          "css",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "toml",
          "vim",
          "vimdoc",
          "xml",
          "yaml",
          "c_sharp",
        },
      },
    },

    {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },

  { "nvim-tree/nvim-tree.lua", enabled = false },

  {
    "chrisgrieser/nvim-spider",
    lazy = true,
    config = function()
      require("spider").setup()
    end,
  },

  {
    "nvim-mini/mini.move",
    lazy = false,
    version = false,
    config = function()
      require("mini.move").setup()
    end,
  },

  {
    "nvim-mini/mini.ai",
    lazy = false,
    version = false,
    config = function()
      require("mini.ai").setup()
    end,
  },

  {
    "nvim-mini/mini.surround",
    lazy = false,
    version = false,
    config = function()
      require("mini.surround").setup {
        mappings = {
          add = "gsa", -- Add surrounding in Normal and Visual modes
          delete = "gsd", -- Delete surrounding
          replace = "gsr", -- Replace surrounding

          suffix_last = "l", -- Suffix to search with "prev" method
          suffix_next = "n", -- Suffix to search with "next" method
        },
      }
    end,
  },

}
