return {
  'kyazdani42/nvim-tree.lua',
  -- lazy = false,
  cmd = "NvimTreeToggle",
  config = function ()
    require("nvim-tree").setup {
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
        enable = false,
        show_on_dirs = true,
      },
      renderer = {
        highlight_opened_files = "name",
        highlight_git = false,
        indent_markers = {
          enable = true,
        },
      },
      hijack_directories = {
        enable = true,
        auto_open = true,
      },
      git = {
        enable = false,
        ignore = true,
      },
      view = {
        adaptive_size = true,
        -- width = 25,
        side = 'left',
        preserve_window_proportions = true
      }
    }
  end
}
