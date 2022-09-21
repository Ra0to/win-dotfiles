-- Plugins initialization

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Gruvbox theme
  use 'ellisonleao/gruvbox.nvim'

  -- набор Lua функций, используется как зависимость в большинстве
  -- плагинов, где есть работа с асинхронщиной
  use 'nvim-lua/plenary.nvim'

  -- конфиги для LSP серверов, нужен для простой настройки и
  -- возможности добавления новых серверов
  use 'neovim/nvim-lspconfig'

  -- зависимости для движка автодополнения
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'

  -- движок автодополнения для LSP
  use 'hrsh7th/nvim-cmp'

  -- парсер для всех языков программирования, цветной код как в твоем
  -- любимом IDE
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function()
        -- так подгружается конфигурация конкретного плагина
        -- ~/.config/nvim/lua/plugins/treesitter.lua
        require('plugins.treesitter')
      end
  }

  -- Code snippets
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip-integ'

  -- Telescope For file searching
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- NerdTree Pretty file tree
  use 'scrooloose/nerdtree'

  -- LSP
  use 'williamboman/mason.nvim'
  -- use 'williamboman/nvim-lsp-installer' -- Easy LSP installer

  -- LuaLine
  -- use {
      -- 'nvim-lualine/lualine.nvim',
      -- requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  -- } 
  -- Try Airplane plugin for status bar (or lualine)
  -- Try NeoGit  
end)
