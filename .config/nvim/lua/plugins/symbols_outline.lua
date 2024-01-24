return {
  'simrat39/symbols-outline.nvim',
  -- lazy = false,
  cmd = "SymbolsOutline",
  config = function()
    require("symbols-outline").setup {
      auto_preview = false,
    }
  end
}
