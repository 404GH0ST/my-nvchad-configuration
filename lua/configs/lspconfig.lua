local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

local servers = {
	"astro",
	"cssls",
	"biome",
	"tailwindcss",
	"dockerls",
	"ansiblels",
	"docker_compose_language_service",
	"solidity_ls_nomicfoundation",
	"solidity_ls",
	"lemminx",
	"html",
	"htmx",
	"jsonls",
	"templ",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

lspconfig.powershell_es.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = {
		"pwsh",
		"-NoLogo",
		"-NoProfile",
		"-Command",
		"~/LSP/PowerShellEditorServices/PowerShellEditorServices/Start-EditorServices.ps1",
		"-Stdio",
	},
	settings = {
		powershell = {
			codeFormatting = {
				Preset = "OTBS",
			},
		},
	},
})

lspconfig.bashls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "sh", "zsh" },
})

lspconfig.ruff_lsp.setup({
	on_attach = function(client, bufnr)
		client.server_capabilities.hoverProvider = false
	end,
})

lspconfig.basedpyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		pyright = {
			disableOrganizeImports = true,
		},
		python = {
			analysis = {
				ignore = { "*" },
			},
		},
	},
})

lspconfig.gopls.setup({
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
				unusedparams = true,
			},
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
		},
	},
})

lspconfig.tsserver.setup({
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false
		on_attach(client, bufnr)
	end,
	capabilities = capabilities,
	init_options = {
		preferences = {
			disableSuggestions = true,
		},
	},
})

lspconfig.biome.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "biome", "lsp-proxy" },
	root_dir = util.root_pattern("biome.json", "biome.jsonc"),
	single_file_support = true,
})

lspconfig.clangd.setup({
	on_attach = function(client, bufnr)
		client.server_capabilities.signatureHelpProvider = false
		on_attach(client, bufnr)
	end,
	capabilities = capabilities,
})

lspconfig.intelephense.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	single_file_support = true,
})
