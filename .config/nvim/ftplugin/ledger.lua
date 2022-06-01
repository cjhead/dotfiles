vim.cmd([[
let g:ledger_align_at = 45
let g:ledger_default_commodity = '$'
]])

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.ledger",
  command = "LedgerAlignBuffer"
})
