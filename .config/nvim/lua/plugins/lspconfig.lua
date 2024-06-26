return {
  'neovim/nvim-lspconfig',
  event = { "BufReadPre", "BufNewFile" },
  config = function()

    local lspconfig = require("lspconfig")
    local client_notifs = {}

    local function get_notif_data(client_id, token)
     if not client_notifs[client_id] then
       client_notifs[client_id] = {}
     end

     if not client_notifs[client_id][token] then
       client_notifs[client_id][token] = {}
     end

     return client_notifs[client_id][token]
    end

    local spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }

    local function update_spinner(client_id, token)
     local notif_data = get_notif_data(client_id, token)

     if notif_data.spinner then
       local new_spinner = (notif_data.spinner + 1) % #spinner_frames
       notif_data.spinner = new_spinner

       notif_data.notification = vim.notify(nil, nil, {
         hide_from_history = true,
         icon = spinner_frames[new_spinner],
         replace = notif_data.notification,
       })

       vim.defer_fn(function()
         update_spinner(client_id, token)
       end, 100)
     end
    end

    local function format_title(title, client_name)
     return client_name .. (#title > 0 and ": " .. title or "")
    end

    local function format_message(message, percentage)
     return (percentage and percentage .. "%\t" or "") .. (message or "")
    end


    -- Peek Definition
    local function preview_location_callback(_, result)
      if result == nil or vim.tbl_isempty(result) then
        return nil
      end
      vim.lsp.util.preview_location(result[1])
    end

    function PeekDefinition()
      local params = vim.lsp.util.make_position_params()
      return vim.lsp.buf_request(0, 'textDocument/definition', params, preview_location_callback)
    end


    -- Define border around diagnostic window
    local border = {
          {"┌", "FloatBorder"},
          {"─", "FloatBorder"},
          {"┐", "FloatBorder"},
          {"│", "FloatBorder"},
          {"┘", "FloatBorder"},
          {"─", "FloatBorder"},
          {"└", "FloatBorder"},
          {"│", "FloatBorder"},
    }


    -- To override borders globally
    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or border
      return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end

    local opts = { silent=true }
    vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

    local on_attach = function(client, bufnr)

      opts["buffer"] = bufnr

      client.server_capabilities.semanticTokensProvider = nil
      -- require"lsp_signature".on_attach({
      --   bind = true,
      --   handler_opts = {
      --     border = "rounded"
      --   }
      -- }, bufnr)

      vim.keymap.set('n', 'gd', PeekDefinition, { desc="LSP: Peek Definition" })
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc="LSP: Declaration"})
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc="LSP: Hover"})
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc="LSP: Implementation"})
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { desc="LSP: Signature Help"})
      vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, { desc="LSP: Add Workspace Folder"})
      vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, { desc="LSP: Remove Workspace Folder"})
      -- vim.keymap.set('n', '<space>wl', print(vim.inspect(vim.lsp.buf.list_workspace_folders())), opts)
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, { desc="LSP: Type Definition"})
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, { desc="LSP: Rename"})
      vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, { desc="LSP: Code Action"})
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc="LSP: References"})
      vim.keymap.set('n', '<space>f', function () vim.lsp.buf.format { async = true } end, { desc="LSP: Format"})

      vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
          local diag_opts = {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = border,
            source = 'always',
            prefix = ' ',
            scope = 'cursor',
          }
          vim.diagnostic.open_float(nil, diag_opts)
        end
      })

    end

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Enable the following language servers
    local servers = { 'clangd',
                      'bashls',
                      -- 'mutt_ls',
                      'marksman',
                      'html',
                      'cssls',
                      'cssmodules_ls',
                      'intelephense',
                      'yamlls',
                      'jsonls',
                      'sqlls',
                      'awk_ls',
                      'cmake'}
    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {
          debounce_text_changes = 150,
        }
      }
    end

    require'lspconfig'.pylsp.setup{
      on_attach = on_attach,
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 150,
      },
      settings = {
        pylsp = {
          plugins = {
            pylint = {
              enabled = false,
            },
            pylsp_black = {
              enabled = true,
            },
            black = {
              cache_config = true,
              line_length = 79,
              preview = true,
            },
            ruff = {
              enabled = true,
              -- executable = "/usr/bin/ruff",
              lineLength = 79,
            },
          }
        }
      }
    }

    -- Grammar guard setup
    -- require'lspconfig'.ltex.setup{
    --   cmd = { "/home/carl/.local/share/nvim/grammar-guard/ltex/bin/ltex-ls" };
    --   on_attach = on_attach,
    --   capabilities = capabilities,
    --   -- handlers = handlers,
    --   filetypes = { "tex", "bib" },
    --   settings = {
    --     ltex = {
    --       additionalRules = {
    --         enablePickyRules = true,
    --         motherTongue = "en-US"
    --       },
    --       checkFrequency = "edit",
    --       diagnosticSeverity = "information",
    --       dictionary = {},
    --       disabledRules = {},
    --       enabled = { "latex", "tex", "bib" },
    --       hiddenFalsePositives = {},
    --       language = "en-US",
    --       sentenceCacheSize = 2000
    --     }
    --   }
    -- }

    -- Setup Lua Language Server
    lspconfig.lua_ls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
            preloadFileSize = 200,
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      },
    }
  end,
}
