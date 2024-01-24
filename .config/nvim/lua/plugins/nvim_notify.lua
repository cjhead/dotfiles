return {
  "rcarriga/nvim-notify",
  lazy = false,
  config = function ()
    local notify = require("notify")
    notify.setup {}
    vim.notify = notify
  end
}
