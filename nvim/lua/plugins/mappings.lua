return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- second key is the lefthand side of the map
          ["L"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
          ["H"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
          ["<leader>mr"] = { "<cmd>Dotnet run<cr>", desc = "Dotnet run" },
          ["<leader>mw"] = { "<cmd>Dotnet watch<cr>", desc = "Dotnet watch" },
          ["<leader>mt"] = { "<cmd>Dotnet test<cr>", desc = "Dotnet test" },
          ["<leader>mb"] = { "<cmd>Dotnet build<cr>", desc = "Dotnet build" },
          ["<leader>mv"] = { "<cmd>Dotnet project view<cr>", desc = "Dotnet project view" },
          ["<leader>ar"] = { "<cmd>Crun<cr>", desc = "Cargo run" },
          ["<leader>ab"] = { "<cmd>Cbuild<cr>", desc = "Cargo build" },
          ["<leader>at"] = { "<cmd>Ctest<cr>", desc = "Cargo test" },
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
        },
        i = {
          ["jk"] = { "<Esc>", desc = "Exit insert mode" },
          ["jj"] = { "<Esc>", desc = "Exit insert mode" },
          ["<C-b>"] = { "<ESC>^i", desc = "move beginning of line" },
          ["<C-e>"] = { "<End>", desc = "move end of line" },
          ["<C-h>"] = { "<Left>", desc = "move left" },
          ["<C-l>"] = { "<Right>", desc = "move right" },
          ["<C-j>"] = { "<Down>", desc = "move down" },
          ["<C-k>"] = { "<Up>", desc = "move up" },
        },
      },
    },
  },
}
