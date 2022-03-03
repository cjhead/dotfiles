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
  -- Plenary
  -------------------------------------------------------------------
  use 'nvim-lua/plenary.nvim'

  -------------------------------------------------------------------
  -- Telescope
  -------------------------------------------------------------------
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'},
    },
    config = [[require('plugins.telescope')]],
  }

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -------------------------------------------------------------------
  -- Lsp
  -------------------------------------------------------------------
  use {
    'neovim/nvim-lspconfig',
    config = [[require('plugins.lsp')]],
  }

  use {
    "brymer-meneses/grammar-guard.nvim",
    requires = "neovim/nvim-lspconfig"
  }

  use { 'onsails/lspkind-nvim' }

  -------------------------------------------------------------------
  -- Icons
  -------------------------------------------------------------------
  use 'kyazdani42/nvim-web-devicons'

  -------------------------------------------------------------------
  -- Navigation tree
  -------------------------------------------------------------------
  use {
    'kyazdani42/nvim-tree.lua',
    config = [[require('plugins.nvim_tree')]]
  }

  -------------------------------------------------------------------
  -- Treesitter
  -------------------------------------------------------------------
  use {
      'nvim-treesitter/nvim-treesitter',
      commit = '668de0951a36ef17016074f1120b6aacbe6c4515',
      config = [[require('plugins.treesitter')]],
      run = ':TSUpdate',
  }

  -------------------------------------------------------------------
  -- Completion
  -------------------------------------------------------------------
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'rafamadriz/friendly-snippets',
      { 'L3MON4D3/LuaSnip',
        wants = 'friendly-snippets',
        config = [[require('plugins.luasnip')]]},
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      { 'f3fora/cmp-spell', after = 'nvim-cmp' },
      { 'ray-x/cmp-treesitter', after = 'nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      { 'windwp/nvim-autopairs',
        after = 'nvim-cmp',
        config = [[require('plugins.autopairs')]]},
    },
    config = [[require('plugins.cmp')]],
  }

  -------------------------------------------------------------------
  -- Status line
  -------------------------------------------------------------------
  use {'nvim-lualine/lualine.nvim',
    -- after = 'nord.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = [[require('plugins.lualine')]],
  }

  -------------------------------------------------------------------
  -- Tabline
  -------------------------------------------------------------------
  use {'romgrk/barbar.nvim',
    config = [[require('plugins.barbar')]],
  }

  -------------------------------------------------------------------
  -- Commenting
  -------------------------------------------------------------------
  use {
    'numToStr/Comment.nvim',
    config = [[require('plugins.comment')]],
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
      config = function ()
          require'alpha'.setup(require'alpha.themes.dashboard'.opts)
      end
  }

  -------------------------------------------------------------------
  -- View markdown preview
  -------------------------------------------------------------------
  use 'ellisonleao/glow.nvim'

  -------------------------------------------------------------------
  -- Note taking
  -------------------------------------------------------------------
  use { 'nvim-neorg/neorg',
    after = 'nvim-treesitter',
    -- branch = 'unstable',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-neorg/neorg-telescope'
    },
    config = [[require('plugins.neorg')]],
  }
  -------------------------------------------------------------------
  -- Indent-blankline
  -------------------------------------------------------------------
  -- use { 'lukas-reineke/indent-blankline.nvim',
    -- config = [[require('plugins.blankline')]],
  -- }

  -------------------------------------------------------------------
  -- Vimwiki
  -------------------------------------------------------------------
  use 'vimwiki/vimwiki'

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
    config = [[require('plugins.one_nord')]],
  }

end,
config = {
  --[[ profile = {
    enable = true,
    threshold = 1
  }, ]]
  display = {
    open_fn = require('packer.util').float,
  }
}})
