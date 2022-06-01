require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.gtd.base"] = {
            config = {
                workspace = 'gtd'
            }
        },
        ["core.gtd.queries"] = {},
        ["core.gtd.ui"] = {},
        ["core.neorgcmd"] = {},
        ["core.keybinds"] = {
            config = {
                default_keybinds = true,
                neorg_leader = "<Leader>",
            }
        },
        ["core.norg.concealer"] = {},
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    default = "~/neorg",
                    gtd = "~/neorg/gtd",
                }
            }
        },
        ["core.norg.completion"] = {
            config = {
                engine = "nvim-cmp"
            }
        },
        ["core.integrations.telescope"] = {},
    },
}
