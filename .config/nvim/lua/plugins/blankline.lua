-- Alternate highlight levels
-- vim.cmd [[highlight IndentBlanklineIndent1 guibg=#2E3440 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guibg=#353B49 gui=nocombine]]

-- require('indent_blankline').setup {
--   char = "",
--     char_highlight_list = {
--       "IndentBlanklineIndent1",
--       "IndentBlanklineIndent2",
--     },
--     space_char_highlight_list = {
--       "IndentBlanklineIndent1",
--       "IndentBlanklineIndent2",
--     },
--     show_trailing_blankline_indent = false,
-- }


-- Treesitter powered context
require('indent_blankline').setup {
  show_current_context = true,
  show_current_context_start = true,
  show_trailing_blankline_indent = false,
}
