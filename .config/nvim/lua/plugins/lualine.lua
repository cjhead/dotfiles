return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'kyazdani42/nvim-web-devicons',
    'arkav/lualine-lsp-progress',
    'rmehri01/onenord.nvim',
  },
  -- lazy = false,
  event = "VeryLazy",
  config = function ()
    require("lualine").setup {
      options = {
        theme = 'onenord',
        globalstatus = true,
      },
      sections = {
        lualine_c = {
          'lsp_progress'
        },
        lualine_x = {
          'encoding',
          {
            'fileformat',
            symbols = {
              unix = ''
            },
          },
          'filetype'
        },
      },
      extensions = {
        'nvim-tree',
        'lazy',
        'neo-tree',
        'fzf',
        'quickfix',
        'symbols-outline',
        'toggleterm',
        'man',
      },
    }
  end
}
