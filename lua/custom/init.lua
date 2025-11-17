-- Ensure legacy APIs used by plugins don't trigger deprecation warnings on 0.11+
if vim.lsp and vim.lsp.get_clients and vim.lsp.get_active_clients then
  -- Override deprecated helper with the recommended implementation.
  vim.lsp.get_active_clients = function(opts)
    return vim.lsp.get_clients(opts)
  end
end
