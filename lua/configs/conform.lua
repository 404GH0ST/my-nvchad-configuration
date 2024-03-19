local options = {
	format_on_save = {
		-- I recommend these options. See :help conform.format for details.
		lsp_fallback = true,
		timeout_ms = 500,
	},

	formatters_by_ft = {
		lua = { "stylua" },
		php = { "php_cs_fixer", "phpcbf" },
		go = { "gofumpt", "goimports-reviser", "golines" },
		javascript = { "biome" },
		c = { "clang_format" },
		python = { "ruff_format" },
		sh = { "shfmt" },
		-- shfmt doesn't support zsh yet
		-- zsh = { "shfmt" },
		xml = { "xmlformat" },
	},
}

require("conform").setup(options)
