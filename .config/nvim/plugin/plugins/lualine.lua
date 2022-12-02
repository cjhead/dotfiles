local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

lualine.setup {
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
    'neo-tree',
    'fzf',
    'quickfix',
    'symbols-outline',
    'toggleterm',
    'man',
  },
}
