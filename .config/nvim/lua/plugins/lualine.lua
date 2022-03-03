require('lualine').setup {
  --[[ options = {
    theme = 'onenord',
  }, ]]
  sections = {
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
    'quickfix'
  },
}
