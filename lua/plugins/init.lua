local cmp = require "cmp"
return {
  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = { enable = true },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "rust-analyzer",
        "vscode-solidity-server",
        "nomicfoundation-solidity-language-server",
        "black",
        "mypy",
        "ruff-lsp",
        "pyright",
        "debugpy",
        "gopls",
        "goimports",
        "golines",
        "gofumpt",
        "tailwindcss-language-server",
        "typescript-language-server",
        "biome",
        "clangd",
        "clang-format",
        "bash-language-server",
        "shfmt",
        "ansible-language-server",
        "ansible-lint",
        "dockerfile-language-server",
        "docker-compose-language-service",
        "hadolint",
        "intelephense",
        "phpstan",
        "phpcbf",
        "lemminx",
        "xmlformatter",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = true },
    },
    config = function()
      require "nvchad.configs.lspconfig".defaults()
      require "configs.lspconfig"
    end,
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    dependencies = "neovim/nvim-lspconfig",
    ft = { 'rust' },
    config = function()
      require "configs.rustaceanvim"
    end,
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function ()
        dapui.open()
      end
      dap.listeners.before.event_initialized["dapui_config"] = function ()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function ()
        dapui.close()
      end
    end,
  },
  {
    'mfussenegger/nvim-dap-python',
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui"
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end,
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui"
    },
    config = function (_, opts)
      require("dap-go").setup(opts)
    end
  },
  {
    'saecki/crates.nvim',
    ft = {"toml"},
    config = function(_, opts)
      local crates  = require('crates')
      crates.setup(opts)
      require('cmp').setup.buffer({
        sources = { { name = "crates" }}
      })
      crates.show()
    end,
  },
  {
    "andweeb/presence.nvim",
    event = "VeryLazy",
    config = function()
      require("presence").setup(require "configs.presence")
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
    {
    "theHamsta/nvim-dap-virtual-text",
    lazy = false,
    config = function(_, opts)
      require("nvim-dap-virtual-text").setup()
    end
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "nvchad.configs.cmp"
      M.completion.completeopt = "menu,menuone,noselect"
      M.mapping["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = false,
      }
      table.insert(M.sources, {name = "crates"})
      return M
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    ft = {
      "python",
      "go",
    },
    opts = function()
      require "configs.none-ls"
    end,
  },
  {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup(require "configs.dashboard")

  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },
  {
  "olexsmir/gopher.nvim",
  ft = "go",
  dependencies = { -- dependencies
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function (_, opts)
    require("gopher").setup(opts)
  end,
  build = function ()
    vim.cmd [[silent! GoInstallDeps]]
  end
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "html"
    },
    config = function ()
      require("nvim-ts-autotag").setup()
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function ()
      opts = require "nvchad.configs.treesitter"
      opts.ensure_installed = {
        "lua",
        "python",
        "javascript",
        "typescript",
        "tsx",
        "rust",
        "solidity",
        "go",
        "bash",
        "c",
        "cpp",
        "dockerfile",
        "css",
        "html",
        "cmake",
        "markdown",
        "make",
        "ini",
        "gowork",
        "gomod",
        "gosum",
        "json",
        "jsonc",
        "php",
        "sql",
        "dot",
        "git_config",
        "git_rebase",
        "gitcommit",
        "gitignore",
        "gitattributes",
        "passwd",
        "regex",
        "requirements",
        "toml",
        "xml",
        "yaml",
      }
      return opts
    end
  }
}
