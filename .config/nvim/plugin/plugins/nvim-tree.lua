local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

-- vim.cmd([[
--   let g:nvim_tree_highlight_opened_files = 2
--   let g:nvim_tree_git_hl = 1
-- ]])

nvim_tree.setup {
  auto_reload_on_write = true,
  hijack_cursor = true,
  reload_on_bufenter = true,
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  sort_by = "name",
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  renderer = {
    highlight_opened_files = "name",
    highlight_git = true,
    indent_markers = {
      enable = true,
    },
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  git = {
    enable = true,
    ignore = true,
  },
  view = {
    adaptive_size = true,
    -- width = 25,
    side = 'left',
    hide_root_folder = false,
    preserve_window_proportions = true
  }
}
