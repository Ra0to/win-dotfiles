local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--- Set
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- From: https://github.com/ThePrimeagen/init.lua

vim.api.nvim_exec("language en_US", true)

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.expand('$HOME/.nvim/undodir')
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

--- Keymap

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--- Plugins setup lazy

require("lazy").setup({
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    {'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' } },
    {'mbbill/undotree'},
    {'rebelot/kanagawa.nvim'},
    {"catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {"folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {}, },
    {'axkirillov/easypick.nvim', dependencies = 'nvim-telescope/telescope.nvim'}
})

--- Colorscheme

vim.api.nvim_exec("colorscheme tokyonight-moon", true)

--- Setup custom pickers for telescope
local easypick = require("easypick")

easypick.setup({
	pickers = {
		{
			name = "project-files",
			command = "fd --type file --strip-cwd-prefix --exclude *.meta --exclude *.tga --exclude *.png --exclude *.mask --exclude *.zip --exclude *.dll",
			previewer = easypick.previewers.default()
		},
		{
			name = "all-project-files",
			command = "fd --type file --strip-cwd-prefix",
			previewer = easypick.previewers.default()
		},
		{
			name = "unrestricted-project-files",
			command = "fd --type file --strip-cwd-prefix --unrestricted",
			previewer = easypick.previewers.default()
		},
	}
})
vim.keymap.set('n', '<leader><leader>', function()
    vim.cmd("Easypick project-files")
end)
vim.keymap.set('n', '<leader>fa', function()
    vim.cmd("Easypick all-project-files")
end)
vim.keymap.set('n', '<leader>fu', function()
    vim.cmd("Easypick unrestricted-project-files")
end)

--- Telescope configuration

require("telescope").setup {
  defaults = {
    -- ....
  },
  pickers = {
    find_files = {
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
    },
  }
}

local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader><leader>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fgr', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
