local opt = vim.opt

opt.backspace = {'indent', 'eol', 'start'}
opt.history = 50
opt.ruler = true
opt.showcmd = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.sidescroll = 10
opt.scrolloff = 20
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.splitright = true
opt.completeopt = {'menu', 'menuone', 'noselect', 'noinsert'}
opt.termguicolors = true
opt.filetype = 'on'
opt.hidden = true
opt.cmdheight = 1
opt.laststatus=3

opt.smartindent = true
opt.autoindent = true
opt.cindent = true

opt.wrap = true
opt.breakindent = true
opt.showbreak = string.rep(" ", 3)
opt.linebreak = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

opt.syntax = 'on'
opt.number = true
opt.relativenumber = true

-- Set default notifications to nvim-notify
vim.notify = require("notify")

-- Wildmenu transparency
-- opt.pumblend = 15

-- Run xrdb when saving .Xresources
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = ".Xresources",
  command = "!xrdb %",
})

-- Ledger
vim.cmd([[
let g:ledger_align_at = 45
let g:ledger_default_commodity = '$'
]])
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = {"*.ldg, *.ledger"},
  command = "set filetype=ledger"
})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.ledger",
  command = "LedgerAlignBuffer"
})

-- Sync plugins on save
vim.api.nvim_create_augroup("packer_user_config", {clear = true})
vim.api.nvim_create_autocmd("BufWritePost", {
  group = "packer_user_config",
  pattern = "pluginList.lua",
  callback = function()
    vim.cmd "source <afile> | PackerSync"
  end,
})

-- Vimwiki
vim.cmd([[
let g:vimwiki_list = [{'path': '~/vimwiki/',
                     \ 'links_space_char': '_',
                     \ 'auto_generate_links': 1,
                     \ 'auto_generate_tags': 1,
                     \ 'auto_diary_index': 1,
                     \ 'auto_tags' : 1,
                     \ 'auto_toc': 1}]
let g:vimwiki_hl_headers = 1
let g:vimwiki_hl_cb_checked = 2
let g:vimwiki_listsyms = ' ○◐●✓'
let g:vimwiki_listsym_rejected = '✗'
let g:vimwiki_conceal_pre = 1
let g:vimwiki_auto_chdir = 1
let g:vimwiki_auto_header = 1
]])

-- Remove trailing whitespace and newlines on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.cmd([[
    %s/\s\+$//e
    %s/\n\+\%$//e
    ]])
  end,
})

-- Pick up where you left off in a file
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    vim.cmd([[
    if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif
    ]])
  end,
})

-- Highlight search while searching then turn off
vim.api.nvim_create_augroup("incsearch-hl", {clear = true})
vim.api.nvim_create_autocmd("CmdlineEnter", {
  pattern = "/,\\?",
  group = "incsearch-hl",
  command = ":set hlsearch"
})
vim.api.nvim_create_autocmd("CmdlineLeave", {
  pattern = "/,\\?",
  group = "incsearch-hl",
  command = ":set nohlsearch"
})
