local options = {
	javascript = { "biomejs" },
	json = { "biomejs" },
	typescript = { "biomejs" },
	c = { "cpplint" },
	cpp = { "cpplint" },
	docker = { "hadolint" },
	html = { "htmlhint" },
	python = { "mypy", "ruff" },
	php = { "phpstan" },
	proto = { "buf_lint" },
	ansible = { "ansible_lint" },
	go = { "golangcilint" },
	sql = { "sqlfluff" },
	yaml = { "yamllint" },
}

require("lint").linters_by_ft = options
