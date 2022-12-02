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
let g:vimwiki_global_ext = 0
]])
