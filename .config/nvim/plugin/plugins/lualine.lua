require('lualine').setup {
  options = {
    theme = 'onenord',
    globalstatus = true,
  },
  sections = {
    -- lualine_c = {
    --   ...,
    --   'lsp_progress'
    -- },
    lualine_x = {
      'encoding',
      {
        'fileformat',
        symbols = {
          unix = ''
        },
      },
      'filetype'
    }
  },
  extensions = {
    'nvim-tree',
    'fzf',
    'quickfix',
    'symbols-outline',
    'toggleterm',
  },
}
