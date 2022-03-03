vim.opt.backspace = {'indent', 'eol', 'start'}
vim.opt.history = 50
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.incsearch = true
vim.opt.expandtab = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
-- vim.opt.hlsearch = false
vim.opt.sidescroll = 10
vim.opt.scrolloff = 20
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.splitright = true
vim.opt.completeopt = {'menu', 'menuone', 'noselect', 'noinsert'}
vim.opt.termguicolors = true
vim.opt.filetype = 'on'
vim.opt.hidden = true
vim.opt.cmdheight = 2
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.syntax = 'on'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false

-- require('onenord').setup()
-- Run xrdb when saving .Xresources
vim.cmd([[
autocmd BufWritePost .Xresources !xrdb %
]])

-- Ledger
vim.cmd([[
au BufNewFile,BufRead *.ldg,*.ledger set filetype=ledger
let g:ledger_align_at = 45
let g:ledger_default_commodity = '$'
au BufWritePre *.ledger LedgerAlignBuffer
]])

-- Sync plugins on save
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost pluginList.lua source <afile> | PackerSync
  augroup end
]])

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
vim.cmd([[
au BufWritePre * %s/\s\+$//e
au BufWritePre * %s/\n\+\%$//e
]])

-- Pick up where you left off in a file
vim.cmd([[
au BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif
]])

-- Highlight search while searching then turn off
vim.cmd([[
augroup vimrc-incsearch-highlight
	autocmd!
	autocmd CmdlineEnter /,\? :set hlsearch
	autocmd CmdlineLeave /,\? :set nohlsearch
augroup END
]])
