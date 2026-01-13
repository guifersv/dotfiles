local set = vim.keymap.set

set({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })
set('n', '<Esc>', '<cmd>nohlsearch<CR>')
set('t', '<C-x>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- insert
set('i', 'jk', '<Esc>')
set('i', '<C-b>', '<Esc>^i', { desc = 'move beginning of line' })
set('i', '<C-e>', '<End>', { desc = 'move end of line' })
set('i', '<C-h>', '<Left>', { desc = 'move left' })
set('i', '<C-l>', '<Right>', { desc = 'move right' })
set('i', '<C-j>', '<Down>', { desc = 'move down' })
set('i', '<C-k>', '<Up>', { desc = 'move up' })

-- windows
set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
set('n', '<C-Up>', '<cmd>resize +4<cr>', { desc = 'Increase Window Height' })
set('n', '<C-Down>', '<cmd>resize -4<cr>', { desc = 'Decrease Window Height' })
set('n', '<C-Left>', '<cmd>vertical resize -4<cr>', { desc = 'Decrease Window Width' })
set('n', '<C-Right>', '<cmd>vertical resize +4<cr>', { desc = 'Increase Window Width' })

set('n', '<leader>q', '<cmd>qa<cr>', { desc = 'Close All' })

-- tabs
set('n', '<leader><tab>t', '<cmd>tablast<cr>', { desc = 'Last Tab' })
set('n', '<leader><tab>o', '<cmd>tabonly<cr>', { desc = 'Close Other Tabs' })
set('n', '<leader><tab>f', '<cmd>tabfirst<cr>', { desc = 'First Tab' })
set('n', '<leader><tab><tab>', '<cmd>tabnew<cr>', { desc = 'New Tab' })
set('n', '<leader><tab>l', '<cmd>tabnext<cr>', { desc = 'Next Tab' })
set('n', '<leader><tab>c', '<cmd>tabclose<cr>', { desc = 'Close Tab' })
set('n', '<leader><tab>h', '<cmd>tabprevious<cr>', { desc = 'Previous Tab' })

-- quickfix
set('n', '[q', vim.cmd.cprev, { desc = 'Previous Quickfix' })
set('n', ']q', vim.cmd.cnext, { desc = 'Next Quickfix' })

-- diagnostic
local diagnostic_goto = function(next, severity)
  return function()
    vim.diagnostic.jump {
      count = (next and 1 or -1) * vim.v.count1,
      severity = severity and vim.diagnostic.severity[severity] or nil,
      float = true,
    }
  end
end
set('n', '<leader>ld', vim.diagnostic.open_float, { desc = 'Line Diagnostics' })
set('n', ']d', diagnostic_goto(true), { desc = 'Next Diagnostic' })
set('n', '[d', diagnostic_goto(false), { desc = 'Prev Diagnostic' })
set('n', ']e', diagnostic_goto(true, 'ERROR'), { desc = 'Next Error' })
set('n', '[e', diagnostic_goto(false, 'ERROR'), { desc = 'Prev Error' })
set('n', ']w', diagnostic_goto(true, 'WARN'), { desc = 'Next Warning' })
set('n', '[w', diagnostic_goto(false, 'WARN'), { desc = 'Prev Warning' })

set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

set({ 'n', 'o', 'x' }, 'w', "<cmd>lua require('spider').motion('w')<CR>")
set({ 'n', 'o', 'x' }, 'e', "<cmd>lua require('spider').motion('e')<CR>")
set({ 'n', 'o', 'x' }, 'b', "<cmd>lua require('spider').motion('b')<CR>")

set({ 'n', 'x', 'o' }, 's', function()
  require('flash').jump()
end, { desc = 'Flash' })

set({ 'n', 'x', 'o' }, 'S', function()
  require('flash').treesitter()
end, { desc = 'Flash Treesitter' })

set('o', 'r', function()
  require('flash').remote()
end, { desc = 'Remote Flash' })

set({ 'o', 'x' }, 'R', function()
  require('flash').treesitter_search()
end, { desc = 'Treesitter Search' })

set('c', '<C-s>', function()
  require('flash').toggle()
end, { desc = 'Toggle Flash Search' })

-- bufferline
set("n", "<leader>c", function()
  vim.cmd("BufferLineCycleNext")
  vim.cmd("bdelete #")
end, { desc = "Close buffer and go next" })

set("n", "<S-l>", function()
  require("bufferline.commands").cycle(vim.v.count1)
end, { desc = "Next buffer" })

set("n", "<S-h>", function()
  require("bufferline.commands").cycle(-vim.v.count1)
end, { desc = "Previous buffer" })

-- Move buffer tabs
set("n", ">b", function()
  require("bufferline.commands").move(vim.v.count1)
end, { desc = "Move buffer tab right" })

set("n", "<b", function()
  require("bufferline.commands").move(-vim.v.count1)
end, { desc = "Move buffer tab left" })

-- Pick / navigate
set("n", "<Leader>bb", function()
  require("bufferline.commands").pick()
end, { desc = "Navigate to buffer tab with interactive picker" })

-- Close buffers
set("n", "<Leader>bc", function()
  require("bufferline.commands").close_others()
end, { desc = "Close all buffers except the current" })

set("n", "<Leader>bd", function()
  require("bufferline.commands").close_with_pick()
end, { desc = "Delete a buffer tab with interactive picker" })

set("n", "<Leader>bl", function()
  require("bufferline.commands").close_in_direction("left")
end, { desc = "Close all buffers to the left of the current" })

set("n", "<Leader>br", function()
  require("bufferline.commands").close_in_direction("right")
end, { desc = "Close all buffers to the right of the current" })

-- Pin
set("n", "<Leader>bp", "<Cmd>BufferLineTogglePin<CR>", {
  desc = "Toggle pin buffer",
})

-- Sorting
set("n", "<Leader>bse", function()
  require("bufferline.commands").sort_by("extension")
end, { desc = "Sort buffers by extension" })

set("n", "<Leader>bsi", function()
  require("bufferline.commands").sort_by("id")
end, { desc = "Sort buffers by buffer number" })

set("n", "<Leader>bsm", function()
  require("bufferline.commands").sort_by(function(a, b)
    return a.modified and not b.modified
  end)
end, { desc = "Sort buffers by last modification" })

set("n", "<Leader>bsp", function()
  require("bufferline.commands").sort_by("directory")
end, { desc = "Sort buffers by directory" })

set("n", "<Leader>bsr", function()
  require("bufferline.commands").sort_by("relative_directory")
end, { desc = "Sort buffers by relative directory" })

-- Open buffer in splits via picker
set("n", "<Leader>b\\", function()
  require("bufferline.pick").choose_then(function(id)
    vim.cmd("split")
    vim.cmd("buffer " .. id)
  end)
end, { desc = "Open buffer in horizontal split (picker)" })

set("n", "<Leader>b|", function()
  require("bufferline.pick").choose_then(function(id)
    vim.cmd("vsplit")
    vim.cmd("buffer " .. id)
  end)
end, { desc = "Open buffer in vertical split (picker)" })
