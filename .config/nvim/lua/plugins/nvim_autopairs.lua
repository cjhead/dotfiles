return {
  'windwp/nvim-autopairs',
  lazy = false,
  config = function ()
    require("nvim-autopairs").setup {
      fast_wrap = {},
    }
    -- Insert `(` after select function or method item
    -- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    -- local cmp = require('cmp')
    -- cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done())
  end
}
