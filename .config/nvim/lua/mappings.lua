local map = vim.keymap.set
local opts = { silent = true }

map('n', '<Space>', '<NOP>', opts)
vim.g.mapleader = ' '

-- Barbar
map('n', '<leader>,', ':BufferPrevious<CR>', opts)
map('n', '<leader>.', ':BufferNext<CR>', opts)
map('n', '<leader><', ':BufferMovePrevious<CR>', opts)
map('n', '<leader>>', ':BufferMoveNext<CR>', opts)
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

-- NvimTree
map('n', '<C-n>', require('utils').toggle, opts) -- To move over BarBar tab page
map('n', '<C-f>', require('nvim-tree').focus, opts)

-- Telescope
map('n', '<leader>ff', require('telescope.builtin').find_files, opts)
map('n', '<leader>fg', require('telescope.builtin').live_grep, opts)
map('n', '<leader>fb', require('telescope.builtin').buffers, opts)
map('n', '<leader>fh', require('telescope.builtin').help_tags, opts)
map('n', '<leader>fc', require('telescope.builtin').commands, opts)
map('n', '<leader>fz', require('telescope.builtin').spell_suggest, opts)

-- Plenary
map('n', '<leader>t', '<Plug>PlenaryTestFile', opts)

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
