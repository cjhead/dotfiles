local colors = require('onenord.colors').load()

require('onenord').setup({
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
    TSBoolean = { fg = colors.yellow },
    TSConstructor = { fg = colors.fg },
    TSConditional = { fg = colors.blue },
    TSConstBuiltin = { fg = colors.light_green },
    TSConstMacro = { fg = colors.light_green },
    TSField = { fg = colors.blue },
    TSFloat = { fg = colors.purple },
    TSFunction = { fg = colors.cyan },
    TSKeyword = { fg = colors.blue },
    TSKeywordReturn = { fg = colors.blue },
    TSKeywordFunction = { fg = colors.cyan },
    TSNumber = { fg = colors.purple },
    TSOperator = { fg = colors.blue },
    TSParameter = { fg = colors.fg },
    TSPunctBracket = { fg = colors.cyan },
    TSPunctDelimiter = { fg = colors.cyan },
    TSStringEscape = { fg = colors.purple },
    TSType = { fg = colors.blue },

    -- BarBar
    BufferCurrentMod = { fg = colors.purple, bg = colors.bg, style = 'bold' },
    BufferVisibleMod = { fg = colors.purple, bg = colors.bg, style = 'bold' },
    BufferInactiveMod = { fg = colors.purple, bg = colors.bg, style = 'bold' },
  },
})
