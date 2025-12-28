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
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
        },
      },
    },
  },
}
