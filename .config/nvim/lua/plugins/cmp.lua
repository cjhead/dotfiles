return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-nvim-lsp-document-symbol',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'f3fora/cmp-spell',
    'ray-x/cmp-treesitter',
    'windwp/nvim-autopairs',
    'onsails/lspkind-nvim',
  },
  event = {"InsertEnter",
            "CmdlineEnter"},
  config = function()

    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    cmp.setup({
      -- experimental = {
      --   ghost_text = true
      -- },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documenation = cmp.config.window.bordered(),
      },

      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text",
          menu = ({
            nvim_lsp = "[LSP]",
            nvim_lua = "[Nvim Lua]",
            treesitter = "[Tree]",
            luasnip = "[LuaSnip]",
            buffer = "[Buffer]",
            path = "[Path]",
            nvim_lsp_document_symbol = "[LSP Symbol]",
            spell = "[Spell]",
            -- tags = "[Tags]",
            -- neorg = "[Neorg]",
          })
        }),
      },

      sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'treesitter' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
      --   { name = 'tags' },
      --   { name = 'neorg' },
      },

      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
          behaviour = cmp.ConfirmBehavior.Replace,
          select = false
        }),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      })
    })

    cmp.setup.filetype({'text', 'vimwiki', 'mail'}, {
      sources = cmp.config.sources({
        { name = 'spell', keyword_length = 5},
        { name = 'buffer', keyword_length = 5},
        { name = 'path'},
      })
    })

    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'nvim_lsp_document_symbol' }
      }, {
        { name = 'buffer' }
      })
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      }, {
        { name = 'nvim_lua' }
      })
    })

  end,
}
