-- NeoVim configuration

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.copyindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.g.mapleader = ';'

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.colorcolumn = '79'

vim.o.background = 'dark' -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
