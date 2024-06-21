local options = require("nvchad.configs.mason")

local opt = {
	ensure_installed = {
		"lua-language-server",
		"stylua",
		"rust-analyzer",
		"vscode-solidity-server",
		"nomicfoundation-solidity-language-server",
		"mypy",
		"ruff",
		"ruff-lsp",
		"pyright",
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
	},
}

for k, v in pairs(opt) do
	options[k] = v
end

return options
