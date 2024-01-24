return {
  'goolord/alpha-nvim',
  dependencies = { 'kyazdani42/nvim-web-devicons' },
  lazy = false,
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
     [[ ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
     [[ ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
     [[ ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
     [[ ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
     [[ ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
     [[ ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
    }

    dashboard.section.buttons.val = {
      dashboard.button("e", "  New file", "<cmd>ene <CR>"),
      dashboard.button("SPC f f", "  Find File"),
      dashboard.button("SPC e n", "  Edit Nvim Config"),
      dashboard.button("SPC f h", "  Help Tags"),
      dashboard.button("SPC f r", "  Frecency/MRU"),
      dashboard.button("SPC f g", "  Find Word"),
      dashboard.button("SPC f m", "  Jump to Bookmarks"),
      dashboard.button("SPC s l", "  Open Last Session"),
    }

    dashboard.section.footer.val = require'alpha.fortune'()

    alpha.setup(require'alpha.themes.dashboard'.opts)
  end
}
