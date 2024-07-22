local lspconfig = require 'lspconfig'
local treesitter = require 'nvim-treesitter'
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local function autocmd(args)
  local event = args[1]
  local group = args[2]
  local callback = args[3]

  vim.api.nvim_create_autocmd(event, {
    group = group,
    buffer = args[4],
    callback = function()
      callback()
    end,
    once = args.once,
  })
end

local function on_attach(client, buffer)
  local augroup_highlight = vim.api.nvim_create_augroup("custom-lsp-references", { clear = true })
  local autocmd_clear = vim.api.nvim_clear_autocmds

  local opts = { buffer = buffer, remap = false }

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<leader>d', vim.lsp.buf.type_definition, opts)

  if client.server_capabilities.documentHighlightProvider then
    autocmd_clear { group = augroup_highlight, buffer = buffer }
    autocmd { "CursorHold", augroup_highlight, vim.lsp.buf.document_highlight, buffer }
    autocmd { "CursorMove", augroup_highlight, vim.lsp.buf.clear_references, buffer }
  end

end

local function init()
  local language_servers = {
    gopls = {
        filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
        settings = {
            gopls = {
                completeUnimported = true,
                staticcheck = true,
                usePlaceholders = true,
                analyses = {
                    unusedparams = true,
                },
            },
        },
    },
    pyright = {},
    lua_ls = {},
    tsserver = {},
    clangd = {},
    arduino_language_server = {
        cmd = {
            "arduino-language-server",
            "-cli-config", "/home/anthony/.config/.arduino15/arduino-cli.yaml",
            "-fqbn", "arduino:avr:uno",
            "-log"
        }
    },
  }
  for server, server_config in pairs(language_servers) do
    local config = { on_attach = on_attach, capabilities = capabilities }

    if server_config then
      for k, v in pairs(server_config) do
        config[k] = v
      end
    end

    lspconfig[server].setup(config)
  end

  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)

  treesitter.setup {
    highlight = { enable = true },
    indent = { enable = true },
    rainbow = { enable = true },
  }

end

init()
