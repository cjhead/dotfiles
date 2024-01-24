return {
  'numToStr/Comment.nvim',
  -- lazy = false,
  event = "BufEnter",
  config = function()
    require("Comment").setup {
      padding = true,
      sticky = true,
      ignore = nil,
    }
  end
}
