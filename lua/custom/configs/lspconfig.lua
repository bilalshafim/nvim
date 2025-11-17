local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local servers = {
  "gopls",
  "kotlin_language_server",
}

local function server_opts(server)
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  if server == "gopls" then
    opts.settings = {
      gopls = {
        completeUnimported = true,
        usePlaceholders = true,
        analyses = { unusedparams = true },
      },
    }
  end

  return opts
end

local has_modern_lsp = vim.fn.has("nvim-0.11") == 1

if has_modern_lsp then
  for _, server in ipairs(servers) do
    vim.lsp.config(server, server_opts(server))
    vim.lsp.enable(server)
  end
else
  local lspconfig = require "lspconfig"
  for _, server in ipairs(servers) do
    lspconfig[server].setup(server_opts(server))
  end
end

local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if ok then
  mason_lspconfig.setup({
    ensure_installed = servers,
    automatic_installation = true,
    automatic_enable = false,
  })
end
