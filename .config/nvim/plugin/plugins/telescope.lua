require('telescope').setup {
  defaults = {
    layout_config = {
      prompt_position = "top",
      -- horizontal = { prompt_position = 'top' },
      -- vertical = { prompt_position = 'top' },
    },
    sorting_strategy = 'ascending',
  },
}

-- Load extensions after setup function

-- fzf-native
require('telescope').load_extension('fzf')

-- Github
require('telescope').load_extension('gh')

-- Nvim-Notify
require('telescope').load_extension('notify')
