-- vim.bo.textwidth = 75
vim.wo.spell=true
vim.bo.spelllang='en_us'
vim.bo.autoindent=false

require('cmp').setup {
  sources = {
    { name = 'spell', keyword_length = 5},
    { name = 'buffer', keyword_length = 5},
    { name = 'path'},
  }
}
