-- Run xrdb when saving .Xresources
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = ".Xresources",
  command = "!xrdb %",
})

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

-- Sync plugins on save
vim.api.nvim_create_augroup("packer_user_config", {clear = true})
vim.api.nvim_create_autocmd("BufWritePost", {
  group = "packer_user_config",
  pattern = "pluginList.lua",
  callback = function()
    vim.cmd "source <afile> | PackerSync"
  end,
})
