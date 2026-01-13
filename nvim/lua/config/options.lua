vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.shiftround = true
opt.breakindent = true
opt.confirm = true
opt.virtualedit = 'block'
opt.wrap = false
opt.termguicolors = true
opt.cursorline = true
opt.scrolloff = 10
opt.signcolumn = "yes"
opt.updatetime = 250
opt.clipboard = "unnamedplus"
opt.showmode = true
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = 'split'
opt.autowrite = false
opt.autoread = true
opt.backup = false
opt.undofile = true
opt.undolevels = 100

-- Better splits
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = 'screen'
opt.winminwidth = 5

vim.opt.foldlevel = 99
