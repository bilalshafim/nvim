local on_attach = require("plugins.configs.lspconfig").on_attach local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}
lspconfig.ruff_lsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
  init_options = {
    settings = {
      args = {}
    }
  }
}
-- lspconfig.pyright.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = {"python"},
--   settings = {
--     pyright = {
--       disableOrganizeImports = true,
--     },
--     python = {
--       analysis = {
--         ignore = { '*' },
--       },
--     },
--   },
-- }

lspconfig.ts_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
