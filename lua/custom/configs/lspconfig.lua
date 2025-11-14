-- lua/custom/configs/lspconfig.lua
-- Modern nvim 0.11+ style (no require('lspconfig').setup)

local base = require("plugins.configs.lspconfig") -- pulls on_attach/capabilities from NvChad core
local on_attach = base.on_attach
local capabilities = base.capabilities

-- Ensure mason-lspconfig is present
local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ok then
  vim.notify("mason-lspconfig not installed", vim.log.levels.WARN)
  return
end

-- LSP servers you want
local servers = {
  "gopls",
  "pyright",
  "ruff",
  "ts_ls",
  "kotlin_language_server",
}

-- Configure each server with the new API
for _, server in ipairs(servers) do
  local settings = nil

  if server == "gopls" then
    settings = {
      gopls = {
        completeUnimported = true,
        usePlaceholders = true,
        analyses = { unusedparams = true },
      },
    }
  elseif server == "pyright" then
    settings = {
      python = { analysis = { autoSearchPaths = true } },
    }
  end

  vim.lsp.config(server, {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = settings,
  })
end

-- Ask Mason to install them (optional but handy)
mason_lspconfig.setup({
  ensure_installed = servers,
})

