local map = vim.keymap.set
local opts = { silent = true }

map('n', '<Space>', '<NOP>', opts)
vim.g.mapleader = ' '

map('n', '<leader>,', ':BufferLineCyclePrev<CR>', opts)
map('n', '<leader>.', ':BufferLineCycleNext<CR>', opts)
map('n', '<leader><', ':BufferLineMovePrev<CR>', opts)
map('n', '<leader>>', ':BufferLineMoveNext<CR>', opts)
map('n', '<A-c>',     ':bdelete<CR>', opts)

-- NvimTree
map('n', '<C-n>', ':NvimTreeToggle<CR>', opts)
map('n', '<C-f>', ':NvimTreeFocus<CR>', opts)

-- Telescope
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>en', ':Telescope find_files cwd=~/.config/nvim/<CR>', opts)
map('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
map('n', '<leader>fb', ':Telescope buffers<CR>', opts)
map('n', '<leader>fh', ':Telescope help_tags<CR>', opts)
map('n', '<leader>fc', ':Telescope commands<CR>', opts)
map('n', '<leader>fz', ':Telescope spell_suggest<CR>', opts)

-- Plenary
map('n', '<leader>t', '<Plug>PlenaryTestFile', opts)

-- Url View
-- map('n', '<leader>uv', ':UrlView Packer<CR>', { desc="UrlView Packer"})
map('n', '<leader>uv', '<Cmd>UrlView packer<CR>', { desc = "View plugin links" })

-- Center results when searching
map('n', 'n', 'nzz', opts)
map('n', 'N', 'Nzz', opts)

-- Ledger
vim.cmd([[
au FileType ledger noremap { ?^\d<CR>
au FileType ledger noremap } /^\d<CR>
au FileType ledger nnoremap <silent><buffer> <C-t> :call ledger#transaction_state_toggle(line('.'), ' *?!')<CR>
au FileType ledger nnoremap <C-a> :LedgerAlignBuffer<CR>
]])
