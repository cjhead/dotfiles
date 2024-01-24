return {
  'axieax/urlview.nvim',
  -- lazy = false,
  cmd = "UrlView",
  config = function ()
    require("urlview").setup {
      default_picker = "telescope",
      actions = "system",
    }
  end
}
