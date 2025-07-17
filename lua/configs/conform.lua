local options = {
	format_on_save = {
		lsp_format = "fallback",
		timeout_ms = 500,
	},

	formatters_by_ft = {
		asm = { "asmfmt" },
		arm = { "asmfmt" },
		lua = { "stylua" },
		php = { "php_cs_fixer" },
		go = { "gofumpt", "goimports", "golines" },
		javascript = { "biome" },
		javascriptreact = { "biome" },
		typescript = { "biome" },
		typescriptreact = { "biome" },
		c = { "clang_format" },
		cpp = { "clang_format" },
		csharp = { "csharpier" },
		python = { "ruff_format" },
		sh = { "shfmt" },
		sql = { "sql_formatter" },
		java = { "google-java-format" },
		-- shfmt doesn't support zsh yet
		-- zsh = { "shfmt" },
		xml = { "xmlformat" },
		html = { "htmlbeautifier" },
		proto = { "buf" },
		yaml = { "yamlfmt" },
		toml = { "taplo" },
		json = { "biome" },
		jsonc = { "biome" },
	},
}

require("conform").setup(options)
