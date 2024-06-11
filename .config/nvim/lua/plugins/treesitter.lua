return {
   'nvim-treesitter/nvim-treesitter',
   build = ':TSUpdate',
   -- lazy = false,
   event = { "VeryLazy", },
   init = function(plugin)
     require("lazy.core.loader").add_to_rtp(plugin)
     require("nvim-treesitter.query_predicates")
   end,
   cmd = {
     "TSUpdate",
      "TSUpdate",
      "TSInstall",
    },
   config = function()
     local configs = require("nvim-treesitter.configs")

     configs.setup {
      ensure_installed = {
        "bash",
        "c",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "lua",
        "luadoc",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "toml",
        "vim",
        "vimdoc",
        "yaml",
      },
      auto_install = true,
      sync_install = false,
      ignore_install = {},
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
      modules = {},
   }
 end
}
