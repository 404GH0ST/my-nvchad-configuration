local options = {
	javascript = { "biomejs" },
	javascriptreact = { "biomejs" },
	json = { "biomejs" },
	jsonc = { "biomejs" },
	typescript = { "biomejs" },
	typescriptreact = { "biomejs" },
	c = { "cpplint" },
	cpp = { "cpplint" },
	docker = { "hadolint" },
	html = { "htmlhint" },
	python = { "ruff" },
	php = { "phpstan" },
	proto = { "buf_lint" },
	ansible = { "ansible_lint" },
	go = { "golangcilint" },
	sql = { "sqlfluff" },
	yaml = { "yamllint" },
}

require("lint").linters_by_ft = options
