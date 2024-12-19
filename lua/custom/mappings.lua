local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require("dap.ui.widgets");
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    }
  }
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function ()
        require('dap-go').debug_test()
      end,
      "Debug go test"
    },
    ["<leader>dgl"] = {
      function ()
        require('dap-go').debug_last()
      end,
      "Debug last go test"
    }
  }
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags"
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags"
    },
    ["<leader>n"] = {
      "<cmd> GoIfErr <CR>",
      "Added if err nil snippet"
    }
  }
}

M.custom_mappings = {
  plugin = false,
  n = {
    ["<leader>sw"] = {
      function()
        vim.cmd('let @/ = expand("<cword>")')
        vim.cmd('/')
      end,
      "Search for word under cursor and move to next occurrence"
    },
    ["<leader>ss"] = {
      function()
        vim.cmd('let @/ = expand("<cword>")')
        vim.cmd('set hlsearch')
      end,
      "Search for word under cursor and highlight it"
    },
    ["<leader>p"] = {
      function()
        vim.cmd([["_dP]])
      end,
      "Abolish selection and paste last yanked text"
    },
    ["<leader>k"] = {
      "<cmd>lnext<CR>zz",
      "Go to next item in the location list and center the screen",
    },
    -- Maybe will try later to set NetRW map
    -- ["<leader>n"] = {
    --   ":belowright split | <cmd> Ex<CR>",
    --   "Open netrw in a new split"
    -- },
  }
}

M.conform = {
  plugin = true,
  -- n = {
  --   ["<leader>fm"] = {
  --     function()
  --       require("conform").format({ async = true })
  --     end,
  --     "Format entire buffer",
  --   },
  -- },
  v = {
    ["<leader>f"] = {
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      "Format visually selected text",
    },
  },
}

return M
