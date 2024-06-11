return {
  "vimwiki/vimwiki",
  -- ft = "vimwiki",
  event = "BufEnter",
  init = function ()
    vim.g.vimwiki_list = {{path = '~/vimwiki/',
                     links_space_char = '_',
                     auto_generate_links = 1,
                     auto_generate_tags = 1,
                     auto_diary_index = 1,
                     auto_tags = 1,
                     auto_toc = 1}}
    vim.g.vimwiki_hl_headers = 1
    vim.g.vimwiki_hl_cb_checked = 2
    vim.g.vimwiki_listsyms = ' ○◐●✓'
    vim.g.vimwiki_listsym_rejected = '✗'
    vim.g.vimwiki_conceal_pre = 1
    vim.g.vimwiki_auto_chdir = 1
    vim.g.vimwiki_auto_header = 1
    vim.g.vimwiki_global_ext = 0
  end

}
