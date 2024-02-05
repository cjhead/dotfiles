local opt = vim.opt

opt.termguicolors = true

opt.backspace = {'indent', 'eol', 'start'}
opt.history = 50
opt.ruler = true
-- opt.showcmd = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.sidescroll = 10
opt.scrolloff = 20
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.splitright = true
opt.completeopt = {'menu', 'menuone', 'noselect', 'noinsert'}
-- opt.filetype = 'on'
opt.hidden = true
opt.cmdheight = 1
opt.laststatus = 3
opt.startofline = true

opt.smartindent = true
opt.autoindent = true
opt.cindent = true

opt.wrap = false
opt.breakindent = true
opt.showbreak = string.rep(" ", 3)
-- opt.linebreak = true

opt.formatoptions = "tcqjro2"

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

-- opt.syntax = 'on'
opt.number = true
opt.relativenumber = true

-- Wildmenu transparency
-- opt.pumblend = 15

vim.filetype.add({
  extension = {},
  filename = {
    ['/home/carl/documents/finances/new_budget_items'] = 'text'
  },
  pattern = {
    ['.*tuir.*txt'] = 'markdown'
  },
})

vim.api.nvim_create_user_command("AutoRun", function()
  print "AutoRun starts now..."
end, {})
