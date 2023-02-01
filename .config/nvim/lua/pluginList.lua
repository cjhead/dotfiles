local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup({function(use)

  -------------------------------------------------------------------
  -- Packer
  -------------------------------------------------------------------
  use 'wbthomason/packer.nvim'

  -------------------------------------------------------------------
  -- Impatient
  -------------------------------------------------------------------
  use 'lewis6991/impatient.nvim'

  -------------------------------------------------------------------
  -- Plenary
  -------------------------------------------------------------------
  use 'nvim-lua/plenary.nvim'

  -------------------------------------------------------------------
  -- Telescope
  -------------------------------------------------------------------
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-github.nvim',
    },
  }

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -------------------------------------------------------------------
  -- Lsp
  -------------------------------------------------------------------
  use {
      'neovim/nvim-lspconfig',
    {
      "brymer-meneses/grammar-guard.nvim",
      requires = "neovim/nvim-lspconfig",
    },
    'onsails/lspkind-nvim',
    'ray-x/lsp_signature.nvim',
  }

  -------------------------------------------------------------------
  -- Dap
  -------------------------------------------------------------------
  use 'mfussenegger/nvim-dap'

  -------------------------------------------------------------------
  -- Icons
  -------------------------------------------------------------------
  use 'kyazdani42/nvim-web-devicons'

  -------------------------------------------------------------------
  -- Navigation tree
  -------------------------------------------------------------------
  use {
    'kyazdani42/nvim-tree.lua',
  }

  use {
    "nvim-neo-tree/neo-tree.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  }

  -------------------------------------------------------------------
  -- Treesitter
  -------------------------------------------------------------------
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  use {'nvim-treesitter/playground'}

  -------------------------------------------------------------------
  -- Completion
  -------------------------------------------------------------------
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'rafamadriz/friendly-snippets',
      { 'L3MON4D3/LuaSnip', wants = 'friendly-snippets'},
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp-signature-help', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp-document-symbol', after = 'nvim-cmp' },
      { 'f3fora/cmp-spell', after = 'nvim-cmp' },
      { 'ray-x/cmp-treesitter', after = 'nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      { 'windwp/nvim-autopairs', after = 'nvim-cmp' },
    },
  }

  -------------------------------------------------------------------
  -- UI
  -------------------------------------------------------------------
  use 'stevearc/dressing.nvim'

  -------------------------------------------------------------------
  -- Status line
  -------------------------------------------------------------------
  use {'nvim-lualine/lualine.nvim',
    requires = {
      { 'kyazdani42/nvim-web-devicons', opt = true },
      'arkav/lualine-lsp-progress',
      'rmehri01/onenord.nvim',
    },
    after = 'onenord.nvim',
  }

  -------------------------------------------------------------------
  -- Tabline
  -------------------------------------------------------------------
  use {
    'akinsho/bufferline.nvim',
    after = 'onenord.nvim',
  }

  -------------------------------------------------------------------
  -- Commenting
  -------------------------------------------------------------------
  use {
    'numToStr/Comment.nvim',
  }

  -------------------------------------------------------------------
  -- Syntax highlighting for kivy
  -------------------------------------------------------------------
  use 'farfanoide/vim-kivy'

  -------------------------------------------------------------------
  -- Syntax highlighting for ledger
  -------------------------------------------------------------------
  use 'ledger/vim-ledger'

  -------------------------------------------------------------------
  -- Nvim start screen
  -------------------------------------------------------------------
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  -------------------------------------------------------------------
  -- View markdown preview
  -------------------------------------------------------------------
  use 'ellisonleao/glow.nvim'

  -------------------------------------------------------------------
  -- Symbols Outline
  -------------------------------------------------------------------
  use { 'simrat39/symbols-outline.nvim',
  }

  -------------------------------------------------------------------
  -- Note taking
  -------------------------------------------------------------------
  use { 'nvim-neorg/neorg',
    after = 'nvim-treesitter',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-neorg/neorg-telescope'
    },
  }

  -------------------------------------------------------------------
  -- Urlview
  -------------------------------------------------------------------
  use { 'axieax/urlview.nvim',
  }

  -------------------------------------------------------------------
  -- Indent-blankline
  -------------------------------------------------------------------
  -- use { 'lukas-reineke/indent-blankline.nvim',
  -- }

  -------------------------------------------------------------------
  -- Vimwiki
  -------------------------------------------------------------------
  use 'vimwiki/vimwiki'

  -------------------------------------------------------------------
  -- Notifications
  -------------------------------------------------------------------
  use 'rcarriga/nvim-notify'

  -------------------------------------------------------------------
  -- Terminal
  -------------------------------------------------------------------
  use 'akinsho/toggleterm.nvim'

  -------------------------------------------------------------------
  -- Colorscheme nord
  -------------------------------------------------------------------
  use {'shaunsingh/nord.nvim',
    config = function()
      vim.g.nord_borders = true
      vim.g.nord_contrast = true
      vim.g.nord_italic = true
      vim.g.nord_disable_background = false
      vim.g.nord_enable_sidebar_background = true
     -- vim.cmd [[colorscheme nord]]
    end,
  }

  -------------------------------------------------------------------
  -- Colorscheme onenord
  -------------------------------------------------------------------
  use {
    'rmehri01/onenord.nvim',
    after = 'nvim-treesitter',
  }

  -------------------------------------------------------------------
  -- Colorizer
  -------------------------------------------------------------------
  use 'NvChad/nvim-colorizer.lua'

  use {'/home/carl/stackmap.nvim',
    disable = true,}

end,
config = {
  profile = {
    enable = true,
    threshold = 1
  },
  display = {
    open_fn = require('packer.util').float,
  }
}})
