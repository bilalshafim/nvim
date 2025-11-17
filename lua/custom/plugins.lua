local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "lua-language-server",
        "kotlin-language-server",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "go",
        "kotlin",
        "python",
      },
      highlight = {
        enable = true,
        use_languagetree = true,
      },
      indent = { enable = true },
    },
  },
  {
    "mfussenegger/nvim-dap",
    init = function ()
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function (_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
   "nvimtools/none-ls.nvim",
   ft = { "go", "python" },
   opts = function()
     return require("custom.configs.null-ls")
   end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function (_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings("gopher")
    end,
    build = function()
      vim.cmd.GoInstallDeps()
    end
  },
  {
    "folke/trouble.nvim",
    config = function()
        require("trouble").setup {
            icons = false,
        }
    end
  },
  {
    "rose-pine/neovim",
    as = "dawn",
    config = function()
      require("rose-pine").setup({
        variant = "dawn",
      })
      vim.cmd("colorscheme dawn")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      require('telescope').setup {
        pickers = {
          find_files = {
            theme = "ivy"
          }
        },
        extensions = {
          fzf = {}
        }
      }

      require('telescope').load_extension('fzf')

      vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags)
      vim.keymap.set("n", "<space>en", function()
        require('telescope.builtin').find_files {
          cwd = vim.fn.stdpath("config")
      }
      end)
      vim.keymap.set("n", "<leader>fi", function()
        require('telescope.builtin').grep_string()
      end)
      vim.keymap.set("n", "<leader>fl", function()
        require('telescope.builtin').live_grep({ default_text = vim.fn.expand('<cword>') })
      end)
    end
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        go = { "gofmt" },
      },
    },
    ft = { "lua", "python", "go" },
    config = function(_, opts)
      require("conform").setup(opts)
      require("core.utils").load_mappings("conform")
    end,
  }
}
return plugins
