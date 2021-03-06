local g = vim.g

-- Enable lua filetype detection and disable vim filetype detection
g.do_filetype_lua = 1
g.did_load_filetypes = 0

-- Disable builtin plugins
g.loaded_gzip = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1

g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_2html_plugin = 1

g.loaded_matchit = 1
g.loaded_matchparen = 1
g.loaded_logiPat = 1
g.loaded_rrhelper = 1

require('impatient')
require('pluginList')
require('options')
require('mappings')
