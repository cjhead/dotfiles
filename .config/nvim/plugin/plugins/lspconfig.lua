-- Configure lsp
local nvim_lsp = require 'lspconfig'


-- Utility functions shared between progress reports for LSP and DAP
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
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)

-- LSP integration
-- Make sure to also have the snippet with the common helper functions in your config!
  vim.lsp.handlers["$/progress"] = function(_, result, ctx)
   local client_id = ctx.client_id

   local val = result.value

   if not val.kind then
     return
   end

   local notif_data = get_notif_data(client_id, result.token)

   if val.kind == "begin" then
     local message = format_message(val.message, val.percentage)

     notif_data.notification = vim.notify(message, "info", {
       title = format_title(val.title, vim.lsp.get_client_by_id(client_id).name),
       icon = spinner_frames[1],
       timeout = false,
       hide_from_history = false,
     })

     notif_data.spinner = 1
     update_spinner(client_id, result.token)
   elseif val.kind == "report" and notif_data then
     notif_data.notification = vim.notify(format_message(val.message, val.percentage), "info", {
       replace = notif_data.notification,
       hide_from_history = false,
     })
   elseif val.kind == "end" and notif_data then
     notif_data.notification =
       vim.notify(val.message and format_message(val.message) or "Complete", "info", {
         icon = "",
         replace = notif_data.notification,
         timeout = 3000,
       })

     notif_data.spinner = nil
   end
  end


  opts["buffer"] = bufnr

  -- require 'lsp_signature'.on_attach({
  --   bind = true,
  --   hint_prefix = "Sig Help ",
  -- }, bufnr)

  vim.keymap.set('n', 'gd', PeekDefinition, opts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
  -- vim.keymap.set('n', '<space>wl', print(vim.inspect(vim.lsp.buf.list_workspace_folders())), opts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, opts)

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

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)


-- Enable the following language servers
local servers = { 'clangd', 'pylsp', 'bashls', 'html', 'cssls', 'yamlls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
end


-- Grammar guard setup
require'lspconfig'.ltex.setup{
  cmd = { "/home/carl/.local/share/nvim/grammar-guard/ltex/bin/ltex-ls" };
  on_attach = on_attach,
  capabilities = capabilities,
  -- handlers = handlers,
  filetypes = { "tex", "bib", "markdown" },
  settings = {
    ltex = {
      additionalRules = {
        enablePickyRules = true,
        motherTongue = "en-US"
      },
      checkFrequency = "edit",
      diagnosticSeverity = "information",
      dictionary = {},
      disabledRules = {},
      enabled = { "latex", "tex", "bib", "markdown" },
      hiddenFalsePositives = {},
      language = "en-US",
      sentenceCacheSize = 2000
    }
  }
}


-- set the path to the sumneko installation
local sumneko_root_path = "/usr/share/lua-language-server"
local sumneko_binary = "/usr/bin/lua-language-server"


local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
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
