return {
  'akinsho/toggleterm.nvim',
  event = "BufEnter",
  config = function()
    require('toggleterm').setup {
      open_mapping = [[<c-\>]],
      shade_terminals = true,
    }
  end
}
