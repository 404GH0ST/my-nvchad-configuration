---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "tokyonight",

	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
	},
}

M.ui = {
	statusline = {
		theme = "minimal",
		separator_style = "round",
	},
}

M.mason = {
	pkgs = {
		"stylua",
		"rust-analyzer",
		"vscode-solidity-server",
		"nomicfoundation-solidity-language-server",
		"ruff",
		"pyrefly",
		"debugpy",
		"gopls",
		"goimports",
		"golines",
		"gofumpt",
		"golangci-lint",
		"delve",
		"tailwindcss-language-server",
		"typescript-language-server",
		"biome",
		"clangd",
		"clang-format",
		"cpplint",
		"bash-language-server",
		"shfmt",
		"ansible-language-server",
		"ansible-lint",
		"dockerfile-language-server",
		"docker-compose-language-service",
		"hadolint",
		"intelephense",
		"phpstan",
		"php-cs-fixer",
		"lemminx",
		"xmlformatter",
		"html-lsp",
		"htmx-lsp",
		"htmlhint",
		"templ",
		"json-lsp",
		"jsonlint",
		"htmlbeautifier",
		"jdtls",
		"google-java-format",
		"checkstyle",
		"astro-language-server",
		"css-lsp",
		"taplo",
		"asm-lsp",
		"asmfmt",
		"omnisharp",
		"csharpier",
	},
}
return M
