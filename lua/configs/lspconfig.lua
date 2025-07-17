local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

local servers = {
	astro = {},
	cssls = {},
	dockerls = {},
	ansiblels = {},
	docker_compose_language_service = {},
	solidity_ls_nomicfoundation = {},
	solidity_ls = {},
	lemminx = {},
	omnisharp = {
		single_file_support = true,
	},
	html = {},
	htmx = {},
	jsonls = {},
	templ = {},
	vuels = {},
	sqls = {},
	protols = {},
	yamlls = {},
	zls = {},
	taplo = {},
	asm_lsp = {},
	pyrefly = {
		single_file_support = true,
	},
	ruff = {
		on_attach = function(client, bufnr)
			client.server_capabilities.hoverProvider = false
			on_attach(client, bufnr) -- Also run the default on_attach
		end,
	},
	tailwindcss = {},
	ts_ls = {
		init_options = {
			preferences = {
				disableSuggestions = true,
			},
		},
		on_attach = function(client, bufnr)
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
			on_attach(client, bufnr)
		end,
	},
	biome = {
		cmd = { "biome", "lsp-proxy" },
		root_dir = util.root_pattern("biome.json", "biome.jsonc"),
		single_file_support = true,
	},
	gopls = {
		cmd = { "gopls" },
		filetypes = { "go", "gomod", "gowork", "gotmpl" },
		root_dir = util.root_pattern("go.work", "go.mod", ".git"),
		settings = {
			gopls = {
				completeUnimported = true,
				usePlaceholders = true,
				analyses = { unusedparams = true },
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
	},
	bashls = {
		filetypes = { "sh", "zsh" },
	},
	powershell_es = {
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
				codeFormatting = { Preset = "OTBS" },
			},
		},
	},
	clangd = {
		filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
	},
	intelephense = {
		single_file_support = true,
	},
}

for server_name, config in pairs(servers) do
	local server_config = vim.tbl_deep_extend("force", {
		on_attach = on_attach,
		capabilities = capabilities,
	}, config)

	vim.lsp.enable(server_name)
	vim.lsp.config(server_name, server_config)
end
