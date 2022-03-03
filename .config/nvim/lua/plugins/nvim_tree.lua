vim.cmd([[
  let g:nvim_tree_highlight_opened_files = 2
  let g:nvim_tree_indent_markers = 1
  let g:nvim_tree_git_hl = 1
]])


require'nvim-tree'.setup {
  auto_close = true,
  hijack_cursor = true,
  update_cwd = true,
  update_to_buf_dir = {
    enable = true,
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  diagnostics = {
    enable = true,
  },
  view = {
    width = 25,
    side = 'left',
    hide_root_folder = false,
    auto_resize = true
  }
}
