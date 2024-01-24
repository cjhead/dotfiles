return {
   'nvim-treesitter/nvim-treesitter',
   build = ':TSUpdate',
   lazy = false,
   config = function()
     local configs = require("nvim-treesitter.configs")


     configs.setup {
      ensure_installed = {
        "c"
      },

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },

      indent = {
        -- disable due to python indentation
        enable = false
      },
   }
 end
}
