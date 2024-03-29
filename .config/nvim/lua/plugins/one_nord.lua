return {
  'rmehri01/onenord.nvim',
  lazy = false,
  priority = 1000,
  config = function ()
    local colors = require('onenord.colors').load()
    require("onenord").setup {

      theme = "dark",
      borders = true,
      face_nc = true,
      styles = {
        comments = "italic",
        strings = "italic",
        keywords = "italic",
        functions = "italic",
        variables = "NONE",
        diagnostics = "underline",
      },
      disable = {
        background = false,
        cursorline = false,
        eob_lines = true,
      },
      inverse = {
        match_paren = false,
      },
      custom_highlights = {

        -- NvimTree
        NvimTreeOpenedFile = { fg = colors.diff_add, style = 'bold' },

        -- Local Syntax
        Conditional = { fg = colors.blue },
        Number = { fg = colors.purple },
        Operator = { fg = colors.dark_blue },
        Statement = { fg = colors.fg },
        MatchParen = { fg = colors.light_purple, bg = colors.none, style = 'bold' },

        -- TreeSitter
        ["@boolean"] = { fg = colors.yellow },
        ["@constructor"] = { fg = colors.fg },
        ["@conditional"] = { fg = colors.blue },
        ["@constant.builtin"] = { fg = colors.light_green },
        ["@constant.macro"] = { fg = colors.light_green },
        ["@field"] = { fg = colors.blue },
        ["@float"] = { fg = colors.purple },
        ["@function"] = { fg = colors.cyan },
        ["@keyword"] = { fg = colors.blue },
        ["@keyword.return"] = { fg = colors.blue },
        ["@keyword.function"] = { fg = colors.cyan },
        ["@method.call"] = { fg = colors.cyan },
        ["@number"] = { fg = colors.purple },
        ["@operator"] = { fg = colors.blue },
        ["@parameter"] = { fg = colors.fg },
        ["@punctuation.bracket"] = { fg = colors.cyan },
        ["@punctuation.delimiter"] = { fg = colors.cyan },
        ["@string.escape"] = { fg = colors.purple },
        ["@type"] = { fg = colors.blue },

        -- BarBar
        BufferCurrentMod = { fg = colors.purple, bg = colors.bg, style = 'bold' },
        BufferVisibleMod = { fg = colors.purple, bg = colors.bg, style = 'bold' },
        BufferInactiveMod = { fg = colors.purple, bg = colors.bg, style = 'bold' },

        -- Bufferline
        BufferLineFill = { bg = colors.none },
      },
    }
    vim.cmd([[colorscheme onenord]])
  end
}
