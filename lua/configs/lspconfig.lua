local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

local servers = {
  "biome",
  "tailwindcss",
  "dockerls",
  "ansiblels",
  "docker_compose_language_service",
  "solidity_ls_nomicfoundation",
  "solidity_ls",
  "lemminx",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.powershell_es.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  bundle_path = '~/LSP/PowerShellEditorServices',
  settings = {
    powershell = {
      codeFormatting = {
        Preset = "OTBS"
      },
    },
  },
}

lspconfig.bashls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'sh', 'zsh' },
}

lspconfig.ruff_lsp.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.hoverProvider = false
  end
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    pyright = {
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        ignore = { '*' },
      },
    },
  },
}

-- lspconfig.solidity.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   cmd = { 'nomicfoundation-solidity-language-server', '--stdio' },
--   filetypes = { 'solidity' },
--   root_dir = util.find_git_ancestor,
--   single_file_support = true,
-- }

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true
      }
    }
  }
}

lspconfig.tsserver.setup {
  on_attach = function (client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    }
  }
}

lspconfig.biome.setup {
    cmd = { "biome", "lsp-proxy" },
    filetypes = {
      "javascript",
      "javascriptreact",
      "json",
      "jsonc",
      "typescript",
      "typescript.tsx",
      "typescriptreact",
    },
    root_dir = util.root_pattern "biome.json",
    single_file_support = true
}

lspconfig.clangd.setup {
  on_attach = function (client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

lspconfig.intelephense.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  single_file_support = true,
}