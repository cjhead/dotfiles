require("bufferline").setup{
  options = {
    mode = "buffers",
    always_show_bufferline = true,
    separator_style = "thick",
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
    --   local icon = level:match("error") and " " or " "
    --   return " " .. icon .. count
    -- end,
    -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
    --   local s = " "
    --   for e, n in pairs(diagnostics_dict) do
    --     local sym = e == "error" and " "
    --       or (e == "warning" and " " or "" )
    --     s = s .. n .. sym
    --   end
    --   return s
    -- end,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left"
      }
    },
  },
}
