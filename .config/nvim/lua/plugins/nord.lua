return {
  'shaunsingh/nord.nvim',
  lazy = false,
  -- cmd = "Telescope",
  config = function ()
    vim.g.nord_borders = true
    vim.g.nord_contrast = true
    vim.g.nord_italic = true
    vim.g.nord_disable_background = false
    vim.g.nord_enable_sidebar_background = true
  end
}
