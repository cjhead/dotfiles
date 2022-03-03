local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<Space>', '<NOP>', opts)
vim.g.mapleader = ' '

-- Barbar
map('n', '<leader>,', ':BufferPrevious<CR>', opts)
map('n', '<leader>.', ':BufferNext<CR>', opts)
map('n', '<A-<>',     ':BufferMovePrevious<CR>', opts)
map('n', '<A->>',     ':BufferMoveNext<CR>', opts)
map('n', '<A-1>',     ':BufferGoto 1<CR>', opts)
map('n', '<A-2>',     ':BufferGoto 2<CR>', opts)
map('n', '<A-3>',     ':BufferGoto 3<CR>', opts)
map('n', '<A-4>',     ':BufferGoto 4<CR>', opts)
map('n', '<A-5>',     ':BufferGoto 5<CR>', opts)
map('n', '<A-6>',     ':BufferGoto 6<CR>', opts)
map('n', '<A-7>',     ':BufferGoto 7<CR>', opts)
map('n', '<A-8>',     ':BufferGoto 8<CR>', opts)
map('n', '<A-9>',     ':BufferGoto 9<CR>', opts)
map('n', '<A-0>',     ':BufferLast<CR>', opts)
map('n', '<A-c>',     ':BufferClose<CR>', opts)
map('n', '<C-p>',     ':BufferPick<CR>', opts)
map('n', '<Space>bd', ':BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', ':BufferOrderByLanguage<CR>', opts)

-- NvimTree
-- map('n', '<C-n>', ':NvimTreeToggle<CR>', opts) -- Stock toggle
map('n', '<C-n>', "<cmd>lua require('utils').toggle()<CR>", opts) -- To move over BarBar tab page
map('n', '<C-f>', ':NvimTreeFocus<CR>', opts)

-- Telescope
map('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
map('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
map('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)
map('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<CR>", opts)
map('n', '<leader>fc', "<cmd>lua require('telescope.builtin').commands()<CR>", opts)
map('n', '<leader>fz', "<cmd>lua require('telescope.builtin').spell_suggest()<CR>", opts)

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
