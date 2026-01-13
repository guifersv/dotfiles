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

-- tabs
set('n', '<leader><tab>t', '<cmd>tablast<cr>', { desc = 'Last Tab' })
set('n', '<leader><tab>o', '<cmd>tabonly<cr>', { desc = 'Close Other Tabs' })
set('n', '<leader><tab>f', '<cmd>tabfirst<cr>', { desc = 'First Tab' })
set('n', '<leader><tab><tab>', '<cmd>tabnew<cr>', { desc = 'New Tab' })
set('n', '<leader><tab>l', '<cmd>tabnext<cr>', { desc = 'Next Tab' })
set('n', '<leader><tab>c', '<cmd>tabclose<cr>', { desc = 'Close Tab' })
set('n', '<leader><tab>h', '<cmd>tabprevious<cr>', { desc = 'Previous Tab' })

-- buffers
set('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
set('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
set('n', '<leader>c', '<cmd>bdelete<cr>', { desc = 'Delete Buffer' })

-- quickfix
set('n', '<leader>lq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
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
