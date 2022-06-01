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
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = false,
  open_on_setup = false,
  open_on_setup_file = false,
  open_on_tab = false,
  sort_by = "name",
  update_cwd = false,
  update_focused_file = {
    enable = true,
    update_cwd = true,
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
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  git = {
    enable = true,
    ignore = false,
  },
  view = {
    width = 25,
    side = 'left',
    hide_root_folder = false,
    preserve_window_proportions = true
  }
}
